

/*****************************************************************/

 begin transaction enable_cmdshell      
	  --Insert into the table
commit transaction enable_cmdshell


--do stuff

 begin transaction disable_cmdshell
--if exists(select top 1 spid from table where spid <> me and spid <> start)
	--begin
		--truncate row where spid = me
	--end
--else
	--truncate row where spid = me
	--set xp_cmdshell to start
commit transaction disable_cmdshell