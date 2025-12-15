package com.matrimony.models;

/**
 *
 * @author dsihle875@gmail.com
 */
public class AdditionalUserInfo {
    private int id;
    private int user_id;
    private int likes;
    private int view;
    
//    empty constructor
    public AdditionalUserInfo() {
    }
    
    public AdditionalUserInfo(int id, int user_id, int likes, int view) {
        this.id = id;
        this.user_id = user_id;
        this.likes = likes;
        this.view = view;
    }

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

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }
   
}
