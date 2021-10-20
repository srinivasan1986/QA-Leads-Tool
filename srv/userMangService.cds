using {sap.sdcpmtool.transaction as sdcpmtool} from '../db/projectHeader';
using {sap.sdcpmtool.master as sdcpmmaster} from '../db/master/data-masters';


service UserMangService {
  entity Users as
    select from sdcpmmaster.Users {
      *
    } excluding { createdBy, modifiedBy };

}

// annotate ProjectService.Projects with {
//   projectManager     @cds.on.insert : $user;
//   projectDescription @cds.on.insert : $user;
// }
//annotate ProjectService.Projects with @odata.draft.enabled;
annotate UserMangService.Users with @odata.draft.enabled;
annotate UserMangService.Users with @Common.SemanticKey: [id];