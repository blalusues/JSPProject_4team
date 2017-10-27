package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/callback")
public class NaverLoginCallbackServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String clientId = "TZblhGxHqxzRPDaQz4FJ";// ���ø����̼� Ŭ���̾�Ʈ ���̵�";
		String clientSecret = "A3UVaH6P0N";// ���ø����̼� Ŭ���̾�Ʈ ��ũ����";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:3333/JSPProject_4team/content", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) { // ���� ȣ��
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // ���� �߻�
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				System.out.println(res.toString());
				// JSON Parser ��ü ����
				JSONParser parser = new JSONParser();

				// �Ѿ�� ���ڿ��� JSON ��ü�� ��ȯ
				JSONObject jsonObj = (JSONObject) parser.parse(res.toString());
				access_token = jsonObj.get("access_token").toString();
				HttpSession session = request.getSession();
				session.setAttribute("access_token", access_token);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		PrintWriter out = response.getWriter();
		StringBuilder str = new StringBuilder();
		str.append("<script language='javascript'>");
		str.append("opener.location.href=\"javascript:aa();\";");
		str.append("self.close();");//â �ݱ�
		str.append("</script>");
		out.print(str);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

	}
}
