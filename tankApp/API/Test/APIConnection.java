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

	public static ArrayList<Tankstelle> TankstellenListe = new ArrayList<Tankstelle>();

	// public void addUser() {
	// Tankstelle ts = new Tankstelle();
	// TankstellenListe.add(ts);
	// }

	public static void executePost(String targetURL, String lat, String bret) {
		HttpURLConnection connection = null;

		String komplettURl = targetURL + "lat=" + lat + "&lng=" + bret + "&rad=" + "1,5"
				+ "&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d";

		System.out.println(komplettURl);

		try {
			// Create connection
			URL url = new URL(targetURL);
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.connect();

			JsonElement element = JsonParser.parseReader(new InputStreamReader(connection.getInputStream()));
			JsonObject obj = element.getAsJsonObject();

			if (obj.get("status").getAsString().equals("ok")) {

				String jsonString = obj.toString().substring(obj.toString().indexOf("["),
						(obj.toString().indexOf("]") + 1));
				Gson gson = new Gson();
				Type listType = new TypeToken<ArrayList<Tankstelle>>() {
				}.getType();
				TankstellenListe = gson.fromJson(jsonString, listType);
			}

			for (Tankstelle t : TankstellenListe) {
				// System.out.println(t.toString());
				// System.out.println(Test.APIConnection.TankstellenListe.get(0).getName());
			}

		}

		catch (Exception e) {
		}

	}

	public static String createTable() {
		String table = "";
		for (Tankstelle t : TankstellenListe) {
			table += "<tr>" + "<td>" + t.getName() + "</td>" + "<td>" + t.getPlace() + "</td>" + "<td>" + t.getDist()
					+ "</td>" + "</tr>";
		}
		System.out.println(table);
		return table;
	}
}
