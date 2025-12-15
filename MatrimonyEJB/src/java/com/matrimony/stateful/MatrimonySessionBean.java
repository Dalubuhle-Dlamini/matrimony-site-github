package com.matrimony.stateful;

import com.matrimony.models.AdditionalUserDetails;
import com.matrimony.models.AdditionalUserInfo;
import com.matrimony.models.ProfilePhoto;
import com.matrimony.models.User;
import com.matrimony.models.UserAdd;
import com.matrimony.util.DBConnection;
import jakarta.ejb.Stateful;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author dsihle875@gmail.com
 */
//stateful class for implementations of local session bean
@Stateful
public class MatrimonySessionBean implements MatrimonySessionBeanLocal {

    @Override
    public int insertBasicUserInformation(String firstname, String lastname, String email, String password, String gender, String dob, int height, String maritalStatus, String country, String city, String number, String language, String religion, String caste, String userType, String paymentMethod, String amount) throws SQLException {
        if (getUserByEmail(email) != null) {
            throw new SQLException("User Already Exsits In Database");
        }
        String hashed_password = hashPassword(password);
        LocalDateTime createdAt = LocalDateTime.now();
        LocalDate dateOfBirth = LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String query = "INSERT INTO users (firstname, lastname, email, password, gender, date_of_birth, height,marital_status, country, city, contact_number, mother_tongue, religion, caste, user_type, createdAt) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, firstname);
            stmt.setString(2, lastname);
            stmt.setString(3, email);
            stmt.setString(4, hashed_password);
            stmt.setString(5, gender);
            stmt.setDate(6, java.sql.Date.valueOf(dateOfBirth));
            stmt.setInt(7, height);
            stmt.setString(8, maritalStatus);
            stmt.setString(9, country);
            stmt.setString(10, city);
            stmt.setString(11, number);
            stmt.setString(12, language);
            stmt.setString(13, religion);
            stmt.setString(14, caste);
            stmt.setString(15, userType);
            stmt.setTimestamp(16, java.sql.Timestamp.valueOf(createdAt));
            int affectedRow = stmt.executeUpdate();
            if (affectedRow == 0) {
                throw new SQLException("Failed to insert record");
            }
//            retrieving generated keys
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int userId = generatedKeys.getInt(1);
                    insertAdditionalUserInfo(userId);
                    insertPhotoInfo(userId);
                    insertUserId(userId);
                    pay(userId, paymentMethod, amount);
                    return userId;  // Return the generated user ID
                } else {
                    throw new SQLException("Inserting user failed, no ID obtained.");
                }
            }
        }
    }

    // Method to insert additional user info
    private void insertAdditionalUserInfo(int userId) throws SQLException {
        String query = "INSERT INTO additionaluserinfo (user_id, likes, view) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, 0);
            stmt.setInt(3, 0);
            stmt.executeUpdate();
        }
    }

    private void pay(int userId, String paymentMethod, String amount) throws SQLException {
        String query = "INSERT INTO payment (user_id, payment_type, amount) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query);) {
            stmt.setInt(1, userId);
            stmt.setString(2, paymentMethod);
            stmt.setString(3, amount);
            stmt.executeUpdate();
        }
    }

    // Method to insert additional user info
    private void insertPhotoInfo(int userId) throws SQLException {
        String query = "INSERT INTO photos (user_id, photo) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            stmt.setString(2, "");
            stmt.executeUpdate();
        }
    }

    public void insertUserId(int userId) throws SQLException {
        String sql = "INSERT INTO additionalUserDetails (user_id) VALUES (?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, userId);
            // Execute insert for each user ID
            statement.executeUpdate();
        }
    }

    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    @Override
    public String loginUser(String username, String password) throws SQLException {
        String sql = "SELECT password, user_type FROM users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String storedHashedPassword = rs.getString("password");
                    String usertype = rs.getString("user_type");
                    if (BCrypt.checkpw(password, storedHashedPassword)) {
                        //logger.log(Level.INFO, "User {0} logged in successfully", username);
                        return usertype;
                    } else {
                        throw new SQLException("Invalid username or password");
                    }
                } else {
                    throw new SQLException("Invalid Username or Password");
                }
            }
        }
    }

    @Override
    public void updateUser(int id, String firstname, String lastname, String email, String gender, String dob,
            String height, String maritalStatus, String country, String city, String number, String language,
            String religion, String caste, String userType) throws SQLException {
        String query = "UPDATE users SET firstname = ?, lastname = ?, email = ?, gender = ?, date_of_birth = ?, height = ?, marital_status = ?, country = ?, city = ?, contact_number = ?, mother_tongue = ?, religion = ?, caste = ?, user_type = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, firstname);
            stmt.setString(2, lastname);
            stmt.setString(3, email);
            stmt.setString(4, gender);
            stmt.setDate(5, java.sql.Date.valueOf(dob));
            stmt.setString(6, height);
            stmt.setString(7, maritalStatus);
            stmt.setString(8, country);
            stmt.setString(9, city);
            stmt.setString(10, number);
            stmt.setString(11, language);
            stmt.setString(12, religion);
            stmt.setString(13, caste);
            stmt.setString(14, userType);
            stmt.setInt(15, id);
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("User Updated Successfully");
            } else {
                throw new SQLException("User update failed. User not found.");
            }
        }
    }

    @Override
    public void updatePassword(int id, String oldPassword, String newPassword) throws SQLException {
        String fetchPassword = "SELECT password FROM users WHERE user_id = ?";
        String updatePassword = "UPDATE users SET password = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement fetchStmt = conn.prepareStatement(fetchPassword)) {
            fetchStmt.setInt(1, id);
            ResultSet rs = fetchStmt.executeQuery();
            if (rs.next()) {
                String storedHash = rs.getString("password");
                if (!BCrypt.checkpw(oldPassword, storedHash)) {
                    throw new SQLException("The old password is incorrect.");
                }
                String hashedNewPassword = hashPassword(newPassword);
                try (PreparedStatement updateStmt = conn.prepareStatement(updatePassword)) {
                    updateStmt.setString(1, hashedNewPassword);
                    updateStmt.setInt(2, id);
                    int rowsUpdated = updateStmt.executeUpdate();
                    if (rowsUpdated > 0) {
                        System.out.println("Password for user: " + id + " has been updated successfully");
                    } else {
                        throw new SQLException("Password update failed. User not found.");
                    }
                }
            } else {
                throw new SQLException("User not found.");
            }
        }
    }

    @Override
    public List<User> searchByCaste(String caste) throws SQLException {
        String sql = "SELECT user_id, firstname, lastname, email, gender, date_of_birth, "
                + "height, marital_status, country, city, contact_number, mother_tongue, "
                + "religion, caste, user_type, createdAt from users WHERE caste = ?";
        // Initialize casteList to avoid null pointer exception
        List<User> casteList = new ArrayList();
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, caste);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    User user = new User();
                    // Extract user data from the result set
                    user.setUser_id(rs.getInt("user_id"));
                    user.setFirstname(rs.getString("firstname"));
                    user.setLastname(rs.getString("lastname"));
                    user.setEmail(rs.getString("email"));
                    user.setGender(rs.getString("gender"));
                    user.setDate_of_birth(rs.getDate("date_of_birth"));
                    user.setHeight(rs.getInt("height"));
                    user.setMarital_status(rs.getString("marital_status"));
                    user.setCountry(rs.getString("country"));
                    user.setCity(rs.getString("city"));
                    user.setContact_number(rs.getString("contact_number"));
                    user.setMother_tongue(rs.getString("mother_tongue"));
                    user.setReligion(rs.getString("religion"));
                    user.setCaste(rs.getString("caste"));
                    user.setUser_type(rs.getString("user_type"));
                    user.setCreatedAt(rs.getTimestamp("createdAt").toLocalDateTime());
                    user.setLikes(getDetails(rs.getInt("user_id")).getLikes());
                    user.setViews(getDetails(rs.getInt("user_id")).getView());
                    user.setPhoto(getPhoto(rs.getInt("user_id")).getPhoto());
                    casteList.add(user);
                }
            }
        }
        return casteList;
    }

    @Override
    public User searchByMemberId(int member_id) throws SQLException {
        String sql = "SELECT user_id, firstname, lastname, email, gender, date_of_birth, "
                + "height, marital_status, country, city, contact_number, mother_tongue, "
                + "religion, caste, user_type, createdAt from users WHERE user_id = ?";
        User user = null;
        // Prepare the statement and set the email parameter
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, member_id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = extractUser(rs);
                }
            }
        }
        return user;
    }

    @Override
    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT user_id, firstname, lastname, email, gender, date_of_birth, "
                + "height, marital_status, country, city, contact_number, mother_tongue, "
                + "religion, caste, user_type, createdAt from users WHERE email = ?";
        User user = null;
        // Prepare the statement and set the email parameter
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = extractUser(rs);
                }
            }
        }
        return user;
    }

    @Override
    public void updateProfilePhoto(int userId, byte[] profilePhoto) throws SQLException {
        String sql = "UPDATE photos SET photo = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(2, userId);
            stmt.setBytes(1, profilePhoto);
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("User Updated Successfully");
            } else {
                throw new SQLException("User update failed. User not found.");
            }
        }
    }

    @Override
    public void updateUserDetails(int userId, String aboutSelf, String familyDetails, String qualification,
            String workingAt, String designation, String hobbies, String favoriteMusic,
            String favoriteMovies, String favoriteCuisines, String favoriteBooks,
            String favoritePlaces) throws SQLException {
        String sql = "UPDATE additionaluserdetails SET about_self = ?, family_details = ?, qualification = ?, working_at = ?, designation = ?, hobbies = ?, favorite_music = ?, favorite_movies = ?, favorite_cuisines = ?, favorite_books = ?, favorite_places = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, aboutSelf);
            stmt.setString(2, familyDetails);
            stmt.setString(3, qualification);
            stmt.setString(4, workingAt);
            stmt.setString(5, designation);
            stmt.setString(6, hobbies);
            stmt.setString(7, favoriteMusic);
            stmt.setString(8, favoriteMovies);
            stmt.setString(9, favoriteCuisines);
            stmt.setString(10, favoriteBooks);
            stmt.setString(11, favoritePlaces);
            stmt.setInt(12, userId);
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("User Updated Successfully");
            } else {
                throw new SQLException("User update failed. User not found.");
            }
        }
    }
