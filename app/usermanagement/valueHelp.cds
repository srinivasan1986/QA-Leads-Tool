// using UserMangService as Users from '../../srv/userMangService';
using { sap.sdcpmtool.master as my } from '../../db/master/data-masters';
//
// annotations for value helps
//

annotate my.Users with{

  userINo @Common.ValueList: {
    CollectionPath : 'Users',
    Label : '',
    Parameters : [
      {$Type: 'Common.ValueListParameterInOut', LocalDataProperty: userINo, ValueListProperty: 'userINo'},  // local data property is the foreign key
      {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'userName'}
    ],
    SearchSupported : true
  };

  userName @Common.ValueList: {
    CollectionPath : 'Users',
    Label : '',
    Parameters : [
      {$Type: 'Common.ValueListParameterInOut', LocalDataProperty: userName, ValueListProperty: 'userName'},  // local data property is the foreign key
      {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'userINo'}
    ],
    SearchSupported : true
  };

  userId @Common.ValueList: {
    CollectionPath : 'Users',
    Label : '',
    Parameters : [
      {$Type: 'Common.ValueListParameterInOut', LocalDataProperty: userId, ValueListProperty: 'userId'},  // local data property is the foreign key
      {$Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'userName'},
    ],
    SearchSupported : true
  };
}