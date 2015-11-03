/**
 * Example Bean
 * @author Daniel Mascarenhas
 */
package org.example.shiro.bean;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import javax.faces.bean.ViewScoped;
import javax.inject.Named;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;

@ManagedBean(name = "indexBean")
@ViewScoped
public class IndexBean implements Serializable {
  

    public Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    
}
