<cfsilent>
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

<cfapplication
	Name = "CKFinder_Connector"
	SessionManagement = true
	ApplicationTimeout = "#CreateTimeSpan( 0, 2, 0, 0 )#"
	SessionTimeout = "#CreateTimeSpan(0,0,45,0)#"
	SetClientCookies = true
>

<!--- Set the Application variables if they aren't defined. --->
<!--- Initilialize local app_is_initialized flag to false --->
<cfset app_is_initialized = False>
<!--- Get a readonly lock --->
<cflock scope="application" type="readonly" timeout="10">
	<!--- Read init flag and store it in local variable --->
	<cfset app_is_initialized = IsDefined("Application.initialized")>
</cflock>

<!--- Check the local flag --->
<cfif not app_is_initialized >
<!--- Application variables are Not initialized yet.
	Get an exclusive lock to write scope --->
	<cflock scope="application" type="exclusive" timeout="10">
	<!--- Check the Application scope initialized flag since another request could
	have set the variables after this page released the read-only lock. --->
	<cfif not IsDefined("Application.initialized") >
		<!--- Include the CFC creation proxy. --->
		<cfinclude template="createcfc.udf.cfm" />

		<!--- Do initializations --->
		<cfset Application.CreateCFC = CreateCFC />
		<cfset Application.CFVersion = Left(SERVER.COLDFUSION.PRODUCTVERSION,Find(",",SERVER.COLDFUSION.PRODUCTVERSION)-1) >
		<cfreturn true />

		<!--- Set the Application scope initialization flag --->
		<cfset Application.initialized = "yes">
	</cfif>
	</cflock>
</cfif>
</cfsilent>
