package com.firstSpring.app.controller;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.firstSpring.app.dao.*;
import com.firstSpring.app.domain.*;
import com.firstSpring.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    UserService userService;

    //로그인
    @GetMapping("/login")
    public String loginForm() {
        return "loginForm";
    }

    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    //
    @PostMapping("/login")
    public String login(String id, String pwd, String toURL, boolean rememberId, Model m, HttpServletResponse response, HttpSession session) throws Exception {
        if(!loginCheck(id, pwd)) {
            String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다.", "utf-8");
            m.addAttribute("msg", msg);
            return "redirect:/login/login";
        }
        //id와 pwd가 일치하면 세션 객체에 id를 저장
        session.setAttribute("id", id);

        if(rememberId) {
            Cookie cookie = new Cookie("id", id);
            response.addCookie(cookie);
        } else {
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
        //toURL이 null이거나 빈문자열이면 홈으로, 아니면 toURL로 가도록 한다.
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;
        return "redirect:"+toURL;
    }

    private boolean loginCheck(String id, String pwd) {
        User user = null;
        try {
            user = userService.read(id);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return user != null && user.getPwd().equals(pwd);
//        return "asdf".equals(id) && "1234".equals(pwd);
    }

}