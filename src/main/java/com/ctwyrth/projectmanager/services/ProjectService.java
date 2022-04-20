package com.ctwyrth.projectmanager.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ctwyrth.projectmanager.models.Project;
import com.ctwyrth.projectmanager.repositories.ProjectRepository;

@Service
public class ProjectService {
    @Autowired
    private ProjectRepository projectRepository;
    
    // shows all
    public List<Project> allProjects() {
        return projectRepository.findAll();
    }

    // creates one
    public Project createProject(Project e) {
        return projectRepository.save(e);
    }

    // retrieves one by id
    public Project findProject(Long id) {
        Optional<Project> optionalProject = projectRepository.findById(id);
        if(optionalProject.isPresent()) {
            return optionalProject.get();
        } else {
            return null;
        }
    }

    // updates one
    public Project updateProject(Project e) {
       	return projectRepository.save(e);
    }
    
    // deletes one
    public void deleteProject(Long id) {
    	projectRepository.deleteById(id);
    }
}