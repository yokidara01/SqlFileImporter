import java.io.BufferedReader;

import java.io.File;
import java.io.FileReader;

import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class InitDatabase {
   static String url = "jdbc:postgresql://localhost:5432/";
    static String user = "postgres";
    static String password = "root";

    static {
        try {
            Connection con = DriverManager.getConnection(url, user, password);
            System.out.println("*** Driver loaded");
        } catch (Exception e) {
            System.out.println("*** Error : " + e.toString());
            System.out.println("*** ");
            System.out.println("*** Error : ");
            e.printStackTrace();
        }

    }



    private static String INSTRUCTIONS = new String();

    public static Connection getConnection(String dbName) throws SQLException {
        return DriverManager.getConnection(url+dbName, user, password);
    }

    public static void resetDatabase(String dbName) throws SQLException {
        String s = new String();
        StringBuffer sb = new StringBuffer();

        try {
            FileReader fr = new FileReader(new File("C:\\Users\\octanet\\Desktop\\dumpmmt-clean.sql"));
            BufferedReader br = new BufferedReader(fr);
            while ((s = br.readLine()) != null) {
                sb.append(s);
            }
            br.close();

            String[] inst = sb.toString().split(";");

            Connection c = InitDatabase.getConnection(dbName);
            Statement st = c.createStatement();

            for (int i = 0; i < inst.length; i++) {

                if (!inst[i].trim().equals("")) {
                    int a =st.executeUpdate(inst[i]);
                    System.out.println(">>" + inst[i]);
                }
            }
            st.close();
            c.close();
        } catch (Exception e) {

            System.out.println("*** Error : " + e.toString());
            System.out.println("*** ");
            System.out.println("*** Error : ");
            e.printStackTrace();
            System.out.println("################################################");
            System.out.println(sb.toString());
        }

    }



    public static void creatDatabase(String dbName){

        String url = "jdbc:postgresql://localhost:5432/";
        String user = "postgres";
        String password = "root";

        try {
            Connection con = DriverManager.getConnection(url, user, password);
            Statement statement = con.createStatement();
            statement.executeUpdate("CREATE DATABASE "+dbName);

            statement.close();
            con.close();


        } catch (SQLException ex) {

            Logger lgr = Logger.getLogger(Main.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }

}