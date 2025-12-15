package com.matrimony.models;

import java.sql.Date;
import java.time.LocalDateTime;

public class User {
    private int user_id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String gender;
    private Date date_of_birth;
    private int height;
    private String marital_status;
    private String country;
    private String city;
    private String contact_number;
    private String mother_tongue;
    private String religion;
    private String caste;
    private String user_type;
    private LocalDateTime createdAt = LocalDateTime.now();

    // New fields for additional user info
    private int likes;
    private int views;
    private byte[] photo;
    
    //new fields for additional user details
    private String aboutSelf;
    private String familyDetails;
    private String qualification;
    private String workingAt;
    private String designation;
    private String hobbies;
    private String favouriteGenre;
    private String favouriteMovies;
    private String favouriteCuisine;
    private String favouriteBooks;
    private String favouritePlaces;
    
//    main class constructor

    public User() {
    }

//    constructor with all fields

    public User(int user_id, String firstname, String lastname, String email, String password, String gender, Date date_of_birth, int height, String marital_status, String country, String city, String contact_number, String mother_tongue, String religion, String caste, String user_type) {
        this.user_id = user_id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.date_of_birth = date_of_birth;
        this.height = height;
        this.marital_status = marital_status;
        this.country = country;
        this.city = city;
        this.contact_number = contact_number;
        this.mother_tongue = mother_tongue;
        this.religion = religion;
        this.caste = caste;
        this.user_type = user_type;
    }
    

//    getters and setter

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }
    
//    getters and setters for additional details
    public String getAboutSelf() {
        return aboutSelf;
    }

    public void setAboutSelf(String aboutSelf) {
        this.aboutSelf = aboutSelf;
    }

    public String getFamilyDetails() {
        return familyDetails;
    }

    public void setFamilyDetails(String familyDetails) {
        this.familyDetails = familyDetails;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getWorkingAt() {
        return workingAt;
    }

    public void setWorkingAt(String workingAt) {
        this.workingAt = workingAt;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }

    public String getFavouriteGenre() {
        return favouriteGenre;
    }

    public void setFavouriteGenre(String favouriteGenre) {
        this.favouriteGenre = favouriteGenre;
    }

    public String getFavouriteMovies() {
        return favouriteMovies;
    }

    public void setFavouriteMovies(String favouriteMovies) {
        this.favouriteMovies = favouriteMovies;
    }

    public String getFavouriteCuisine() {
        return favouriteCuisine;
    }

    public void setFavouriteCuisine(String favouriteCuisine) {
        this.favouriteCuisine = favouriteCuisine;
    }

    public String getFavouriteBooks() {
        return favouriteBooks;
    }

    public void setFavouriteBooks(String favouriteBooks) {
        this.favouriteBooks = favouriteBooks;
    }

    public String getFavouritePlaces() {
        return favouritePlaces;
    }

    public void setFavouritePlaces(String favouritePlaces) {
        this.favouritePlaces = favouritePlaces;
    }

    
    
    
    
    
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public String getMarital_status() {
        return marital_status;
    }

    public void setMarital_status(String marital_status) {
        this.marital_status = marital_status;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getContact_number() {
        return contact_number;
    }

    public void setContact_number(String contact_number) {
        this.contact_number = contact_number;
    }

    public String getMother_tongue() {
        return mother_tongue;
    }

    public void setMother_tongue(String mother_tongue) {
        this.mother_tongue = mother_tongue;
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getCaste() {
        return caste;
    }

    public void setCaste(String caste) {
        this.caste = caste;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }
           
}
