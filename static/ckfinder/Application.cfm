<cfsetting enablecfoutputonly="true">
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
 * This file is used by ColdFusion 6.1.
 * Use Application.cfc in ColdFusion 7 and later.
 *
 * The <cfapplication> tag is used to set up the application.
 * You may safely remove this file. However, if you would like to use
 * sessions or client variables, for example to change "config.baseDir" and
 * "config.baseUrl" variables dynamically (in config.cfm), or specify ACL settings
 * for different user roles, make sure that SessionManagement and/or ClientManagement
 * is enabled.
 *
 * Note that client variables are not enabled by default,
 * to do this, add "ClientManagement = true" in the <cfapplication> tag.
 *
 * IMPORTANT: each Application has its own unique session scope, if you are using your own
 * Application.cfm file, make sure that the name of the application is correct in
 * ckfinder/core/connector/cfm/Application.cfm
 *
--->
<cfapplication
	Name = "CKFinder_Connector"
	SessionManagement = true
	ApplicationTimeout = "#CreateTimeSpan( 0, 0, 5, 0 )#"
	SessionTimeout = "#CreateTimeSpan(0,0,45,0)#"
	SetClientCookies = true
>
