package naver;
 
// 네이버 API 예제 - 회원프로필 조회
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
 
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
 
public class APIExamMemberProfile {
	private static String token;
	private static String name;
	private static String email;
 
	public APIExamMemberProfile(String token) {
		this.token = token;
	}
 
	public String getName() {
		return name;
	}
 
	public String getEmail() {
		return email;
	}
 
	public static void main(String[] args) {
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject) parser.parse(response.toString());
			JSONObject responObj = (JSONObject) parser.parse((String) jsonObject.get("response"));
			name = (String) responObj.get("name");
			email = (String) responObj.get("email");
 
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
