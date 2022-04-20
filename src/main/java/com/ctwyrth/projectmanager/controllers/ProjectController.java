package com.ctwyrth.projectmanager.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.ctwyrth.projectmanager.models.Project;
import com.ctwyrth.projectmanager.models.User;
import com.ctwyrth.projectmanager.services.ProjectService;
import com.ctwyrth.projectmanager.services.UserService;

@Controller
public class ProjectController {
    // -----------------------variables-----------------------
    @Autowired
    private ProjectService projectService;
    
    @Autowired
    private UserService userService;

    // show all
    @GetMapping("/home")
    public String index(HttpSession session, Model model) {
    	Long userId = (Long) session.getAttribute("user_id");
    	if (userId == null) {
    	    return "redirect:/";
    	} else {
    		User currentUser = userService.findUser(userId);
    		List<Project> projects = projectService.allProjects();
    		model.addAttribute("projects", projects);
    		model.addAttribute(currentUser);
    		return "/projects/home.jsp";	
    	}
    }
    
    // create project
    @GetMapping("/projects/new")
    public String addProject(@ModelAttribute("project") Project project, HttpSession session) {
    	Long userId = (Long) session.getAttribute("user_id");
    	if (userId == null) {
    	    return "redirect:/";
    	} else {
    		return "/projects/newProject.jsp";
    	}
    }
    @PostMapping("/projects/new")
    public String create(@Valid @ModelAttribute("project") Project project, BindingResult result, HttpSession session) {
    	Long userId = (Long) session.getAttribute("user_id");
    	if (userId == null) {
    	    return "redirect:/";
    	} else {
    		if (result.hasErrors()) {
    			return "/projects/home.jsp";
    		} else {
    			projectService.createProject(project);
    			return "redirect:/home";
    		}
    	}
    }

    // display one found by id
    @GetMapping("/projects/{id}")
    public String showOneprojectById(@PathVariable("id") Long id, HttpSession session, Model model) {
    	Long userId = (Long) session.getAttribute("user_id");
    	if (userId == null) {
    	    return "redirect:/";
    	} else {
    		Project projectToShow = projectService.findProject(id);
    		model.addAttribute("project", projectToShow);
    		return "/projects/show.jsp";
    	}
    }

    // update one found by id
    @GetMapping("/projects/{id}/edit")
    public String edit(@PathVariable("id") Long id, HttpSession session, Model model) {
    	Long userId = (Long) session.getAttribute("user_id");
    	if (userId == null) {
    	    return "redirect:/";
    	} else {
    		Project projectToShow = projectService.findProject(id);
    		model.addAttribute("project", projectToShow);
    		return "/projects/edit.jsp";
    	}
    }
    @PutMapping("/projects/{id}")
    public String update(@Valid @ModelAttribute("project") Project project, BindingResult result, HttpSession session) {
    	Long userId = (Long) session.getAttribute("user_id");
    	if (userId == null) {
    	    return "redirect:/";
    	} else {
    		if (result.hasErrors()) {
    			return "/projects/edit.jsp";
    		} else {
    			if (userId.equals(project.getLead().getId())) {
    				projectService.updateProject(project);
    				return "redirect:/projects";
    			} else {
    				return "redirect:/home";
    			}
    		}
    	}
    }

    // delete one
    @DeleteMapping("/projects/{id}")
    public String destroy(@PathVariable("id") Long id, HttpSession session) {
    	Long userId = (Long) session.getAttribute("user_id");
    	if (userId == null) {
    	    return "redirect:/";
    	} else {
    		Project projectToDelete = projectService.findProject(id);
    		if (userId.equals(projectToDelete.getLead().getId())) {
    			projectService.deleteProject(id);
    			return "redirect:/projects";
    		} else {
    			return "redirect:/home";
    		}
    	}
    }
}