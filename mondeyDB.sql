PGDMP             
            {           mondeydb_wsze    15.3    15.3     Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          mondeydb_wsze_user    false    216   �%       X           0    0    board_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.board_id_seq', 151, true);
          public          mondeydb_wsze_user    false    215            Y           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 45, true);
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
                   postgres    false            K     x���n���?+OA�@?�g�ZY�%��lk��ER"%.2my����E�E�^�CZ�H���1��x8��g����sf��L�`<I�4COR����1��U,C��҈���c�T��:�	]�޶,��+��ؒe��龕,#!&��oIyNq,^�KM5[i�TC(ӥ[Uթ�f��4�t!l�A�n�w�T��嗸&���u@��I��\]Aɺew4�EX&��(_�t�F�h�b���O��A�[ד:xy�4#-����i�T��$)��P�Ɗ�E%����i�#�7!c[^��sD[R��"'��;\o
��7�A�������B�V�Bَ+����G���h(�����,��!B����M(��Τ,����g�*?�G�z~�7D��BM4��T�M	�h��yv1�WI�ߢ��I������¥�]�����h����:�v���w	�5/�LӨ�f�vm��,�W3t��8��u]�2�fa)_%�@6�5[ �1Ԁ��;��h[f�@�%:
��ABh��$[A'�4U �X��{o���}�$��e5=]7Eÿ������ץ����MY:j�[I�<Y3E{������BB3Ė��%ʉ�n�!i&ڠ��)Ih;�v���Y��v��:)(����5om�_��OMK�y�la!��XъE�!�7Js~�Dj)�?g
)�Q$E���S�A0,�y�|/7��
�[]kfm��<���U�������|�\�8q���K���Rd⩊%Ii�k��dC#��hh+$reNQ��8��g�H���������iW�:�=��yڷ�i�S�:����曳9�4�x�NS���<��XE4D��UE]1��_R�V�f>���T�4L�Z���Jv��ⳃ���c��tҖ9�W+y�u�o>0\A^�isC��6Uۍi|�[rڷ��NH�׸;����u�V��A��6�G\� mv�My6d�G�3�Ҋx���<�|�Q�38� �P�R�fbE�&ʢ�9�hn���j^-]%����р4z=�6[�ɘ�C_h�^i�I6�����V�읯�M�9�����ù�����UF�:�e�S8�g����sD�����G�����p�Y�'� ���F��y����@��?/�+�7�����'B�� \r�F��Q��&�|2�vt��/k!�W ��}'�2��� �քG�$�D@��zh���@�O3��bx2�BJ�Q|�NQ-StE�����m0G*���̳>,�h&Sq�-�6��ԇW�$�u�e���y�@��ůCɹ�!_��Vt�F����n��Oٶ���"F�u���3� ZX��oJ�4?�oǳ\�:"����Lyĳ�g����~�'�d(�x�
#�-��>���y�{򵂨�Q�� 9����^:h��G������Px��ڰ\�L�Ê!�ѿa��[ѣ��i����׭��i���� 又�����X�߈��/��������b���c���ǿ����5��������r�֐�e+��PX���n�=�*w��Ls������'�N^��Ҟ�3=˦����#�Oo�߈D���s�0�t&��w����,Er�b㿍�C����������/�l��wU�oHY+�zڲ�)�����}?*���h��4��ā�9�V8S2�ԩ�ٮpԒ��tnv�۬����>��V_�n!u����Mϲ)܊�zDp��b�n���c+![QO�KOS� 0��X�5����hT7 �ܽ�W�ѝXϚ�L�ܪY�b�j44�.F��8�c�);�����m2�z�T��/ϧ�Wt�n�c_f������Ӻ|�?�B꜋���5D���v��GL��vh��~�F-3r$M��I�����.��t6�Wkd�)Vr��dְ:��	E&�8L�?��%1=0�?� �W�=���!g>�nׄڲG�;��#�2ʭ��^�9?x������E���U�?�Uv/��#����~Dp�����Gʇ#?!_�IRIr �,EC�_�I�D�OLt�����I6 �ɽgI6oh��Sp���g\�K>�.�����rw����D+�1�Ch�:2x���ϲ)��f���j�{E������A�
S����8��^,���Rm;��t����2A_m�j|�|��R�=�1�����٧�f|�T4'�+� y�)r�P�(�@��b��jite�,����	��Z��$x^@�$�~qd�>塡��^?��׸�<�xL��^ڙ�`�Hn�s�2��9k�h�G77��0~Y�!�ﶳ/ƃ�o(�#b|�1>�2.
�z�����YS�H+=�\4E!z	���y�#ɀ\ V�^��oS�4ɣ�[��$�'������N+��2	�$v����)�ܹG|�cSMŕԽ��o��g�fvS�}�󊘅	T��.�Y<�^�/-��H>A-Ԙ��	�f��Z`�ߟr�����gaY�ϴ���²\��p���9yc�xce�1����v�,��z_����k�∠K�t��%QI�^m�,����X#N��3��l�8�ǡP�?/�9G�2w��g���W��hU����:�(�śڿ���:~��=Sɑ��9.HAd�(%�bE�7��m4`&�kjj�����j�\���^���\�3�z���iJ�O��}������0-ϖ��2|O���Ճ�p��|h7ɖ�:L������z����Y,�V��n˫�*���^@�kӎpU�#遢�u6�xL�Ls�m�5�/X���1$�6�&5mesc����"�ȣ��-�!/�=O1(f�b�:�B��:�'��o��׍vE�I}�;ɼ�\\ܷ��Y�О�P��݆��
�j޾*���e��@[k��\Đm����6��\j�m\��F����0���0fY�s� 놷����<"�d|ވ�?�t�e���K��8��Þ+9<,�T͆��y�I�%�Vչ~�˅�:7=v2�P����a3��lp���7o���j      M   �  x��Uَ�X}&���y3;F*uc�f1����f5����Q͢�Fju?�/�w���,u+[��y�""蜈8�b��[q���(�$N��̉S�-2�z����
�c�rE���ĥ+��JHi{s!�6�ޖ�f朶�a�bV�K�Z j���3ř�5X����Ͽ�ʨh�B`�(��f�R���k�O
��n�|E\�a�=B("D|���8l�EhG�.+��N����R��dcp
":��n�o�âS����-��ϛ��0�`4n0�5�]4u���c�%���>���
��uK�"�U�sM/����"�g�S')�8Ώ��][�M��<��KB8Pf���w��J8�9�G5w�}9*�.�����w���hA~�կ�צ.�Ǘ�?_f��>�9���?�ئN�90��ﯝ�2�+H�զ&=�6ٝ���ja�<�:�Vi-�U~o�{��nv�G��w�MkFʈ��t����Vy���I��Tm��xk.	N�T3=rR?��9�۫�!8��-2���p���$���ꘟx����T@��]��IZ�Z�����r���l)����r��<Y�����z
���ȝ��gvQ�Ao�,ν�48���B�x_�M^��;~9*@�ˮ1���t2�$�
\�ݳ��e��;*�8�;�Q����|!e�,E7��T�Q����?��y�4������~y�@/0Aa(��`�=l��Ԫ6c�52�U$i�T-|����׎r�x�S)�.-E3>���G����6q��b�A�R�(��+�t��Ӹ�+�v�\��W*8�?�1���{��� ��Aw����`àŚ~aMaq�.��R>m�$䟸�.��y�w:�3�[�Y�T)I��60���r�φ���ȳY�E�q3FN2����^8��g	1;d[<R�v��+L�2A|@�,�Z���I��G�h��;��� N}ȃ�%�Ĳh&�@�&"O��'�Y�Yfu������/_��8O�T�u�V����gx��s��ZU �UT��	� �q��i\G@<%�S�Y�cbc*��b�_򶮐���YOF��1��W��9}�D띲΍���(�r/��h;������Bٙ�q��z�I�%�$�؊K���?[�� /��[�d��2a%W��J;��`�ʲ�DEg�5j��6�Ҋf���J�om?����8�:�)��j��C�9����>�(0i��I���*� |��z��l'�G],��"�C@���ӭs�z����|o+Z[�>B�U�!�Qd~5S��zZ�� �1x	��+�-Zd̞�!_v,b42����vRn���e�*D��udo���&ˆT�J䴉��+A$�C��*��Q�b��y���u���L�U+1	���Nױ�O����5���H5=.�.Ĝ�jPQ�EW�ѸY�k��ց^��@d�YC�iw/ĚB�2�"e�l[�%qκ��K���|���m�3I��_������^=     