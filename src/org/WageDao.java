package org;
import data.User;
import data.Wage;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 * Created by dell on 2016/12/11.
 */
public class WageDao {
    public static Wage selectWages(String username){
        Connection conn;
        Wage result = new Wage();
        try {

            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM wages");
            while (rs.next()) {
                if (rs.getString(1).equals(username)){
                    result.setUsername(rs.getString(1));
                    result.setName(rs.getString(2));
                    result.setId(rs.getInt(3));
                    result.setAttendanceday(rs.getInt(4));
                    result.setBasewage(rs.getInt(5));
                    result.setBonus(rs.getInt(6));
                    result.setDeduction(rs.getInt(7));
                    result.setTotal(rs.getInt(8));
                    return result;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public static List<Wage> showWages(int id) {
        Connection conn;
        List<Wage> result = new ArrayList<>();
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM wages");
            while (rs.next()) {
                if (rs.getInt(3) < id) {
                    Wage temp = new Wage();
                    temp.setUsername(rs.getString(1));
                    temp.setName(rs.getString(2));
                    temp.setId(rs.getInt(3));
                    temp.setAttendanceday(rs.getInt(4));
                    temp.setBasewage(rs.getInt(5));
                    temp.setBonus(rs.getInt(6));
                    temp.setDeduction(rs.getInt(7));
                    temp.setTotal(rs.getInt(8));
                    result.add(temp);
                }
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static int editWage(Wage wage){
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        int id = (int)session.getAttribute("newid");
        if (id <= wage.getId()){
            return -1;
        }
        int total = wage.getBasewage() + ((wage.getAttendanceday() - 20) * 100) + wage.getBonus() - wage.getDeduction();
        Connection conn;
        try {
            conn = DatabaseConn.getConnection();
            Statement st = conn.createStatement();
            String sql = "UPDATE wages SET attendanceday ='"+wage.getAttendanceday()+"', basewage ='" +wage.getBasewage()
                    +"', bonus ='"+wage.getBonus()+ "', deduction ='"+wage.getDeduction()+"', total ='"+total +"' where username ='"+wage.getUsername()+"'";
            st.executeUpdate(sql);
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return -2;
        }
    }
}
