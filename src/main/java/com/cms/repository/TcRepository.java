package com.cms.repository;

import com.cms.entity.Tc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TcRepository extends JpaRepository<Tc, Long> {
    List<Tc> findAll();
}
