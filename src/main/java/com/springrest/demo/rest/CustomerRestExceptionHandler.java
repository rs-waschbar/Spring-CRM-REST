package com.springrest.demo.rest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CustomerRestExceptionHandler {

    @ExceptionHandler
    public ResponseEntity<CustomerErrorResponse> handleException(CustomerNotFoundException exc) {
        CustomerErrorResponse errResponse = new CustomerErrorResponse(
                                                        HttpStatus.NOT_FOUND.value(),
                                                        exc.getMessage(),
                                                        System.currentTimeMillis());

        return new ResponseEntity<CustomerErrorResponse>(errResponse, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler
    public ResponseEntity<CustomerErrorResponse> handleException(Exception otherException) {
        CustomerErrorResponse errorResponse = new CustomerErrorResponse(
                                                        HttpStatus.BAD_REQUEST.value(),
                                                        otherException.getMessage(),
                                                        System.currentTimeMillis());

        return new ResponseEntity<CustomerErrorResponse>(errorResponse, HttpStatus.BAD_REQUEST);
    }



}
