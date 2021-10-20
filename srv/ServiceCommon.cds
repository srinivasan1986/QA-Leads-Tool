using {sap.sdcpmtool.transaction as sdcpmtool} from '../db/projectHeader';

annotate sdcpmtool.Projects with @(
    Capabilities.SearchRestrictions : {Searchable : false}
) {
    projectName           @(Common.FieldControl : #Mandatory);
    actualStartDate       @(Common.FieldControl : #Mandatory);

    region                @(Common.ValueList : {
        Label          : 'Regions',
        CollectionPath : 'Regions',
        Parameters     : [
        {
            $Type             : 'Common.ValueListParameterInOut',
            ValueListProperty : 'code',
            LocalDataProperty : region_code
        },
        {
            $Type             : 'Common.ValueListParameterDisplayOnly',
            ValueListProperty : 'name'
        }
        ]
    });

    projectType_name      @(Common.FieldControl : #Readonly);

   projectType           @(
        Common           : {
            Text                     : projectType.name,
            TextFor                  : projectType.code,
            TextArrangement          : #TextOnly,
            ValueListWithFixedValues : true
        },
        Common.ValueList : {
            Label          : 'Project Types',
            CollectionPath : 'ProjectTypes',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'code',
                LocalDataProperty : projectType_code
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
            ]
        }
    );

    projectMode           @(
        Common           : {
            Text                     : projectMode.name,
            TextArrangement          : #TextOnly,
            ValueListWithFixedValues : true
        },
        Common.ValueList : {
            Label          : 'Project Modes',
            CollectionPath : 'ProjectModes',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'code',
                LocalDataProperty : projectMode_code
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
            ]
        }
    );

    projectStatus         @(
        Common           : {
            Text                     : projectStatus.name,
            TextArrangement          : #TextOnly,
            ValueListWithFixedValues : true
        },
        Common.ValueList : {
            Label          : 'Project Status',
            CollectionPath : 'ProjectStatuss',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'code',
                LocalDataProperty : projectStatus_code
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
            ]
        }
    );

    subRegion             @(
        Common           : {
            Text            : subRegion.name,
            TextArrangement : #TextOnly
        },
        Common.ValueList : {
            Label          : 'Sub Region',
            CollectionPath : 'SubRegions',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'region_code',
                LocalDataProperty : region_code
            },
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'code',
                LocalDataProperty : subRegion_code
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
            ]
        }
    );

    primaryDeliveryCenter @(
        Common           : {
            Text            : primaryDeliveryCenter.name,
            TextArrangement : #TextOnly
        },
        Common.ValueList : {
            Label          : 'Delivery Center',
            CollectionPath : 'DeliveryCenters',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'code',
                LocalDataProperty : primaryDeliveryCenter_code
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
            ]
        }
    );

    factoryRelevant       @(
        Common           : {
            Text            : factoryRelevant.name,
            TextArrangement : #TextOnly
        },
        Common.ValueList : {
            Label          : 'Factory Relevant',
            CollectionPath : 'FactoryRelevantFields',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'code',
                LocalDataProperty : factoryRelevant_code
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
            ]
        }
    );

    bcpStatus             @(
        Common           : {
            Text                     : bcpStatus.name,
            TextArrangement          : #TextOnly,
            ValueListWithFixedValues : true
        },
        Common.ValueList : {
            Label          : 'BCP Status',
            CollectionPath : 'BCPStatusFields',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'code',
                LocalDataProperty : bcpStatus_code
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
            ]
        }
    );

    projectManager        @(
        Common           : {
            Text            : projectManager.userName,
            TextArrangement : #TextFirst,
            FieldControl : #Mandatory            
        },
        Common.ValueList : {
            Label          : 'Users',
            CollectionPath : 'Users',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'userId',
                LocalDataProperty : projectManager_userId
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'userName'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'userINo'
            }
            ]
        }
    );

    dpManager             @(
        Common           : {
            Text            : dpManager.userName,
            TextArrangement : #TextFirst
        },
        Common.ValueList : {
            Label          : 'Users',
            CollectionPath : 'Users',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'userId',
                LocalDataProperty : dpManager_userId
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'userName'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'userINo'
            }
            ]
        }
    );

    qaLeadId              @(
        Common           : {
            Text            : qaLeadId.userName,
            TextArrangement : #TextFirst
        },
        Common.ValueList : {
            Label          : 'Users',
            CollectionPath : 'Users',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'userId',
                LocalDataProperty : qaLeadId_userId
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'userName'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'userINo'
            }
            ]
        }
    );

    customerIndustry      @(
        Common           : {
            Text            : customerIndustry.name,
            TextArrangement : #TextOnly
        },
        Common.ValueList : {
            Label          : 'Customer Industry',
            CollectionPath : 'CustomerIndustries',
            Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'code',
                LocalDataProperty : customerIndustry_code
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
            ]
        }
    );
};


