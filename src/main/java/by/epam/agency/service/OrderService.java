package by.epam.agency.service;

import by.epam.agency.entity.Order;
import by.epam.agency.exception.ServiceException;

import java.util.List;

public interface OrderService {
    void createOrder(Order order) throws ServiceException;

    void deleteOrder(int id) throws ServiceException;

    Order findOrderById(int id) throws ServiceException;

    List<Order> getAllOrders() throws ServiceException;

    void updateOrdersStatus() throws ServiceException;
}
