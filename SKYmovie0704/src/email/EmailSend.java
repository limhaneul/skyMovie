package email;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import Member.MemberDAO;

@WebServlet("/EmailSend")
public class EmailSend extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		String email=request.getParameter("email");	
		MemberDAO m =new MemberDAO();
		
		
		PrintWriter out =response.getWriter();
		
		int check=m.emailCheck(email);
		
		if(check==1) {
			
			System.out.println("email이 중복됨");
		
			out.print(check);
			return;
		}
		
		System.out.println(email);

		check=2;
		
		//서버 설정
		String host="smtp.naver.com";
		final String user="2221325@naver.com";
		final String password="qhrtnddk@2";
		
		//메일 받을 주소
		String to_email=email;
		

		  //SMTP 서버 정보를 설정한다.
	    // Properties p = new Properties();

		/*
		 * p.put("mail.smtp.port", host); p.put("mail.smtp.starttls.enable", "true");
		 * p.put("mail.smtp.auth", "true"); p.put("mail.smtp.debug", "true");
		 * p.put("mail.smtp.socketFactory.port", "465");
		 * p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		 * p.put("mail.smtp.socketFactory.fallback", "false");
		 */
         
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

	     
	     
	     
	    
		
		
		StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String number = temp.toString();
		

		
		
	   
	    
		
	     
     System.out.println("서버정보 확인");    
		//인증코드 작성
		System.out.println(number);
		
		 Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
             protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(user,password);
             }
         });
		
		 System.out.println("서버정보 확인");    
		 //메일보내기
		 try {
             
			 MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "SKY Movie입니다"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				// 메일 제목
				msg.setSubject("안녕하세요 SKY Movie 회원 이메일 인증 번호입니다.");
				// 메일 내용
				msg.setText("인증 번호는 :" + number+"입니다");

				Transport.send(msg);
				System.out.println("이메일 전송");
			 
			 
         }catch (Exception e) {
            System.out.println(e.getMessage());
         }
	
		 JSONObject jo =new JSONObject();
		 jo.put("check", check);
		 jo.put("number", number);
		 JSONArray ja=new JSONArray();
		 JSONObject jo1 =new JSONObject();
		
 
		 ja.add(jo);
		 
		 jo1.put("mail", ja);
		 out.print(jo1);
		 
		 
	}

	
		
	

	
	
	

}
