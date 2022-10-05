@IsTest

public with sharing class UserControllerTest {

    @TestSetup
    static void createTestData() {

        User user = new User(
                Alias = 'Test12',
                Email = 'standarduser1972@testorg.com',
                EmailEncodingKey = 'UTF-8',
                LastName = 'Testing',
                LanguageLocaleKey = 'en_US',
                LocaleSidKey = 'en_US',
                ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
                TimeZoneSidKey = 'America/Los_Angeles',
                Username = 'standarduser1972@vityachekas.com'
        );
        insert user;
    }

    @IsTest
    static void testPositive() {

        //given
        User user = [
                SELECT Name, Username, Email, Phone, IsActive, City, UserRoleId
                FROM User
                WHERE LastName = 'Testing'
        ];

        //when
        Test.startTest();
        List<User> users = UserController.getUsers();
        Test.stopTest();

        //then
        System.assert(users.contains(user));
    }
}