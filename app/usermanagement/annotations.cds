using UserMangService as service from '../../srv/userMangService';

annotate cds.UUID with @Core.Computed  @odata.Type : 'Edm.String';

annotate UserMangService.Users with @UI : {

  Identification : [
    { Value : seqId },
  ],
  HeaderInfo : {
    TypeName       : '{i18n>User}',
    TypeNamePlural : '{i18n>Users}',
    Title          : {
      $Type : 'UI.DataField',
      Value : seqId
    },
    Description    : {
      $Type : 'UI.DataField',
      Value : '{i18n>seqId}'
    }
  },
  PresentationVariant : {
    Text           : 'Default',
    Visualizations : ['@UI.LineItem'],
    SortOrder      : [{
      $Type      : 'Common.SortOrderType',
      Property   : seqId,
      Descending : false
    }]
  },
  SelectionFields : [
    userINo,
    userName,
    userId
  ],
  LineItem : [
    { Value :  seqId, Label : '{i18n>S.No}' },
    { Value : userINo , Label : '{i18n>I-Number}'  },
    { Value : userName, Label : '{i18n>User-Name}' },
    { Value : userId , Label : '{i18n>Email-ID}'  }
    
  ],
  Facets : [{
    $Type  : 'UI.CollectionFacet',
    Label  : '{i18n>UserDetails}',
    ID     : 'seqId',
    Facets : [
      {  // User details
        $Type  : 'UI.ReferenceFacet',
        ID     : 'UserInformation',
        Target : '@UI.FieldGroup#UserInformation',
        Label  : 'UserInformation'
      }]
  }],
  FieldGroup#UserInformation : { Data : [
    { Value : userId , Label : 'Email-ID' },
    { Value : userINo , Label : 'I-Number' },
    { Value : userName, Label : 'User-Name' }
  ]}
};