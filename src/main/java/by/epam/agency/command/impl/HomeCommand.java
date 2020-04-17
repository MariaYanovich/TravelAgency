package by.epam.agency.command.impl;

import by.epam.agency.command.Command;
import by.epam.agency.command.constants.JspParameterType;
import by.epam.agency.command.constants.PageType;
import by.epam.agency.entity.City;
import by.epam.agency.entity.Tour;
import by.epam.agency.entity.TourType;
import by.epam.agency.entity.Transport;
import by.epam.agency.exception.ServiceException;
import by.epam.agency.factory.ServiceFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class HomeCommand implements Command {
    private static final Logger LOGGER = LogManager.getLogger(HomeCommand.class.getName());

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        List<Tour> tours = new ArrayList<>();
        List<City> cities = new ArrayList<>();
        List<TourType> tourTypes = new ArrayList<>();
        List<Transport> transports = new ArrayList<>();
        try {
            tours = ServiceFactory.getInstance().getTourService().getAllTours();
            cities = ServiceFactory.getInstance().getCityService().getAllCities();
            tourTypes = ServiceFactory.getInstance().getTourTypeService().getAllTourTypes();
            transports = ServiceFactory.getInstance().getTransportService().getAllTransports();
        } catch (ServiceException e) {
            LOGGER.error(e);
        }
        request.getSession().setAttribute(JspParameterType.TRANSPORTS, transports);
        request.getSession().setAttribute(JspParameterType.TOURS, tours);
        request.getSession().setAttribute(JspParameterType.CITIES, cities);
        request.getSession().setAttribute(JspParameterType.TOUR_TYPES, tourTypes);
        return PageType.HOME_PAGE.getAddress();
    }
}
