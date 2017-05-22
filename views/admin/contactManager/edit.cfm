<cfscript>
	recordId = rc.id      ?: "";
	version  = rc.version ?: "";
</cfscript>

<cfoutput>
	#renderViewlet( event='admin.datamanager.versionNavigator', args={
		  object         = "contact"
		, id             = recordId
		, version        = version
		, isDraft        = IsTrue( prc.record._version_is_draft ?: "" )
		, baseUrl        = event.buildAdminLink( linkto="contactManager.edit", queryString="id=#recordId#&version=" )
		, allVersionsUrl = event.buildAdminLink( linkto="contactManager.versionHistory", queryString="id=#recordId#" )
	} )#

	#renderView( view="/admin/datamanager/_editRecordForm", args={
		  object           = "contact"
		, id               = rc.id      ?: ""
		, record           = prc.record ?: {}
		, editRecordAction = event.buildAdminLink( linkTo='contactManager.editAction' )
		, cancelAction     = event.buildAdminLink( linkTo='contactManager' )
		, useVersioning    = true
	} )#
</cfoutput>