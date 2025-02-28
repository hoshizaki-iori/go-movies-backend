PGDMP                         y         	   go_movies    14.1    14.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16406 	   go_movies    DATABASE     d   CREATE DATABASE go_movies WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Thai_Thailand.874';
    DROP DATABASE go_movies;
                postgres    false            �            1259    16407    genres    TABLE     �   CREATE TABLE public.genres (
    id integer NOT NULL,
    genre_name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.genres;
       public         heap    postgres    false            �            1259    16412    genres_id_seq    SEQUENCE     �   CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.genres_id_seq;
       public          postgres    false    209                       0    0    genres_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;
          public          postgres    false    210            �            1259    16413    movies    TABLE     8  CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying,
    description text,
    year integer,
    release_date date,
    runtime integer,
    rating integer,
    mpaa_rating character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.movies;
       public         heap    postgres    false            �            1259    16418    movies_genres    TABLE     �   CREATE TABLE public.movies_genres (
    id integer NOT NULL,
    movie_id integer,
    genre_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 !   DROP TABLE public.movies_genres;
       public         heap    postgres    false            �            1259    16421    movies_genres_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.movies_genres_id_seq;
       public          postgres    false    212            	           0    0    movies_genres_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.movies_genres_id_seq OWNED BY public.movies_genres.id;
          public          postgres    false    213            �            1259    16422    movies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.movies_id_seq;
       public          postgres    false    211            
           0    0    movies_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;
          public          postgres    false    214            f           2604    16423 	   genres id    DEFAULT     f   ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);
 8   ALTER TABLE public.genres ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            g           2604    16424 	   movies id    DEFAULT     f   ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);
 8   ALTER TABLE public.movies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    211            h           2604    16425    movies_genres id    DEFAULT     t   ALTER TABLE ONLY public.movies_genres ALTER COLUMN id SET DEFAULT nextval('public.movies_genres_id_seq'::regclass);
 ?   ALTER TABLE public.movies_genres ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212            �          0    16407    genres 
   TABLE DATA           H   COPY public.genres (id, genre_name, created_at, updated_at) FROM stdin;
    public          postgres    false    209   �       �          0    16413    movies 
   TABLE DATA           �   COPY public.movies (id, title, description, year, release_date, runtime, rating, mpaa_rating, created_at, updated_at) FROM stdin;
    public          postgres    false    211   X       �          0    16418    movies_genres 
   TABLE DATA           W   COPY public.movies_genres (id, movie_id, genre_id, created_at, updated_at) FROM stdin;
    public          postgres    false    212   +                   0    0    genres_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.genres_id_seq', 9, true);
          public          postgres    false    210                       0    0    movies_genres_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.movies_genres_id_seq', 1, true);
          public          postgres    false    213                       0    0    movies_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.movies_id_seq', 8, true);
          public          postgres    false    214            j           2606    16427    genres genres_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
       public            postgres    false    209            n           2606    16429     movies_genres movies_genres_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT movies_genres_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.movies_genres DROP CONSTRAINT movies_genres_pkey;
       public            postgres    false    212            l           2606    16431    movies movies_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    211            o           2606    16432 '   movies_genres fk_movie_genries_genre_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT fk_movie_genries_genre_id FOREIGN KEY (genre_id) REFERENCES public.genres(id);
 Q   ALTER TABLE ONLY public.movies_genres DROP CONSTRAINT fk_movie_genries_genre_id;
       public          postgres    false    209    212    3178            p           2606    16437 '   movies_genres fk_movie_genries_movie_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_genres
    ADD CONSTRAINT fk_movie_genries_movie_id FOREIGN KEY (movie_id) REFERENCES public.movies(id);
 Q   ALTER TABLE ONLY public.movies_genres DROP CONSTRAINT fk_movie_genries_movie_id;
       public          postgres    false    3180    212    211            �   ~   x�3�t)J�M�4202�50�54W00�#lb\F��E���D�7�tL.���#Z�	�s~nf��S~~6њL9��3u�2��`��[Y\�ZTI�sNǔ�Լ��"�=o�Kj
�Xr��&�%oE� �G\�      �   �  x���ϊ�0���S��H�T۹--vaY��zQ�I,�����u��cJ�,��{��$�f�n�^�:L��,h���3.�-�8ǔg���_�?����ar#&��Fo3µ��j���s`JQ�ͥfR(��+����pق����W5�0!|����yʥ&"; \|X<��z�����BT��!Ov��.�FW���ˎI��a/{��G*��v'��1��J��R�b�m��T���գ�q� ���x������f�q�6�r�>�0&��1�A�e"h&�V��ኬ��H�c�Sʝ��^t�j*�a&�1���
RRp
� hz�5�h�cp�%S�HֶSۿϒ�ܔY�3�Z�]kz�E���.i�K�8�|�.xvX��mM��Xi:�;����B&W�1դ��%��6i����6D�Ս�M�W�몪~j�щ      �   "   x�3�4B##]S R00�#lb\1z\\\ �t�     