package org;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by meng on 2016/11/15.
 */
public class SuperDao {
    protected static PreparedStatement setPreparedStatement(String sql, Object... param) {
        PreparedStatement pst = null;
        int len = param.length;
        try {
            Connection conn = DatabaseConn.getConnection();
            pst = conn.prepareStatement(sql);
            for (int i = 0; i < len; i++) {
                if (param[i].getClass() == String.class) {
                    pst.setString(i + 1, String.valueOf(param[i]));
                } else if(param[i].getClass() == Integer.class) {
                    pst.setInt(i + 1, (int)param[i]);
                } else if(param[i].getClass() == Double.class) {
                    pst.setDouble(i + 1, (double)param[i]);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pst;
    }
}
