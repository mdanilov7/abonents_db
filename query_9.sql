select ST_ABONENTS.C_NAME as "ABONENT_NAME",
       ('from ' || to_char(C_IN_TIME, 'HH24') || ' to ' || mod(to_char(C_IN_TIME, 'HH24') + 1, 24)) as "HH24",
       round(count(*) / 360, 2) as "CNT"
from QRY_QUEUE, ST_ABONENTS, QRY_TYPE
where QRY_QUEUE.C_QRY_TYPE = QRY_TYPE.ID and 
      QRY_TYPE.C_AB_REF = ST_ABONENTS.ID
group by ST_ABONENTS.C_NAME, ('from ' || to_char(C_IN_TIME, 'HH24') || ' to ' || mod(to_char(C_IN_TIME, 'HH24') + 1, 24));
