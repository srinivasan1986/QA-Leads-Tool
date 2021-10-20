const cds = require("@sap/cds");
const SequenceHelper = require("./lib/SequenceHelper");
const ValidateInpHelper = require("./lib/ValidateInpHelper");
const validator = new ValidateInpHelper();

/**
 * The way a message will be displayed in Fiori Elements. Use as property
 * 'numericSeverity'.
 */
const MessageType = {
	InfoToast: 1,
	InfoDialog: 2,
	WarningDialog: 3,
	ErrorDialog: 4,
};

module.exports = cds.service.impl(async (service) => {
	const db = await cds.connect.to("db");
	const { Projects } = service.entities;

	service.before("CREATE", Projects, async (context) => {
		const projectId = new SequenceHelper({
			db: db,
			sequence: "PROJECTID",
			table: "Projects",
			field: "projectId",
			context: context
		});

		service.before("SAVE", Projects, function(req){
			validator.validateProjectService(req);
            // if (!req.data.projectName) {
            //     req.error(400, "Enter a valid project Name", "in/projectName");
            // }

            // if (!req.data.projectManager_userId) {
            //     req.error(400, "Enter a valid project manager", "in/projectManager_userId");
            // }

            // if (!req.data.actualStartDate) {
            //     req.error(400, "Enter a valid Start Date", "in/actualStartDate");
            // }

		});

		context.data.projectId = await projectId.getNextNumber();
		context.data.projectArchiveFlag = false;
		// context.data.projectManager_userId = "anonymou";
	});

	// service.prepend(()=>{
	service.on("DELETE", Projects, async (req) => {
		const projectId = req.data.ID;
		const n = await req.run(UPDATE(Projects)
			.set({
				projectArchiveFlag: true,
				modifiedAt: Date.now(),
				modifiedBy: req.user.id
			})
			.where({ ID: projectId })).then(
				req.info({
					code: 204,
					message: "Projects Archived",
					numericSeverity: MessageType.InfoToast,
				})
			);
		n > 0 || req.error(500, `${projectId} Error while updating projects`)
	});

	service.after("READ", "Projects", async (projects, req) => {
		// projects[0].dpManager_userId = req.user.id;
		// const projetestctId = req.data;
		//   const tx = ProjectService.tx(req)
		//   let query = cds.parse.cql (`SELECT from Projects`)
		//   const books = await tx.run(query)
		// //   const books = await tx.run (SELECT.from (Projects).excluding ['IsActiveEntity'])
		//   return books

	});
	//   });
});