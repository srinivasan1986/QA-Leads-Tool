// using { User } from '@sap/cds/common';
using { cuid, Country, managed, Currency, User } from '@sap/cds/common';

type ProjectType : Association to sap.sdcpmtool.master.ProjectTypes;
type ProjectMode : Association to sap.sdcpmtool.master.ProjectModes;
type ProjectStatus : Association to sap.sdcpmtool.master.ProjectStatuss;
type Region : Association to sap.sdcpmtool.master.Regions;
type SubRegion : Association to sap.sdcpmtool.master.SubRegions;
type DeliveryCenter : Association to sap.sdcpmtool.master.DeliveryCenters;
type ProjectSize : Association to sap.sdcpmtool.master.ProjectSizes;
type CustomerIndustry : Association to sap.sdcpmtool.master.CustomerIndustries;
type CompanyCode : Association to sap.sdcpmtool.master.CompanyCodes;
type BCPStatusField : Association to sap.sdcpmtool.master.BCPStatusFields;
type FactoryRelevantField : Association to sap.sdcpmtool.master.FactoryRelevantFields;
type ProjectPhaseField : Association to sap.sdcpmtool.master.ProjectPhaseFields;
type PMToolUser : Association to sap.sdcpmtool.master.Users;

context sap.sdcpmtool.master {

    entity Users : managed{
         key id : UUID;
            seqId  : Integer @readonly default 0;
            userId : User;
            userINo : String(10);
            userName : String(50);
    }

    entity ProjectTypes : CodeList {
        key code : String(2)
    }

    entity ProjectModes : CodeList {
        key code : String(2)
    }

    entity ProjectStatuss : CodeList {
        key code : String(2)
    }

    entity Regions : CodeList {
        key code : String(2)
    }

    entity SubRegions : CodeList {
        key code : String(2);
            region : Region
    }

    // entity RegionSubRegionMaps {
    //     key region : Region;
    //     key subregion : SubRegion;
    // }

    entity DeliveryCenters : CodeList {
        key code : String(2);
    }

    entity ProjectSizes : CodeList {
        key code : String(2);
    }

    entity CustomerIndustries : CodeList {
        key code : String(2);
    }

    entity CompanyCodes : CodeList {
        key code : String(4);
    }

    entity BCPStatusFields : CodeList {
        key code : String(2);
    }

    entity FactoryRelevantFields : CodeList {
        key code : String(2);
    }

    entity ProjectPhaseFields : CodeList {
        key code : String(2);
    }

    aspect CodeList @(
        cds.autoexpose,
        cds.persistence.skip : 'if-unused'
    ) {
        name  : localized String(255) @title : '{i18n>Name}';       
    }
}
