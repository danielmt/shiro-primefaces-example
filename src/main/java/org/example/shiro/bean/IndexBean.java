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

@Named
@ViewScoped
public class IndexBean implements Serializable {
    private Subject subject = SecurityUtils.getSubject();

    public Subject getSubject() {
        return subject;
    }
}
