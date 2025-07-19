package com.streamnz.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * Performance Monitoring Interceptor
 * Monitors request processing time and logs performance metrics
 */
@Slf4j
@Component
public class PerformanceInterceptor implements HandlerInterceptor {

    private static final String START_TIME_ATTRIBUTE = "startTime";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        long startTime = System.currentTimeMillis();
        request.setAttribute(START_TIME_ATTRIBUTE, startTime);
        
        log.debug("Starting request processing for: {} {}", 
                request.getMethod(), request.getRequestURI());
        
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // Post-processing logic can be added here
        log.debug("Request processing completed for: {} {}", 
                request.getMethod(), request.getRequestURI());
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        long startTime = (Long) request.getAttribute(START_TIME_ATTRIBUTE);
        long endTime = System.currentTimeMillis();
        long duration = endTime - startTime;
        
        String logLevel = duration > 1000 ? "warn" : "debug";
        
        if (ex != null) {
            log.error("Request failed: {} {} - {}ms - Error: {}", 
                    request.getMethod(), request.getRequestURI(), duration, ex.getMessage());
        } else {
            log.debug("Request completed: {} {} - {}ms - Status: {}", 
                    request.getMethod(), request.getRequestURI(), duration, response.getStatus());
        }
        
        // Log slow requests
        if (duration > 1000) {
            log.warn("Slow request detected: {} {} took {}ms", 
                    request.getMethod(), request.getRequestURI(), duration);
        }
    }
} 