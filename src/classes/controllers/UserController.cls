public with sharing class UserController {
    @AuraEnabled(Cacheable=true)
    public static List<User> getUsers() {
        return [
                SELECT Name, Username, Email, Phone, IsActive, City, UserRoleId
                FROM User
        ];
    }
}