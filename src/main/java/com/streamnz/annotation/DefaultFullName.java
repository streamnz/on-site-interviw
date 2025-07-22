package com.streamnz.annotation;


import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = DefaultFullNameValidator.class)
@Documented
public @interface DefaultFullName {
    String message() default "Invalid full name configuration";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};

}
