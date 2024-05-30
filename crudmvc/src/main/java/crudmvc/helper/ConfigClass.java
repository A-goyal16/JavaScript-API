package crudmvc.helper;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages = "crudmvc")
public class ConfigClass {
	@Bean
	public EntityManager getEM() {
		return Persistence.createEntityManagerFactory("mvc").createEntityManager();
	}

	@Bean
	public ViewResolver getVR() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	

	
}

