package com.matrimony.stateful;

import com.matrimony.models.AdditionalUserDetails;
import com.matrimony.models.AdditionalUserInfo;
import com.matrimony.models.ProfilePhoto;
import com.matrimony.models.User;
import com.matrimony.models.UserAdd;
import com.mysql.cj.jdbc.Blob;
import jakarta.ejb.Local;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author dsihle875@gmail.com
 */
@Local
public interface MatrimonySessionBeanLocal {

    /**
     *
     * @param firstname
     * @param lastname
     * @param email
     * @param password
     * @param gender
     * @param dob
     * @param height
     * @param maritalStatus
     * @param country
     * @param city
     * @param number
     * @param language
     * @param religion
     * @param caste
     * @param userType
     * @return
     * @throws SQLException
     */
    public int insertBasicUserInformation(String firstname,
            String lastname,
            String email,
            String password,
            String gender,
            String dob,
            int height,
            String maritalStatus,
            String country,
            String city,
            String number,
            String language,
            String religion,
            String caste,
            String userType, 
            String paymentMethod, 
            String amount
    ) throws SQLException;


    /**
     *
     * @param caste
     * @return
     * @throws SQLException
     */
    public List<User> searchByCaste(String caste) throws SQLException;

    /**
     *
     * @param member_id
     * @return
     * @throws SQLException
     */
    public User searchByMemberId(int member_id) throws SQLException;

    /**
     *
     * @param email
     * @return
     * @throws SQLException
     */
    public User getUserByEmail(String email) throws SQLException;


    /**
     *
     * @param username
     * @param password
     * @return
     * @throws SQLException
     */
    public String loginUser(String username, String password) throws SQLException;


    /**
     *
     * @param id
     * @param firstname
     * @param lastname
     * @param email
     * @param gender
     * @param dob
     * @param height
     * @param maritalStatus
     * @param country
     * @param city
     * @param number
     * @param language
     * @param religion
     * @param caste
     * @param userType
     * @throws SQLException
     */
    public void updateUser(
            int id,
            String firstname,
            String lastname,
            String email,
            String gender,
            String dob,
            String height,
            String maritalStatus,
            String country,
            String city,
            String number,
            String language,
            String religion,
            String caste,
            String userType
    ) throws SQLException;


    /**
     *
     * @param id
     * @param oldPassword
     * @param newPassword
     * @throws SQLException
     */
    public void updatePassword(int id, String oldPassword, String newPassword) throws SQLException;

    /**
     *
     * @param userId
     * @param profilePhoto
     * @throws SQLException
     */
    public void updateProfilePhoto(int userId, byte[] profilePhoto) throws SQLException;

    /**
     *
     * @param userId
     * @param aboutSelf
     * @param familyDetails
     * @param qualification
     * @param workingAt
     * @param designation
     * @param hobbies
     * @param favoriteMusic
     * @param favoriteMovies
     * @param favoriteCuisines
     * @param favoriteBooks
     * @param favoritePlaces
     * @throws SQLException
     */
    public void updateUserDetails(int userId, String aboutSelf, String familyDetails, String qualification,
            String workingAt, String designation, String hobbies, String favoriteMusic,
            String favoriteMovies, String favoriteCuisines, String favoriteBooks,
            String favoritePlaces) throws SQLException;

    /**
     *
     * @return returns a list of users
     * @throws SQLException
     */
    public List<User> getAllUsers() throws SQLException;
    
    /**
     *
     * @return returns all user details
     * @throws SQLException
     */
    public List<AdditionalUserDetails> getAllDetails() throws SQLException;

    /**
     *
     * @param userId
     * @return
     * @throws SQLException
     */
    public ProfilePhoto getPhoto(int userId) throws SQLException;

    /**
     *
     * @param userId
     * @return
     * @throws SQLException
     */
    public AdditionalUserInfo getDetails(int userId) throws SQLException;

    /**
     *
     * @param userId
     * @param likingUserId
     * @throws SQLException
     */
    public void like(int userId, int likingUserId) throws SQLException;

    /**
     *
     * @param likedUserId
     * @param likingUserId
     * @return
     * @throws SQLException
     */
    public boolean checkIfLiked(int likedUserId, int likingUserId) throws SQLException;


    /**
     *
     * @param userId
     * @throws SQLException
     */
    public void addView(int userId) throws SQLException;

    /**
     *
     * @param userId
     * @return
     * @throws SQLException
     */
    public AdditionalUserDetails getUserDetails(int userId) throws SQLException;

    /**
     *
     * @param userId
     * @throws SQLException
     */
    public void deleteUser(int userId) throws SQLException;
    
    /**
     *
     * @return
     * @throws SQLException
     */
    public int getTotalViews() throws SQLException;
    
    /**
     *
     * @return
     * @throws SQLException
     */
    public int getTotalLikes() throws SQLException;
    
    /**
     *
     * @param userId
     * @return
     * @throws SQLException
     */
    public String getSubscribtionLeft(int userId) throws SQLException;
    
    /**
     *
     * @param userId
     * @param newAmount
     * @param newPaymentType
     * @throws SQLException
     */
    public void updatePaymentDetails(int userId, String newAmount, String newPaymentType) throws SQLException;
    
    /**
     *
     * @return
     * @throws SQLException
     */
    public List<UserAdd> getAllAdds() throws SQLException;

    /**
     *
     * @param userId
     * @param title
     * @param body
     * @throws SQLException
     */
    public void updateUserAdd(int userId, String title, String body) throws SQLException;
    
    /**
     *
     * @param userId
     * @param title
     * @param body
     * @throws SQLException
     */
    public void insertUserAdd(int userId, String title, String body) throws SQLException;
}
