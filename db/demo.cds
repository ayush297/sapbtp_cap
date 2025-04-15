namespace ayushdb;
using { ayushdb.commons as common } from './commons';
using { cuid, temporal, managed } from '@sap/cds/common';


context demo {

    entity student {
        key ID: common.Guid;
        NAME: String(80);
        CLASS: Association to one standard;
        GENDER: String(1);
        CITY: String(10);
    }    

    entity Books {
        key ID: common.Guid;
        name: String(30);
        AUTHOR: String(80);
    }

    entity standard {
        key ID: Int16;
        CLASSNAME: String(10);
        SECTIONS: Int16;
        CLASSTEACHER: String(80);
    }
}


context trans {

    entity rentals : cuid, temporal, managed {
        student: Association to demo.student;
        book: Association to demo.Books; 
    }
}

