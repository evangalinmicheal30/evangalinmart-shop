package com.evangalinmart.shop.repository;

import com.evangalinmart.shop.model.CartItem;
import com.evangalinmart.shop.model.Product;
import com.evangalinmart.shop.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {

    List<CartItem> findByUser(User user);

    Optional<CartItem> findByUserAndProduct(User user, Product product);

    void deleteByUser(User user);
}
