function changeCustom()
{
       
        document.getElementById("custom").style.display = "block";
         document.getElementById("custom").style.visibility = "visible";
        document.getElementById("quick").style.visibility = "hidden";
         document.getElementById("quick").style.display = "none";

    return true;
}
function changeQuick()
{
             document.getElementById("quick").style.display = "block";
        document.getElementById("quick").style.visibility = "visible";
        document.getElementById("custom").style.visibility = "hidden";
         document.getElementById("custom").style.display = "none";

    return true;
}

function alertDrop(base)
{
    return confirm("Etes vous sur de vouloir supprimer la base " + base + " ?");
}