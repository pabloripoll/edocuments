# Postgre Schema

## Base Schema

Table name, column name, data_type, not_null, column_position

```sql
SELECT
    t.tablename AS table_name,
    a.attname AS column_name,
    pg_catalog.format_type(a.atttypid, a.atttypmod) AS data_type,
    a.attnotnull AS not_null,
    a.attnum AS column_position
FROM
    pg_catalog.pg_tables t
    JOIN pg_catalog.pg_class c ON t.tablename = c.relname
    JOIN pg_catalog.pg_attribute a ON c.oid = a.attrelid
WHERE
    t.schemaname = 'public'  -- or your specific schema
    AND a.attnum > 0  -- exclude system columns
    AND NOT a.attisdropped  -- exclude dropped columns
ORDER BY
    t.tablename,
    a.attnum;
```

## Complete Schema

```sql
SELECT
    t.tablename AS table_name,
    a.attname AS column_name,
    pg_catalog.format_type(a.atttypid, a.atttypmod) AS data_type,
    a.attnotnull AS not_null,
    a.attnum AS column_position,

    -- Primary Key
    CASE WHEN pk.contype = 'p' THEN true ELSE false END AS is_primary_key,

    -- Foreign Key Information
    CASE WHEN fk.contype = 'f' THEN true ELSE false END AS is_foreign_key,
    fk_ref_table.relname AS fk_references_table,
    fk_ref_attr.attname AS fk_references_column,
    fk.conname AS fk_constraint_name,

    -- Unique Constraint
    CASE WHEN uq.contype = 'u' THEN true ELSE false END AS is_unique,

    -- Index Information
    STRING_AGG(DISTINCT i.relname, ', ') AS indexes,

    -- Default Value
    pg_get_expr(ad.adbin, ad.adrelid) AS column_default

FROM
    pg_catalog.pg_tables t
    JOIN pg_catalog.pg_class c ON t.tablename = c.relname AND t.schemaname = c.relnamespace::regnamespace::text
    JOIN pg_catalog.pg_attribute a ON c.oid = a.attrelid

    -- Primary Key
    LEFT JOIN pg_catalog.pg_constraint pk ON pk.conrelid = c.oid
        AND pk.contype = 'p'
        AND a.attnum = ANY(pk.conkey)

    -- Foreign Key
    LEFT JOIN pg_catalog.pg_constraint fk ON fk.conrelid = c.oid
        AND fk.contype = 'f'
        AND a.attnum = ANY(fk.conkey)
    LEFT JOIN pg_catalog.pg_class fk_ref_table ON fk.confrelid = fk_ref_table.oid
    LEFT JOIN pg_catalog.pg_attribute fk_ref_attr ON fk_ref_attr.attrelid = fk.confrelid
        AND fk_ref_attr.attnum = fk.confkey[array_position(fk.conkey, a.attnum)]

    -- Unique Constraint
    LEFT JOIN pg_catalog.pg_constraint uq ON uq.conrelid = c.oid
        AND uq.contype = 'u'
        AND a.attnum = ANY(uq.conkey)

    -- Indexes
    LEFT JOIN pg_catalog.pg_index ix ON ix.indrelid = c.oid
        AND a.attnum = ANY(ix.indkey)
    LEFT JOIN pg_catalog.pg_class i ON ix.indexrelid = i.oid

    -- Default Values
    LEFT JOIN pg_catalog.pg_attrdef ad ON ad.adrelid = c.oid
        AND ad.adnum = a.attnum

WHERE
    t.schemaname = 'public'
    AND a.attnum > 0
    AND NOT a.attisdropped

GROUP BY
    t.tablename,
    a.attname,
    a.atttypid,
    a.atttypmod,
    a.attnotnull,
    a.attnum,
    pk.contype,
    fk.contype,
    fk_ref_table.relname,
    fk_ref_attr.attname,
    fk.conname,
    uq.contype,
    ad.adbin,
    ad.adrelid

ORDER BY
    t.tablename,
    a.attnum;
```

## Result

