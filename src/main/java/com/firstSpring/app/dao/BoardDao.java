package com.firstSpring.app.dao;

import com.firstSpring.app.domain.BoardDto;

public interface BoardDao {
    BoardDto select(Integer bno) throws Exception // T selectOne(String statement, Object parameter)
    ;
}
