package org;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by meng on 2016/11/15.
 */
public class SuperDao {
    protected static PreparedStatement setPreparedStatement(String sql, Object... param) {
        Connection conn = DatabaseConn.getConn();
        PreparedStatement pst = null;
        int len = param.length;
        try {
            pst = conn.prepareStatement(sql);
            for (int i = 0; i < len; i++) {
                if (param[i].getClass() == String.class) {
                    pst.setString(i, String.valueOf(param[i]));
                } else if(param[i].getClass() == Integer.class) {
                    pst.setInt(i, (int)param[i]);
                } else if(param[i].getClass() == Double.class) {
                    pst.setDouble(i, (double)param[i]);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pst;
    }
}
