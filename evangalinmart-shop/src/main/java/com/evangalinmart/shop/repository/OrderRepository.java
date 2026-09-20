package com.evangalinmart.shop.repository;

import com.evangalinmart.shop.model.Order;
import com.evangalinmart.shop.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findByUserOrderByOrderDateDesc(User user);
}
