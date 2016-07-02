select H, CNT from

(select to_char(C_EXEC_TIME, 'HH24') as "H",
        count(*) as "CNT"
from QRY_QUEUE 
group by to_char(C_EXEC_TIME, 'HH24') 
order by CNT desc)

where rownum <= 1;
