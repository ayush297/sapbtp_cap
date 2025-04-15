using { ayushdb.demo as master, 
        ayushdb.trans as transaction } from '../db/demo';


service MyService {

    entity StudentSet    as projection on master.student;
    entity BookRentalSet as projection on transaction.rentals;
    entity BookSet       as projection on master.Books;
    entity StandardSet   as projection on master.standard;

}