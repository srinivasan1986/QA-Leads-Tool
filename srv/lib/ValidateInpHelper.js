module.exports = class ValidateInpHelper {

    validateProjectService(req) {
        return new Promise((resolve,reject) => {
            // check mandatory properties
            if (!req.data.projectName) {
                req.error(400, "Enter a valid project Name", "in/projectName");
            }

            if (!req.data.projectManager_userId) {
                req.error(400, "Enter a valid project manager", "in/projectManager_userId");
            }

            if (!req.data.actualStartDate) {
                req.error(400, "Enter a valid Start Date", "in/actualStartDate");
            }
        });
    }
};