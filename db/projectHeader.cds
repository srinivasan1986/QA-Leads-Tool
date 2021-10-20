namespace sap.sdcpmtool.transaction;
using { cuid, Country, managed, Currency, User } from '@sap/cds/common';
using { ProjectType, ProjectMode, ProjectStatus, 
        Region, SubRegion, BCPStatusField,
        DeliveryCenter, FactoryRelevantField, ProjectSize,
        CustomerIndustry, ProjectPhaseField, CompanyCode, PMToolUser } from './master';

entity Projects : cuid, managed {
  projectId : Integer;
  ptdProjectId: String(40);
  crmOppId: String(9);
  customerName: String(30);
  projectName: String(30);
  projectType: ProjectType;
  projectMode: ProjectMode;
  projectStatus: ProjectStatus;
  actualStartDate: Date;
  plannedStartDate: Date;
  plannedEndDate: Date;
  region: Region;
  subRegion: SubRegion;
  country: Country;
  primaryDeliveryCenter: DeliveryCenter;
  bcpStatus: BCPStatusField;
  qaLeadId: PMToolUser;
  factoryRelevant: FactoryRelevantField;
  projectSize: ProjectSize;
  customerIndustry: CustomerIndustry;
  projectManager: PMToolUser;
  dpManager: PMToolUser;
  projectPhase: ProjectPhaseField;
  muCompanyCode: CompanyCode;
  projectCurrency: Currency;
  projectDescription: String;
  projectArchiveFlag : Boolean;
}


