@IsTest
public with sharing class OrderControllerTest {

    @TestSetup
    static void createTestData() {

        User user = new User(
                Alias = 'Test',
                Email = 'standarduser1976@testorg.com',
                EmailEncodingKey = 'UTF-8',
                LastName = 'Testing1',
                LanguageLocaleKey = 'en_US',
                LocaleSidKey = 'en_US',
                ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
                TimeZoneSidKey = 'America/Los_Angeles',
                Username = 'standarduser1976@vityachekas.com'
        );
        insert user;

        Account account = new Account(Name = 'Test');
        insert account;

        Order order = new Order(
                AccountId = account.Id,
                Status = 'Draft',
                EffectiveDate = Date.today(),
                OwnerId = user.Id
        );
        insert order;
    }

    @IsTest
    static void testPositive() {

        //given
        User user = [SELECT Name FROM User WHERE LastName = 'Testing1'];

        //when
        Test.startTest();
        List<Order> orders =  OrderController.relatedOrder(user.Name);
        Test.stopTest();

        //then
        System.assertEquals(1, orders.size());
    }
}