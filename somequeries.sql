--INSERTING 
INSERT INTO "Volume"."Volume"("Date", "Volume") 
SELECT "Date", "Volume" from "Overall"."Overall";

INSERT INTO "Open_Close"."Open_Close"("Date", "Open", "Close","Adj Close") 
SELECT "Date", "Open", "Close","Adj Close" from "Overall"."Overall";

INSERT INTO "High_Low"."High_Low"("Date", "High","Low") 
SELECT "Date", "High","Low" from "Overall"."Overall";

--show all data in Excel format
SELECT * FROM "High_Low"."High_Low"
INNER JOIN "Company"."Company" on "Company"."Company"."ID" = "High_Low"."High_Low"."stock_Id"
INNER JOIN "Open_Close"."Open_Close" on "High_Low"."High_Low"."Date" = "Open_Close"."Open_Close"."Date"
INNER JOIN "Volume"."Volume" on "Volume"."Volume"."Date" = "High_Low"."High_Low"."Date";

--Returns date of highest closing price
SELECT * FROM "Open_Close"."Open_Close"
WHERE "Close" = (SELECT MAX("Close") FROM "Open_Close"."Open_Close")
RETURNING *;

--Returns date of lowest volume
SELECT * FROM "Volume"."Volume"
WHERE "Volume" = (SELECT MIN("Volume") FROM "Volume"."Volume")
RETURNING *;

--UPDATE 12/15/16's volume to 1
UPDATE "Volume"."Volume"
SET "Volume" = 1
WHERE "Date" = '2016-12-15';

SELECT * FROM "Volume"."Volume" WHERE "Date" = '2016-12-15';

--, "High_Low"."High_Low", "Open_Close"."Open_Close"

--DELETE DATA OF DATE 3/19/18
DELETE FROM "Volume"."Volume"
WHERE "Date" = '2018-03-19'
RETURNING *;

DELETE FROM "High_Low"."High_Low"
WHERE "Date" = '2018-03-19'
RETURNING *;

DELETE FROM "Open_Close"."Open_Close"
WHERE "Date" = '2018-03-19'
RETURNING *;

--RETURNS COUNTS
SELECT COUNT(*) FROM "Volume"."Volume";
SELECT COUNT(*) FROM "High_Low"."High_Low";
SELECT COUNT(*) FROM "Open_Close"."Open_Close";

