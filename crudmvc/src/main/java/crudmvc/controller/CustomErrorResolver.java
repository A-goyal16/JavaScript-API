package crudmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

@Component
public class CustomErrorResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response,
                                         Object handler, Exception ex) {
        ModelAndView modelAndView = new ModelAndView();

        if (request.getRequestURI().equals("/error")) 
        {
            Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
            if (statusCode == 403) {
               modelAndView.setViewName("errorpage");
            }else {
                modelAndView.setViewName("errorpage"); 
        }
        }
        modelAndView.setViewName("errorpage");
        return modelAndView;
    }	
}
