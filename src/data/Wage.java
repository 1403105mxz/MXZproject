package data;

/**
 * Created by dell on 2016/12/11.
 */
public class Wage {
    private String username;
    private String name;
    private int id;
    private int attendanceday;
    private int basewage;
    private int bonus;
    private int deduction;
    private int total;

    public int getAttendanceday() {
        return attendanceday;
    }

    public int getBasewage() {
        return basewage;
    }

    public int getBonus() {
        return bonus;
    }

    public int getDeduction() {
        return deduction;
    }

    public int getId() {
        return id;
    }

    public int getTotal() {
        return total;
    }

    public String getName() {
        return name;
    }

    public String getUsername() {
        return username;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAttendanceday(int attendanceday) {
        this.attendanceday = attendanceday;
    }

    public void setBasewage(int basewage) {
        this.basewage = basewage;
    }

    public void setBonus(int bonus) {
        this.bonus = bonus;
    }

    public void setDeduction(int deduction) {
        this.deduction = deduction;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}
