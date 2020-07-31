package com.spring.springbootmybatisproject.board.repository;

import com.spring.springbootmybatisproject.board.model.BoardAttachVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BoardAttachMapper {

    public void insert(BoardAttachVO vo);

    public void delete(String uuid);

    public List<BoardAttachVO> findByBoardId(Long boardId);
}
