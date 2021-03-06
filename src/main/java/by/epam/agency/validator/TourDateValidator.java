package by.epam.agency.validator;

import by.epam.agency.exception.ValidatorException;
import by.epam.agency.util.Message;

import java.sql.Date;
import java.util.Calendar;

public class TourDateValidator extends Validator {
    private Date date;

    public TourDateValidator(Date date) {
        this.date = date;
    }

    @Override
    public void validate() throws ValidatorException {
        if (date == null || date.before(Calendar.getInstance().getTime())) {
            throw new ValidatorException(Message.INCORRECT_DATE);
        }
        if (hasNext()) {
            next.validate();
        }
    }
}
