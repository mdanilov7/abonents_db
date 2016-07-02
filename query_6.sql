select ABONENT_NAME, CNT from

(select ST_ABONENTS.C_NAME as "ABONENT_NAME",
        count(*) as "CNT"
from QRY_TYPE, ST_ABONENTS, QRY_QUEUE 
where QRY_QUEUE.C_QRY_TYPE = QRY_TYPE.ID and 
      QRY_TYPE.C_AB_REF = ST_ABONENTS.ID 
group by ST_ABONENTS.C_NAME
order by CNT desc)

where rownum <= 1;