package com.controller;

import com.Utill.ImageUtill;
import com.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.IIOException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.awt.*;
import java.io.ByteArrayInputStream;
import java.io.IOException;

@RestController
public class UsersController {
    @Autowired

    @RequestMapping("/login")
    public Object login(String verifyCode,HttpServletRequest request){
        String sessionVerifyCode = request.getSession().getAttribute("verifyCode").toString();
        if (sessionVerifyCode.equals(verifyCode)){
            return"success";
        }else {
            return null;
        }

    }
    @RequestMapping("/verifyCode")
    public  void  genrateImage(HttpServletRequest request, HttpServletResponse response) throws IOException, HeadlessException {
        final ImageUtill imageUtill=ImageUtill.getInstance();
        final ByteArrayInputStream image=imageUtill.getImage();
        final String verifyCode=imageUtill.getStr();
        request.getSession().setAttribute("verifyCode",verifyCode);
        response.setContentType("image/jpeg");
        byte[] bytes=new byte[1024];
        try (final  ServletOutputStream out=response.getOutputStream()){
            while (image.read(bytes)!=-1){
                out.write(bytes);
            }

        }

    }




}
