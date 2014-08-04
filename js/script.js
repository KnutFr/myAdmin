function    showTables(sdatabase) {
    jQuery.ajax({
		type: "POST",
		url: "ajax/showTablesContent.php",
		data: {database: sdatabase}
    }).done(function( html ) {
		jQuery("#content").html(html);
    });
    jQuery.ajax({
		type: "POST",
		url: "ajax/showTablesRequest.php",
		data: {database: sdatabase}
    }).done(function( html ) {
		jQuery("#tablesRequest").html(html);
    });
}
	
function       execQuery(squery, stable, sdatabase) {
    jQuery.ajax({
		type: "POST",
		url: "ajax/execRequest.php",
		data: {query:squery, table:stable, database:sdatabase},
    }).done(function( html ) {
		jQuery("#content").html(html);
    });
}

function       confirmQuery(squery, sdata, sdatabase) {
    Modalbox.hide();
    
    jQuery.ajax({
		type: "POST",
		url: "ajax/confirmQuery.php",
		data: {query:squery, table:sdata, database:sdatabase},
    }).done(function( html ) {
		jQuery("#content").html(html);
    });
}

function       insertQuery(object, stable, sdatabase) {
    alert(object.parent());
    jQuery.ajax({
		type: "POST",
		url: "ajax/insertForm.php",
		data: {query:squery, table:stable, database:sdatabase},
    }).done(function( html ) {
		alert(html);
    });
}

