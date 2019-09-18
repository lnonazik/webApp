package com.lnonazik.webproject.serviceImplement;

import com.lnonazik.webproject.service.MailService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Service
public class MailServiceImplement implements MailService {

    private final static String EMAIL_ADDRESS = "lnonazik@gmail.com";
    private final static String EMAIL_PASSWORD = "nivodu82";

    @Async
    @Override
    public void send(String context, String email, String body) {
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.port", "465");
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.socketFactory.post", "465");
        properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_ADDRESS, EMAIL_PASSWORD);
            }
        });

        try{
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_ADDRESS));
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(email));
            message.setSubject(context, "UTF-8");
            message.setText(body);
            synchronized (this){
                Transport.send(message);
            }
        }catch (MessagingException e){
            e.printStackTrace();
        }

    }
}
