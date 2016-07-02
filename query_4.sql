select ST_ABONENTS.C_NAME as "ABONENT_NAME",
       case
        when QRY_QUEUE.C_ST is not null
          then 
            (case when QRY_QUEUE.C_ST = 1 then 'OK' else  'FAIL' end)
          else 'NULL'
       end as "STATUS",
       count(*) as "CNT"
from QRY_QUEUE, QRY_TYPE, ST_ABONENTS
where QRY_QUEUE.C_QRY_TYPE = QRY_TYPE.ID and 
      QRY_TYPE.C_AB_REF = ST_ABONENTS.ID
group by ST_ABONENTS.C_NAME, QRY_QUEUE.C_ST;
