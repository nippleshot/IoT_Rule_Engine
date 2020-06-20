package example;

public class Classroom {
    private String roomNum;
    private String status; //{"class_start", "class_done", "self_study"}
    private String door_lock; //{"lock", "unlock"}
    private int current_temp;

    public Classroom(String roomNum, String status, String door_lock, int current_temp) {
        this.roomNum = roomNum;
        this.status = status;
        this.door_lock = door_lock;
        this.current_temp = current_temp;
    }

    public Classroom() {
    }

    @Override
    public String toString() {
        return "Classroom{" + "\n" +
                "roomNum='" + roomNum + '\'' + "\n" +
                ", status='" + status + '\'' + "\n" +
                ", door_lock='" + door_lock + '\'' + "\n" +
                ", current_temp=" + current_temp + "\n" +
                '}';
    }

    public String getRoomNum() {
        return roomNum;
    }

    public String getStatus() {
        return status;
    }

    public String getDoor_lock() {
        return door_lock;
    }

    public int getCurrent_temp() {
        return current_temp;
    }

    public void setRoomNum(String roomNum) {
        this.roomNum = roomNum;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setDoor_lock(String door_lock) {
        this.door_lock = door_lock;
    }

    public void setCurrent_temp(int current_temp) {
        this.current_temp = current_temp;
    }
}
