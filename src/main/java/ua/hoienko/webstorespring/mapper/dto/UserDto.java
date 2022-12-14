package ua.hoienko.webstorespring.mapper.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class UserDto {
    private String firstName;
    private String lastName;
    private String email;
    private String password;
}
