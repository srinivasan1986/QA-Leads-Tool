/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require([
		"test/com/sap/test/unit/AllTests"
	], function () {
		QUnit.start();
	});
});
