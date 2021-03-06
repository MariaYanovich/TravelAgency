package by.epam.agency.command.impl.redirect;

import by.epam.agency.command.Command;
import by.epam.agency.command.constants.JspParameterType;
import by.epam.agency.command.constants.PageType;
import by.epam.agency.command.constants.SessionAttribute;
import by.epam.agency.exception.ServiceException;
import by.epam.agency.exception.ValidatorException;
import by.epam.agency.factory.ServiceFactory;
import by.epam.agency.util.Message;
import by.epam.agency.validator.PositiveIntValidator;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RedirectToSubmitBuyPageCommand implements Command {
    private static final Logger LOGGER = LogManager.getLogger(RedirectToSubmitBuyPageCommand.class.getName());

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String tourNumber = request.getParameter(JspParameterType.TOUR_NUMBER);
        request.getSession().setAttribute(SessionAttribute.TOUR_NUMBER, tourNumber);
        try {
            new PositiveIntValidator(Integer.parseInt(tourNumber)).validate();
            if (Integer.parseInt(tourNumber) <= ServiceFactory.getInstance().getTourService().
                    findTourById(Integer.parseInt((String) request.getSession().
                            getAttribute(SessionAttribute.TOUR_ID))).getPlaces()) {
                return PageType.SUBMIT_BUY_PAGE.getAddress();
            }
        } catch (ServiceException | ValidatorException e) {
            LOGGER.error(Message.REDIRECT_TO_SUBMIT_BUY_PAGE_COMMAND_ERROR, e);
        }
        return PageType.INPUT_TOUR_NUMBER_PAGE.getAddress();
    }
}
