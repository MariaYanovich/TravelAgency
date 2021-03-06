package by.epam.agency.command.impl;

import by.epam.agency.command.Command;
import by.epam.agency.command.constants.PageType;
import by.epam.agency.command.util.CommandUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeCommand implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        new CommandUtil().initializeTourParameters(request);
        return PageType.HOME_PAGE.getAddress();
    }
}
