package com.cms.services;

import com.cms.entity.Result;
import com.cms.repository.ResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ResultServiceImpl implements ResultService {
    @Autowired
    private final ResultRepository resultRepository;

    public ResultServiceImpl(ResultRepository resultRepository) {
        this.resultRepository = resultRepository;
    }

    @Override
    public Result saveResult(Result result) {
        return resultRepository.save(result);
    }

    @Override
    public Optional<Result> getResultById(Long id) {
        return resultRepository.findById(id);
    }

    @Override
    public List<Result> getAllResults() {
        return resultRepository.findAll();
    }

    @Override
    public void deleteResult(Long id) {
        resultRepository.deleteById(id);
    }
}