```txt
"master_access_logs","id","bigint","true","1","true","false",\N,\N,\N,"false","master_access_logs_pkey"
"master_access_logs","user_id","bigint","true","2","false","true","users","id","fk_c5e10dfa76ed395","false","idx_c5e10dfa76ed395"
"master_access_logs","is_terminated","boolean","true","3","false","false",\N,\N,\N,"false",\N
"master_access_logs","is_expired","boolean","true","4","false","false",\N,\N,\N,"false",\N
"master_access_logs","expires_at","timestamp(0) without time zone","true","5","false","false",\N,\N,\N,"false","idx_master_access_logsexpires_at"
"master_access_logs","refresh_count","integer","true","6","false","false",\N,\N,\N,"false",\N
"master_access_logs","created_at","timestamp(0) without time zone","true","7","false","false",\N,\N,\N,"false",\N
"master_access_logs","updated_at","timestamp(0) without time zone","true","8","false","false",\N,\N,\N,"false",\N
"master_access_logs","ip_address","character varying(45)","false","9","false","false",\N,\N,\N,"false",\N
"master_access_logs","user_agent","text","false","10","false","false",\N,\N,\N,"false",\N
"master_access_logs","requests_count","integer","true","11","false","false",\N,\N,\N,"false",\N
"master_access_logs","payload","json","false","12","false","false",\N,\N,\N,"false",\N
"master_access_logs","token","text","true","13","false","false",\N,\N,\N,"false","idx_master_access_logstoken"
"master_profile","id","bigint","true","1","true","false",\N,\N,\N,"false","master_profile_pkey"
"master_profile","master_id","bigint","true","2","false","true","masters","id","fk_5d70476713b3db11","false","idx_5d70476713b3db11"
"master_profile","nickname","character varying(64)","true","3","false","false",\N,\N,\N,"false",\N
"master_profile","avatar","text","false","4","false","false",\N,\N,\N,"false",\N
"master_profile","created_at","timestamp(0) without time zone","true","5","false","false",\N,\N,\N,"false",\N
"master_profile","updated_at","timestamp(0) without time zone","true","6","false","false",\N,\N,\N,"false",\N
"masters","id","bigint","true","1","true","false",\N,\N,\N,"false","masters_pkey"
"masters","user_id","bigint","true","2","false","true","users","id","fk_7493b149a76ed395","false","idx_7493b149a76ed395"
"masters","is_active","boolean","true","3","false","false",\N,\N,\N,"false",\N
"masters","is_banned","boolean","true","4","false","false",\N,\N,\N,"false",\N
"masters","created_at","timestamp(0) without time zone","true","5","false","false",\N,\N,\N,"false",\N
"masters","updated_at","timestamp(0) without time zone","true","6","false","false",\N,\N,\N,"false",\N
"users","id","bigint","true","1","true","false",\N,\N,\N,"false","users_pkey"
"users","role","character varying(32)","true","2","false","false",\N,\N,\N,"false","idx_users_role"
"users","email","character varying(64)","true","3","false","false",\N,\N,\N,"false","uniq_users_email"
"users","password","character varying(256)","true","4","false","false",\N,\N,\N,"false",\N
"users","created_at","timestamp(0) without time zone","true","5","false","false",\N,\N,\N,"false","idx_users_created_at"
"users","updated_at","timestamp(0) without time zone","false","6","false","false",\N,\N,\N,"false",\N
"users","deleted_at","timestamp(0) without time zone","false","7","false","false",\N,\N,\N,"false","idx_users_deleted_at"
"users","created_by_user_id","bigint","true","8","false","false",\N,\N,\N,"false",\N
```

