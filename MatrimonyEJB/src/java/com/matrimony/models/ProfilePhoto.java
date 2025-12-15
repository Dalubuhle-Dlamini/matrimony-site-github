package com.matrimony.models;

/**
 *
 * @author dsihle875@gmail.com
 */
public class ProfilePhoto {
    private int id;
    private int user_id;
    private byte[] photo;

//    empty constructor
    public ProfilePhoto() {
    }

    public ProfilePhoto(int id, int user_id, byte[] photo) {
        this.id = id;
        this.user_id = user_id;
        this.photo = photo;
    }
    
//    getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }
    
    
}
