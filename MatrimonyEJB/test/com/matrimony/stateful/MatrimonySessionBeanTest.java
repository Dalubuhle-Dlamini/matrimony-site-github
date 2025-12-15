/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.matrimony.stateful;

import com.matrimony.models.AdditionalUserDetails;
import com.matrimony.models.AdditionalUserInfo;
import com.matrimony.models.ProfilePhoto;
import com.matrimony.models.User;
import com.matrimony.models.UserAdd;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author dsihl
 */
public class MatrimonySessionBeanTest {
    
    public MatrimonySessionBeanTest() {
    }
    
    @BeforeAll
    public static void setUpClass() {
    }
    
    @AfterAll
    public static void tearDownClass() {
    }
    
    @BeforeEach
    public void setUp() {
    }
    
    @AfterEach
    public void tearDown() {
    }

    /**
     * Test of insertBasicUserInformation method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testInsertBasicUserInformation() throws Exception {
        System.out.println("insertBasicUserInformation");
        String firstname = "Phumlani";
        String lastname = "Nxumalo";
        String email = "phumlani@gmail.com";
        String password = "1234";
        String gender = "Male";
        String dob = "12-02-2001";
        int height = 178;
        String maritalStatus = "Married";
        String country = "Eswatini";
        String city = "Manzini";
        String number = "79342453";
        String language = "siSwati";
        String religion = "Christianity";
        String caste = "Swazi";
        String userType = "User";
        String paymentMethod = "Pay Pal";
        String amount = "500";
        MatrimonySessionBean instance = new MatrimonySessionBean();
        int expResult = 0;
        int result = instance.insertBasicUserInformation(firstname, lastname, email, password, gender, dob, height, maritalStatus, country, city, number, language, religion, caste, userType, paymentMethod, amount);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * @throws java.lang.Exception
     * Test of insertUserId method, of class MatrimonySessionBean.
     */
    @Test
    public void testInsertUserId() throws Exception {
        System.out.println("insertUserId");
        int userId = 100;
        MatrimonySessionBean instance = new MatrimonySessionBean();
        instance.insertUserId(userId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of loginUser method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testLoginUser() throws Exception {
        System.out.println("loginUser");
        String username = "dsihle875@gmail.com";
        String password = "123456789";
        MatrimonySessionBean instance = new MatrimonySessionBean();
        String expResult = "";
        String result = instance.loginUser(username, password);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateUser method, of class M
     * @throws java.lang.Exception
     * @throws java.lang.ExceptionatrimonySessionBean.
     */
    @Test
    public void testUpdateUser() throws Exception {
        System.out.println("updateUser");
        int id = 3;
        String firstname = "Dalubuhle";
        String lastname = "Dlamini";
        String email = "dsihle875@gmail.com";
        String gender = "Male";
        String dob = "02-14-2001";
        String height = "187";
        String maritalStatus = "Never Married";
        String country = "Eswatini";
        String city = "Mbabane";
        String number = "76635980";
        String language = "English";
        String religion = "Christianity";
        String caste = "Swazi";
        String userType = "User";
        MatrimonySessionBean instance = new MatrimonySessionBean();
        instance.updateUser(id, firstname, lastname, email, gender, dob, height, maritalStatus, country, city, number, language, religion, caste, userType);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * @throws java.lang.Exception
     * Test of updatePassword method, of class MatrimonySessionBean.
     */
    @Test
    public void testUpdatePassword() throws Exception {
        System.out.println("updatePassword");
        int id = 25;
        String oldPassword = "123456";
        String newPassword = "123456789";
        MatrimonySessionBean instance = new MatrimonySessionBean();
        instance.updatePassword(id, oldPassword, newPassword);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of searchByCaste method, of class MatrimonySessionBean
     * @throws java.lang.Exception
     * @throws java.lang.ExceptionmonySessionBean.
     */
    @Test
    public void testSearchByCaste() throws Exception {
        System.out.println("searchByCaste");
        String caste = "zulu";
        MatrimonySessionBean instance = new MatrimonySessionBean();
        List<User> expResult = null;
        List<User> result = instance.searchByCaste(caste);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of searchByMemberId method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testSearchByMemberId() throws Exception {
        System.out.println("searchByMemberId");
        int member_id = 3;
        MatrimonySessionBean instance = new MatrimonySessionBean();
        User expResult = null;
        User result = instance.searchByMemberId(member_id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUserByEmail method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testGetUserByEmail() throws Exception {
        System.out.println("getUserByEmail");
        String email = "dsihle875@gmail.com";
        MatrimonySessionBean instance = new MatrimonySessionBean();
        User expResult = null;
        User result = instance.getUserByEmail(email);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateUserDetails method, of class MatrimonySessionBean
     * @throws java.lang.Exception
     */
    @Test
    public void testUpdateUserDetails() throws Exception {
        System.out.println("updateUserDetails");
        int userId = 0;
        String aboutSelf = "This is a paragraph about my self";
        String familyDetails = "This is a paragraph about my family";
        String qualification = "Software Engineer";
        String workingAt = "FNB";
        String designation = "Front End Developer";
        String hobbies = "Soccer";
        String favoriteMusic = "Gospel";
        String favoriteMovies = "Goodfellas 1990";
        String favoriteCuisines = "Pizza";
        String favoriteBooks = "Goodfellas 1990";
        String favoritePlaces = "Spain, Barcelona";
        MatrimonySessionBean instance = new MatrimonySessionBean();
        instance.updateUserDetails(userId, aboutSelf, familyDetails, qualification, workingAt, designation, hobbies, favoriteMusic, favoriteMovies, favoriteCuisines, favoriteBooks, favoritePlaces);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllUsers method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testGetAllUsers() throws Exception {
        System.out.println("getAllUsers");
        MatrimonySessionBean instance = new MatrimonySessionBean();
        List<User> expResult = null;
        List<User> result = instance.getAllUsers();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPhoto method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testGetPhoto() throws Exception {
        System.out.println("getPhoto");
        int userId = 3;
        MatrimonySessionBean instance = new MatrimonySessionBean();
        ProfilePhoto expResult = null;
        ProfilePhoto result = instance.getPhoto(userId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDetails method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testGetDetails() throws Exception {
        System.out.println("getDetails");
        int userId = 5;
        MatrimonySessionBean instance = new MatrimonySessionBean();
        AdditionalUserInfo expResult = null;
        AdditionalUserInfo result = instance.getDetails(userId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of like method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testLike() throws Exception {
        System.out.println("like");
        int profileUserId = 3;
        int likingUserId = 26;
        MatrimonySessionBean instance = new MatrimonySessionBean();
        instance.like(profileUserId, likingUserId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of checkIfLiked method, of class MatrimonySessionBean
     * @throws java.lang.Exception
     */
    @Test
    public void testCheckIfLiked() throws Exception {
        System.out.println("checkIfLiked");
        int likedUserId = 3;
        int likingUserId = 6;
        MatrimonySessionBean instance = new MatrimonySessionBean();
        boolean expResult = false;
        boolean result = instance.checkIfLiked(likedUserId, likingUserId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addView method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testAddView() throws Exception {
        System.out.println("addView");
        int userId = 6;
        MatrimonySessionBean instance = new MatrimonySessionBean();
        instance.addView(userId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUserDetails method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testGetUserDetails() throws Exception {
        System.out.println("getUserDetails");
        int userId = 6;
        MatrimonySessionBean instance = new MatrimonySessionBean();
        AdditionalUserDetails expResult = null;
        AdditionalUserDetails result = instance.getUserDetails(userId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllDetails method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testGetAllDetails() throws Exception {
        System.out.println("getAllDetails");
        MatrimonySessionBean instance = new MatrimonySessionBean();
        List<AdditionalUserDetails> expResult = null;
        List<AdditionalUserDetails> result = instance.getAllDetails();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteUser method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testDeleteUser() throws Exception {
        System.out.println("deleteUser");
        int userId = 31;
        MatrimonySessionBean instance = new MatrimonySessionBean();
        instance.deleteUser(userId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalLikes method, of class MatrimonySessionBean
     * @throws java.lang.Exception
     */
    @Test
    public void testGetTotalLikes() throws Exception {
        System.out.println("getTotalLikes");
        MatrimonySessionBean instance = new MatrimonySessionBean();
        int expResult = 21;
        int result = instance.getTotalLikes();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalViews method, of class MatrimonySessionBean.
     */
    @Test
    public void testGetTotalViews() throws Exception {
        System.out.println("getTotalViews");
        MatrimonySessionBean instance = new MatrimonySessionBean();
        int expResult = 21;
        int result = instance.getTotalViews();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSubscribtionLeft method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testGetSubscribtionLeft() throws Exception {
        System.out.println("getSubscribtionLeft");
        int userId = 3;
        MatrimonySessionBean instance = new MatrimonySessionBean();
        String expResult = "4 days left 4 hours left";
        String result = instance.getSubscribtionLeft(userId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updatePaymentDetails method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testUpdatePaymentDetails() throws Exception {
        System.out.println("updatePaymentDetails");
        int userId = 3;
        String newAmount = "500";
        String newPaymentType = "Pay Pal";
        MatrimonySessionBean instance = new MatrimonySessionBean();
        instance.updatePaymentDetails(userId, newAmount, newPaymentType);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllAdds method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testGetAllAdds() throws Exception {
        System.out.println("getAllAdds");
        MatrimonySessionBean instance = new MatrimonySessionBean();
        List<UserAdd> expResult = null;
        List<UserAdd> result = instance.getAllAdds();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateUserAdd method, of class MatrimonySessionBean.
     * @throws java.lang.Exception
     */
    @Test
    public void testUpdateUserAdd() throws Exception {
        System.out.println("updateUserAdd");
        int userId = 3;
        String title = "I am Married";
        String body = "I am Married now thank you matimony app!!!";
        MatrimonySessionBean instance = new MatrimonySessionBean();
        instance.updateUserAdd(userId, title, body);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of insertUserAdd method, of class MatrimonySessionBean.
     */
    @Test
    public void testInsertUserAdd() throws Exception {
        System.out.println("insertUserAdd");
        int userId = 7;
        String title = "Bad News";
        String body = "I posted and i have zero likes and no one views my profile any help";
        MatrimonySessionBean instance = new MatrimonySessionBean();
        instance.insertUserAdd(userId, title, body);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
