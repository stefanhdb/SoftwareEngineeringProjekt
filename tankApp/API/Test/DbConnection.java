package Test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class DbConnection {
	
	private static final String DB_FILENAME = "Leaderboard.db";
    private static final String DB_PATH = "Datenbank\\" + DB_FILENAME;
	
    private static Connection connect() {
    	
    	String url = "jdbc:sqlite:" + "C:\\Users\\nicho\\OneDrive\\Dokumente\\GitHub\\SoftwareEngineeringProjekt\\tankApp\\Datenbank\\Leaderboard.db";
    	//String url = "jdbc:sqlite:" + DB_PATH;
    	//System.out.println(url);
        Connection connection = null;

        try 
        {
            connection = DriverManager.getConnection(url);
        } 
        catch (SQLException e) 
        {
            System.out.println(e.getMessage());
        }
        return connection;
    }
    
  //Rufe die gesamte Tabelle "DbData" ab und erstellt eine ArrayList mit TestObjects
    public static ArrayList<DbData> getData(String id)    {
        ArrayList<DbData> list = new ArrayList<DbData>();
        String sql = "SELECT * FROM Leaderboard";
        try  
        {     	
        	Connection conn = connect(); 
        	PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet resultSet = pstmt.executeQuery();
                        
            //Iteriert durch das gesamte Ergebnis der Abfrage 
            //und erstellt für jede Zeile ein neues Testobjekt
            while (resultSet.next()) 
            {
            	try {
                int tid = resultSet.getInt("TankId");
                String tsId = resultSet.getString("TankstellenId"); 
                String tnId = resultSet.getString("TankstellenName"); 
                String user = resultSet.getString("Tanker"); 
                String fuel = resultSet.getString("Treibstoff"); 
                double price = resultSet.getDouble("Preis");
                double liter = resultSet.getDouble("Liter");
                String dateStr = resultSet.getString("Datum");
                double tsPreis = resultSet.getDouble("TankstellenPreis");
        		double avgP =  resultSet.getDouble("DurchschnittAbweichung");
                
                Date date = new SimpleDateFormat("dd.MM.yyyy").parse( dateStr);

                
                if(id.equals(tsId)) {
                DbData data = new DbData(tid, tsId, tnId, user, fuel, price, liter, date, tsPreis, avgP);
                list.add(data);
                }
                }
                catch(Exception e) {
                System.out.println("Es ist ein Fehler mit der Datenbank aufgetreten: " + e);	
                } 
            }
            conn.close();
        } 
        catch (SQLException e) 
        {
            System.out.println(e.getMessage());
        }
        return list;

    }
    
    public static String createTable(ArrayList<DbData> list, String fuel ,String dateAbStr, String dateBisStr) {
		String table = "";
		try {
		//Die Date-Strings in den typ Date umwandeln, damit man sie mit dem Datum der Transaktion vergleichen kann
		SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy");	
		if(!dateAbStr.equals("")) {	
		String[] dateAbAr = dateAbStr.split("-");
		dateAbStr = dateAbAr[2]  + "."+ dateAbAr[1]  + "."+ dateAbAr[0];	
		}
		if(!dateBisStr.equals("")) {			
		String[] dateBisAr = dateBisStr.split("-");
		dateBisStr = dateBisAr[2] + "."+ dateBisAr[1]  + "."+ dateBisAr[0];
		}
		
		if(!dateAbStr.equals("")&&!dateBisStr.equals("")) {
			//Wenn beide Daten eingegeben wurden
	    	Date dateAb = formatter.parse(dateAbStr);
	    	Date dateBis = formatter.parse(dateBisStr);
	    	
	    	for (DbData db : list) {
	    		//Nur Transaktionen, bei denen der Treibstoff und das Datum passt, werden angegeben
				if((fuel.equals(db.getFuel())||fuel.equals("")) && (db.getDate().compareTo(dateAb)>0 && db.getDate().compareTo(dateBis)<0 )) {
					
				double preisProLiter = db.getPreis()/db.getLiter();
				double gespartProLiter = preisProLiter - (db.getTsPreis()+db.getAvgP());
				
				
				table += "<tr>" + 
				"<td>" + db.getUser() + "</td>" + 
				"<td>" + preisProLiter + "</td>" +
				"<td>" + gespartProLiter + "</td>" +
				"</tr>";
				}
			}
		}
		else if(!dateAbStr.equals("")) {
			//Wenn nur das Ab-Datum eingegeben wurde
			Date dateAb = formatter.parse(dateAbStr);
			for (DbData db : list) {
				if((fuel.equals(db.getFuel())||fuel.equals("")) && db.getDate().compareTo(dateAb)>0 ) {
				//Nur Transaktionen, bei denen der Treibstoff und das Datum passt, werden angegeben	
				double preisProLiter = db.getPreis()/db.getLiter();
				double gespartProLiter = preisProLiter - (db.getTsPreis()+db.getAvgP());
				
				
				table += "<tr>" + 
				"<td>" + db.getUser() + "</td>" + 
				"<td>" + preisProLiter + "</td>" +
				"<td>" + gespartProLiter + "</td>" +
				"</tr>";
				}
			}
    	}
		else if(!dateBisStr.equals("")) {
			//Wenn nur das Bis-Datum eingegeben wurde
	    	Date dateBis = formatter.parse(dateBisStr);
	    	for (DbData db : list) {
				if((fuel.equals(db.getFuel())||fuel.equals("")) &&  db.getDate().compareTo(dateBis)<0 ) {
				//Nur Transaktionen, bei denen der Treibstoff und das Datum passt, werden angegeben	
				double preisProLiter = db.getPreis()/db.getLiter();
				double gespartProLiter = preisProLiter - (db.getTsPreis()+db.getAvgP());
				
				
				table += "<tr>" + 
				"<td>" + db.getUser() + "</td>" + 
				"<td>" + preisProLiter + "</td>" +
				"<td>" + gespartProLiter + "</td>" +
				"</tr>";
				}
			}
	    	}
		else {
			//Wenn kein Datum angegeben wurde
			for (DbData db : list) {
				if(fuel.equals(db.getFuel())||fuel.equals("")) {
				//Nur Transaktionen, bei denen der Treibstoff und das Datum passt, werden angegeben	
				double preisProLiter = db.getPreis()/db.getLiter();
				double gespartProLiter = preisProLiter - (db.getTsPreis()+db.getAvgP());
				
				
				table += "<tr>" + 
				"<td>" + db.getUser() + "</td>" + 
				"<td>" + preisProLiter + "</td>" +
				"<td>" + gespartProLiter + "</td>" +
				"</tr>";
				}
			}
			
		}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return table;
	}
    
    public static double avgP(String id, String fuel) {
    	HttpURLConnection con = null;
    	double totalPrice =0;	
    	String newId = id.replace("-", "/");
    	
    	String urlSt = "https://www.volzinnovation.com/fuel_price_variations_germany/data/"+ newId + "/"+ fuel +".json";
    	try {
			// Create connection
			URL url = new URL(urlSt);
			con = (HttpURLConnection) url.openConnection();
			con.addRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:25.0) Gecko/20100101 Firefox/25.0");
			con.setRequestMethod("GET");
			con.connect();			

			JsonElement element = JsonParser.parseReader(new InputStreamReader(con.getInputStream()));
			JsonArray  obj = element.getAsJsonArray();


				String jsonString = obj.toString();
				Gson gson = new Gson();
				ArrayList<Preise> preis = new ArrayList<Preise>();
				Type listType = new TypeToken<ArrayList<Preise>>() {
				}.getType();
				preis = gson.fromJson(jsonString, listType);
				for (Preise p : preis) {
					totalPrice = totalPrice + p.getPrice();
				}
				double avgP = totalPrice/preis.size();
				return avgP;
			


		}

		catch (Exception e) {
			System.out.println("Ein Fehler ist bei der Preisabfrage entstanden: " + e);
			
		}
    	return 0;	
    	
    }
    
    
    public static void insertData(ArrayList<DbData> db) {

        //SQL statement wird vorbereitet, noch mit variablen Werten
        //die beiden Fragezeichen entspechen hier den Werten für ID und Text
        String sql = "INSERT INTO Leaderboard(TankId,TankstellenId, TankstellenName, Tanker, Treibstoff, Preis, Liter, Datum, TankstellenPreis,DurchschnittAbweichung) VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
        	Connection conn = connect(); 
        	PreparedStatement pstmt = conn.prepareStatement(sql);
            //füllt das SQL statement mit den Werten des TestObjects, welches übergeben wurde
            //erstes Fragezeichen wird mit der ID  des übergebenen TestObjects gefüllt
        	SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy");
        	String dateForm = formatter.format(db.get(0).getDate());
        	
            pstmt.setInt(1, db.get(0).gettId());
            pstmt.setString(2, db.get(0).getTsId());
            pstmt.setString(3, db.get(0).getTsName());
            pstmt.setString(4, db.get(0).getUser());
            pstmt.setString(5, db.get(0).getFuel());
            pstmt.setDouble(6, db.get(0).getPreis());
            pstmt.setDouble(7, db.get(0).getLiter());
            pstmt.setString(8, dateForm);            
            pstmt.setDouble(9, db.get(0).getTsPreis());            
            pstmt.setDouble(10, db.get(0).getAvgP());
            //Nun vollständiges SQL statement wird jetzt ausgeführt
            pstmt.executeUpdate();
            conn.close();

        } 
        catch (Exception e) {
            System.out.println("Ein fehler beim Eintragen in die Datenbank ist entstanden: " + e.getMessage());
        }

    }
    
