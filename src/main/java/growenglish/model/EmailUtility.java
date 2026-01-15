package growenglish.model;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtility {
    
    private static final String HOST_NAME = "smtp.gmail.com";
    private static final int TSL_PORT = 587;
    private static final String APP_EMAIL = "your_email@gmail.com";
    private static final String APP_PASSWORD = "xxxx xxxx xxxx xxxx";

    public static void sendEmail(String toAddress, String subject, String message) throws MessagingException {

        Properties properties = new Properties();
        properties.put("mail.smtp.host", HOST_NAME);
        properties.put("mail.smtp.port", TSL_PORT);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(APP_EMAIL, APP_PASSWORD);
            }
        });

        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(APP_EMAIL));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress));
        msg.setSubject(subject);
        msg.setText(message);
        Transport.send(msg);
    }
}