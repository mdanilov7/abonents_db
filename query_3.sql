select QRY_TYPE.C_NAME as "QRYTYPE",
       round(sum(case when C_ST = 0 then 1 else 0 end) / count(*) *100, 2) as "PRC"
from QRY_TYPE, QRY_QUEUE
where QRY_QUEUE.C_QRY_TYPE = QRY_TYPE.ID
group by QRY_TYPE.C_NAME 
having sum(case when C_ST = 0 then 1 else 0 end) / count(*) > 0.05;
