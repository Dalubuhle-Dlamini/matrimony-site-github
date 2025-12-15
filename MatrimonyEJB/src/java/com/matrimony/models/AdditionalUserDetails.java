package com.matrimony.models;

/**
 *
 * @author dsihle875@gmail.com
 */
public class AdditionalUserDetails {
    private int userId;
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

    public AdditionalUserDetails(int userId, String aboutSelf, String familyDetails, String qualification, String workingAt, String designation, String hobbies, String favouriteGenre, String favouriteMovies, String favouriteCuisine, String favouriteBooks, String favouritePlaces) {
        this.userId = userId;
        this.aboutSelf = aboutSelf;
        this.familyDetails = familyDetails;
        this.qualification = qualification;
        this.workingAt = workingAt;
        this.designation = designation;
        this.hobbies = hobbies;
        this.favouriteGenre = favouriteGenre;
        this.favouriteMovies = favouriteMovies;
        this.favouriteCuisine = favouriteCuisine;
        this.favouriteBooks = favouriteBooks;
        this.favouritePlaces = favouritePlaces;
    }

    public AdditionalUserDetails() {
    }

    
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

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
 
}
