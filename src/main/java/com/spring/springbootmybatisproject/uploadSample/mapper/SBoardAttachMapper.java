package com.spring.springbootmybatisproject.uploadSample.mapper;


import com.spring.springbootmybatisproject.uploadSample.domain.SBoardAttachVO;

import java.util.List;

public interface SBoardAttachMapper {

    public void insert(SBoardAttachVO vo);

    public void delete(String uuid);

    public List<SBoardAttachVO> findByBno(Long bno);

//	public void deleteAll(Long bno);

//	public List<SBoardAttachVO> getOldFiles();

}