using { ayush.db.master as master,
        ayush.db.transaction as trans } from '../db/data-model';


service CatalogService  @(path: 'CatalogService' ) {

    entity businessPartnerSet as projection on master.businessPartner;
    entity AddressSet as projection on master.address;
    entity EmployeeSet as projection on master.employees;
    entity ProductSet as projection on master.product;
    entity POs as projection on trans.purchaseorder
    actions {
        action boost() returns POs; 
        function largestOrder() returns POs;
    };
    
    entity POItems as projection on trans.poitems;

}
 