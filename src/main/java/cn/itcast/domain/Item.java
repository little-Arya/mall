package cn.itcast.domain;

public class Item {
    private Integer id;
    private String username;
    private Integer pid;
    private String prname;
    private String total;
    private Integer num;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getPrname() {
        return prname;
    }

    public void setPrname(String prname) {
        this.prname = prname;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", pid=" + pid +
                ", prname='" + prname + '\'' +
                ", total='" + total + '\'' +
                ", num=" + num +
                '}';
    }
}
