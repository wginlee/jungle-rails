                                        Table "public.users"
     Column      |            Type             |                     Modifiers                      
-----------------+-----------------------------+----------------------------------------------------
 id              | integer                     | not null default nextval('users_id_seq'::regclass)
 first_name      | character varying           | 
 last_name       | character varying           | 
 email           | character varying           | 
 password_digest | character varying           | 
 created_at      | timestamp without time zone | not null
 updated_at      | timestamp without time zone | not null
Indexes:
    "users_pkey" PRIMARY KEY, btree (id)

