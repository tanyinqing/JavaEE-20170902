package demo.util;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Arrays;

@WebListener("/*")
public class ListenerTest implements HttpSessionAttributeListener {
    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        System.out.println("attributeAdded: "+ event.getName()+" : "+event.getValue());
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {

    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {

    }
//public class ListenerTest implements HttpSessionListener {
    //public class ListenerTest implements ServletRequestAttributeListener {

    /*@Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("created: "+ Arrays.toString(se.getSession().getValueNames()));
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("destroyed: "+Arrays.toString(se.getSession().getValueNames()));
    }*/

}
