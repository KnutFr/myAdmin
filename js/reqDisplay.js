function addSql()
{
	document.formSql.input.value = "SELECT col1, col2 FROM `table_name` WHERE clause1 AND clause2";
}
function createSql()
{
	document.formSql.input.value = 'CREATE TABLE "nom de table"("colonne 1" "type de données pour la colonne 1", "colonne 2" "type de données pour la colonne 2,... )";';
}
function insertSql()
{
	document.formSql.input.value = "INSERT INTO table_name VALUES (value1, value2, value3,...)";
}
function deleteSql()
{
	document.formSql.input.value = "DELETE FROM table_name WHERE some_column=some_value";
}
function updateSql()
{
	document.formSql.input.value = "UPDATE table_name SET column1=value, column2=value2,... WHERE some_column=some_value";
}
function dbCreate()
{
	document.formSql.input.value = "CREATE DATABASE database_name";
}
function dropSql()
{
	document.formSql.input.value = "DROP TABLE table_name";
}