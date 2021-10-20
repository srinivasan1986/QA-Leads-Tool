using {sap.sdcpmtool.transaction as sdcpmtool} from '../db/projectHeader';

service ManagerService @(requires : 'sdcpmtool_managers') {
    // @Capabilities: {
    //     CollectionPropertyRestrictions: [
    //     {
    //         CollectionProperty : 'MyProjects',
    //         Insertable : false,
    //         Updatable : true,
    //         Deletable : false
    //     }
    //     ] }

    entity MyProjects as
        select from sdcpmtool.Projects {
            *
        };

    entity User {
        key username : String;
    }
}

annotate ManagerService.MyProjects with @(

Capabilities : {
    InsertRestrictions : {Insertable : false},
    UpdateRestrictions : {Updatable : true},
    DeleteRestrictions : {Deletable : false},
    SearchRestrictions : {Searchable : false}
});
annotate ManagerService.MyProjects with @odata.draft.enabled;

