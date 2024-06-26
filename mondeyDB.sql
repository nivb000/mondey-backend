PGDMP     2    
                {           mondeydb_wsze    15.3    15.3     Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            S           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            T           1262    16389    mondeydb_wsze    DATABASE     x   CREATE DATABASE mondeydb_wsze WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';
    DROP DATABASE mondeydb_wsze;
                mondeydb_wsze_user    false            U           0    0    mondeydb_wsze    DATABASE PROPERTIES     6   ALTER DATABASE mondeydb_wsze SET "TimeZone" TO 'utc';
                     mondeydb_wsze_user    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                mondeydb_wsze_user    false            �            1259    16397    board    TABLE     '  CREATE TABLE public.board (
    title text,
    archivedat bigint,
    createdat bigint,
    "createdby.id" text,
    "createdby.fullname" text,
    "createdby.imgurl" text,
    labels json,
    groups json,
    activities json,
    cmpsorder json,
    id integer NOT NULL,
    members jsonb
);
    DROP TABLE public.board;
       public         heap    mondeydb_wsze_user    false    5            �            1259    16402    board_id_seq    SEQUENCE     �   CREATE SEQUENCE public.board_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.board_id_seq;
       public          mondeydb_wsze_user    false    214    5            V           0    0    board_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.board_id_seq OWNED BY public.board.id;
          public          mondeydb_wsze_user    false    215            �            1259    16403    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    fullname text,
    email text,
    password text,
    "imgUrl" text
);
    DROP TABLE public.users;
       public         heap    mondeydb_wsze_user    false    5            �            1259    16408    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          mondeydb_wsze_user    false    5    216            W           0    0    user_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;
          public          mondeydb_wsze_user    false    217            �           2604    16409    board id    DEFAULT     d   ALTER TABLE ONLY public.board ALTER COLUMN id SET DEFAULT nextval('public.board_id_seq'::regclass);
 7   ALTER TABLE public.board ALTER COLUMN id DROP DEFAULT;
       public          mondeydb_wsze_user    false    215    214            �           2604    16410    users id    DEFAULT     c   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          mondeydb_wsze_user    false    217    216            K          0    16397    board 
   TABLE DATA           �   COPY public.board (title, archivedat, createdat, "createdby.id", "createdby.fullname", "createdby.imgurl", labels, groups, activities, cmpsorder, id, members) FROM stdin;
    public          mondeydb_wsze_user    false    214   �       M          0    16403    users 
   TABLE DATA           H   COPY public.users (id, fullname, email, password, "imgUrl") FROM stdin;
    public          mondeydb_wsze_user    false    216   �       X           0    0    board_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.board_id_seq', 126, true);
          public          mondeydb_wsze_user    false    215            Y           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 30, true);
          public          mondeydb_wsze_user    false    217            �           2606    16412    board board_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.board
    ADD CONSTRAINT board_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.board DROP CONSTRAINT board_pkey;
       public            mondeydb_wsze_user    false    214            �           2606    16414    users user_email_key 
   CONSTRAINT     P   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_email_key UNIQUE (email);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT user_email_key;
       public            mondeydb_wsze_user    false    216            �           2606    16416    users user_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public            mondeydb_wsze_user    false    216            �           826    16391     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     Z   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO mondeydb_wsze_user;
                   postgres    false            �           826    16393    DEFAULT PRIVILEGES FOR TYPES    DEFAULT ACL     V   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO mondeydb_wsze_user;
                   postgres    false            �           826    16392     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     Z   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO mondeydb_wsze_user;
                   postgres    false            �           826    16390    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     W   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO mondeydb_wsze_user;
                   postgres    false            K   6  x��U[o�6~v~��~��Œ��	�fÒ�Y���")�6%j$U�-��Gʱ#�)��	0�st��9��@�8� ��@?�O^K�4M�K�VZ�j>��TM�J����rZ��c�a�8
���s?�rBf;β����L�!�1������u��ח���n�n��������.�o>6��}�F�E.d��0gz�����E��?����2��]tG�f�S#>	�aU��a���B�O9A�O�������=�o�����������h� l`p�saO�;�7R4�c+E��gJR��{�c�6ʝ�"0��!%�y@e�m^��n��Q�ν�[�2���.G.A�:DS�����S�_�=9�����A�w�x� �cQ��ti��6�W7CxS��*ru#��,�]x�5�3�y�:�<�p��cvKy픶�^��>�I� V�Z�BR��7`1*��d�f�2_����,i�;������\ĕp~�#)��13A�:W��^1�
Kj�G& I�F�?����-�"�m���7�W��>"�<"�2��X�,���1�����t3�\4�UH�[6�b�'�#W�M�"��6w� ��kX𭏓�_�zJ&�d]f$A��xÙ�v��w��:YX� �c�Ao�g��Q8ע]u�Z��s�=,�L� ��b3��^��3�<z~�FQ����
`�řތ�v6~�`�~�]A�GT��06{��8��[,�+��c��йZ����K~�BUA�s�jxA����iƜ4Ce���%���r����=5>�:D!�?7��Py�	/��$-Л�./��\\\���(�      M   �  x���A��0���W���1�dmHv�i�T�n�U�^l����� ���쪭z�#�g�'[�{>�l6��� cl5�����*c�~�y��e��K�UMu5랪��
� �q���l,2�܉��t�	\�b["'������u��=}L Q��K^���ǗˬͻM/F.���C�N*�'�8��$����j�ю�4�U�PQ��1�ëb(j�]{8����8o�^/ݓ*ʻ��Bu��v������M$�_B�"Q�\uķH�t��PJWS�XB�$#���?�;9�a�q��oY�1|�2��u��R5�W�y�c�������8�◟��n)eY]t�lMњ�+�������lO�{�<��3�S�|��Φ�H���3���ɬo�eY?�N��     