//    extract user details from database

    public User extractUser(ResultSet rs) throws SQLException {
        User user = new User();
        try {
            user.setUser_id(rs.getInt("user_id"));
            user.setFirstname(rs.getString("firstname"));
            user.setLastname(rs.getString("lastname"));
            user.setEmail(rs.getString("email"));
            user.setGender(rs.getString("gender"));
            user.setDate_of_birth(rs.getDate("date_of_birth"));
            user.setHeight(rs.getInt("height"));
            user.setMarital_status(rs.getString("marital_status"));
            user.setCountry(rs.getString("country"));
            user.setCity(rs.getString("city"));
            user.setContact_number(rs.getString("contact_number"));
            user.setMother_tongue(rs.getString("mother_tongue"));
            user.setReligion(rs.getString("religion"));
            user.setCaste(rs.getString("caste"));
            user.setUser_type(rs.getString("user_type"));
//                    details come from external methods
            user.setLikes(getDetails(rs.getInt("user_id")).getLikes());
            user.setViews(getDetails(rs.getInt("user_id")).getView());
            user.setPhoto(getPhoto(rs.getInt("user_id")).getPhoto());
            //              getting user informations
            user.setAboutSelf(getUserDetails(rs.getInt("user_id")).getAboutSelf());
            user.setFamilyDetails(getUserDetails(rs.getInt("user_id")).getFamilyDetails());
            user.setQualification(getUserDetails(rs.getInt("user_id")).getQualification());
            user.setWorkingAt(getUserDetails(rs.getInt("user_id")).getWorkingAt());
            user.setDesignation(getUserDetails(rs.getInt("user_id")).getDesignation());
            user.setHobbies(getUserDetails(rs.getInt("user_id")).getHobbies());
            user.setFavouriteGenre(getUserDetails(rs.getInt("user_id")).getFavouriteGenre());
            user.setFavouriteMovies(getUserDetails(rs.getInt("user_id")).getFavouriteMovies());
            user.setFavouriteCuisine(getUserDetails(rs.getInt("user_id")).getFavouriteCuisine());
            user.setFavouriteBooks(getUserDetails(rs.getInt("user_id")).getFavouriteBooks());
            user.setFavouritePlaces(getUserDetails(rs.getInt("user_id")).getFavouritePlaces());
        } catch (SQLException e) {
            throw new SQLException("An error occured: " + e);
        }
        return user;
    }

    private String hashPassword(String password) {
        String salt = BCrypt.gensalt();
        String hashedPassword = BCrypt.hashpw(password, salt);
        return hashedPassword;
    }

    @Override
    public List<User> getAllUsers() throws SQLException {
        String query = "SELECT * FROM users";
        List<User> userList = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                // Extract user data from the result set
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setFirstname(rs.getString("firstname"));
                user.setLastname(rs.getString("lastname"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
                user.setDate_of_birth(rs.getDate("date_of_birth"));
                user.setHeight(rs.getInt("height"));
                user.setMarital_status(rs.getString("marital_status"));
                user.setCountry(rs.getString("country"));
                user.setCity(rs.getString("city"));
                user.setContact_number(rs.getString("contact_number"));
                user.setMother_tongue(rs.getString("mother_tongue"));
                user.setReligion(rs.getString("religion"));
                user.setCaste(rs.getString("caste"));
                user.setUser_type(rs.getString("user_type"));
                user.setCreatedAt(rs.getTimestamp("createdAt").toLocalDateTime());
//              getting likes and photos
                user.setLikes(getDetails(rs.getInt("user_id")).getLikes());
                user.setViews(getDetails(rs.getInt("user_id")).getView());
                user.setPhoto(getPhoto(rs.getInt("user_id")).getPhoto());
//              getting user informations
                user.setAboutSelf(getUserDetails(rs.getInt("user_id")).getAboutSelf());
                user.setFamilyDetails(getUserDetails(rs.getInt("user_id")).getFamilyDetails());
                user.setQualification(getUserDetails(rs.getInt("user_id")).getQualification());
                user.setWorkingAt(getUserDetails(rs.getInt("user_id")).getWorkingAt());
                user.setDesignation(getUserDetails(rs.getInt("user_id")).getDesignation());
                user.setHobbies(getUserDetails(rs.getInt("user_id")).getHobbies());
                user.setFavouriteGenre(getUserDetails(rs.getInt("user_id")).getFavouriteGenre());
                user.setFavouriteMovies(getUserDetails(rs.getInt("user_id")).getFavouriteMovies());
                user.setFavouriteCuisine(getUserDetails(rs.getInt("user_id")).getFavouriteCuisine());
                user.setFavouriteBooks(getUserDetails(rs.getInt("user_id")).getFavouriteBooks());
                user.setFavouritePlaces(getUserDetails(rs.getInt("user_id")).getFavouritePlaces());
                userList.add(user);
            }
        }
        return userList;
    }

    @Override
    public ProfilePhoto getPhoto(int userId) throws SQLException {
        ProfilePhoto profilePhoto = new ProfilePhoto();
        String query = "SELECT photo FROM photos WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    profilePhoto.setPhoto(rs.getBytes("photo"));
                }
            }
        }
        return profilePhoto;
    }

    @Override
    public AdditionalUserInfo getDetails(int userId) throws SQLException {
        AdditionalUserInfo info = new AdditionalUserInfo();
        String query = "SELECT likes, view FROM additionaluserinfo WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    info.setLikes(rs.getInt("likes"));
                    info.setView(rs.getInt("view"));
                }
            }
        }
        return info;
    }

    @Override
    public void like(int profileUserId, int likingUserId) throws SQLException {
        String selectSql = "SELECT likes, liked_users FROM additionaluserinfo WHERE user_id = ?";
        String updateSql = "UPDATE additionaluserinfo SET likes = likes + 1, liked_users = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement selectStmt = conn.prepareStatement(selectSql); PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
            selectStmt.setInt(1, profileUserId);
            ResultSet rs = selectStmt.executeQuery();
            if (rs.next()) {
                String likedUsers = rs.getString("liked_users");
                int likes = rs.getInt("likes");
                // Check if the user has already liked this profile
                if (likedUsers == null || !likedUsers.contains(String.valueOf(likingUserId))) {
                    // Add likingUserId to likedUsers list
                    likedUsers = likedUsers == null ? String.valueOf(likingUserId)
                            : likedUsers + "," + likingUserId;
                    // Update the database with the new likes count and liked_users list
                    updateStmt.setString(1, likedUsers);
                    updateStmt.setInt(2, profileUserId);
                    updateStmt.executeUpdate();
                    System.out.println("User liked profile successfully.");
                } else {
                    System.out.println("User has already liked this profile.");
                }
            } else {
                throw new SQLException("User profile not found.");
            }
        }
    }