public static ArrayList<DbData> getArray(int id, String tsId, String tsName, String user, String fuel, String price, String liter, String dateStr, String tsPreisStr, String avgPStr)    {
	
	ArrayList<DbData> list = new ArrayList<DbData>();
	try {
	double preis = Double.parseDouble(price);
	double literDoub = Double.parseDouble(liter);
	double tsPreis = Double.parseDouble(tsPreisStr);
	double avgP = Double.parseDouble(avgPStr);	
	
	Date date = new Date();
	
	DbData data = new DbData(id, tsId, tsName, user, fuel, preis, literDoub, date, tsPreis, avgP);
	list.add(data);
	
	}
	catch(Exception e) {
		System.out.println(e.getMessage());
	}
	return list;
	
	}


public static boolean searchUName(String uname) {
	String sql = "SELECT Tanker FROM Leaderboard";
	try  
    {     	
    	Connection conn = connect(); 
    	PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet resultSet = pstmt.executeQuery();
                    
        //Iteriert durch das gesamte Ergebnis der Abfrage 
        //und erstellt für jede Zeile ein neues Testobjekt
        while (resultSet.next()) 
        {
        	try {
            String user = resultSet.getString("Tanker"); 
        	if(uname.equals(user)) {
        		System.out.println(user);
        	return false;
        	}

            }
            catch(Exception e) {
            System.out.println("Es ist ein Fehler mit der Datenbank aufgetreten: " + e);	
            } 
        }
        conn.close();
    } 
    catch (SQLException e) 
    {
        System.out.println(e.getMessage());
    }
	return true;
}
    
    
    
}
