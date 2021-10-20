using {sap.sdcpmtool.transaction as sdcpmtool} from '../db/projectHeader';
using {sap.sdcpmtool.master as sdcpmmaster} from '../db/master/data-masters';

service ProjectService {
  entity Projects as
    select from sdcpmtool.Projects {
      *
    } excluding { createdBy, modifiedBy };

  entity Users  as projection on sdcpmmaster.Users;
}


// annotate ProjectService.Projects with {
//   projectManager     @cds.on.insert : $user;
//   projectDescription @cds.on.insert : $user;
// }
annotate ProjectService.Projects with @odata.draft.enabled;
// annotate UserMangService.Users with @odata.draft.enabled;

