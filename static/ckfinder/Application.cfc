<!---
 * CKFinder
 * ========
 * http://cksource.com/ckfinder
 * Copyright (C) 2007-2015, CKSource - Frederico Knabben. All rights reserved.
 *
 * The software, this file and its contents are subject to the CKFinder
 * License. Please read the license.txt file before using, installing, copying,
 * modifying or distribute this file or part of its contents. The contents of
 * this file is part of the Source Code of CKFinder.
 *
 *
 * This file is used by ColdFusion 7 and later.
 * Use Application.cfm in ColdFusion 6.1.
 *
 * The Application.cfc component is used to set up the application.
 * You may safely remove this file. However, if you would like to use
 * sessions or client variables, for example to change "config.baseDir" and
 * "config.baseUrl" variables dynamically (in config.cfm), or specify ACL settings
 * for different user roles, make sure that SessionManagement and/or ClientManagement
 * is enabled.
 *
 * Note that client variables are not enabled by default,
 * to do this, add "ClientManagement = true".
 *
 * IMPORTANT: each Application has its own unique session scope, if you are using your own
 * Application.cfc file, make sure that the name of the application is correct in
 * ckfinder/core/connector/cfm/Application.cfc
 *
--->

<cfcomponent displayname="Application" output="false" hint="Pre-page processing for the application">

	<cfscript>
	// Set up the application.
	THIS.Name = "CKFinder_Connector";
	THIS.ApplicationTimeout = "#CreateTimeSpan( 0, 0, 5, 0 )#";
	THIS.SessionTimeout = "#CreateTimeSpan(0,0,45,0)#";
	THIS.SessionManagement = true;
	THIS.SetClientCookies = true;
	THIS.mappings["/CKFinder_Connector"] = getDirectoryFromPath(GetBaseTemplatePath());
	</cfscript>

</cfcomponent>
