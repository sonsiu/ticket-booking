
package controller;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.*;

public class SendEmail {
        
    public String getRandom(){
        Random r = new Random();
        int number = r.nextInt(999999);
        return String.format("%06d", number);
    }
    
    public boolean sendEmail(User user){
        boolean test = false;
        
        String toEmail = user.getEmail();
        String fromEmail = "@fpt.edu.vn";
        String password = "";
        
        
        try {
            Properties p = new Properties();
            p.setProperty("mail.smtp.host", "smtp.gmail.com");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.auth", "true");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.put("mail.smtp.socketFactory.port", "587");
            p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
            Session session = Session.getInstance(p, new Authenticator(){
                @Override
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            
            Message mess = new MimeMessage(session);
            
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        
            mess.setSubject("User Email Verification");
            
            mess.setText("Registered successfully. Please verify your account using this code: " + user.getVerifyCode());
        
            Transport.send(mess);
            
            test = true;
        } catch (Exception e) {
            
        }
        return test;
    }
}
