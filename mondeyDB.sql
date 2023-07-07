PGDMP     5                    {           mondeyDB    15.1    15.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    16418    mondeyDB    DATABASE     }   CREATE DATABASE "mondeyDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Hebrew_Israel.1255';
    DROP DATABASE "mondeyDB";
                postgres    false            �            1259    16465    board    TABLE     $  CREATE TABLE public.board (
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
    style json
);
    DROP TABLE public.board;
       public         heap    postgres    false            �            1259    16481    board_id_seq    SEQUENCE     �   CREATE SEQUENCE public.board_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.board_id_seq;
       public          postgres    false    214            
           0    0    board_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.board_id_seq OWNED BY public.board.id;
          public          postgres    false    215            �            1259    16525    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    fullname text,
    email text,
    password text,
    "imgUrl" text,
    boardmentions json
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16524    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    217                       0    0    user_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;
          public          postgres    false    216            j           2604    16482    board id    DEFAULT     d   ALTER TABLE ONLY public.board ALTER COLUMN id SET DEFAULT nextval('public.board_id_seq'::regclass);
 7   ALTER TABLE public.board ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            k           2604    16528    users id    DEFAULT     c   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217                       0    16465    board 
   TABLE DATA           �   COPY public.board (title, archivedat, createdat, "createdby.id", "createdby.fullname", "createdby.imgurl", labels, groups, activities, cmpsorder, id, style) FROM stdin;
    public          postgres    false    214   �                 0    16525    users 
   TABLE DATA           W   COPY public.users (id, fullname, email, password, "imgUrl", boardmentions) FROM stdin;
    public          postgres    false    217   �                  0    0    board_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.board_id_seq', 79, true);
          public          postgres    false    215                       0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 27, true);
          public          postgres    false    216            m           2606    16484    board board_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.board
    ADD CONSTRAINT board_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.board DROP CONSTRAINT board_pkey;
       public            postgres    false    214            o           2606    16534    users user_email_key 
   CONSTRAINT     P   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_email_key UNIQUE (email);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT user_email_key;
       public            postgres    false    217            q           2606    16532    users user_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public            postgres    false    217                   x��V�n�6}v�BP�<�"RwF�8ۤ�f�Hܦ��<P$%ӦDU�b���}I��q�����E0G�Ù3ã�*�[����� ��ak4��iM�2��^��(��[e2�HN�X��|"J������C�cǑ�xa�Fv�#[p���t��}������j:�����r1G�-���-���"�/~��;��U�ĢHQy�r����^��5�֟&#f���f�,YɩZފbƲ���Jeǂ�B��	�lb�ڏ�`c�MY�YӟB�q���?m�[|�\��K��(D�ڂ
<a��K�� ���ə4�[�qM��\$B�e��J�E�f�͔�4����6	*��s��� |L�'?$ĸAiΩ<ĵ�õp�X�Hr��v�����a�	��j��a�{sk��7�~}��#� �-���]ۃ;��r�*�������%�Pm��a�f�7�Վ�d��u�k˓rQNP)�p��#�:�K�s#�G�_���:y!���'*q��L�k�t�iJ���G�>K�q����OKT�,2T� I�ѵʆid\PE�&��
U��wl�mF�+��*i�k�j��q�y�R��qc�
�Jc�4��Py�Z���໘����Z��1�+µJ���Dz������ �� �s�S)����J���i�����	�3�d3�o&��zG[mD4\!��?�ca��괘�U�+���N�����B��u���u�6�����tw�K߶lGI��y�����x��J����Jy�%�k=B��T[&�$詘|��7�$���]����/;�.!{�}cY5�mT��
�	�J�5�A�8Gjr�����8S��HiG5kZLv�|��/C놳N�����֝��֬mWw�������{CIĴ�'9�����������>��Rb��c��cB_lF�uF82#X�.x��[L/< �7���c.�pT��}��Es���?��v�0b�0Biľ�0`�V'��'''��Y��         [  x���AO�0��ݯXv�$��@�	qls�ę�یQ-PVʠ�_/,ѳ��M��<�g��l6|�8瓮V�r`�6�i]֗��Y��֡�ˌջ~�;���\�!6&�kb�=��˱%�L��cA��q�*�v�b1��ղm؍�	5/�q&�-7�C����ZBU9ӆ�:�*UM�Q�������a�} cl��L��=v	��f�b	L����� <����i����p�T�)3x!��I�3����&���iq|
�6����v�J�J��P'U�
������u�X��u�n�0Z1s.��}�?�z���Z,�ǽ��X�Y>��Q�X�#z���7k��     