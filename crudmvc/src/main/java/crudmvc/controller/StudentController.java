package crudmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import crudmvc.dao.StudentDao;
import crudmvc.dto.Student;
import crudmvc.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	StudentService service;

	@Autowired
	StudentDao dao;

	@RequestMapping("/load")
	public ModelAndView load() {
		Student student = new Student();
		ModelAndView view = new ModelAndView();
		//view.addObject("studentdata", student);
		view.setViewName("save2");
		return view;
	}

	@PostMapping("/save")
	public ModelAndView save(Student student) {
		return service.save(student);
	}

	@GetMapping("/fetch")
	public ModelAndView fetch(Student student) {
		return service.fetch(student);
	}
	
	@RequestMapping("/edit")
	public ModelAndView loadeditpage(@RequestParam int id)
	{
		return service.loadpage(id);
	}
	
	@RequestMapping("/update")
	public ModelAndView update(@ModelAttribute Student student)
	{
		return service.update(student);
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam int id)
	{
		return service.delete(id);
	}
}

