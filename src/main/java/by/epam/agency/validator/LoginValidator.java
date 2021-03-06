package by.epam.agency.validator;


import by.epam.agency.exception.ValidatorException;
import by.epam.agency.util.Message;
import by.epam.agency.validator.constants.ValidatorRegex;
import com.mysql.cj.util.StringUtils;

import java.util.regex.Pattern;

public class LoginValidator extends Validator {
    private String login;

    public LoginValidator(String login) {
        this.login = login;
    }

    @Override
    public void validate() throws ValidatorException {
        try {
            pattern = Pattern.compile(ValidatorRegex.LOGIN);
            matcher = pattern.matcher(login);
        } catch (NullPointerException e) {
            throw new ValidatorException(Message.NULL_LOGIN, e);
        }
        if (StringUtils.isNullOrEmpty(login) || !matcher.find()) {
            throw new ValidatorException(Message.INCORRECT_LOGIN);
        }
        if (hasNext()) {
            next.validate();
        }
    }
}
