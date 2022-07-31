package com.firstSpring.app.dao;

import com.firstSpring.app.domain.*;

public interface UserDao {
    int insert(User user) throws Exception;

    User select(String id) throws Exception;

    int update(User user) throws Exception;

    int delete(String id) throws Exception;

    int count() throws Exception;

    int deleteAll() throws Exception;
}