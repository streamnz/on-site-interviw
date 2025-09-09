package com.streamnz.decorator;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @Author cheng hao
 * @Date 09/09/2025 16:53
 */
public class DecoratorDemo {

    // 接口
    interface Printer {
        void print(String message);
    }

    // 具体实现
    static class ConsolePrinter implements Printer {
        @Override
        public void print(String message) {
            System.out.println(message);
        }
    }
    // 抽象装饰器
    static abstract class PrinterDecorator implements Printer {
        protected final Printer wrappedPrinter;
        public PrinterDecorator(Printer wrappedPrinter) {
            this.wrappedPrinter = wrappedPrinter;
        }
    }

    // 具体装饰器
    static class TimestampPrinter extends PrinterDecorator {
        public TimestampPrinter(Printer wrappedPrinter) {
            super(wrappedPrinter);
        }

        @Override
        public void print(String message) {
            LocalDateTime date = LocalDateTime.now();
            String format = date.format(DateTimeFormatter.ISO_DATE_TIME);
            String timestampedMessage = "[" + format + "] " + message;
            wrappedPrinter.print(timestampedMessage);
        }
    }
    // 客户端代码
    public static void main(String[] args) {
        Printer printer = new ConsolePrinter();
        Printer timestampedPrinter = new TimestampPrinter(printer);
        timestampedPrinter.print("Hello, World!");
    }

}
