package com.streamnz.util;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.streamnz.annotation.DateFormat;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * Custom Jackson serializer for date formatting
 * Supports LocalDateTime and Date objects
 */
public class DateFormatSerializer extends JsonSerializer<Object> implements ContextualSerializer {

    private String pattern = "yyyy-MM-dd HH:mm:ss";
    private String timezone = "Asia/Shanghai";
    private boolean useLocalTime = true;

    public DateFormatSerializer() {
    }

    public DateFormatSerializer(String pattern, String timezone, boolean useLocalTime) {
        this.pattern = pattern;
        this.timezone = timezone;
        this.useLocalTime = useLocalTime;
    }

    @Override
    public void serialize(Object value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        if (value == null) {
            gen.writeNull();
            return;
        }

        String formattedDate = formatDate(value);
        gen.writeString(formattedDate);
    }

    private String formatDate(Object value) {
        try {
            if (value instanceof LocalDateTime) {
                return formatLocalDateTime((LocalDateTime) value);
            } else if (value instanceof Date) {
                return formatDate((Date) value);
            } else {
                return value.toString();
            }
        } catch (Exception e) {
            return value.toString();
        }
    }

    private String formatLocalDateTime(LocalDateTime dateTime) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        if (useLocalTime) {
            return dateTime.format(formatter);
        } else {
            ZoneId zoneId = ZoneId.of(timezone);
            return dateTime.atZone(zoneId).format(formatter);
        }
    }

    private String formatDate(Date date) {
        LocalDateTime localDateTime = date.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDateTime();
        return formatLocalDateTime(localDateTime);
    }

    @Override
    public JsonSerializer<?> createContextual(SerializerProvider prov, BeanProperty property) throws JsonMappingException {
        if (property == null) {
            return this;
        }

        DateFormat annotation = property.getAnnotation(DateFormat.class);
        if (annotation == null) {
            annotation = property.getContextAnnotation(DateFormat.class);
        }

        if (annotation != null) {
            return new DateFormatSerializer(
                annotation.pattern(),
                annotation.timezone(),
                annotation.useLocalTime()
            );
        }

        return this;
    }

    @Override
    public Class<Object> handledType() {
        return Object.class;
    }
} 