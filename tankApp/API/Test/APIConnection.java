package Test;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import java.io.InputStream;


public class APIConnection {
	
	static ArrayList <Tankstelle> TankstellenListe = new ArrayList <Tankstelle>();
	
//	public void addUser() {
//		Tankstelle ts = new Tankstelle();
//		TankstellenListe.add(ts);
//	}
	

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
    	Gson gson = new Gson();
    	Type listType = new TypeToken<ArrayList<Tankstelle>>(){}.getType();
    	TankstellenListe = gson.fromJson(jsonString, listType);
    }
    
    for(Tankstelle t: TankstellenListe) {
    	System.out.println(t.toString());
    }
    
    return obj.toString();
	  }
	  catch(Exception e) {
		  return null;
	  }
	  
	}
}
