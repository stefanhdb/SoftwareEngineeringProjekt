package Test;

import java.io.BufferedReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

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
                
                Date date = new SimpleDateFormat("dd.MM.yyyy").parse( dateStr);

                
                if(id.equals(tsId)) {
                DbData data = new DbData(tid, tsId, tnId, user, fuel, price, liter, date);
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
    
    public static String createTable(ArrayList<DbData> list) {
		String table = "";
		
		
		
		for (DbData db : list) {
//			System.out.println(db.getLiter());
//			System.out.println(db.getPreis());
			double preisProLiter = db.getPreis()/db.getLiter();
			
			
			table += "<tr>" + "<td>" + db.getUser() + "</td>" + "<td>" + preisProLiter + "</td>"					
					+ "</tr>";
			
		}
		return table;
	}
    
    
    public static void insertData(ArrayList<DbData> db) {

        //SQL statement wird vorbereitet, noch mit variablen Werten
        //die beiden Fragezeichen entspechen hier den Werten für ID und Text
        String sql = "INSERT INTO Leaderboard(TankId,TankstellenId, TankstellenName, Tanker, Treibstoff, Preis, Liter, Datum) VALUES(?,?,?,?,?,?,?,?)";
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
            //Nun vollständiges SQL statement wird jetzt ausgeführt
            pstmt.executeUpdate();
            conn.close();

        } 
        catch (Exception e) {
            System.out.println("Ein fehler beim Eintragen in die Datenbank ist entstanden: "+e.getMessage());
        }

    }
    
public static ArrayList<DbData> getArray(int id, String tsId, String tsName, String user, String fuel, String price, String liter, String dateStr)    {
	
	ArrayList<DbData> list = new ArrayList<DbData>();
	try {
	double preis = Double.parseDouble(price);
	double literDoub = Double.parseDouble(liter);
	
	String[] result = dateStr.split("-");
	String newDate =  result[2] + "." + result[1] + "." + result[0];
	
	Date date = new SimpleDateFormat("dd.MM.yyyy").parse( newDate);
	
	DbData data = new DbData(id, tsId, tsName, user, fuel, preis, literDoub, date);
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