//   checking whether current user has liked other user

    @Override
    public boolean checkIfLiked(int likedUserId, int likingUserId) throws SQLException {
        String query = "SELECT liked_users FROM additionaluserinfo WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, likedUserId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String likedUsers = rs.getString("liked_users");
                if (likedUsers != null && !likedUsers.isEmpty()) {
                    String[] likedUserIds = likedUsers.split(",");
                    for (String id : likedUserIds) {
                        if (Integer.parseInt(id.trim()) == likingUserId) {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    @Override
    public void addView(int userId) throws SQLException {
        String updateQuery = "UPDATE additionaluserinfo SET view = view + 1 WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
            stmt.setInt(1, userId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error updating view count for user ID: " + userId, e);
        }
    }

    @Override
    public AdditionalUserDetails getUserDetails(int userId) throws SQLException {
        String sql = "SELECT * FROM additionaluserdetails WHERE user_id = ?";
        AdditionalUserDetails userDetails = new AdditionalUserDetails();
        try (Connection conn = DBConnection.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, userId);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    userDetails.setUserId(rs.getInt("user_id"));
                    userDetails.setAboutSelf(rs.getString("about_self"));
                    userDetails.setFamilyDetails(rs.getString("family_details"));
                    userDetails.setQualification(rs.getString("qualification"));
                    userDetails.setWorkingAt(rs.getString("working_at"));
                    userDetails.setDesignation(rs.getString("designation"));
                    userDetails.setHobbies(rs.getString("hobbies"));
                    userDetails.setFavouriteGenre(rs.getString("favorite_music"));
                    userDetails.setFavouriteMovies(rs.getString("favorite_movies"));
                    userDetails.setFavouriteCuisine(rs.getString("favorite_cuisines"));
                    userDetails.setFavouriteBooks(rs.getString("favorite_books"));
                    userDetails.setFavouritePlaces(rs.getString("favorite_places"));
                }
            }
        }
        return userDetails;
    }

    @Override
    public List<AdditionalUserDetails> getAllDetails() throws SQLException {
        String sql = "SELECT * FROM additionaluserdetails";
        List<AdditionalUserDetails> userList = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                // Extract user data from the result set
                AdditionalUserDetails userDetails = new AdditionalUserDetails();
                userDetails.setUserId(rs.getInt("user_id"));
                userDetails.setAboutSelf(rs.getString("about_self"));
                userDetails.setFamilyDetails(rs.getString("family_details"));
                userDetails.setQualification(rs.getString("qualification"));
                userDetails.setWorkingAt(rs.getString("working_at"));
                userDetails.setDesignation(rs.getString("designation"));
                userDetails.setHobbies(rs.getString("hobbies"));
                userDetails.setFavouriteGenre(rs.getString("favorite_music"));
                userDetails.setFavouriteMovies(rs.getString("favorite_movies"));
                userDetails.setFavouriteCuisine(rs.getString("favorite_cuisines"));
                userDetails.setFavouriteBooks(rs.getString("favorite_books"));
                userDetails.setFavouritePlaces(rs.getString("favorite_places"));
                userList.add(userDetails);
            }
        }
        return userList;
    }

    @Override
    public void deleteUser(int userId) throws SQLException {
        String deleteUserQuery = "DELETE FROM users WHERE user_id = ?";
        String deletePhotosQuery = "DELETE FROM photo WHERE user_id = ?";
        String deleteAdditionalUserDetailsQuery = "DELETE FROM additionaluserdetails WHERE user_id = ?";
        String deleteAdditionalUserInfoQuery = "DELETE FROM additionaluserinfo WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement deletePhotosStmt = conn.prepareStatement(deletePhotosQuery); PreparedStatement deleteAdditionalUserDetailsStmt = conn.prepareStatement(deleteAdditionalUserDetailsQuery); PreparedStatement deleteAdditionalUserInfoStmt = conn.prepareStatement(deleteAdditionalUserInfoQuery); PreparedStatement deleteUserStmt = conn.prepareStatement(deleteUserQuery)) {
            // Begin transaction
            conn.setAutoCommit(false);
            // Delete from dependent tables first
            deletePhotosStmt.setInt(1, userId);
            deletePhotosStmt.executeUpdate();
            deleteAdditionalUserDetailsStmt.setInt(1, userId);
            deleteAdditionalUserDetailsStmt.executeUpdate();
            deleteAdditionalUserInfoStmt.setInt(1, userId);
            deleteAdditionalUserInfoStmt.executeUpdate();
            // Finally, delete from the main user table
            deleteUserStmt.setInt(1, userId);
            deleteUserStmt.executeUpdate();
            // Commit transaction
            conn.commit();
        } catch (SQLException e) {
            throw e;
        }
    }

    @Override
    public int getTotalLikes() throws SQLException {
        String sql = "SELECT SUM(likes) FROM additionaluserinfo";
        try (Connection connection = DBConnection.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1); // Get the total likes from the result
            }
        }
        return 0; // Return 0 if no data is found
    }

    // Method to get total views
    @Override
    public int getTotalViews() throws SQLException {
        String sql = "SELECT SUM(view) FROM additionaluserinfo";
        try (Connection connection = DBConnection.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1); // Get the total views from the result
            }
        }
        return 0; // Return 0 if no data is found
    }

    @Override
    public String getSubscribtionLeft(int userId) throws SQLException {
        String sql = "SELECT amount, date_paid FROM payment WHERE user_id = ?";
        try (Connection connection = DBConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int amount = rs.getInt("amount");
                Timestamp datePaid = rs.getTimestamp("date_paid");
                LocalDateTime paidDate = datePaid.toLocalDateTime();
                LocalDateTime currentDate = LocalDateTime.now();
                // Calculate subscription period based on amount
                LocalDateTime expiryDate;
                switch (amount) {
                    case 50:
                        expiryDate = paidDate.plusWeeks(1); // 1 week for 50
                        break;
                    case 500:
                        expiryDate = paidDate.plusMonths(1); // 1 month for 500
                        break;
                    default:
                        return "Invalid amount!";
                }
                // Calculate time remaining
                Duration duration = Duration.between(currentDate, expiryDate);
                if (duration.isNegative()) {
                    return "Subscription expired!";
                } else {
                    long daysLeft = duration.toDays();
                    long hoursLeft = duration.toHoursPart();
                    return daysLeft + " days, " + hoursLeft + " hours left";
                }
            } else {
                return "No subscription found for user!";
            }
        }
    }

    @Override
    public void updatePaymentDetails(int userId, String newAmount, String newPaymentType) throws SQLException {
        String sql = "UPDATE payment SET amount = ?, payment_type = ?, date_paid = NOW() WHERE user_id = ?";
        try (Connection connection = DBConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, newAmount);
            ps.setString(2, newPaymentType);
            ps.setInt(3, userId);
            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Payment details updated successfully.");
            } else {
                System.out.println("No payment record found for user.");
            }
        }
    }

    @Override
    public List<UserAdd> getAllAdds() throws SQLException {
        List<UserAdd> userAdds = new ArrayList<>();
        String query = "SELECT ua.user_id, ua.title, ua.body, u.firstname, p.photo "
                + "FROM user_adds ua "
                + "JOIN users u ON ua.user_id = u.user_id "
                + "JOIN photos p ON ua.user_id = p.user_id";
        try (Connection connection = DBConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query); ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                UserAdd userAdd = new UserAdd();
                userAdd.setUserId(resultSet.getInt("user_id"));
                userAdd.setTitle(resultSet.getString("title"));
                userAdd.setBody(resultSet.getString("body"));
                // Fetch first name from 'users' table
                userAdd.setName(resultSet.getString("firstname"));
                // Fetch profile image from 'photos' table (as byte array)
                userAdd.setPhoto(resultSet.getBytes("photo"));
                userAdds.add(userAdd);
            }
        }
        return userAdds;
    }

    @Override
    public void updateUserAdd(int userId, String title, String body) throws SQLException {
        String sql = "UPDATE user_adds SET title = ?, body = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // Set the parameters for the prepared statement
            pstmt.setString(1, title);
            pstmt.setString(2, body);
            pstmt.setInt(3, userId);
            // Execute the update
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("An existing user_add was updated successfully!");
            } else {
                System.out.println("No user_add found for the given user_id.");
            }
        } catch (SQLException e) {
            throw new SQLException("Error updating user_add: " + e.getMessage(), e);
        }
    }

    // Insert new user add
    @Override
    public void insertUserAdd(int userId, String title, String body) throws SQLException {
        String sql = "INSERT INTO user_adds (user_id, title, body) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            pstmt.setString(2, title);
            pstmt.setString(3, body);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new user_add was inserted successfully!");
            }
        } catch (SQLException e) {
            throw new SQLException("Error inserting user_add: " + e.getMessage(), e);
        }
    }
}
