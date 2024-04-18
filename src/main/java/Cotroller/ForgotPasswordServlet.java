package Cotroller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.AccountDAO;

@WebServlet(urlPatterns = { "/ForgotPasswordServlet" })
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setAttribute("error", "");
		request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {

			String email = request.getParameter("email");

			AccountDAO dao = new AccountDAO();

			// Kiểm tra xem email có tồn tại trong cơ sở dữ liệu hay không
			if (!dao.exists(email)) {

				request.setAttribute("error", "Email không tồn tại.");
				request.getRequestDispatcher("/forgotpassword.jsp").forward(request, response);
			} else {
				// Nếu email tồn tại, thiết lập thông tin để gửi email thông báo reset mật khẩu
				String senderEmail = "linhtai860974@gmail.com";
				String senderPassword = "kpgkxqlwhmwwkvdt"; // System.getenv("EMAIL_SENDER_PASSWORD")

				// Cấu hình các thuộc tính của mail server
				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "587");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.starttls.enable", "true");

				// Tạo session để xác thực thông tin đăng nhập của người gửi email
				Session mailSession = Session.getInstance(props, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(senderEmail, senderPassword);
					}
				});

				try {
					// Tạo một đối tượng MimeMessage để định dạng email
					MimeMessage message = new MimeMessage(mailSession);
					message.addHeader("Content-Type", "text/plain; charset=UTF-8");// kiểu chữ của nội dung
					message.setFrom(new InternetAddress(senderEmail));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));// gửi email
					message.setSubject("Shop Clothes - Đặt lại mật khẩu!");
					message.setSentDate(new Date());

					// Tạo đường dẫn reset mật khẩu và tạo nội dung email
					String passwordLink = "http://127.0.0.1:8080" + request.getContextPath()
							+ "/RestorePasswordServlet?email=" + email;
					String emailContent = "Vui lòng click vào đường link bên dưới để đặt lại mật khẩu:\n" + passwordLink
							+ "\n\nBest regards!";
					message.setText(emailContent, "UTF-8");

					// Gửi email
					Transport.send(message);

					request.getRequestDispatcher("/mailsuccess.jsp").forward(request, response);
				} catch (AddressException e) {
					
					response.getWriter().println(e);
				} catch (MessagingException e) {
					
					response.getWriter().println(e);
				}
			}
		} catch (NamingException | SQLException e) {
			
			response.getWriter().println(e);
		}
	}
}