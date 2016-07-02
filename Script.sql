CREATE SEQUENCE SEQ_USER
   START WITH 1
   INCREMENT BY 1;

CREATE TABLE QRY_QUEUE
(
   ID            NUMBER,
   C_IN_TIME     DATE,
   C_EXEC_TIME   DATE,
   C_ST          VARCHAR2 (1 BYTE),
   C_QRY_TYPE    NUMBER
);

CREATE TABLE ST_ABONENTS
(
   ID       NUMBER,
   C_NAME   VARCHAR2 (100 BYTE)
);

CREATE TABLE QRY_TYPE
(
   ID         NUMBER,
   C_AB_REF   NUMBER,
   C_NAME     VARCHAR2 (210 BYTE)
);

BEGIN
   FOR i IN 1 .. 5
   LOOP
      INSERT INTO ST_ABONENTS
           VALUES (SEQ_USER.NEXTVAL, 'Abonent ' || i);
   END LOOP;
   FOR i IN 6 .. 7
   LOOP
      INSERT INTO ST_ABONENTS
           VALUES (SEQ_USER.NEXTVAL, 'Abonent ' || i);
   END LOOP;
   DECLARE
      I      NUMBER;
      CNT    NUMBER := 2;
      CNT1   NUMBER := 0;
      CURSOR c_obj
      IS
           SELECT a1.id
             FROM ST_ABONENTS a1
         ORDER BY a1.C_name;
   BEGIN
      FOR plp$c_obj IN c_obj
      LOOP
         I := plp$c_obj.id;
         cnt := cnt + 2;
         IF cnt > 5
         THEN
            cnt := 2;
         END IF;
         FOR j IN 1 .. cnt
         LOOP
            cnt1 := cnt1 + 1;
            INSERT INTO QRY_TYPE
                 VALUES (
                           SEQ_USER.NEXTVAL,
                           I,
                           'Message type ' || cnt1);
         END LOOP;
         NULL;
      END LOOP;
   END;

   DECLARE
      I            NUMBER;
      s            INTEGER := 0;
      s1           INTEGER := 0;
      go_out       INTEGER := 0;
      go_out1      INTEGER := 0;
      tempID       NUMBER;
      tempIDprev   NUMBER;
      CURSOR c_obj
      IS
           SELECT a1.id
             FROM QRY_TYPE a1
         ORDER BY a1.C_name;
   BEGIN
      FOR plp$c_obj IN c_obj
      LOOP
         I := plp$c_obj.id;
         go_out1 := go_out1 + 1;
         IF go_out1 = 22
         THEN
            EXIT;
         END IF;
         FOR j IN 1 .. 150
         LOOP
            s := s + 1;
            IF s >= 55
            THEN
               s := 0;
            END IF;
            s1 := s + 4;
            INSERT INTO QRY_QUEUE
                 VALUES (
                           SEQ_USER.NEXTVAL,
                           TO_DATE ('01/01/2015 23:40:' || s,
                                    'DD/MM/YYYY HH24:MI:SS'),
                           TO_DATE ('01/01/2015 23:41:' || s1,
                                    'DD/MM/YYYY HH24:MI:SS'),
                           1,
                           I);
         END LOOP;
      END LOOP;
      FOR plp$c_obj IN c_obj
      LOOP
         I := plp$c_obj.id;
         go_out := go_out + 1;
         IF go_out <= 10
         THEN
            FOR j IN 1 .. 50
            LOOP
               s := s + 1;
               IF s >= 40
               THEN
                  s := 0;
               END IF;
               s1 := s + 6;
               INSERT INTO QRY_QUEUE
                    VALUES (
                              SEQ_USER.NEXTVAL,
                              TO_DATE ('01/01/2015 23:45:' || s,
                                       'DD/MM/YYYY HH24:MI:SS'),
                              TO_DATE ('01/01/2015 23:46:' || s1,
                                       'DD/MM/YYYY HH24:MI:SS'),
                              1,
                              I);
            END LOOP;
         ELSIF go_out <= 13
         THEN
            FOR j IN 1 .. 13
            LOOP
               s := s + 1;
               IF s >= 30
               THEN
                  s := 0;
               END IF;
               s1 := s + 5;
               INSERT INTO QRY_QUEUE
                    VALUES (
                              SEQ_USER.NEXTVAL,
                              TO_DATE ('01/01/2015 13:50:10',
                                       'DD/MM/YYYY HH24:MI:SS'),
                              TO_DATE ('01/01/2015 13:50:15',
                                       'DD/MM/YYYY HH24:MI:SS'),
                              0,
                              I);
            END LOOP;
         ELSIF go_out <= 15
         THEN
            FOR j IN 1 .. 3
            LOOP
               s := s + 1;
               IF s >= 30
               THEN
                  s := 0;
               END IF;
               INSERT INTO QRY_QUEUE
                    VALUES (
                              SEQ_USER.NEXTVAL,
                              TO_DATE ('01/01/2015 22:22:' || s,
                                       'DD/MM/YYYY HH24:MI:SS'),
                              NULL,
                              NULL,
                              I);
            END LOOP;
         END IF;
      END LOOP;
   END;

   COMMIT;
END;
