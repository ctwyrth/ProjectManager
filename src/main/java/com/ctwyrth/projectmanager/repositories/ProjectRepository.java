package com.ctwyrth.projectmanager.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ctwyrth.projectmanager.models.Project;

@Repository
public interface ProjectRepository extends CrudRepository<Project, Long> {
    // this method retrieves all from the database
    List<Project> findAll();

}