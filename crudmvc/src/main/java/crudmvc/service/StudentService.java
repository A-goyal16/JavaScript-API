package crudmvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import crudmvc.dao.StudentDao;
import crudmvc.dto.Student;

@Service
public class StudentService {

	@Autowired
	StudentDao dao;

	public ModelAndView save(Student student) {
		ModelAndView view = new ModelAndView();
		view.setViewName("home");
		dao.save(student);
		return view;
	}

	public ModelAndView fetch(Student student) {
		ModelAndView view = new ModelAndView();
		List<Student> l = dao.fetchAll();
		if (l.isEmpty()) {
			view.addObject("fail", "data not found");
			view.setViewName("home");
		} else {
			view.addObject("list", l);
			view.setViewName("data");
		}
		return view;
	}

	public ModelAndView loadpage(int id) {
		ModelAndView view = new ModelAndView("update");
		Student student = dao.fetchById(id);
		view.addObject("student", student);
		return view;
	}

	public ModelAndView update(Student student) {
		dao.update(student);
		ModelAndView view = new ModelAndView();
		view.setViewName("data");
		view.addObject("list", dao.fetchAll());
		return view;
	}

	public ModelAndView delete(int id) {
		ModelAndView view=new ModelAndView();
		dao.delete(id);
		List<Student> list=new ArrayList<Student>();
		if(list.isEmpty())
		{
			view.addObject("list", new ArrayList<Student>()); 
	        view.setViewName("data");
	        view.addObject("fail", "no data found");
			view.setViewName("home");
		}else
		{
			view.addObject("list", list);
			view.setViewName("data");
		}
		return view;
	}
}
