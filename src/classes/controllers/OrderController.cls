public with sharing class OrderController {
    @AuraEnabled(Cacheable=true)
    public static List<Order> relatedOrder(String keySearch) {
        return [
                SELECT Id, OrderNumber, CustomerAuthorizedById, TotalAmount, Status
                FROM Order
                WHERE OwnerId IN (
                        SELECT Id
                        FROM User
                        WHERE Name = :keySearch
                )
        ];
    }
}