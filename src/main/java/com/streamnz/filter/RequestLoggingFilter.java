package com.streamnz.filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.ContentCachingRequestWrapper;
import org.springframework.web.util.ContentCachingResponseWrapper;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

/**
 * Request Logging Filter
 * Logs request and response details for debugging and monitoring
 */
@Slf4j
@Component
public class RequestLoggingFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain
    ) throws ServletException, IOException {
        
        String requestId = UUID.randomUUID().toString().substring(0, 8);
        long startTime = System.currentTimeMillis();
        
        // Log request details
        log.info("Request [{}] {} {} from {}", 
                requestId,
                request.getMethod(),
                request.getRequestURI(),
                request.getRemoteAddr()
        );
        
        // Wrap request and response for content logging
        ContentCachingRequestWrapper wrappedRequest = new ContentCachingRequestWrapper(request);
        ContentCachingResponseWrapper wrappedResponse = new ContentCachingResponseWrapper(response);
        
        try {
            filterChain.doFilter(wrappedRequest, wrappedResponse);
        } finally {
            // Log response details
            long duration = System.currentTimeMillis() - startTime;
            log.info("Response [{}] {} {} - {}ms", 
                    requestId,
                    wrappedResponse.getStatus(),
                    request.getRequestURI(),
                    duration
            );
            
            // Log request body for debugging (only for non-GET requests)
            if (!"GET".equals(request.getMethod()) && !"HEAD".equals(request.getMethod())) {
                String requestBody = getContentAsString(wrappedRequest.getContentAsByteArray(), 
                        request.getCharacterEncoding());
                if (!requestBody.isEmpty()) {
                    log.debug("Request [{}] body: {}", requestId, requestBody);
                }
            }
            
            // Copy response content back to original response
            wrappedResponse.copyBodyToResponse();
        }
    }
    
    private String getContentAsString(byte[] content, String encoding) {
        if (content == null || content.length == 0) {
            return "";
        }
        try {
            return new String(content, encoding != null ? encoding : StandardCharsets.UTF_8.name());
        } catch (Exception e) {
            return "[Could not read content]";
        }
    }
} 