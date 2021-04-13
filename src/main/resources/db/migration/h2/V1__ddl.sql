CREATE SEQUENCE "HIBERNATE_SEQUENCE" START WITH 1;
CREATE MEMORY TABLE "ASSOCIATION_VALUE_ENTRY"(
    "ID" BIGINT NOT NULL,
    "ASSOCIATION_KEY" VARCHAR(255) NOT NULL,
    "ASSOCIATION_VALUE" VARCHAR(255),
    "SAGA_ID" VARCHAR(255) NOT NULL,
    "SAGA_TYPE" VARCHAR(255)
);
ALTER TABLE "ASSOCIATION_VALUE_ENTRY" ADD CONSTRAINT "CONSTRAINT_B" PRIMARY KEY("ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.ASSOCIATION_VALUE_ENTRY;
CREATE INDEX "IDXK45EQNXKGD8HPDN6XIXN8SGFT" ON "ASSOCIATION_VALUE_ENTRY"("SAGA_TYPE", "ASSOCIATION_KEY", "ASSOCIATION_VALUE");
CREATE INDEX "IDXGV5K1V2MH6FRXUY5C0HGBAU94" ON "ASSOCIATION_VALUE_ENTRY"("SAGA_ID", "SAGA_TYPE");
CREATE MEMORY TABLE "ORDER_ENTITY"(
    "ID" VARCHAR(255) NOT NULL,
    "DELIVERY_ADDRESS" VARCHAR(255),
    "ORDER_STATE" VARCHAR(255),
    "RESTAURANT_ID" VARCHAR(255),
    "USER_ID" VARCHAR(255)
);
ALTER TABLE "ORDER_ENTITY" ADD CONSTRAINT "CONSTRAINT_4" PRIMARY KEY("ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.ORDER_ENTITY;
CREATE MEMORY TABLE "ORDER_ENTITY_ORDER_LINE_ITEMS"(
    "ORDER_ENTITY_ID" VARCHAR(255) NOT NULL,
    "MENU_ITEM_ID" VARCHAR(255),
    "NAME" VARCHAR(255),
    "PRICE" DECIMAL(19, 2),
    "QUANTITY" INTEGER
);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.ORDER_ENTITY_ORDER_LINE_ITEMS;
CREATE MEMORY TABLE "SAGA_ENTRY"(
    "SAGA_ID" VARCHAR(255) NOT NULL,
    "REVISION" VARCHAR(255),
    "SAGA_TYPE" VARCHAR(255),
    "SERIALIZED_SAGA" BLOB
);
ALTER TABLE "SAGA_ENTRY" ADD CONSTRAINT "CONSTRAINT_BD" PRIMARY KEY("SAGA_ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SAGA_ENTRY;
CREATE MEMORY TABLE "TOKEN_ENTRY"(
    "PROCESSOR_NAME" VARCHAR(255) NOT NULL,
    "SEGMENT" INTEGER NOT NULL,
    "OWNER" VARCHAR(255),
    "TIMESTAMP" VARCHAR(255) NOT NULL,
    "TOKEN" BLOB,
    "TOKEN_TYPE" VARCHAR(255)
);
ALTER TABLE "TOKEN_ENTRY" ADD CONSTRAINT "CONSTRAINT_7" PRIMARY KEY("PROCESSOR_NAME", "SEGMENT");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TOKEN_ENTRY;
ALTER TABLE "ORDER_ENTITY_ORDER_LINE_ITEMS" ADD CONSTRAINT "FKGAJ6H7W5XQBRDP8NY5QWV27I9" FOREIGN KEY("ORDER_ENTITY_ID") REFERENCES "ORDER_ENTITY"("ID") NOCHECK;
(