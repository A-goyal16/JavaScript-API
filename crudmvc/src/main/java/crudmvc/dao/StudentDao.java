package crudmvc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import crudmvc.dto.Student;

@Repository
public class StudentDao {
	@Autowired
	EntityManager manager;

	public void save(Student student) {
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		manager.persist(student);
		transaction.commit();
		System.out.println("data saved");
	}

	public List fetchAll() {
		return manager.createQuery("select x from Student x").getResultList();
	}

	public Student fetchById(int id) {
		return manager.find(Student.class, id);
	}

	public void update(Student student) {
		EntityTransaction transaction=manager.getTransaction();
		transaction.begin();
		manager.merge(student);
		transaction.commit();
	}

	public void delete(int id) {
		EntityTransaction transaction=manager.getTransaction();
		transaction.begin();
		manager.remove(manager.find(Student.class, id));
		transaction.commit();
	}
}