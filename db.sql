PGDMP         0                {            book    14.1    14.1 c    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17031    book    DATABASE     a   CREATE DATABASE book WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE book;
                postgres    false                        3079    17032 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    17043    author    TABLE     �   CREATE TABLE public.author (
    idauthor uuid NOT NULL,
    lastname character varying(20) NOT NULL,
    firstname character varying(20) NOT NULL
);
    DROP TABLE public.author;
       public         heap    postgres    false            �            1259    17046    authors    TABLE     E   CREATE TABLE public.authors (
    name character varying NOT NULL
);
    DROP TABLE public.authors;
       public         heap    postgres    false            �            1259    17051    bookliterature    TABLE     �   CREATE TABLE public.bookliterature (
    idbookliterature uuid NOT NULL,
    idauthor uuid NOT NULL,
    bookname character varying(50) NOT NULL,
    note character varying(50) NOT NULL
);
 "   DROP TABLE public.bookliterature;
       public         heap    postgres    false            �            1259    17054    bookresponse    TABLE     �   CREATE TABLE public.bookresponse (
    idbookresponse uuid NOT NULL,
    idbookliterature uuid,
    id_user uuid,
    createdat date,
    response character varying(500),
    note character varying(50)
);
     DROP TABLE public.bookresponse;
       public         heap    postgres    false            �            1259    17059    books    TABLE     �   CREATE TABLE public.books (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    pagecount integer NOT NULL,
    yearofissue integer NOT NULL,
    author character varying
);
    DROP TABLE public.books;
       public         heap    postgres    false            �            1259    17064    category    TABLE     �   CREATE TABLE public.category (
    idcategory uuid NOT NULL,
    categoryname character varying(25),
    multiselect boolean,
    idparent uuid
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    17067    exchangelist    TABLE     �   CREATE TABLE public.exchangelist (
    idexchangelist uuid NOT NULL,
    idofferlist1 uuid,
    idwishlist1 uuid,
    idofferlist2 uuid,
    idwishlist2 uuid,
    createatdate date,
    createattime time without time zone,
    isboth boolean
);
     DROP TABLE public.exchangelist;
       public         heap    postgres    false            �            1259    17070    flyway_schema_history    TABLE     �  CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);
 )   DROP TABLE public.flyway_schema_history;
       public         heap    postgres    false            �            1259    17076 	   offerlist    TABLE     :  CREATE TABLE public.offerlist (
    idofferlist uuid NOT NULL,
    idbookliterature uuid,
    id_user uuid,
    idstatus uuid,
    ibsn character varying(13),
    yearpublishing date,
    createatdate date,
    createattime time without time zone,
    updateatdate date,
    updateattime time without time zone
);
    DROP TABLE public.offerlist;
       public         heap    postgres    false            �            1259    17079    roles    TABLE     C   CREATE TABLE public.roles (
    name character varying NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    17084    status    TABLE     [   CREATE TABLE public.status (
    idstatus uuid NOT NULL,
    name character varying(10)
);
    DROP TABLE public.status;
       public         heap    postgres    false            �            1259    17087    tokens    TABLE     y   CREATE TABLE public.tokens (
    user_id uuid NOT NULL,
    value character varying(255) NOT NULL,
    killed boolean
);
    DROP TABLE public.tokens;
       public         heap    postgres    false            �            1259    17090    useraddress    TABLE     )  CREATE TABLE public.useraddress (
    id_useraddress uuid NOT NULL,
    id_user uuid,
    addrindex character varying(6),
    addrcity character varying(15),
    addrstreet character varying(25),
    addrhouse character varying(5),
    addrapartment character varying(3),
    isdefault boolean
);
    DROP TABLE public.useraddress;
       public         heap    postgres    false            �            1259    17093    userexchangelist    TABLE     �   CREATE TABLE public.userexchangelist (
    id_userexchangelist uuid NOT NULL,
    idexchangelist uuid,
    idofferlist uuid,
    tracknumber character varying(20),
    receiving boolean
);
 $   DROP TABLE public.userexchangelist;
       public         heap    postgres    false            �            1259    17096    userlist    TABLE     �   CREATE TABLE public.userlist (
    id_userlist uuid NOT NULL,
    idwishlist uuid,
    "TypeList" integer,
    idofferlist uuid
);
    DROP TABLE public.userlist;
       public         heap    postgres    false            �            1259    17099    usermessage    TABLE     O  CREATE TABLE public.usermessage (
    id_usermessage uuid NOT NULL,
    id_user uuid,
    createatdate date,
    createattime time without time zone,
    textmessage character varying(250),
    notes character varying(150),
    idstatus uuid,
    typeofmessage integer,
    updatedatdate date,
    updatedattime time with time zone
);
    DROP TABLE public.usermessage;
       public         heap    postgres    false            �            1259    17102    users    TABLE     �  CREATE TABLE public.users (
    id uuid NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    role character varying,
    email character varying(25) NOT NULL,
    password character varying(120) NOT NULL,
    enabled boolean DEFAULT true,
    rating integer DEFAULT 1 NOT NULL,
    created_at_time time with time zone,
    created_at_date date,
    avatar bytea,
    username character varying(120)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17109    uservaluecategory    TABLE        CREATE TABLE public.uservaluecategory (
    id_uservaluecategory uuid NOT NULL,
    id_userlist uuid,
    "idCategory" uuid
);
 %   DROP TABLE public.uservaluecategory;
       public         heap    postgres    false            �            1259    17112    verification_tokens    TABLE     �   CREATE TABLE public.verification_tokens (
    id uuid NOT NULL,
    token character varying(255),
    user_id uuid NOT NULL,
    expiry_date timestamp without time zone,
    confirmed boolean NOT NULL
);
 '   DROP TABLE public.verification_tokens;
       public         heap    postgres    false            �            1259    17115    wishlist    TABLE       CREATE TABLE public.wishlist (
    idwishlist uuid NOT NULL,
    id_user uuid,
    idstatus uuid,
    id_useraddress uuid,
    createatdate date,
    createattime time without time zone,
    updateatdate date,
    updateattime time without time zone,
    yearpublishing date
);
    DROP TABLE public.wishlist;
       public         heap    postgres    false            �          0    17043    author 
   TABLE DATA           ?   COPY public.author (idauthor, lastname, firstname) FROM stdin;
    public          postgres    false    210   �}       �          0    17046    authors 
   TABLE DATA           '   COPY public.authors (name) FROM stdin;
    public          postgres    false    211   0�       �          0    17051    bookliterature 
   TABLE DATA           T   COPY public.bookliterature (idbookliterature, idauthor, bookname, note) FROM stdin;
    public          postgres    false    212   M�       �          0    17054    bookresponse 
   TABLE DATA           l   COPY public.bookresponse (idbookresponse, idbookliterature, id_user, createdat, response, note) FROM stdin;
    public          postgres    false    213   j�       �          0    17059    books 
   TABLE DATA           I   COPY public.books (id, name, pagecount, yearofissue, author) FROM stdin;
    public          postgres    false    214   ��       �          0    17064    category 
   TABLE DATA           S   COPY public.category (idcategory, categoryname, multiselect, idparent) FROM stdin;
    public          postgres    false    215   ��       �          0    17067    exchangelist 
   TABLE DATA           �   COPY public.exchangelist (idexchangelist, idofferlist1, idwishlist1, idofferlist2, idwishlist2, createatdate, createattime, isboth) FROM stdin;
    public          postgres    false    216   ��       �          0    17070    flyway_schema_history 
   TABLE DATA           �   COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
    public          postgres    false    217   ށ       �          0    17076 	   offerlist 
   TABLE DATA           �   COPY public.offerlist (idofferlist, idbookliterature, id_user, idstatus, ibsn, yearpublishing, createatdate, createattime, updateatdate, updateattime) FROM stdin;
    public          postgres    false    218   ��       �          0    17079    roles 
   TABLE DATA           %   COPY public.roles (name) FROM stdin;
    public          postgres    false    219   �       �          0    17084    status 
   TABLE DATA           0   COPY public.status (idstatus, name) FROM stdin;
    public          postgres    false    220   J�       �          0    17087    tokens 
   TABLE DATA           8   COPY public.tokens (user_id, value, killed) FROM stdin;
    public          postgres    false    221   g�       �          0    17090    useraddress 
   TABLE DATA           �   COPY public.useraddress (id_useraddress, id_user, addrindex, addrcity, addrstreet, addrhouse, addrapartment, isdefault) FROM stdin;
    public          postgres    false    222    �       �          0    17093    userexchangelist 
   TABLE DATA           t   COPY public.userexchangelist (id_userexchangelist, idexchangelist, idofferlist, tracknumber, receiving) FROM stdin;
    public          postgres    false    223   =�       �          0    17096    userlist 
   TABLE DATA           T   COPY public.userlist (id_userlist, idwishlist, "TypeList", idofferlist) FROM stdin;
    public          postgres    false    224   Z�       �          0    17099    usermessage 
   TABLE DATA           �   COPY public.usermessage (id_usermessage, id_user, createatdate, createattime, textmessage, notes, idstatus, typeofmessage, updatedatdate, updatedattime) FROM stdin;
    public          postgres    false    225   w�       �          0    17102    users 
   TABLE DATA           �   COPY public.users (id, first_name, last_name, role, email, password, enabled, rating, created_at_time, created_at_date, avatar, username) FROM stdin;
    public          postgres    false    226   ��       �          0    17109    uservaluecategory 
   TABLE DATA           \   COPY public.uservaluecategory (id_uservaluecategory, id_userlist, "idCategory") FROM stdin;
    public          postgres    false    227   ;�       �          0    17112    verification_tokens 
   TABLE DATA           Y   COPY public.verification_tokens (id, token, user_id, expiry_date, confirmed) FROM stdin;
    public          postgres    false    228   X�       �          0    17115    wishlist 
   TABLE DATA           �   COPY public.wishlist (idwishlist, id_user, idstatus, id_useraddress, createatdate, createattime, updateatdate, updateattime, yearpublishing) FROM stdin;
    public          postgres    false    229   ل       �           2606    17119    author author_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (idauthor);
 <   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pkey;
       public            postgres    false    210            �           2606    17121    authors authors_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (name);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    211            �           2606    17123 "   bookliterature bookliterature_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.bookliterature
    ADD CONSTRAINT bookliterature_pkey PRIMARY KEY (idbookliterature);
 L   ALTER TABLE ONLY public.bookliterature DROP CONSTRAINT bookliterature_pkey;
       public            postgres    false    212            �           2606    17125    bookresponse bookresponse_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.bookresponse
    ADD CONSTRAINT bookresponse_pkey PRIMARY KEY (idbookresponse);
 H   ALTER TABLE ONLY public.bookresponse DROP CONSTRAINT bookresponse_pkey;
       public            postgres    false    213            �           2606    17127    books books_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    214            �           2606    17129    category category_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (idcategory);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    17131    exchangelist exchangelist_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.exchangelist
    ADD CONSTRAINT exchangelist_pkey PRIMARY KEY (idexchangelist);
 H   ALTER TABLE ONLY public.exchangelist DROP CONSTRAINT exchangelist_pkey;
       public            postgres    false    216            �           2606    17133 .   flyway_schema_history flyway_schema_history_pk 
   CONSTRAINT     x   ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);
 X   ALTER TABLE ONLY public.flyway_schema_history DROP CONSTRAINT flyway_schema_history_pk;
       public            postgres    false    217            �           2606    17135    offerlist offerlist_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.offerlist
    ADD CONSTRAINT offerlist_pkey PRIMARY KEY (idofferlist);
 B   ALTER TABLE ONLY public.offerlist DROP CONSTRAINT offerlist_pkey;
       public            postgres    false    218            �           2606    17137 *   verification_tokens pk_verification_tokens 
   CONSTRAINT     h   ALTER TABLE ONLY public.verification_tokens
    ADD CONSTRAINT pk_verification_tokens PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.verification_tokens DROP CONSTRAINT pk_verification_tokens;
       public            postgres    false    228            �           2606    17139    roles roles_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (name);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    219            �           2606    17141    status status_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (idstatus);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    220            �           2606    17143    tokens tokens_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (user_id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    221            �           2606    17145    tokens tokens_value_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_value_key UNIQUE (value);
 A   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_value_key;
       public            postgres    false    221            �           2606    17147    useraddress useraddress_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.useraddress
    ADD CONSTRAINT useraddress_pkey PRIMARY KEY (id_useraddress);
 F   ALTER TABLE ONLY public.useraddress DROP CONSTRAINT useraddress_pkey;
       public            postgres    false    222            �           2606    17149 &   userexchangelist userexchangelist_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.userexchangelist
    ADD CONSTRAINT userexchangelist_pkey PRIMARY KEY (id_userexchangelist);
 P   ALTER TABLE ONLY public.userexchangelist DROP CONSTRAINT userexchangelist_pkey;
       public            postgres    false    223            �           2606    17151    userlist userlist_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.userlist
    ADD CONSTRAINT userlist_pkey PRIMARY KEY (id_userlist);
 @   ALTER TABLE ONLY public.userlist DROP CONSTRAINT userlist_pkey;
       public            postgres    false    224            �           2606    17153    usermessage usermessage_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.usermessage
    ADD CONSTRAINT usermessage_pkey PRIMARY KEY (id_usermessage);
 F   ALTER TABLE ONLY public.usermessage DROP CONSTRAINT usermessage_pkey;
       public            postgres    false    225            �           2606    17155    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    226            �           2606    17157    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    226            �           2606    17159 (   uservaluecategory uservaluecategory_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.uservaluecategory
    ADD CONSTRAINT uservaluecategory_pkey PRIMARY KEY (id_uservaluecategory);
 R   ALTER TABLE ONLY public.uservaluecategory DROP CONSTRAINT uservaluecategory_pkey;
       public            postgres    false    227            �           2606    17161    wishlist wishlist_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (idwishlist);
 @   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_pkey;
       public            postgres    false    229            �           1259    17162    fki_fk_idCategory    INDEX     Y   CREATE INDEX "fki_fk_idCategory" ON public.uservaluecategory USING btree ("idCategory");
 '   DROP INDEX public."fki_fk_idCategory";
       public            postgres    false    227            �           1259    17163    fki_fk_idofferlist    INDEX     N   CREATE INDEX fki_fk_idofferlist ON public.userlist USING btree (idofferlist);
 &   DROP INDEX public.fki_fk_idofferlist;
       public            postgres    false    224            �           1259    17164    fki_fk_idparent    INDEX     H   CREATE INDEX fki_fk_idparent ON public.category USING btree (idparent);
 #   DROP INDEX public.fki_fk_idparent;
       public            postgres    false    215            �           1259    17165    flyway_schema_history_s_idx    INDEX     `   CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);
 /   DROP INDEX public.flyway_schema_history_s_idx;
       public            postgres    false    217            �           2606    17166    books fk_authors    FK CONSTRAINT     r   ALTER TABLE ONLY public.books
    ADD CONSTRAINT fk_authors FOREIGN KEY (author) REFERENCES public.authors(name);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT fk_authors;
       public          postgres    false    214    3256    211            �           2606    17171    uservaluecategory fk_idCategory    FK CONSTRAINT     �   ALTER TABLE ONLY public.uservaluecategory
    ADD CONSTRAINT "fk_idCategory" FOREIGN KEY ("idCategory") REFERENCES public.category(idcategory);
 K   ALTER TABLE ONLY public.uservaluecategory DROP CONSTRAINT "fk_idCategory";
       public          postgres    false    215    3264    227            �           2606    17176    bookresponse fk_id_user    FK CONSTRAINT     v   ALTER TABLE ONLY public.bookresponse
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 A   ALTER TABLE ONLY public.bookresponse DROP CONSTRAINT fk_id_user;
       public          postgres    false    213    3293    226            �           2606    17181    useraddress fk_id_user    FK CONSTRAINT     u   ALTER TABLE ONLY public.useraddress
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.useraddress DROP CONSTRAINT fk_id_user;
       public          postgres    false    222    226    3293            �           2606    17186    offerlist fk_id_user    FK CONSTRAINT     s   ALTER TABLE ONLY public.offerlist
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 >   ALTER TABLE ONLY public.offerlist DROP CONSTRAINT fk_id_user;
       public          postgres    false    3293    218    226            �           2606    17191    wishlist fk_id_user    FK CONSTRAINT     r   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 =   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT fk_id_user;
       public          postgres    false    226    229    3293            �           2606    17196    usermessage fk_id_user    FK CONSTRAINT     u   ALTER TABLE ONLY public.usermessage
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.usermessage DROP CONSTRAINT fk_id_user;
       public          postgres    false    226    3293    225            �           2606    17201    wishlist fk_id_useraddress    FK CONSTRAINT     �   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk_id_useraddress FOREIGN KEY (id_useraddress) REFERENCES public.useraddress(id_useraddress);
 D   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT fk_id_useraddress;
       public          postgres    false    229    3282    222            �           2606    17206     uservaluecategory fk_id_userlist    FK CONSTRAINT     �   ALTER TABLE ONLY public.uservaluecategory
    ADD CONSTRAINT fk_id_userlist FOREIGN KEY (id_userlist) REFERENCES public.userlist(id_userlist);
 J   ALTER TABLE ONLY public.uservaluecategory DROP CONSTRAINT fk_id_userlist;
       public          postgres    false    224    227    3287            �           2606    17211    bookliterature fk_idauthor    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookliterature
    ADD CONSTRAINT fk_idauthor FOREIGN KEY (idauthor) REFERENCES public.author(idauthor);
 D   ALTER TABLE ONLY public.bookliterature DROP CONSTRAINT fk_idauthor;
       public          postgres    false    210    212    3254            �           2606    17216     bookresponse fk_idbookliterature    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookresponse
    ADD CONSTRAINT fk_idbookliterature FOREIGN KEY (idbookliterature) REFERENCES public.bookliterature(idbookliterature);
 J   ALTER TABLE ONLY public.bookresponse DROP CONSTRAINT fk_idbookliterature;
       public          postgres    false    3258    213    212            �           2606    17221    offerlist fk_idbookliterature    FK CONSTRAINT     �   ALTER TABLE ONLY public.offerlist
    ADD CONSTRAINT fk_idbookliterature FOREIGN KEY (idbookliterature) REFERENCES public.bookliterature(idbookliterature);
 G   ALTER TABLE ONLY public.offerlist DROP CONSTRAINT fk_idbookliterature;
       public          postgres    false    218    212    3258            �           2606    17226 "   userexchangelist fk_idexchangelist    FK CONSTRAINT     �   ALTER TABLE ONLY public.userexchangelist
    ADD CONSTRAINT fk_idexchangelist FOREIGN KEY (idexchangelist) REFERENCES public.exchangelist(idexchangelist);
 L   ALTER TABLE ONLY public.userexchangelist DROP CONSTRAINT fk_idexchangelist;
       public          postgres    false    223    216    3267            �           2606    17231    userexchangelist fk_idofferlist    FK CONSTRAINT     �   ALTER TABLE ONLY public.userexchangelist
    ADD CONSTRAINT fk_idofferlist FOREIGN KEY (idofferlist) REFERENCES public.offerlist(idofferlist);
 I   ALTER TABLE ONLY public.userexchangelist DROP CONSTRAINT fk_idofferlist;
       public          postgres    false    218    223    3272            �           2606    17236    userlist fk_idofferlist    FK CONSTRAINT     �   ALTER TABLE ONLY public.userlist
    ADD CONSTRAINT fk_idofferlist FOREIGN KEY (idofferlist) REFERENCES public.offerlist(idofferlist);
 A   ALTER TABLE ONLY public.userlist DROP CONSTRAINT fk_idofferlist;
       public          postgres    false    218    3272    224            �           2606    17241    exchangelist fk_idofferlist1    FK CONSTRAINT     �   ALTER TABLE ONLY public.exchangelist
    ADD CONSTRAINT fk_idofferlist1 FOREIGN KEY (idofferlist1) REFERENCES public.offerlist(idofferlist);
 F   ALTER TABLE ONLY public.exchangelist DROP CONSTRAINT fk_idofferlist1;
       public          postgres    false    3272    216    218            �           2606    17246    exchangelist fk_idofferlist2    FK CONSTRAINT     �   ALTER TABLE ONLY public.exchangelist
    ADD CONSTRAINT fk_idofferlist2 FOREIGN KEY (idofferlist2) REFERENCES public.offerlist(idofferlist);
 F   ALTER TABLE ONLY public.exchangelist DROP CONSTRAINT fk_idofferlist2;
       public          postgres    false    216    218    3272            �           2606    17251    category fk_idparent    FK CONSTRAINT        ALTER TABLE ONLY public.category
    ADD CONSTRAINT fk_idparent FOREIGN KEY (idparent) REFERENCES public.category(idcategory);
 >   ALTER TABLE ONLY public.category DROP CONSTRAINT fk_idparent;
       public          postgres    false    215    215    3264            �           2606    17256    offerlist fk_idstatus    FK CONSTRAINT     |   ALTER TABLE ONLY public.offerlist
    ADD CONSTRAINT fk_idstatus FOREIGN KEY (idstatus) REFERENCES public.status(idstatus);
 ?   ALTER TABLE ONLY public.offerlist DROP CONSTRAINT fk_idstatus;
       public          postgres    false    220    218    3276            �           2606    17261    wishlist fk_idstatus    FK CONSTRAINT     {   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk_idstatus FOREIGN KEY (idstatus) REFERENCES public.status(idstatus);
 >   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT fk_idstatus;
       public          postgres    false    3276    220    229            �           2606    17266    usermessage fk_idstatus    FK CONSTRAINT     ~   ALTER TABLE ONLY public.usermessage
    ADD CONSTRAINT fk_idstatus FOREIGN KEY (idstatus) REFERENCES public.status(idstatus);
 A   ALTER TABLE ONLY public.usermessage DROP CONSTRAINT fk_idstatus;
       public          postgres    false    220    225    3276            �           2606    17271    userlist fk_idwishlist    FK CONSTRAINT     �   ALTER TABLE ONLY public.userlist
    ADD CONSTRAINT fk_idwishlist FOREIGN KEY (idwishlist) REFERENCES public.wishlist(idwishlist);
 @   ALTER TABLE ONLY public.userlist DROP CONSTRAINT fk_idwishlist;
       public          postgres    false    229    224    3300            �           2606    17276    exchangelist fk_idwishlist1    FK CONSTRAINT     �   ALTER TABLE ONLY public.exchangelist
    ADD CONSTRAINT fk_idwishlist1 FOREIGN KEY (idwishlist1) REFERENCES public.wishlist(idwishlist);
 E   ALTER TABLE ONLY public.exchangelist DROP CONSTRAINT fk_idwishlist1;
       public          postgres    false    216    3300    229            �           2606    17281    exchangelist fk_idwishlist2    FK CONSTRAINT     �   ALTER TABLE ONLY public.exchangelist
    ADD CONSTRAINT fk_idwishlist2 FOREIGN KEY (idwishlist2) REFERENCES public.wishlist(idwishlist);
 E   ALTER TABLE ONLY public.exchangelist DROP CONSTRAINT fk_idwishlist2;
       public          postgres    false    3300    229    216            �           2606    17286    users fk_roles    FK CONSTRAINT     l   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_roles FOREIGN KEY (role) REFERENCES public.roles(name);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_roles;
       public          postgres    false    226    219    3274            �           2606    17291 2   verification_tokens fk_verification_tokens_on_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.verification_tokens
    ADD CONSTRAINT fk_verification_tokens_on_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.verification_tokens DROP CONSTRAINT fk_verification_tokens_on_user;
       public          postgres    false    3293    226    228            �           2606    17296    tokens tokens_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_user_id_fkey;
       public          postgres    false    3293    221    226            �   /  x�mTI�E]g��.�Q?���&�K��L��@x��l&�-��V��._!�F�H,X������M?�uʹ�Ȋ��>%��h
\Z�br.v������~<��e|9.��x�=��4��S��C"e�#�YQ�b�J��+�X�2����~?m��� O�5*��L��g���4r�*S2��Z�����b\��\�������&Q��m딢�dMW.�K��n��=�Ks�~��|Z;%�8R>T�ձ�J>�Jn�w�����O_�y߁��ʮ�칐�A7�!������j��UX�@˿�x��ڬ+�kGO�^"E_;u�t�ԓ�y������wo�~�y���E�$U�����J�V�g��f\w���~5ށ�i�Ou�F*@�}�S��P�������~��}���_������0G���uc�љbЕt�Y�̹������/��=�w h��L�$01�o�ɻjĘ�e��3�_����p�lN6�ɠ��KSB��F��(�?�Z�ʶ:]��:���o��a��Q���A� 3�F��ʜ�	Z�m{o�=O]�M\ W�p@��<J��lV�������{�^b���J\ ����͓j�`}offa���r��S�~q�=̋@��ċљj�ЍBP�ѓc5F��nꞽ�mZ5>�!{�"s�$��\Z)� �Xp�>
(?;�8.u��op��<�_��42)��9�H���S.ҫ��` ���|/�� 8��t\ |�R���Ӟ����d^�	`��A��G�|VM����9�+R�E����һ�W�>��'��|���_�- �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   "   x�v�rt������wqr������ [      �      x������ � �      �   �   x����   �s��ӎM�p��(�uԉik����û<�B�������e�
�@���h�.Y/S��}%�G��z����zZ'���k0�QΪ�`�O�����M3��I�hWF��,ӳΣ�ů�.���*}:��x� �-a�+���H���t�ݱ,�\�8�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�=���  �3<�WQDo��u�\��5/���L�z�n}�@�	%Ԅ<&�IBR�+�x��_���e��nA��xE��^�h�Z�z��E���l1=��v)��r2u�{W~��ᴈ��n��GJ��"�ë��������{/^      �      x������ � �      �   q   x���� гV��A�L-{�
�����<�OԵ%aaP�PⳅUXbf9�r;�V�M�m�ĭ�:mMc���ԃ�����N��b�[0������#�/3-���j�2�"{      �      x������ � �     