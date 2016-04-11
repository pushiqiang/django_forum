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
--->

<cfcomponent displayname="Application" output="false" hint="Pre-page processing for the application">

	<!---
	Run the pseudo constructor to set up default
	data structures.
	--->
	<cfscript>
	// Set up the application.
	THIS.Name = "CKFinder_Connector";
	THIS.ApplicationTimeout = "#CreateTimeSpan( 0, 2, 0, 0 )#";
	THIS.SessionTimeout = "#CreateTimeSpan(0,0,45,0)#";
	THIS.SessionManagement = true;
	THIS.SetClientCookies = true;
	THIS.mappings["/CKFinder_Connector"] = getDirectoryFromPath(GetBaseTemplatePath());
	</cfscript>

	<!--- Include the CFC creation proxy. --->
	<cfinclude template="createcfc.udf.cfm" />

	<cffunction name="OnRequestStart" access="public" returntype="boolean" output="false" hint="Pre-page processing for the page request.">
		<!---
		Store the CreateCFC method in the application
		scope.
		--->
		<cfset APPLICATION.CreateCFC = THIS.CreateCFC />
		<cfset APPLICATION.CFVersion = Left(SERVER.COLDFUSION.PRODUCTVERSION,Find(",",SERVER.COLDFUSION.PRODUCTVERSION)-1) />
		<cfreturn true />
	</cffunction>

</cfcomponent>
