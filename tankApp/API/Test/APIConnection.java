package Test;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.InputStream;


public class APIConnection {
	

public static String executePost(String targetURL) {
	  HttpURLConnection connection = null;
	  
	  try {
	    //Create connection
	    URL url = new URL(targetURL);
	    connection = (HttpURLConnection) url.openConnection();
	    connection.setRequestMethod("GET");
	    connection.connect();
	   
	    JsonElement element = JsonParser.parseReader(new InputStreamReader(connection.getInputStream()));
        JsonObject obj = element.getAsJsonObject();
	    
	    
    if(obj.get("status").getAsString().equals("ok")){
    	
    	String jsonString= obj.toString().substring(obj.toString().indexOf("["), (obj.toString().indexOf("]")+1));
    	
    }
    
    return obj.toString();
	  }
	  catch(Exception e) {
		  return null;
	  }
	  
	}
}
