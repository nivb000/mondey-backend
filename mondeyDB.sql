PGDMP         	                {           mondeydb_wsze    15.3    15.3     Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
                mondeydb_wsze_user    false            �            1259    16397    board    TABLE     A  CREATE TABLE public.board (
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
    members jsonb,
    "isFavorite" boolean
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
   TABLE DATA           �   COPY public.board (title, archivedat, createdat, "createdby.id", "createdby.fullname", "createdby.imgurl", labels, groups, activities, cmpsorder, id, members, "isFavorite") FROM stdin;
    public          mondeydb_wsze_user    false    214   �       M          0    16403    users 
   TABLE DATA           H   COPY public.users (id, fullname, email, password, "imgUrl") FROM stdin;
    public          mondeydb_wsze_user    false    216   �       X           0    0    board_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.board_id_seq', 135, true);
          public          mondeydb_wsze_user    false    215            Y           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 32, true);
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
                   postgres    false            K   �  x��U[o�6~v~���"�f����NۤM��v� �1P$-ӦDU�R;���H�&�m0�Z5���w��o��y��~�.0�0�O��)����F�����ݛk0n̕�e��a)J�l�tE�lc�v�PBv���a�t���*kkgl/r�4��d1b�,mh5-����^K�%@d�)mǂ�B�����4���ڽ�*��O���[����6����
[��k��
Q��T�
<g����;�G;#��Vo��`aDs�0\$Bj�TH��Ŕ[=�i�4�ia�O�A���v[��G��ׂ�	c��~Eȩ��6q>Y1��D������3\ig���x3>è��)��聚#��^�I�'8�a����C�\�Z�+�s��9�D>I�g�ϲV^���Ҡy�E�����IV;�Ҕf���o�KS�J7`!.�e�
��@�I
�#3�pAu�]���fa�s����V��UA�-_f%�JM���(楉���ЍY������6�$,Cź"��#�E�%p�̹@��`r���i�.`�?�8ZH���k;e�k�&z�A<�xə�w�)Y�~��06AD�с΢��'�'a�b��eo�Ѣ�i����k��y%��&����W)iq��Xg]r`��-�ϱ9>!'��Y6�݅vK�zz�9�J�6�H=z���c�1Jc���HiKMs���8�t��w��ށۂw�k�/iq`��lX�?M���W���h��T �Z�N׳ʥy��i�c` �\2����n;"�Լ,2�\Mu�}|5Qx�8���n�o�2�«�Mp���"3AVt��6������g-��K�2��^�* �6��y_���W�����l����([�8������k�7V6�>������^���e��l����Fٌ��.�l_\\���-�      M      x�e�Mo�0 ��3|
^��8�%K&�ETA��%�R:���T��/sf�]�O��ghR�[z�Xj2JىT�3�SR)���Pφ�:����ڛ�'���yނ��w��,���/Ʈ�EN��;w��p�vR�y� u�SZԣ��܂���2��cղt�nut��g��l�Қ��s�IYC������|��W���e!L|,ź��8[]�Zㆉ}�"<-��@��ą�2�V��`Jq�:�� m8j�M���ηט�F����SX���<�H��4�Q��2���{b�9��"��7��r�     