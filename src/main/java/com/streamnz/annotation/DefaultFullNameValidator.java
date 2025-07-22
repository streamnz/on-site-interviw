package com.streamnz.annotation;

import com.streamnz.model.dto.UserCreateDTO;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

/**
 * @Author cheng hao
 * @Date 22/07/2025 20:44
 */
public class DefaultFullNameValidator implements ConstraintValidator<DefaultFullName, UserCreateDTO> {

    @Override
    public boolean isValid(UserCreateDTO dto, ConstraintValidatorContext context) {
        if (dto == null) {
            return true;
        }
        if ((dto.getFullName() == null || dto.getFullName().trim().isEmpty())
                && dto.getUsername() != null && !dto.getUsername().trim().isEmpty()) {
            dto.setFullName(dto.getUsername());
        }
        return true;
    }

}
