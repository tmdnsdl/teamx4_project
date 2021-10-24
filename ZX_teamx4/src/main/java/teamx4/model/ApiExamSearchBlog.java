package teamx4.model;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class ApiExamSearchBlog {


    public static void main(String[] args) {
        String clientId = "pE3wgWDVLSb_IaO6KBkq"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "NXH6oRYwvW"; //애플리케이션 클라이언트 시크릿값"


        String text = null;
        try {
            text = URLEncoder.encode("일산맛집", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }


        String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // json 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
         
         JSONParser jsonParser = new JSONParser();
         JSONObject jsonObject;
         JSONArray infoArray =null;
 		try {
 			jsonObject = (JSONObject) jsonParser.parse(responseBody);
 			infoArray = (JSONArray) jsonObject.get("items");
 		} catch (ParseException e) {
 			e.printStackTrace();
 		}
    
	try {
        for(int i = 0; i < infoArray.size();  i++) {
            JSONObject itemObject = (JSONObject) infoArray.get(i);
            System.out.println("-------------------------");
            System.out.println(itemObject.get("bloggername"));
            System.out.println(itemObject.get("postdate"));
            System.out.println(itemObject.get("bloggerlink"));
            System.out.println(itemObject.get("title"));
            System.out.println(itemObject.get("description"));
            System.out.println(itemObject.get("link"));
            System.out.println(itemObject.get("link"));
            System.out.println("-------------------------");
            System.out.println();
            System.out.println();
            System.out.println();
        }
        System.out.println("검색된 총 포스트 수 "+infoArray.size());
		}catch (NullPointerException e) {
			System.out.println("NullPointerException 발생");
          
		}
    }


    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }
            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}