package naver;
 
// ���̹� API ���� - ȸ�������� ��ȸ
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
 
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
 
public class APIExamMemberProfile {
	public static String name;
	public static String email;
 
	public static void getInfo (String token) {
		String header = "Bearer " + token; // Bearer ������ ���� �߰�
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // ���� ȣ��
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // ���� �߻�
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject) parser.parse(response.toString());
			JSONObject reJsonObject = (JSONObject)jsonObject.get("response"); 
			name = (String) reJsonObject.get("name");
			email = (String) reJsonObject.get("id");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
 
	public static void main(String[] args) {
		
	}
}
