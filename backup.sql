PGDMP     *    $    	            {            book    14.2    14.2 W    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    28675    book    DATABASE     a   CREATE DATABASE book WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE book;
                postgres    false                        3079    28685 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    28745    author    TABLE     �   CREATE TABLE public.author (
    idauthor uuid NOT NULL,
    lastname character varying(20) NOT NULL,
    firstname character varying(20) NOT NULL
);
    DROP TABLE public.author;
       public         heap    postgres    false            �            1259    28750    bookliterature    TABLE     �   CREATE TABLE public.bookliterature (
    idbookliterature uuid NOT NULL,
    idauthor uuid NOT NULL,
    bookname character varying(50) NOT NULL,
    note character varying(50) NOT NULL
);
 "   DROP TABLE public.bookliterature;
       public         heap    postgres    false            �            1259    28760    bookresponse    TABLE     �   CREATE TABLE public.bookresponse (
    idbookresponse uuid NOT NULL,
    idbookliterature uuid,
    id_user uuid,
    createdat date,
    response character varying(500),
    note character varying(50)
);
     DROP TABLE public.bookresponse;
       public         heap    postgres    false            �            1259    28807    category    TABLE     �   CREATE TABLE public.category (
    idcategory uuid NOT NULL,
    categoryname character varying(25),
    multiselect boolean
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    28782    exchangelist    TABLE     �   CREATE TABLE public.exchangelist (
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
       public         heap    postgres    false            �            1259    28676    flyway_schema_history    TABLE     �  CREATE TABLE public.flyway_schema_history (
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
       public         heap    postgres    false            �            1259    28767 	   offerlist    TABLE     :  CREATE TABLE public.offerlist (
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
       public         heap    postgres    false            �            1259    28696    roles    TABLE     C   CREATE TABLE public.roles (
    name character varying NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    28802    status    TABLE     [   CREATE TABLE public.status (
    idstatus uuid NOT NULL,
    name character varying(10)
);
    DROP TABLE public.status;
       public         heap    postgres    false            �            1259    28718    tokens    TABLE     y   CREATE TABLE public.tokens (
    user_id uuid NOT NULL,
    value character varying(255) NOT NULL,
    killed boolean
);
    DROP TABLE public.tokens;
       public         heap    postgres    false            �            1259    28755    useraddress    TABLE     )  CREATE TABLE public.useraddress (
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
       public         heap    postgres    false            �            1259    28787    userexchangelist    TABLE     �   CREATE TABLE public.userexchangelist (
    id_userexchangelist uuid NOT NULL,
    idexchangelist uuid,
    idofferlist uuid,
    tracknumber character varying(20),
    receiving boolean
);
 $   DROP TABLE public.userexchangelist;
       public         heap    postgres    false            �            1259    28792    userlist    TABLE     k   CREATE TABLE public.userlist (
    id_userlist uuid NOT NULL,
    typelist integer,
    idwishlist uuid
);
    DROP TABLE public.userlist;
       public         heap    postgres    false            �            1259    28777    usermessage    TABLE       CREATE TABLE public.usermessage (
    id_usermessage uuid NOT NULL,
    id_user uuid,
    createatdate date,
    createattime time without time zone,
    textmessage character varying(250),
    notes character varying(150),
    idstatus uuid,
    typeofmessage integer
);
    DROP TABLE public.usermessage;
       public         heap    postgres    false            �            1259    28703    users    TABLE     �  CREATE TABLE public.users (
    id uuid NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    role character varying,
    email character varying(25) NOT NULL,
    password character varying(120) NOT NULL,
    username character varying(120),
    rating integer,
    created_at_time time without time zone,
    created_at_date date,
    avatar bytea,
    enabled boolean DEFAULT true
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    28797    uservaluecategory    TABLE     }   CREATE TABLE public.uservaluecategory (
    id_uservaluecategory uuid NOT NULL,
    id_userlist uuid,
    idcategory uuid
);
 %   DROP TABLE public.uservaluecategory;
       public         heap    postgres    false            �            1259    28735    verification_tokens    TABLE     �   CREATE TABLE public.verification_tokens (
    id uuid NOT NULL,
    token character varying(255),
    user_id uuid NOT NULL,
    expiry_date timestamp without time zone,
    confirmed boolean NOT NULL
);
 '   DROP TABLE public.verification_tokens;
       public         heap    postgres    false            �            1259    28772    wishlist    TABLE     �   CREATE TABLE public.wishlist (
    idwishlist uuid NOT NULL,
    id_user uuid,
    idstatus uuid,
    id_useraddress uuid,
    createatdate date,
    createattime time without time zone,
    updateatdate date,
    updateattime time without time zone
);
    DROP TABLE public.wishlist;
       public         heap    postgres    false            }          0    28745    author 
   TABLE DATA           ?   COPY public.author (idauthor, lastname, firstname) FROM stdin;
    public          postgres    false    215   �o       ~          0    28750    bookliterature 
   TABLE DATA           T   COPY public.bookliterature (idbookliterature, idauthor, bookname, note) FROM stdin;
    public          postgres    false    216   �o       �          0    28760    bookresponse 
   TABLE DATA           l   COPY public.bookresponse (idbookresponse, idbookliterature, id_user, createdat, response, note) FROM stdin;
    public          postgres    false    218   �o       �          0    28807    category 
   TABLE DATA           I   COPY public.category (idcategory, categoryname, multiselect) FROM stdin;
    public          postgres    false    227   p       �          0    28782    exchangelist 
   TABLE DATA           �   COPY public.exchangelist (idexchangelist, idofferlist1, idwishlist1, idofferlist2, idwishlist2, createatdate, createattime, isboth) FROM stdin;
    public          postgres    false    222   p       x          0    28676    flyway_schema_history 
   TABLE DATA           �   COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
    public          postgres    false    210   ;p       �          0    28767 	   offerlist 
   TABLE DATA           �   COPY public.offerlist (idofferlist, idbookliterature, id_user, idstatus, ibsn, yearpublishing, createatdate, createattime, updateatdate, updateattime) FROM stdin;
    public          postgres    false    219   Xp       y          0    28696    roles 
   TABLE DATA           %   COPY public.roles (name) FROM stdin;
    public          postgres    false    211   up       �          0    28802    status 
   TABLE DATA           0   COPY public.status (idstatus, name) FROM stdin;
    public          postgres    false    226   �p       {          0    28718    tokens 
   TABLE DATA           8   COPY public.tokens (user_id, value, killed) FROM stdin;
    public          postgres    false    213   �p                 0    28755    useraddress 
   TABLE DATA           �   COPY public.useraddress (id_useraddress, id_user, addrindex, addrcity, addrstreet, addrhouse, addrapartment, isdefault) FROM stdin;
    public          postgres    false    217   0y       �          0    28787    userexchangelist 
   TABLE DATA           t   COPY public.userexchangelist (id_userexchangelist, idexchangelist, idofferlist, tracknumber, receiving) FROM stdin;
    public          postgres    false    223   z       �          0    28792    userlist 
   TABLE DATA           E   COPY public.userlist (id_userlist, typelist, idwishlist) FROM stdin;
    public          postgres    false    224   7z       �          0    28777    usermessage 
   TABLE DATA           �   COPY public.usermessage (id_usermessage, id_user, createatdate, createattime, textmessage, notes, idstatus, typeofmessage) FROM stdin;
    public          postgres    false    221   Tz       z          0    28703    users 
   TABLE DATA           �   COPY public.users (id, first_name, last_name, role, email, password, username, rating, created_at_time, created_at_date, avatar, enabled) FROM stdin;
    public          postgres    false    212   qz       �          0    28797    uservaluecategory 
   TABLE DATA           Z   COPY public.uservaluecategory (id_uservaluecategory, id_userlist, idcategory) FROM stdin;
    public          postgres    false    225   #�       |          0    28735    verification_tokens 
   TABLE DATA           Y   COPY public.verification_tokens (id, token, user_id, expiry_date, confirmed) FROM stdin;
    public          postgres    false    214   @�       �          0    28772    wishlist 
   TABLE DATA           �   COPY public.wishlist (idwishlist, id_user, idstatus, id_useraddress, createatdate, createattime, updateatdate, updateattime) FROM stdin;
    public          postgres    false    220   �       �           2606    28749    author author_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (idauthor);
 <   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pkey;
       public            postgres    false    215            �           2606    28754 "   bookliterature bookliterature_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.bookliterature
    ADD CONSTRAINT bookliterature_pkey PRIMARY KEY (idbookliterature);
 L   ALTER TABLE ONLY public.bookliterature DROP CONSTRAINT bookliterature_pkey;
       public            postgres    false    216            �           2606    28766    bookresponse bookresponse_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.bookresponse
    ADD CONSTRAINT bookresponse_pkey PRIMARY KEY (idbookresponse);
 H   ALTER TABLE ONLY public.bookresponse DROP CONSTRAINT bookresponse_pkey;
       public            postgres    false    218            �           2606    28811    category category_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (idcategory);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    227            �           2606    28786    exchangelist exchangelist_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.exchangelist
    ADD CONSTRAINT exchangelist_pkey PRIMARY KEY (idexchangelist);
 H   ALTER TABLE ONLY public.exchangelist DROP CONSTRAINT exchangelist_pkey;
       public            postgres    false    222            �           2606    28683 .   flyway_schema_history flyway_schema_history_pk 
   CONSTRAINT     x   ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);
 X   ALTER TABLE ONLY public.flyway_schema_history DROP CONSTRAINT flyway_schema_history_pk;
       public            postgres    false    210            �           2606    28771    offerlist offerlist_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.offerlist
    ADD CONSTRAINT offerlist_pkey PRIMARY KEY (idofferlist);
 B   ALTER TABLE ONLY public.offerlist DROP CONSTRAINT offerlist_pkey;
       public            postgres    false    219            �           2606    28739 *   verification_tokens pk_verification_tokens 
   CONSTRAINT     h   ALTER TABLE ONLY public.verification_tokens
    ADD CONSTRAINT pk_verification_tokens PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.verification_tokens DROP CONSTRAINT pk_verification_tokens;
       public            postgres    false    214            �           2606    28702    roles roles_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (name);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    211            �           2606    28806    status status_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (idstatus);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public            postgres    false    226            �           2606    28722    tokens tokens_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (user_id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    213            �           2606    28724    tokens tokens_value_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_value_key UNIQUE (value);
 A   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_value_key;
       public            postgres    false    213            �           2606    28759    useraddress useraddress_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.useraddress
    ADD CONSTRAINT useraddress_pkey PRIMARY KEY (id_useraddress);
 F   ALTER TABLE ONLY public.useraddress DROP CONSTRAINT useraddress_pkey;
       public            postgres    false    217            �           2606    28791 &   userexchangelist userexchangelist_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.userexchangelist
    ADD CONSTRAINT userexchangelist_pkey PRIMARY KEY (id_userexchangelist);
 P   ALTER TABLE ONLY public.userexchangelist DROP CONSTRAINT userexchangelist_pkey;
       public            postgres    false    223            �           2606    28796    userlist userlist_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.userlist
    ADD CONSTRAINT userlist_pkey PRIMARY KEY (id_userlist);
 @   ALTER TABLE ONLY public.userlist DROP CONSTRAINT userlist_pkey;
       public            postgres    false    224            �           2606    28781    usermessage usermessage_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.usermessage
    ADD CONSTRAINT usermessage_pkey PRIMARY KEY (id_usermessage);
 F   ALTER TABLE ONLY public.usermessage DROP CONSTRAINT usermessage_pkey;
       public            postgres    false    221            �           2606    28716    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    212            �           2606    28709    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    212            �           2606    28801 (   uservaluecategory uservaluecategory_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.uservaluecategory
    ADD CONSTRAINT uservaluecategory_pkey PRIMARY KEY (id_uservaluecategory);
 R   ALTER TABLE ONLY public.uservaluecategory DROP CONSTRAINT uservaluecategory_pkey;
       public            postgres    false    225            �           2606    28776    wishlist wishlist_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (idwishlist);
 @   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_pkey;
       public            postgres    false    220            �           1259    28684    flyway_schema_history_s_idx    INDEX     `   CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);
 /   DROP INDEX public.flyway_schema_history_s_idx;
       public            postgres    false    210            �           2606    28822    bookresponse fk_id_user    FK CONSTRAINT     v   ALTER TABLE ONLY public.bookresponse
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 A   ALTER TABLE ONLY public.bookresponse DROP CONSTRAINT fk_id_user;
       public          postgres    false    212    218    3252            �           2606    28827    useraddress fk_id_user    FK CONSTRAINT     u   ALTER TABLE ONLY public.useraddress
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.useraddress DROP CONSTRAINT fk_id_user;
       public          postgres    false    217    212    3252            �           2606    28837    offerlist fk_id_user    FK CONSTRAINT     s   ALTER TABLE ONLY public.offerlist
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 >   ALTER TABLE ONLY public.offerlist DROP CONSTRAINT fk_id_user;
       public          postgres    false    3252    219    212            �           2606    28847    wishlist fk_id_user    FK CONSTRAINT     r   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 =   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT fk_id_user;
       public          postgres    false    212    220    3252            �           2606    28862    usermessage fk_id_user    FK CONSTRAINT     u   ALTER TABLE ONLY public.usermessage
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.usermessage DROP CONSTRAINT fk_id_user;
       public          postgres    false    212    3252    221            �           2606    28857    wishlist fk_id_useraddress    FK CONSTRAINT     �   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk_id_useraddress FOREIGN KEY (id_useraddress) REFERENCES public.useraddress(id_useraddress);
 D   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT fk_id_useraddress;
       public          postgres    false    220    3264    217            �           2606    28907     uservaluecategory fk_id_userlist    FK CONSTRAINT     �   ALTER TABLE ONLY public.uservaluecategory
    ADD CONSTRAINT fk_id_userlist FOREIGN KEY (id_userlist) REFERENCES public.userlist(id_userlist);
 J   ALTER TABLE ONLY public.uservaluecategory DROP CONSTRAINT fk_id_userlist;
       public          postgres    false    225    224    3278            �           2606    28812    bookliterature fk_idauthor    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookliterature
    ADD CONSTRAINT fk_idauthor FOREIGN KEY (idauthor) REFERENCES public.author(idauthor);
 D   ALTER TABLE ONLY public.bookliterature DROP CONSTRAINT fk_idauthor;
       public          postgres    false    215    216    3260            �           2606    28817     bookresponse fk_idbookliterature    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookresponse
    ADD CONSTRAINT fk_idbookliterature FOREIGN KEY (idbookliterature) REFERENCES public.bookliterature(idbookliterature);
 J   ALTER TABLE ONLY public.bookresponse DROP CONSTRAINT fk_idbookliterature;
       public          postgres    false    218    3262    216            �           2606    28832    offerlist fk_idbookliterature    FK CONSTRAINT     �   ALTER TABLE ONLY public.offerlist
    ADD CONSTRAINT fk_idbookliterature FOREIGN KEY (idbookliterature) REFERENCES public.bookliterature(idbookliterature);
 G   ALTER TABLE ONLY public.offerlist DROP CONSTRAINT fk_idbookliterature;
       public          postgres    false    3262    219    216            �           2606    28912    uservaluecategory fk_idcategory    FK CONSTRAINT     �   ALTER TABLE ONLY public.uservaluecategory
    ADD CONSTRAINT fk_idcategory FOREIGN KEY (idcategory) REFERENCES public.category(idcategory);
 I   ALTER TABLE ONLY public.uservaluecategory DROP CONSTRAINT fk_idcategory;
       public          postgres    false    227    3284    225            �           2606    28892 "   userexchangelist fk_idexchangelist    FK CONSTRAINT     �   ALTER TABLE ONLY public.userexchangelist
    ADD CONSTRAINT fk_idexchangelist FOREIGN KEY (idexchangelist) REFERENCES public.exchangelist(idexchangelist);
 L   ALTER TABLE ONLY public.userexchangelist DROP CONSTRAINT fk_idexchangelist;
       public          postgres    false    223    3274    222            �           2606    28897    userexchangelist fk_idofferlist    FK CONSTRAINT     �   ALTER TABLE ONLY public.userexchangelist
    ADD CONSTRAINT fk_idofferlist FOREIGN KEY (idofferlist) REFERENCES public.offerlist(idofferlist);
 I   ALTER TABLE ONLY public.userexchangelist DROP CONSTRAINT fk_idofferlist;
       public          postgres    false    3268    219    223            �           2606    28872    exchangelist fk_idofferlist1    FK CONSTRAINT     �   ALTER TABLE ONLY public.exchangelist
    ADD CONSTRAINT fk_idofferlist1 FOREIGN KEY (idofferlist1) REFERENCES public.offerlist(idofferlist);
 F   ALTER TABLE ONLY public.exchangelist DROP CONSTRAINT fk_idofferlist1;
       public          postgres    false    219    222    3268            �           2606    28877    exchangelist fk_idofferlist2    FK CONSTRAINT     �   ALTER TABLE ONLY public.exchangelist
    ADD CONSTRAINT fk_idofferlist2 FOREIGN KEY (idofferlist2) REFERENCES public.offerlist(idofferlist);
 F   ALTER TABLE ONLY public.exchangelist DROP CONSTRAINT fk_idofferlist2;
       public          postgres    false    222    219    3268            �           2606    28842    offerlist fk_idstatus    FK CONSTRAINT     |   ALTER TABLE ONLY public.offerlist
    ADD CONSTRAINT fk_idstatus FOREIGN KEY (idstatus) REFERENCES public.status(idstatus);
 ?   ALTER TABLE ONLY public.offerlist DROP CONSTRAINT fk_idstatus;
       public          postgres    false    226    3282    219            �           2606    28852    wishlist fk_idstatus    FK CONSTRAINT     {   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk_idstatus FOREIGN KEY (idstatus) REFERENCES public.status(idstatus);
 >   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT fk_idstatus;
       public          postgres    false    226    3282    220            �           2606    28867    usermessage fk_idstatus    FK CONSTRAINT     ~   ALTER TABLE ONLY public.usermessage
    ADD CONSTRAINT fk_idstatus FOREIGN KEY (idstatus) REFERENCES public.status(idstatus);
 A   ALTER TABLE ONLY public.usermessage DROP CONSTRAINT fk_idstatus;
       public          postgres    false    3282    226    221            �           2606    28902    userlist fk_idwishlist    FK CONSTRAINT     �   ALTER TABLE ONLY public.userlist
    ADD CONSTRAINT fk_idwishlist FOREIGN KEY (idwishlist) REFERENCES public.wishlist(idwishlist);
 @   ALTER TABLE ONLY public.userlist DROP CONSTRAINT fk_idwishlist;
       public          postgres    false    224    3270    220            �           2606    28882    exchangelist fk_idwishlist1    FK CONSTRAINT     �   ALTER TABLE ONLY public.exchangelist
    ADD CONSTRAINT fk_idwishlist1 FOREIGN KEY (idwishlist1) REFERENCES public.wishlist(idwishlist);
 E   ALTER TABLE ONLY public.exchangelist DROP CONSTRAINT fk_idwishlist1;
       public          postgres    false    222    3270    220            �           2606    28887    exchangelist fk_idwishlist2    FK CONSTRAINT     �   ALTER TABLE ONLY public.exchangelist
    ADD CONSTRAINT fk_idwishlist2 FOREIGN KEY (idwishlist2) REFERENCES public.wishlist(idwishlist);
 E   ALTER TABLE ONLY public.exchangelist DROP CONSTRAINT fk_idwishlist2;
       public          postgres    false    222    3270    220            �           2606    28710    users fk_roles    FK CONSTRAINT     l   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_roles FOREIGN KEY (role) REFERENCES public.roles(name);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_roles;
       public          postgres    false    212    3248    211            �           2606    28740 2   verification_tokens fk_verification_tokens_on_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.verification_tokens
    ADD CONSTRAINT fk_verification_tokens_on_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.verification_tokens DROP CONSTRAINT fk_verification_tokens_on_user;
       public          postgres    false    214    3252    212            �           2606    28730    tokens tokens_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_user_id_fkey;
       public          postgres    false    212    3252    213            }      x������ � �      ~      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      x      x������ � �      �      x������ � �      y   "   x�st����
v���wqr������ Z�      �      x������ � �      {   \  x���Ko�H�ם�RA=I��6e���"dSf1�(�1�x`��~N�N�B�*�D/�=�\k_'�i9���DJ��V�#���lD��h/ۃ_������j��M�㳩)6�l��h�]?�H�߈?����-��Syd�]o&���Me������������?��1�W�N'��;es����"�Mdr'��U��0#��?�o�E1k%�m"�HHհ�$2�*j[�&������b6����	��fz}s��\>Si�׋�ˡ�_�,��ݿ�~�ww�]yi��&�*Rq���'�I*�z�+����ﻝ^/eZs�������z�;��ן���x����s�gۻ�{n���F1^{��&� RU	IoH�d��:��xq���t�S������\���ￔ��|'��^���d���:n��W����|̷��f5S$��ȸ���'-�Uk�+�.�n{S��}��M�^Q��͍���`����5�9�/ts����ł׊�h�[��FYyN��WMG�6��}�>9���b��̟��Rh��ʹ=�k'����s����x7�O^-���V�V5�oͰoQ\ˮj��B.�W�{���\�`�'���7Ѓ���;��i��1[l&��V�Wޯ�p�����b�1��e5����J�uۊ�V���E=��0ռ�n��c=@�w�}��3d��`�Cos�l_��N7y�?Kt�%QG@�UJC�[E�m;��gY:����G���2�����]�q��_I3>e?�_������~���0Z�#PrψN"	�H�RǬ[ԃ釃�����e����+��+��3�C_��񴆧��w�������O�t���"M����b$�wǪҴeq���0��A>�]?�� �}m^�;f�w\��N�e�nfx7��|��;T:�|��y+K:%���u�/������C���/���<.�?�3��v�r�0�1�W�,���U�#/D�c%OX�0�q�z�>���h_^��䊍��=�#�lܝC��/� ޾9f����<�?���|s����"���o5P������$N:�,�1� l�X��`r{��۴}���ܴ����0��0�{[��O�ƒ2�uEڎb���S^Q�}Rwu��`����?���!/L�ys���^���}f�F:^�n���9������'����H#���R��������~�Żv��7���������{��s�s��g�Y��փ�����u%�4Z��]M�`�T�u*��M���
d��o��T9��=��ү�K�x�ܾ	���w2A���b�4��r����#/JE�Q,cR�Kz`Ȥs�?0�#rM^�l���N���q�06p�s�������7��0R�t��O�:�uŘ������pK<�>h��k�D�`�_�-4�������E�N~�A릕(��yÉ�����TwBC.�[V<��!C^X��O�_��C�ϔ���#X��O�����_�b���}�H|ãH�J�C�ED�0	݁��H9��o�)[oOxgl��=��]���*h���}r�=Ë[%���e���ʆ6��u�-'�o���B��/ꁖ���`������;\�ܨp_��Pܤ����;�>���x�C>��F��B�.^!<fLjUS*qu�/�ÀN����'���p'�F��l�~��f.G�3��{�7?���L�� ��euCP�k��������j��-�}�2���xȷ�;��}Dwxm�w|�W��_y��F|慪��UH	�&�o����gMG����b���&M������O��-���&���hps�4x��l�?CŻ����~}�HɱeT`�d��}!�$"�YGK��=Z~>�N~^2�.���꿸/(fo��;���|�彥_���/`�F��qD�ߤ�H�F8�a̍����{�e�
���~�\A��\#��=GBfm���7�s�&x��x���/�\��[c����	"G'���&b��-�ح�L�l���A�2�G�����Dw���0�z`��u͑�Y����	g��<�E=��Л�w
�/�����BZI�?M���8����~F��}�ۿ�����c�9         �   x����q1�^��$Ԅ+�	���n;��v�����cw�*�F��B �ʵ2'NI��xݐ2����yΟy^�����|^���Z��wVh�����y���v�Nz�
�µ�����@̖̠I������p.�䛫�Q��Ct�c�d_�ʈXt��
��c"`Y��a8a�����6�1�ڀ�8Y�p"N���>����z���      �      x������ � �      �      x������ � �      �      x������ � �      z   �	  x���Ɏ�������d���Jj��<��*VQ3%Q�Di� �e�d��$gx��o�j��P�m@ ���s����H
b,� ��#�HORy�
`E�����o��������?����ۗ�?~����������e<,^�I %}:�����a��5R_C���p��CWS����R�� �@dlu�C~ �w�f'���TlVQ\\�|�y~�� dZ<b����SZO�(��Z�k֧��� H?=λ��׌W�>�~O�g�.���r0���qbf5"h5�kv޷w�U���9F�2�)O!`="���ʳZJE9TV�/1n��J����>��׌�}�E�8/�S�q�����҉F��8�@�o��y���Շ�M\�12�Zk�񬈰G����x�!�d��_����c��y��r:V���ޛ){��Q���c4���>T��]_�5th�Mv�#��0��c!�<�󴎐gR�K*���(>R�1�w��W�pH-��uB`�:���?�q�^	���N����":�FT�>��LZZC=�4����)q�|��ڌNx^AM6Q�T�FT�m\>�{X�=�ƌ���.�}q]_f�ԯŧf�� �"�=K��k��=�I����v6{)'{�=\�:F{J $y��d#8���E��cT1�J��[Ǉc����dX��R�vm��Wv�o��8v�򬅡G��QJk�)��}���}* �8������p�m�Fl�h��%�%���d��[��v�Y�"���		�"�"�;äT�vGm	c����(�&\A����*�+�%/�z��&�}��q;͚%=���$|�6Y�Pv���)�Ta�J�5s�HCO
F��Eh  �����w��~���"�i��;?IF��JrP�`;xo%�<�������U�$/a)YV������6�V��`&�g�snQ�	�)8�Jy(?Z���
�D0?��dX:�7�|9���|�V��󅜛�Cob�dQ^�^��צ�=�O���ZI�ʧ1@n7:ŞtVi'�_^��Y��S�����>X�Qnu�I0@�`��������v���d��S�(�_[����=Ǌ�����@�s���Rs-h�sҏ���R
E~,m��Tݬ�t���A���m
��X)�,[5��m6޸��yO'h��#1�N��#+'��aRH<B����;��!%�O�y�:�U6�*����k��kҾ�5�fp�֡:�q�L�[�n6���r��ԳpuUy �!�FO�0
���v_�w�����_���t��d�8,���Mk�ˢ��Gx�o��>	ءR���L��+��<C�swG�)�*,�z���g9�l�J�k"�O7P�i1i��1-�괋w�r���Q����Z�F��}��Gtʱ�Ð	�ȥ#"���8��0�� Ȋg�h�79���{��f����#�z�};-���p%��\U|�Hn%"�hT��,_B�1�P��A��ψi��x����D>����R�p���]�v��A�;v=���Z_��������3���r���������J����]6B�����q*��q
����~.���<a��K'�Z�&��nQT��1�O\fZ�(��/�K��A{9.��.Z(�j��ąGϥ��ܹ��ZzTE�H9s'��8޺ �����j��X�Y��w���Ge�=���N��AU:A���n�LTӶ�&c�bLz.��;BB�I�-#�B����RF_���X�q5�fMt~�U�bʷ�ά�J���U��YtX�l��y�(W8<�_�y�$��}uK.�o�h�D�Xr�]����������_��Q�������'�np�u^�4h�V}T,_���,F����*��y\r���qf��2�5���t�1֞�^HC ��*"�_��䠾�u1dKO�H���9�Q��g��`Q�_�8���Y�@M��6��V�^Wm��j �'�l^&��^,���[�"7�04����;�,�4z�~y�=o߿���~?ё\�	��I�CM��f�͹Z���/z��b=�կz�'-;5[n�'��seȀy�j�m�ܭ����45�i�0$Δ�Ϯ�]Lج��%�T���c��(���|��vv�J��k$��#��W���� �	�����݂f�
��Kx�'�q��ᯃY�����H��Y9�֮���*�2��q����>_>w@[�,g��0�ȶ�ݮ���D|�/����4�\���*�R#(���굜b��6��8��U��t6�q�N{��f�|d�a��:A8ٺ&ܦsWr~�/����!�\Xx�x$�0GY6m�-�~���v3N�K�v�v�2
@�v�:�e�\[yV�2Dβ#mt�ܫ�ܑ�b��0kv�B�'�=
�t���iK���r��C�5(�˳�aW;�m��tЫG�"����7�W_}�o�}��      �      x������ � �      |   �  x�eVI�1<g�b>��$�����Z^��cB}�k�(#���hS7*�4����Z6����>��&IYj��C<K��E�j�l��~�nJ�Y���!�IV��Z�e�̧�B�T����W�%�����O�$��({���NR���:�r��嘾����ã����ن��@���gns��:��[R��:��ߪo�O���w]�|�@����)BK��}���D�'M �Vؚ���л�'��=|$�l�YL+:�k��Ջ{�+k�����/�Gj�#�R�ST:F��~�,D���.����^ҋ�h�ʘieͰs�����T/������G�^�ɨ��F����Q& YQ�W9��uśGJ.`ZkԵ��Y�O��X�wG�x�]v�۲3�����b��䠒7p���4W���Q� ������t9�wՔb2��Ѹ����n���#�紱J�P 3e�"���?�kGwj�1p�;(#u�VG���7���+�c여T#�G�^'Pl�]���!��˓3���K $f�����1�z@�HP��T�@)Ph,�h7��#�����	� �tC�A��~�$�V�L��g��#����+-�OH�E�ƭ�#�DN�;��0�\B��#�4x]i���W����>�[q�s�H���H���HP����2D	�B֨l��} L�OkjC OA9��e�ɳwѽe�����G� D,d��%�DC���1�z�ε�㋏A� zo��&4�{n����x�y_���+|$81d��΀���=�7�x�~�/ҕ�g�Ф��k	Go�5�q�<�k�A	��e�Y+��GG���5L`�*�]�~9���Cǲ;��刵kh��v�����:ak�9�C
����������Ja�V�B���������Ra�p�{�O����V�_��#�@:�W\��#J�bם� ��q�7*���� �2�$�t�E�@v�O���`��
�bV��A���������ED�I��L.�^�e�k�öu�7+���[�+�	@fE�:��j}>gS��	��� �
\n�(8_�_@��8�@F݊��	zpFB��<l��y�t��@f���x�lU��c�l���u�gI�@N?WyHo������\�^d�	e1:��xE�Zn<X�?�?~�kެ��D��?�eiXp�f��[�\wڗ���KV����܆����C��Pm�j��ESxƸ<DG0X<���@��sM��$�Ab��PkÁ��/�����������~����{ؚn�!���������Ǵ�b��:τ�,��ϥ����\�@�@�gN��7���ʗG_-(_�����LG��ð�2qX�5�`�9%�]��=�5Y�'=���������Z��_g�@��_��PBF�Mz;R�ut�F_�pYkG1�IqG��ݱ�h�ł6泰|L�,��=+`�N��e
+�׾�}_k�����v�X���8�1�D�t�M�a4u��n���(�n�`�����A�o��b�}�8�o&\o$��0��X�Cz�Kσ��ӻW���Fà�b�6��%	.�v���P����~����ꀽ�"��Dt��mn��1�����[%�e�72�F�%�� A�w�vD<bw)M��/�=�Y��G��xx�XXl�.���/�V�M����_g�����������      �      x������ � �     