import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
    String dbName ="test9";
        try {
            InitDatabase.creatDatabase(dbName);
            InitDatabase.resetDatabase(dbName);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }






}



