package com.sms.exception;

public class DuplicateBranchCodeException extends RuntimeException {
    public DuplicateBranchCodeException(String message) {
        super(message);
    }
}