```sql
-- Dumping structure for table public.masters
CREATE TABLE IF NOT EXISTS "masters" (
	"id" SERIAL NOT NULL,
	"user_id" BIGINT NOT NULL,
	"is_active" BOOLEAN NOT NULL DEFAULT false,
	"is_banned" BOOLEAN NOT NULL DEFAULT false,
	"created_at" TIMESTAMP NOT NULL,
	"updated_at" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	KEY ("user_id"),
	CONSTRAINT "fk_7493b149a76ed395" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Data exporting was unselected.

-- Dumping structure for table public.master_access_logs
CREATE TABLE IF NOT EXISTS "master_access_logs" (
	"id" SERIAL NOT NULL,
	"user_id" BIGINT NOT NULL,
	"is_terminated" BOOLEAN NOT NULL DEFAULT false,
	"is_expired" BOOLEAN NOT NULL DEFAULT false,
	"expires_at" TIMESTAMP NOT NULL,
	"refresh_count" INTEGER NOT NULL DEFAULT 0,
	"created_at" TIMESTAMP NOT NULL,
	"updated_at" TIMESTAMP NOT NULL,
	"ip_address" VARCHAR(45) NULL DEFAULT NULL::character varying,
	"user_agent" TEXT NULL DEFAULT NULL,
	"requests_count" INTEGER NOT NULL DEFAULT 0,
	"payload" JSON NULL DEFAULT NULL,
	"token" TEXT NOT NULL,
	PRIMARY KEY ("id"),
	KEY ("user_id"),
	KEY ("expires_at"),
	KEY ("token"),
	CONSTRAINT "fk_c5e10dfa76ed395" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Data exporting was unselected.

-- Dumping structure for table public.master_profile
CREATE TABLE IF NOT EXISTS "master_profile" (
	"id" SERIAL NOT NULL,
	"master_id" BIGINT NOT NULL,
	"nickname" VARCHAR(64) NOT NULL,
	"avatar" TEXT NULL DEFAULT NULL,
	"created_at" TIMESTAMP NOT NULL,
	"updated_at" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	KEY ("master_id"),
	CONSTRAINT "fk_5d70476713b3db11" FOREIGN KEY ("master_id") REFERENCES "masters" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Data exporting was unselected.

-- Dumping structure for table public.users
CREATE TABLE IF NOT EXISTS "users" (
	"id" SERIAL NOT NULL,
	"role" VARCHAR(32) NOT NULL,
	"email" VARCHAR(64) NOT NULL,
	"password" VARCHAR(256) NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	"updated_at" TIMESTAMP NULL DEFAULT NULL::timestamp without time zone,
	"deleted_at" TIMESTAMP NULL DEFAULT NULL::timestamp without time zone,
	"created_by_user_id" BIGINT NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("email"),
	KEY ("role"),
	KEY ("created_at"),
	KEY ("deleted_at")
);

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
```

```sh
Legend:
[PK] = Primary Key
[FK] = Foreign Key
[UC] = Unique Constraint
[IDX] = Indexed

Database Schema
│
├── users [PRIMARY]
│   ├── [PK] id (bigint, NOT NULL) [auto-increment]
│   ├── [IDX] role (varchar(32), NOT NULL)
│   ├── [UC][IDX] email (varchar(64), UNIQUE, NOT NULL)
│   ├── password (varchar(256), NOT NULL)
│   ├── [IDX] created_at (timestamp, NOT NULL)
│   ├── updated_at (timestamp)
│   ├── [IDX] deleted_at (timestamp)
│   └── created_by_user_id (bigint, NOT NULL)
│
├── masters
│   ├── [PK] id (bigint, NOT NULL) [auto-increment]
│   ├── [FK][IDX] user_id (bigint, NOT NULL) → users.id
│   ├── is_active (boolean, NOT NULL)
│   ├── is_banned (boolean, NOT NULL)
│   ├── created_at (timestamp, NOT NULL)
│   └── updated_at (timestamp, NOT NULL)
│
├── master_access_logs
│   ├── [PK] id (bigint, NOT NULL) [auto-increment]
│   ├── [FK][IDX] user_id (bigint, NOT NULL) → users.id
│   ├── is_terminated (boolean, NOT NULL)
│   ├── is_expired (boolean, NOT NULL)
│   ├── [IDX] expires_at (timestamp, NOT NULL)
│   ├── refresh_count (integer, NOT NULL)
│   ├── created_at (timestamp, NOT NULL)
│   ├── updated_at (timestamp, NOT NULL)
│   ├── ip_address (varchar(45))
│   ├── user_agent (text)
│   ├── requests_count (integer, NOT NULL)
│   ├── payload (json)
│   └── [IDX] token (text, NOT NULL)
│
├── master_profile
│   ├── [PK] id (bigint, NOT NULL) [auto-increment]
│   ├── [FK][IDX] master_id (bigint, NOT NULL) → masters.id
│   ├── nickname (varchar(64), NOT NULL)
│   ├── avatar (text)
│   ├── created_at (timestamp, NOT NULL)
│   └── updated_at (timestamp, NOT NULL)
│
```