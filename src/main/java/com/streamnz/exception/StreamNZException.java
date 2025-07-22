package com.streamnz.exception;

/**
 * @Author cheng hao
 * @Date 22/07/2025 19:28
 */
public class StreamNZException extends RuntimeException {

    public StreamNZException() {
    }

    public StreamNZException(String message) {
        super(message);
    }

    public StreamNZException(String message, Throwable cause) {
        super(message, cause);
    }

    public StreamNZException(Throwable cause) {
        super(cause);
    }

    public StreamNZException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
