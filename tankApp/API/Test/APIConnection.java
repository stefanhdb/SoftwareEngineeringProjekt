package Test;

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

public class APIConnection {

	public static ArrayList<Tankstelle> TankstellenListe = new ArrayList<Tankstelle>();
	
	public static ArrayList<Tankstelle> TankstellenFavListe = new ArrayList<Tankstelle>();
	
	

	public static void executePost(String targetURL) {
		HttpURLConnection connection = null;

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
				//JSON Datei in ArrayList abspeichern
				TankstellenListe = gson.fromJson(jsonString, listType);
			}


		}

		catch (Exception e) {
		}
		
//Testtankstellen erstellen
//		TankstellenListe = new ArrayList<Tankstelle>();
//		TankstellenListe.add(new Tankstelle("123"));
//		TankstellenListe.add(new Tankstelle("456"));
//		TankstellenListe.add(new Tankstelle("789"));
//		TankstellenListe.add(new Tankstelle("101"));

	}
	
	

	public static String createTable() {
		String table = "";
		String buttonText= "Zu Favoriten Hinzufügen";
		
		
		
		for (Tankstelle t : TankstellenListe) {
			for(Tankstelle tf : TankstellenFavListe) {
				//Die Favoritenliste durchgehen, ob die Tankstelle in beiden vorhanden ist und dementsprechend den Text umändern
			if(t.getId().equals(tf.getId())) {
				buttonText = "Von Favoriten entfernen";
			}
			}
			//Wenn die Tankstelle geschlossen ist, den text ändern
			String open ="Geöffnet";
			if(t.isOpen()==false) {
				open="Geschlossen";
			}
			
			//Den String für die Tabelle schreiben
			table += "<tr>" 
					+ "<td>" + t.getName() + "</td>" 
					+ "<td>" + t.getStreet() + "</td>"	
					+ "<td>" + t.getPlace() + "</td>" 
					+ "<td>" + t.getDist() + "</td>"
					+ "<td>" + t.getDiesel() + " Euro</td>" 
					+ "<td>" + t.getE10() + " Euro</td>" 
					+ "<td>" + t.getE5() + " Euro</td>"
					+ "<td>" + open + " </td>" 
					+ "<td>" + "<button type=\"button\" id="+ t.getId() +" onclick=\"favVerw(this.id)\">"+buttonText+"</button>"+ "</td>"
					+ "<td>" + "<button type=\"button\" id="+ t.getId() +" onclick=\"lbVerw(this.id)\">Leaderboard anzeigen</button>"+ "</td>"
					+ "<td>" + "<button type=\"button\" id="+ t.getId() +" onclick=\"goGraph(this.id)\">Preisveränderung in den letzten 24h</button>"+ "</td>" 
					+ "</tr>";
			
			buttonText= "Zu Favoriten Hinzufügen";
			
		}
		return table;
	}

	public static String createUrl(String latPar, String lngPar, String coord, String rad) {
		String url = null;
		if(rad==null) {
			rad="5";
		}

		if (((latPar == null && lngPar == null) || (latPar.equals("") && lngPar.equals(""))) && (coord == null  || coord.equals(""))) {
			//Wenn keine Koordinaten vorhanden sind, wird Pforzheim Standartmäßig angezeigt
			url = "https://creativecommons.tankerkoenig.de/json/list.php?lat=" + 48.8851 + "&lng=" + 8.7307
					+ "&rad="+rad +"&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d";

		} 
		else if((latPar == null && lngPar == null) || (latPar.equals("") && lngPar.equals("")) && (coord != null  || !coord.equals(""))) {
			String[] coordAr = coord.split("&");
			//Wenn Koordinaten in einem Cookie vorhanden sind und keine Parameter übergeben wurden, werden diese Standardmäßig verwendet
			
			url = "https://creativecommons.tankerkoenig.de/json/list.php?lat=" + coordAr[0] + "&lng=" + coordAr[1]
					+ "&rad="+rad +"&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d";
		}
		else {
			//Wenn keine Koordinaten gespeichert sind, werden die aktuellen Koordinaten verwendet
			url = "https://creativecommons.tankerkoenig.de/json/list.php?lat=" + latPar + "&lng=" + lngPar
					+ "&rad="+rad +"&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d";

		}
		return url;
	}
	
	public static String createUrl(String latPar, String lngPar, String rad) {
		//Wird zur suche nach einer Tankstelle verwendet
		String url = null;
		if(rad==null) {
			rad="5";
		}

		if ((latPar == null && lngPar == null) || (latPar.equals("") && lngPar.equals(""))) {
			url = "https://creativecommons.tankerkoenig.de/json/list.php?lat=" + 48.8851 + "&lng=" + 8.7307
					+ "&rad="+rad +"&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d";

		} 		
		else {

			url = "https://creativecommons.tankerkoenig.de/json/list.php?lat=" + latPar + "&lng=" + lngPar
					+ "&rad="+rad +"&sort=dist&type=all&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d";

		}
		return url;
	}
	

	
	public static void getFav(String c) {
		String[] id = c.split("&");
		String url = "https://creativecommons.tankerkoenig.de/json/detail.php?";
		
		TankstellenFavListe.clear();
		
		//Die FavoritenListe durchgehen und die Daten von ihnen abfragen
		//Einzelne abfragen für die Tankstellen sind nötig, da wenn der User sich aus und wieder einloggt, müssen diese wieder vorhanden sein
		for(String i : id) {
			HttpURLConnection connection = null;
			url = "https://creativecommons.tankerkoenig.de/json/detail.php?";
			url += "id=" + i +"&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d";
			
			
			try {
				// Create connection
				URL targetUrl = new URL(url);
				connection = (HttpURLConnection) targetUrl.openConnection();
				connection.setRequestMethod("GET");
				connection.connect();

				JsonElement element = JsonParser.parseReader(new InputStreamReader(connection.getInputStream()));
				JsonObject obj = element.getAsJsonObject();
				

				if (obj.get("status").getAsString().equals("ok")) {
					
					String jsonString = obj.toString().substring(obj.toString().indexOf("station")+9,
							(obj.toString().length()-1));
					Gson gson = new Gson();
					//Tankstellen zu Array List hinzufügen
					TankstellenFavListe.add(gson.fromJson(jsonString, Tankstelle.class)) ;
					}
				
			
				}
			catch (Exception e) {
				}
			}
		
		
		//Test Favoriten Tankstellen
//		TankstellenFavListe = new ArrayList<Tankstelle>();
//		for(Tankstelle t : TankstellenListe) {
//			if(c.contains(t.getId())) {
//				TankstellenFavListe.add(t);
//			}
//		}
		
		}
		
	
	public static String createTableFav() {
		String table = "";
		
		for (Tankstelle t : TankstellenFavListe) {
			//Wenn die Tankstelle geschlossen ist, den text ändern
			String open ="Geöffnet";
			if(t.isOpen()==false) {
				open="Geschlossen";
			}
			
			//Den String für die Tabelle schreiben
			table += "<tr>" 
					+ "<td>" + t.getName() + "</td>" 
					+ "<td>" + t.getStreet() + "</td>"	
					+ "<td>" + t.getPlace()  + "</td>"
					+ "<td>" + t.getDiesel() + " Euro</td>" 
					+ "<td>" + t.getE10() + " Euro</td>" 
					+ "<td>" + t.getE5() + " Euro</td>"
					+ "<td>" + open + " </td>" 
					+ "<td>" + "<button type=\"button\" id="+ t.getId() +" onclick=\"favVerw(this.id)\">Von Favoriten entfernen</button>"+ "</td>" 
					+ "<td>" + "<button type=\"button\" id=\"lb\" onclick=\"lbVerw()\">Leaderboard anzeigen</button>" + "</td>" 
					+ "<td>" + "<button type=\"button\" id="+ t.getId() +" onclick=\"goGraph(this.id)\">Preisveränderung in den letzten 24h</button>"+ "</td>" 
					+ "</tr>";
		}		
		
		return table;
	}
	
	public static double getPrice(String id, String fuel) {	
			//Den Preis einer Tankstelle bestimmen
			HttpURLConnection connection = null;
			String realId = id.replace("\"", "");
			
			String urlStr = "https://creativecommons.tankerkoenig.de/json/detail.php?";
			urlStr += "id=" + realId +"&apikey=1ed6e591-71c8-44d4-ada3-0ddfb623d87d";
			
			try {
				// Create connection
				URL targetUrl = new URL(urlStr);
				connection = (HttpURLConnection) targetUrl.openConnection();
				connection.setRequestMethod("GET");
				connection.connect();

				JsonElement element = JsonParser.parseReader(new InputStreamReader(connection.getInputStream()));
				JsonObject obj = element.getAsJsonObject();
				
				if (obj.get("status").getAsString().equals("ok")) {
					
					String jsonString = obj.toString().substring(obj.toString().indexOf("station")+9,
							(obj.toString().length()-1));
					Gson gson = new Gson();
					ArrayList<Tankstelle> TankstellenPreis = new ArrayList<Tankstelle>();
					TankstellenPreis.add(gson.fromJson(jsonString, Tankstelle.class));
					
					//Preis für den angegebenen Treibstoff ermitteln
					if(fuel.equals("diesel")) {
					double price = TankstellenPreis.get(0).getDiesel();
					return price;	
					}
					else if(fuel.equals("e5")) {
						double price = TankstellenPreis.get(0).getE5();
						return price;	
						}
					else {
						double price = TankstellenPreis.get(0).getE10();
						return price;	
					}
					}
				
			
				}
			catch (Exception e) {
				}
			return 0;
		
			}	
}
