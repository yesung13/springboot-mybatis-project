package com.spring.springbootmybatisproject.board.service;

import com.spring.springbootmybatisproject.board.repository.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper mapper;

    @Override
    public List<Map<String, Object>> getBoardList(List<Integer> params) {
        return mapper.getBoardList(params);
    }
}
