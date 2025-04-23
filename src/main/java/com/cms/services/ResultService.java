package com.cms.services;

import com.cms.entity.Result;
import java.util.List;
import java.util.Optional;

public interface ResultService {
    Result saveResult(Result result);
    Optional<Result> getResultById(Long id);
    List<Result> getAllResults();
    void deleteResult(Long id);
}
