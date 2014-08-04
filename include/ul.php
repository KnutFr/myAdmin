<?php
function checkSize($filename, $filesize)
{
	if(($filename == "none") && ($userfile_size == 0))
	 	return (false);
	else
		return (true);
}
function copyFile($filename,$file)
{
	$today = date("d-m-Y g : i");
	$localfile = "upload/".$today.$filename;
        $copie = copy($file,$localfile);
        if ($copie === false)
        	return (false);
        else 
        	return ($localfile);
}
function zip_extract($file, $extractPath) {
    $zip = new ZipArchive;
    $res = $zip->open($file);
    if ($res === TRUE) {
        $zip->extractTo($extractPath);
        $zip->close();
        return TRUE;
    } 
    else 
        return FALSE;
} 
?>