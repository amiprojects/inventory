package com.kaanish.util;

import javax.ejb.EJB;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.kaanish.ejb.Ejb;

@WebListener
public class Listener implements HttpSessionListener {
	@EJB
	Ejb ejb;


    public void sessionCreated(HttpSessionEvent hs)  { 
         hs.getSession().setAttribute("ejb", ejb);
    }


    public void sessionDestroyed(HttpSessionEvent hs)  { 
         hs.getSession().removeAttribute("ejb");
    }
	
}
