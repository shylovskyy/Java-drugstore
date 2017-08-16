package ua.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import ua.dto.filter.SimpleFilter;

import ua.entity.MeasuringSystem;

public interface MeasuringSystemService {

	MeasuringSystem findOne(Long id);

	List<MeasuringSystem> findAll();

	void save(MeasuringSystem entity);

	void delete(Long id);

	MeasuringSystem findByName(String name);

	Page<MeasuringSystem> findAll(Pageable pageable, SimpleFilter filter);

}
