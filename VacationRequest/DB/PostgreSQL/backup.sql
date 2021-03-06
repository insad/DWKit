PGDMP     +                    u            dwkitsample    9.5.5    10.0 �    T
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            U
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            V
           1262    30409    dwkitsample    DATABASE     i   CREATE DATABASE dwkitsample WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE dwkitsample;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            W
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            X
           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12623    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            Y
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    30709    Document    TABLE     �  CREATE TABLE "Document" (
    "Id" uuid NOT NULL,
    "Number" integer NOT NULL,
    "Name" character varying(256) NOT NULL,
    "Comment" character varying(1024),
    "AuthorId" uuid NOT NULL,
    "ManagerId" uuid,
    "Amount" money DEFAULT (0)::money NOT NULL,
    "State" character varying(256) DEFAULT 'Draft'::character varying NOT NULL,
    "StateName" character varying(256)
);
    DROP TABLE public."Document";
       public         postgres    false    6            �            1259    30732    DocumentTransitionHistory    TABLE     �  CREATE TABLE "DocumentTransitionHistory" (
    "Id" uuid NOT NULL,
    "DocumentId" uuid NOT NULL,
    "EmployeeId" uuid,
    "AllowedToEmployeeNames" character varying(1024),
    "TransitionTime" date,
    "Order" integer NOT NULL,
    "InitialState" character varying(256) NOT NULL,
    "DestinationState" character varying(256) NOT NULL,
    "Command" character varying(1024) NOT NULL
);
 /   DROP TABLE public."DocumentTransitionHistory";
       public         postgres    false    6            �            1259    30730 #   DocumentTransitionHistory_Order_seq    SEQUENCE     �   CREATE SEQUENCE "DocumentTransitionHistory_Order_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."DocumentTransitionHistory_Order_seq";
       public       postgres    false    211    6            Z
           0    0 #   DocumentTransitionHistory_Order_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE "DocumentTransitionHistory_Order_seq" OWNED BY "DocumentTransitionHistory"."Order";
            public       postgres    false    210            �            1259    30707    Document_Number_seq    SEQUENCE     w   CREATE SEQUENCE "Document_Number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Document_Number_seq";
       public       postgres    false    209    6            [
           0    0    Document_Number_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE "Document_Number_seq" OWNED BY "Document"."Number";
            public       postgres    false    208            �            1259    30694    StructDivision    TABLE     {   CREATE TABLE "StructDivision" (
    "Id" uuid NOT NULL,
    "Name" character varying(256) NOT NULL,
    "ParentId" uuid
);
 $   DROP TABLE public."StructDivision";
       public         postgres    false    6            �            1259    30685    WorkflowGlobalParameter    TABLE     �   CREATE TABLE "WorkflowGlobalParameter" (
    "Id" uuid NOT NULL,
    "Type" character varying(256) NOT NULL,
    "Name" character varying(256) NOT NULL,
    "Value" text NOT NULL
);
 -   DROP TABLE public."WorkflowGlobalParameter";
       public         postgres    false    6            �            1259    30615    WorkflowInbox    TABLE     x   CREATE TABLE "WorkflowInbox" (
    "Id" uuid NOT NULL,
    "ProcessId" uuid NOT NULL,
    "IdentityId" uuid NOT NULL
);
 #   DROP TABLE public."WorkflowInbox";
       public         postgres    false    6            �            1259    30622    WorkflowProcessInstance    TABLE     j  CREATE TABLE "WorkflowProcessInstance" (
    "Id" uuid NOT NULL,
    "StateName" character varying(256),
    "ActivityName" character varying(256) NOT NULL,
    "SchemeId" uuid NOT NULL,
    "PreviousState" character varying(256),
    "PreviousStateForDirect" character varying(256),
    "PreviousStateForReverse" character varying(256),
    "PreviousActivity" character varying(256),
    "PreviousActivityForDirect" character varying(256),
    "PreviousActivityForReverse" character varying(256),
    "IsDeterminingParametersChanged" boolean NOT NULL,
    "ParentProcessId" uuid,
    "RootProcessId" uuid NOT NULL
);
 -   DROP TABLE public."WorkflowProcessInstance";
       public         postgres    false    6            �            1259    30631 "   WorkflowProcessInstancePersistence    TABLE     �   CREATE TABLE "WorkflowProcessInstancePersistence" (
    "Id" uuid NOT NULL,
    "ProcessId" uuid NOT NULL,
    "ParameterName" character varying(256) NOT NULL,
    "Value" text NOT NULL
);
 8   DROP TABLE public."WorkflowProcessInstancePersistence";
       public         postgres    false    6            �            1259    30640    WorkflowProcessInstanceStatus    TABLE     �   CREATE TABLE "WorkflowProcessInstanceStatus" (
    "Id" uuid NOT NULL,
    "Status" smallint NOT NULL,
    "Lock" uuid NOT NULL
);
 3   DROP TABLE public."WorkflowProcessInstanceStatus";
       public         postgres    false    6            �            1259    30646    WorkflowProcessScheme    TABLE     �  CREATE TABLE "WorkflowProcessScheme" (
    "Id" uuid NOT NULL,
    "Scheme" text NOT NULL,
    "DefiningParameters" text NOT NULL,
    "DefiningParametersHash" character varying(1024) NOT NULL,
    "SchemeCode" character varying(256) NOT NULL,
    "IsObsolete" boolean NOT NULL,
    "RootSchemeCode" character varying(256),
    "RootSchemeId" uuid,
    "AllowedActivities" text,
    "StartingTransition" text
);
 +   DROP TABLE public."WorkflowProcessScheme";
       public         postgres    false    6            �            1259    30657    WorkflowProcessTimer    TABLE     �   CREATE TABLE "WorkflowProcessTimer" (
    "Id" uuid NOT NULL,
    "ProcessId" uuid NOT NULL,
    "Name" character varying(256) NOT NULL,
    "NextExecutionDateTime" timestamp without time zone NOT NULL,
    "Ignore" boolean NOT NULL
);
 *   DROP TABLE public."WorkflowProcessTimer";
       public         postgres    false    6            �            1259    30666     WorkflowProcessTransitionHistory    TABLE     S  CREATE TABLE "WorkflowProcessTransitionHistory" (
    "Id" uuid NOT NULL,
    "ProcessId" uuid NOT NULL,
    "ExecutorIdentityId" character varying(256),
    "ActorIdentityId" character varying(256),
    "FromActivityName" character varying(256) NOT NULL,
    "ToActivityName" character varying(256) NOT NULL,
    "ToStateName" character varying(256),
    "TransitionTime" timestamp without time zone NOT NULL,
    "TransitionClassifier" character varying(256) NOT NULL,
    "FromStateName" character varying(256),
    "TriggerName" character varying(256),
    "IsFinalised" boolean NOT NULL
);
 6   DROP TABLE public."WorkflowProcessTransitionHistory";
       public         postgres    false    6            �            1259    30677    WorkflowScheme    TABLE     j   CREATE TABLE "WorkflowScheme" (
    "Code" character varying(256) NOT NULL,
    "Scheme" text NOT NULL
);
 $   DROP TABLE public."WorkflowScheme";
       public         postgres    false    6            �            1259    30410    dwAppSettings    TABLE     Y  CREATE TABLE "dwAppSettings" (
    "Name" character varying(50) NOT NULL,
    "Value" character varying(1000) NOT NULL,
    "GroupName" character varying(50),
    "ParamName" character varying(1024) NOT NULL,
    "Order" integer,
    "EditorType" character varying(50) DEFAULT 0 NOT NULL,
    "IsHidden" boolean DEFAULT (0)::boolean NOT NULL
);
 #   DROP TABLE public."dwAppSettings";
       public         postgres    false    6            �            1259    30508    dwSecurityCredential    TABLE       CREATE TABLE "dwSecurityCredential" (
    "Id" uuid NOT NULL,
    "PasswordHash" character varying(128),
    "PasswordSalt" character varying(128),
    "SecurityUserId" uuid NOT NULL,
    "Login" character varying(256) NOT NULL,
    "AuthenticationType" smallint NOT NULL
);
 *   DROP TABLE public."dwSecurityCredential";
       public         postgres    false    6            �            1259    30437    dwSecurityGroup    TABLE     �   CREATE TABLE "dwSecurityGroup" (
    "Id" uuid NOT NULL,
    "Name" character varying(128) NOT NULL,
    "Comment" character varying(1000),
    "IsSyncWithDomainGroup" boolean DEFAULT (0)::boolean NOT NULL
);
 %   DROP TABLE public."dwSecurityGroup";
       public         postgres    false    6            �            1259    30551    dwSecurityGroupToSecurityRole    TABLE     �   CREATE TABLE "dwSecurityGroupToSecurityRole" (
    "Id" uuid NOT NULL,
    "SecurityRoleId" uuid NOT NULL,
    "SecurityGroupId" uuid NOT NULL
);
 3   DROP TABLE public."dwSecurityGroupToSecurityRole";
       public         postgres    false    6            �            1259    30566    dwSecurityGroupToSecurityUser    TABLE     �   CREATE TABLE "dwSecurityGroupToSecurityUser" (
    "Id" uuid NOT NULL,
    "SecurityUserId" uuid NOT NULL,
    "SecurityGroupId" uuid NOT NULL
);
 3   DROP TABLE public."dwSecurityGroupToSecurityUser";
       public         postgres    false    6            �            1259    30451    dwSecurityPermission    TABLE     �   CREATE TABLE "dwSecurityPermission" (
    "Id" uuid NOT NULL,
    "Code" character varying(128) NOT NULL,
    "Name" character varying(128),
    "GroupId" uuid NOT NULL
);
 *   DROP TABLE public."dwSecurityPermission";
       public         postgres    false    6            �            1259    30446    dwSecurityPermissionGroup    TABLE     �   CREATE TABLE "dwSecurityPermissionGroup" (
    "Id" uuid NOT NULL,
    "Name" character varying(128) NOT NULL,
    "Code" character varying(128) NOT NULL
);
 /   DROP TABLE public."dwSecurityPermissionGroup";
       public         postgres    false    6            �            1259    30461    dwSecurityRole    TABLE     �   CREATE TABLE "dwSecurityRole" (
    "Id" uuid NOT NULL,
    "Code" character varying(128) NOT NULL,
    "Name" character varying(128) NOT NULL,
    "Comment" character varying(1000),
    "DomainGroup" character varying(512)
);
 $   DROP TABLE public."dwSecurityRole";
       public         postgres    false    6            �            1259    30469 "   dwSecurityRoleToSecurityPermission    TABLE     �   CREATE TABLE "dwSecurityRoleToSecurityPermission" (
    "Id" uuid NOT NULL,
    "SecurityRoleId" uuid NOT NULL,
    "SecurityPermissionId" uuid NOT NULL,
    "AccessType" smallint DEFAULT 0 NOT NULL
);
 8   DROP TABLE public."dwSecurityRoleToSecurityPermission";
       public         postgres    false    6            �            1259    30485    dwSecurityUser    TABLE       CREATE TABLE "dwSecurityUser" (
    "Id" uuid NOT NULL,
    "Name" character varying(256) NOT NULL,
    "Email" character varying(256),
    "IsLocked" boolean DEFAULT (0)::boolean NOT NULL,
    "ExternalId" character varying(1024),
    "Timezone" character varying(256),
    "Localization" character varying(256),
    "DecimalSeparator" character(1),
    "PageSize" integer,
    "StartPage" character varying(256),
    "IsRTL" boolean DEFAULT (0)::boolean,
    "StructDivisionId" uuid,
    "IsHead" boolean DEFAULT (0)::boolean NOT NULL
);
 $   DROP TABLE public."dwSecurityUser";
       public         postgres    false    6            �            1259    30521    dwSecurityUserImpersonation    TABLE     �   CREATE TABLE "dwSecurityUserImpersonation" (
    "Id" uuid NOT NULL,
    "SecurityUserId" uuid NOT NULL,
    "ImpSecurityUserId" uuid NOT NULL,
    "DateFrom" timestamp without time zone NOT NULL,
    "DateTo" timestamp without time zone NOT NULL
);
 1   DROP TABLE public."dwSecurityUserImpersonation";
       public         postgres    false    6            �            1259    30495    dwSecurityUserState    TABLE     �   CREATE TABLE "dwSecurityUserState" (
    "Id" uuid NOT NULL,
    "SecurityUserId" uuid NOT NULL,
    "Key" character varying(256) NOT NULL,
    "Value" text NOT NULL
);
 )   DROP TABLE public."dwSecurityUserState";
       public         postgres    false    6            �            1259    30536    dwSecurityUserToSecurityRole    TABLE     �   CREATE TABLE "dwSecurityUserToSecurityRole" (
    "Id" uuid NOT NULL,
    "SecurityRoleId" uuid NOT NULL,
    "SecurityUserId" uuid NOT NULL
);
 2   DROP TABLE public."dwSecurityUserToSecurityRole";
       public         postgres    false    6            �            1259    30428    dwUploadedFiles    TABLE     �  CREATE TABLE "dwUploadedFiles" (
    "Id" uuid NOT NULL,
    "Data" bytea NOT NULL,
    "Used" boolean DEFAULT (0)::boolean NOT NULL,
    "ObjectId" uuid NOT NULL,
    "Name" character varying(1000) NOT NULL,
    "TableName" character varying(255) NOT NULL,
    "CreatedBy" character varying(1024),
    "CreatedDate" timestamp without time zone,
    "AttachmentLength" bigint NOT NULL
);
 %   DROP TABLE public."dwUploadedFiles";
       public         postgres    false    6            �            1259    30590 !   dwV_Security_CheckPermissionGroup    VIEW     �  CREATE VIEW "dwV_Security_CheckPermissionGroup" AS
 SELECT sgtosr."SecurityGroupId",
    sp."Id" AS "PermissionId",
    spg."Code" AS "PermissionGroupCode",
    spg."Name" AS "PermissionGroupName",
    sp."Code" AS "PermissionCode",
    sp."Name" AS "PermissionName",
    max(srtosp."AccessType") AS "AccessType"
   FROM ((("dwSecurityPermission" sp
     JOIN "dwSecurityPermissionGroup" spg ON ((sp."GroupId" = spg."Id")))
     JOIN "dwSecurityRoleToSecurityPermission" srtosp ON ((srtosp."SecurityPermissionId" = sp."Id")))
     JOIN "dwSecurityGroupToSecurityRole" sgtosr ON ((sgtosr."SecurityRoleId" = srtosp."SecurityRoleId")))
  WHERE (srtosp."AccessType" <> 0)
  GROUP BY sgtosr."SecurityGroupId", sp."Id", spg."Code", spg."Name", sp."Code", sp."Name";
 6   DROP VIEW public."dwV_Security_CheckPermissionGroup";
       public       postgres    false    185    185    185    187    187    187    193    193    184    184    185    184    6            �            1259    30581    dwV_Security_UserRole    VIEW     +  CREATE VIEW "dwV_Security_UserRole" AS
 SELECT "dwSecurityUserToSecurityRole"."SecurityUserId" AS "UserId",
    "dwSecurityUserToSecurityRole"."SecurityRoleId" AS "RoleId"
   FROM "dwSecurityUserToSecurityRole"
UNION
 SELECT DISTINCT "dwSecurityGroupToSecurityUser"."SecurityUserId" AS "UserId",
    "dwSecurityGroupToSecurityRole"."SecurityRoleId" AS "RoleId"
   FROM ("dwSecurityGroupToSecurityRole"
     JOIN "dwSecurityGroupToSecurityUser" ON (("dwSecurityGroupToSecurityUser"."SecurityGroupId" = "dwSecurityGroupToSecurityRole"."SecurityGroupId")));
 *   DROP VIEW public."dwV_Security_UserRole";
       public       postgres    false    193    192    192    194    194    193    6            �            1259    30585     dwV_Security_CheckPermissionUser    VIEW       CREATE VIEW "dwV_Security_CheckPermissionUser" AS
 SELECT "dwV_Security_UserRole"."UserId",
    sp."Id" AS "PermissionId",
    spg."Code" AS "PermissionGroupCode",
    spg."Name" AS "PermissionGroupName",
    sp."Code" AS "PermissionCode",
    sp."Name" AS "PermissionName",
    max(srtosp."AccessType") AS "AccessType"
   FROM ((("dwSecurityPermission" sp
     JOIN "dwSecurityPermissionGroup" spg ON ((sp."GroupId" = spg."Id")))
     JOIN "dwSecurityRoleToSecurityPermission" srtosp ON ((srtosp."SecurityPermissionId" = sp."Id")))
     JOIN "dwV_Security_UserRole" ON (("dwV_Security_UserRole"."RoleId" = srtosp."SecurityRoleId")))
  WHERE (srtosp."AccessType" <> 0)
  GROUP BY "dwV_Security_UserRole"."UserId", sp."Id", spg."Code", spg."Name", sp."Code", sp."Name";
 5   DROP VIEW public."dwV_Security_CheckPermissionUser";
       public       postgres    false    185    195    195    187    187    187    185    185    185    184    184    184    6            �            1259    30751    vStructDivisionParents    VIEW     -  CREATE VIEW "vStructDivisionParents" AS
 WITH RECURSIVE "cteRecursive" AS (
         SELECT sd."Id" AS "FirstId",
            sd."ParentId",
            sd."Id"
           FROM "StructDivision" sd
          WHERE (sd."ParentId" IS NOT NULL)
        UNION ALL
         SELECT r."FirstId",
            sdr."ParentId",
            sdr."Id"
           FROM ("StructDivision" sdr
             JOIN "cteRecursive" r ON ((r."ParentId" = sdr."Id")))
        )
 SELECT DISTINCT "cteRecursive"."FirstId" AS "Id",
    "cteRecursive"."ParentId"
   FROM "cteRecursive";
 +   DROP VIEW public."vStructDivisionParents";
       public       postgres    false    207    207    6            �            1259    30755    vStructDivisionParentsAndThis    VIEW       CREATE VIEW "vStructDivisionParentsAndThis" AS
 SELECT "StructDivision"."Id",
    "StructDivision"."Id" AS "ParentId"
   FROM "StructDivision"
UNION
 SELECT "vStructDivisionParents"."Id",
    "vStructDivisionParents"."ParentId"
   FROM "vStructDivisionParents";
 2   DROP VIEW public."vStructDivisionParentsAndThis";
       public       postgres    false    207    212    212    6            �            1259    30759    vHeads    VIEW     G  CREATE VIEW "vHeads" AS
 SELECT e."Id",
    e."Name",
    eh."Id" AS "HeadId",
    eh."Name" AS "HeadName"
   FROM (("dwSecurityUser" e
     JOIN "vStructDivisionParentsAndThis" vsp ON ((e."StructDivisionId" = vsp."Id")))
     JOIN "dwSecurityUser" eh ON (((eh."StructDivisionId" = vsp."ParentId") AND (eh."IsHead" = true))));
    DROP VIEW public."vHeads";
       public       postgres    false    213    188    213    188    188    188    6            �            1259    30764    vStructDivisionUsers    VIEW     �  CREATE VIEW "vStructDivisionUsers" AS
 SELECT "StructDivision"."Id",
    "StructDivision"."Name",
    "StructDivision"."ParentId",
    NULL::text AS "Roles"
   FROM "StructDivision"
UNION ALL
 SELECT "dwSecurityUser"."Id",
    "dwSecurityUser"."Name",
    "dwSecurityUser"."StructDivisionId" AS "ParentId",
    string_agg(("dwSecurityRole"."Name")::text, ', '::text) AS "Roles"
   FROM (("dwSecurityUser"
     LEFT JOIN "dwV_Security_UserRole" ON (("dwV_Security_UserRole"."UserId" = "dwSecurityUser"."Id")))
     LEFT JOIN "dwSecurityRole" ON (("dwSecurityRole"."Id" = "dwV_Security_UserRole"."RoleId")))
  GROUP BY "dwSecurityUser"."Id", "dwSecurityUser"."Name", "dwSecurityUser"."StructDivisionId";
 )   DROP VIEW public."vStructDivisionUsers";
       public       postgres    false    186    186    188    188    188    195    195    207    207    207    6            �            1259    30769    vUsers    VIEW     |  CREATE VIEW "vUsers" AS
 SELECT "dwSecurityUser"."Id",
    "dwSecurityUser"."Name",
    "dwSecurityUser"."StructDivisionId",
    string_agg(("dwSecurityRole"."Name")::text, ', '::text) AS "Roles",
    concat("dwSecurityUser"."Name", ' (', string_agg(("dwSecurityRole"."Name")::text, ', '::text), ')') AS "Title"
   FROM (("dwSecurityUser"
     LEFT JOIN "dwV_Security_UserRole" ON (("dwV_Security_UserRole"."UserId" = "dwSecurityUser"."Id")))
     LEFT JOIN "dwSecurityRole" ON (("dwSecurityRole"."Id" = "dwV_Security_UserRole"."RoleId")))
  GROUP BY "dwSecurityUser"."Id", "dwSecurityUser"."Name", "dwSecurityUser"."StructDivisionId";
    DROP VIEW public."vUsers";
       public       postgres    false    195    188    195    188    186    188    186    6            d	           2604    30712    Document Number    DEFAULT     j   ALTER TABLE ONLY "Document" ALTER COLUMN "Number" SET DEFAULT nextval('"Document_Number_seq"'::regclass);
 B   ALTER TABLE public."Document" ALTER COLUMN "Number" DROP DEFAULT;
       public       postgres    false    209    208    209            g	           2604    30735    DocumentTransitionHistory Order    DEFAULT     �   ALTER TABLE ONLY "DocumentTransitionHistory" ALTER COLUMN "Order" SET DEFAULT nextval('"DocumentTransitionHistory_Order_seq"'::regclass);
 R   ALTER TABLE public."DocumentTransitionHistory" ALTER COLUMN "Order" DROP DEFAULT;
       public       postgres    false    210    211    211            O
          0    30709    Document 
   TABLE DATA               y   COPY "Document" ("Id", "Number", "Name", "Comment", "AuthorId", "ManagerId", "Amount", "State", "StateName") FROM stdin;
    public       postgres    false    209   2�       Q
          0    30732    DocumentTransitionHistory 
   TABLE DATA               �   COPY "DocumentTransitionHistory" ("Id", "DocumentId", "EmployeeId", "AllowedToEmployeeNames", "TransitionTime", "Order", "InitialState", "DestinationState", "Command") FROM stdin;
    public       postgres    false    211   O�       M
          0    30694    StructDivision 
   TABLE DATA               =   COPY "StructDivision" ("Id", "Name", "ParentId") FROM stdin;
    public       postgres    false    207   l�       L
          0    30685    WorkflowGlobalParameter 
   TABLE DATA               K   COPY "WorkflowGlobalParameter" ("Id", "Type", "Name", "Value") FROM stdin;
    public       postgres    false    206   c�       D
          0    30615    WorkflowInbox 
   TABLE DATA               C   COPY "WorkflowInbox" ("Id", "ProcessId", "IdentityId") FROM stdin;
    public       postgres    false    198   ��       E
          0    30622    WorkflowProcessInstance 
   TABLE DATA               6  COPY "WorkflowProcessInstance" ("Id", "StateName", "ActivityName", "SchemeId", "PreviousState", "PreviousStateForDirect", "PreviousStateForReverse", "PreviousActivity", "PreviousActivityForDirect", "PreviousActivityForReverse", "IsDeterminingParametersChanged", "ParentProcessId", "RootProcessId") FROM stdin;
    public       postgres    false    199   f�       F
          0    30631 "   WorkflowProcessInstancePersistence 
   TABLE DATA               d   COPY "WorkflowProcessInstancePersistence" ("Id", "ProcessId", "ParameterName", "Value") FROM stdin;
    public       postgres    false    200   G�       G
          0    30640    WorkflowProcessInstanceStatus 
   TABLE DATA               J   COPY "WorkflowProcessInstanceStatus" ("Id", "Status", "Lock") FROM stdin;
    public       postgres    false    201   d�       H
          0    30646    WorkflowProcessScheme 
   TABLE DATA               �   COPY "WorkflowProcessScheme" ("Id", "Scheme", "DefiningParameters", "DefiningParametersHash", "SchemeCode", "IsObsolete", "RootSchemeCode", "RootSchemeId", "AllowedActivities", "StartingTransition") FROM stdin;
    public       postgres    false    202   �       I
          0    30657    WorkflowProcessTimer 
   TABLE DATA               g   COPY "WorkflowProcessTimer" ("Id", "ProcessId", "Name", "NextExecutionDateTime", "Ignore") FROM stdin;
    public       postgres    false    203   u�       J
          0    30666     WorkflowProcessTransitionHistory 
   TABLE DATA               �   COPY "WorkflowProcessTransitionHistory" ("Id", "ProcessId", "ExecutorIdentityId", "ActorIdentityId", "FromActivityName", "ToActivityName", "ToStateName", "TransitionTime", "TransitionClassifier", "FromStateName", "TriggerName", "IsFinalised") FROM stdin;
    public       postgres    false    204   ��       K
          0    30677    WorkflowScheme 
   TABLE DATA               5   COPY "WorkflowScheme" ("Code", "Scheme") FROM stdin;
    public       postgres    false    205   �       6
          0    30410    dwAppSettings 
   TABLE DATA               p   COPY "dwAppSettings" ("Name", "Value", "GroupName", "ParamName", "Order", "EditorType", "IsHidden") FROM stdin;
    public       postgres    false    181   >�       ?
          0    30508    dwSecurityCredential 
   TABLE DATA               �   COPY "dwSecurityCredential" ("Id", "PasswordHash", "PasswordSalt", "SecurityUserId", "Login", "AuthenticationType") FROM stdin;
    public       postgres    false    190   ��       8
          0    30437    dwSecurityGroup 
   TABLE DATA               V   COPY "dwSecurityGroup" ("Id", "Name", "Comment", "IsSyncWithDomainGroup") FROM stdin;
    public       postgres    false    183   ��       B
          0    30551    dwSecurityGroupToSecurityRole 
   TABLE DATA               ]   COPY "dwSecurityGroupToSecurityRole" ("Id", "SecurityRoleId", "SecurityGroupId") FROM stdin;
    public       postgres    false    193   �       C
          0    30566    dwSecurityGroupToSecurityUser 
   TABLE DATA               ]   COPY "dwSecurityGroupToSecurityUser" ("Id", "SecurityUserId", "SecurityGroupId") FROM stdin;
    public       postgres    false    194   .�       :
          0    30451    dwSecurityPermission 
   TABLE DATA               J   COPY "dwSecurityPermission" ("Id", "Code", "Name", "GroupId") FROM stdin;
    public       postgres    false    185   K�       9
          0    30446    dwSecurityPermissionGroup 
   TABLE DATA               D   COPY "dwSecurityPermissionGroup" ("Id", "Name", "Code") FROM stdin;
    public       postgres    false    184   h�       ;
          0    30461    dwSecurityRole 
   TABLE DATA               S   COPY "dwSecurityRole" ("Id", "Code", "Name", "Comment", "DomainGroup") FROM stdin;
    public       postgres    false    186   ��       <
          0    30469 "   dwSecurityRoleToSecurityPermission 
   TABLE DATA               u   COPY "dwSecurityRoleToSecurityPermission" ("Id", "SecurityRoleId", "SecurityPermissionId", "AccessType") FROM stdin;
    public       postgres    false    187   C�       =
          0    30485    dwSecurityUser 
   TABLE DATA               �   COPY "dwSecurityUser" ("Id", "Name", "Email", "IsLocked", "ExternalId", "Timezone", "Localization", "DecimalSeparator", "PageSize", "StartPage", "IsRTL", "StructDivisionId", "IsHead") FROM stdin;
    public       postgres    false    188   `�       @
          0    30521    dwSecurityUserImpersonation 
   TABLE DATA               s   COPY "dwSecurityUserImpersonation" ("Id", "SecurityUserId", "ImpSecurityUserId", "DateFrom", "DateTo") FROM stdin;
    public       postgres    false    191   ��       >
          0    30495    dwSecurityUserState 
   TABLE DATA               P   COPY "dwSecurityUserState" ("Id", "SecurityUserId", "Key", "Value") FROM stdin;
    public       postgres    false    189   ��       A
          0    30536    dwSecurityUserToSecurityRole 
   TABLE DATA               [   COPY "dwSecurityUserToSecurityRole" ("Id", "SecurityRoleId", "SecurityUserId") FROM stdin;
    public       postgres    false    192   �       7
          0    30428    dwUploadedFiles 
   TABLE DATA               �   COPY "dwUploadedFiles" ("Id", "Data", "Used", "ObjectId", "Name", "TableName", "CreatedBy", "CreatedDate", "AttachmentLength") FROM stdin;
    public       postgres    false    182   j�       \
           0    0 #   DocumentTransitionHistory_Order_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"DocumentTransitionHistory_Order_seq"', 21, true);
            public       postgres    false    210            ]
           0    0    Document_Number_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"Document_Number_seq"', 3, true);
            public       postgres    false    208            �	           2606    30740 8   DocumentTransitionHistory DocumentTransitionHistory_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY "DocumentTransitionHistory"
    ADD CONSTRAINT "DocumentTransitionHistory_pkey" PRIMARY KEY ("Id");
 f   ALTER TABLE ONLY public."DocumentTransitionHistory" DROP CONSTRAINT "DocumentTransitionHistory_pkey";
       public         postgres    false    211            �	           2606    30719    Document Document_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY "Document"
    ADD CONSTRAINT "Document_pkey" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Document" DROP CONSTRAINT "Document_pkey";
       public         postgres    false    209            �	           2606    30698 "   StructDivision StructDivision_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "StructDivision"
    ADD CONSTRAINT "StructDivision_pkey" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."StructDivision" DROP CONSTRAINT "StructDivision_pkey";
       public         postgres    false    207            �	           2606    30692 4   WorkflowGlobalParameter WorkflowGlobalParameter_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY "WorkflowGlobalParameter"
    ADD CONSTRAINT "WorkflowGlobalParameter_pkey" PRIMARY KEY ("Id");
 b   ALTER TABLE ONLY public."WorkflowGlobalParameter" DROP CONSTRAINT "WorkflowGlobalParameter_pkey";
       public         postgres    false    206            �	           2606    30619     WorkflowInbox WorkflowInbox_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY "WorkflowInbox"
    ADD CONSTRAINT "WorkflowInbox_pkey" PRIMARY KEY ("Id");
 N   ALTER TABLE ONLY public."WorkflowInbox" DROP CONSTRAINT "WorkflowInbox_pkey";
       public         postgres    false    198            �	           2606    30638 J   WorkflowProcessInstancePersistence WorkflowProcessInstancePersistence_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "WorkflowProcessInstancePersistence"
    ADD CONSTRAINT "WorkflowProcessInstancePersistence_pkey" PRIMARY KEY ("Id");
 x   ALTER TABLE ONLY public."WorkflowProcessInstancePersistence" DROP CONSTRAINT "WorkflowProcessInstancePersistence_pkey";
       public         postgres    false    200            �	           2606    30644 @   WorkflowProcessInstanceStatus WorkflowProcessInstanceStatus_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "WorkflowProcessInstanceStatus"
    ADD CONSTRAINT "WorkflowProcessInstanceStatus_pkey" PRIMARY KEY ("Id");
 n   ALTER TABLE ONLY public."WorkflowProcessInstanceStatus" DROP CONSTRAINT "WorkflowProcessInstanceStatus_pkey";
       public         postgres    false    201            �	           2606    30629 4   WorkflowProcessInstance WorkflowProcessInstance_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY "WorkflowProcessInstance"
    ADD CONSTRAINT "WorkflowProcessInstance_pkey" PRIMARY KEY ("Id");
 b   ALTER TABLE ONLY public."WorkflowProcessInstance" DROP CONSTRAINT "WorkflowProcessInstance_pkey";
       public         postgres    false    199            �	           2606    30653 0   WorkflowProcessScheme WorkflowProcessScheme_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY "WorkflowProcessScheme"
    ADD CONSTRAINT "WorkflowProcessScheme_pkey" PRIMARY KEY ("Id");
 ^   ALTER TABLE ONLY public."WorkflowProcessScheme" DROP CONSTRAINT "WorkflowProcessScheme_pkey";
       public         postgres    false    202            �	           2606    30661 .   WorkflowProcessTimer WorkflowProcessTimer_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY "WorkflowProcessTimer"
    ADD CONSTRAINT "WorkflowProcessTimer_pkey" PRIMARY KEY ("Id");
 \   ALTER TABLE ONLY public."WorkflowProcessTimer" DROP CONSTRAINT "WorkflowProcessTimer_pkey";
       public         postgres    false    203            �	           2606    30673 F   WorkflowProcessTransitionHistory WorkflowProcessTransitionHistory_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "WorkflowProcessTransitionHistory"
    ADD CONSTRAINT "WorkflowProcessTransitionHistory_pkey" PRIMARY KEY ("Id");
 t   ALTER TABLE ONLY public."WorkflowProcessTransitionHistory" DROP CONSTRAINT "WorkflowProcessTransitionHistory_pkey";
       public         postgres    false    204            �	           2606    30684 "   WorkflowScheme WorkflowScheme_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "WorkflowScheme"
    ADD CONSTRAINT "WorkflowScheme_pkey" PRIMARY KEY ("Code");
 P   ALTER TABLE ONLY public."WorkflowScheme" DROP CONSTRAINT "WorkflowScheme_pkey";
       public         postgres    false    205            i	           2606    30419     dwAppSettings dwAppSettings_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "dwAppSettings"
    ADD CONSTRAINT "dwAppSettings_pkey" PRIMARY KEY ("Name");
 N   ALTER TABLE ONLY public."dwAppSettings" DROP CONSTRAINT "dwAppSettings_pkey";
       public         postgres    false    181            {	           2606    30515 .   dwSecurityCredential dwSecurityCredential_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY "dwSecurityCredential"
    ADD CONSTRAINT "dwSecurityCredential_pkey" PRIMARY KEY ("Id");
 \   ALTER TABLE ONLY public."dwSecurityCredential" DROP CONSTRAINT "dwSecurityCredential_pkey";
       public         postgres    false    190            �	           2606    30555 @   dwSecurityGroupToSecurityRole dwSecurityGroupToSecurityRole_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "dwSecurityGroupToSecurityRole"
    ADD CONSTRAINT "dwSecurityGroupToSecurityRole_pkey" PRIMARY KEY ("Id");
 n   ALTER TABLE ONLY public."dwSecurityGroupToSecurityRole" DROP CONSTRAINT "dwSecurityGroupToSecurityRole_pkey";
       public         postgres    false    193            �	           2606    30570 @   dwSecurityGroupToSecurityUser dwSecurityGroupToSecurityUser_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "dwSecurityGroupToSecurityUser"
    ADD CONSTRAINT "dwSecurityGroupToSecurityUser_pkey" PRIMARY KEY ("Id");
 n   ALTER TABLE ONLY public."dwSecurityGroupToSecurityUser" DROP CONSTRAINT "dwSecurityGroupToSecurityUser_pkey";
       public         postgres    false    194            m	           2606    30445 $   dwSecurityGroup dwSecurityGroup_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "dwSecurityGroup"
    ADD CONSTRAINT "dwSecurityGroup_pkey" PRIMARY KEY ("Id");
 R   ALTER TABLE ONLY public."dwSecurityGroup" DROP CONSTRAINT "dwSecurityGroup_pkey";
       public         postgres    false    183            o	           2606    30450 8   dwSecurityPermissionGroup dwSecurityPermissionGroup_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY "dwSecurityPermissionGroup"
    ADD CONSTRAINT "dwSecurityPermissionGroup_pkey" PRIMARY KEY ("Id");
 f   ALTER TABLE ONLY public."dwSecurityPermissionGroup" DROP CONSTRAINT "dwSecurityPermissionGroup_pkey";
       public         postgres    false    184            q	           2606    30455 .   dwSecurityPermission dwSecurityPermission_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY "dwSecurityPermission"
    ADD CONSTRAINT "dwSecurityPermission_pkey" PRIMARY KEY ("Id");
 \   ALTER TABLE ONLY public."dwSecurityPermission" DROP CONSTRAINT "dwSecurityPermission_pkey";
       public         postgres    false    185            u	           2606    30474 J   dwSecurityRoleToSecurityPermission dwSecurityRoleToSecurityPermission_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityRoleToSecurityPermission"
    ADD CONSTRAINT "dwSecurityRoleToSecurityPermission_pkey" PRIMARY KEY ("Id");
 x   ALTER TABLE ONLY public."dwSecurityRoleToSecurityPermission" DROP CONSTRAINT "dwSecurityRoleToSecurityPermission_pkey";
       public         postgres    false    187            s	           2606    30468 "   dwSecurityRole dwSecurityRole_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "dwSecurityRole"
    ADD CONSTRAINT "dwSecurityRole_pkey" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."dwSecurityRole" DROP CONSTRAINT "dwSecurityRole_pkey";
       public         postgres    false    186            }	           2606    30525 <   dwSecurityUserImpersonation dwSecurityUserImpersonation_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY "dwSecurityUserImpersonation"
    ADD CONSTRAINT "dwSecurityUserImpersonation_pkey" PRIMARY KEY ("Id");
 j   ALTER TABLE ONLY public."dwSecurityUserImpersonation" DROP CONSTRAINT "dwSecurityUserImpersonation_pkey";
       public         postgres    false    191            y	           2606    30502 ,   dwSecurityUserState dwSecurityUserState_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY "dwSecurityUserState"
    ADD CONSTRAINT "dwSecurityUserState_pkey" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."dwSecurityUserState" DROP CONSTRAINT "dwSecurityUserState_pkey";
       public         postgres    false    189            	           2606    30540 >   dwSecurityUserToSecurityRole dwSecurityUserToSecurityRole_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY "dwSecurityUserToSecurityRole"
    ADD CONSTRAINT "dwSecurityUserToSecurityRole_pkey" PRIMARY KEY ("Id");
 l   ALTER TABLE ONLY public."dwSecurityUserToSecurityRole" DROP CONSTRAINT "dwSecurityUserToSecurityRole_pkey";
       public         postgres    false    192            w	           2606    30494 "   dwSecurityUser dwSecurityUser_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "dwSecurityUser"
    ADD CONSTRAINT "dwSecurityUser_pkey" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."dwSecurityUser" DROP CONSTRAINT "dwSecurityUser_pkey";
       public         postgres    false    188            k	           2606    30436 $   dwUploadedFiles dwUploadedFiles_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "dwUploadedFiles"
    ADD CONSTRAINT "dwUploadedFiles_pkey" PRIMARY KEY ("Id");
 R   ALTER TABLE ONLY public."dwUploadedFiles" DROP CONSTRAINT "dwUploadedFiles_pkey";
       public         postgres    false    182            �	           1259    30620    WorkflowInbox_IdentityId_idx    INDEX     [   CREATE INDEX "WorkflowInbox_IdentityId_idx" ON "WorkflowInbox" USING btree ("IdentityId");
 2   DROP INDEX public."WorkflowInbox_IdentityId_idx";
       public         postgres    false    198            �	           1259    30621    WorkflowInbox_ProcessId_idx    INDEX     Y   CREATE INDEX "WorkflowInbox_ProcessId_idx" ON "WorkflowInbox" USING btree ("ProcessId");
 1   DROP INDEX public."WorkflowInbox_ProcessId_idx";
       public         postgres    false    198            �	           1259    30639 0   WorkflowProcessInstancePersistence_ProcessId_idx    INDEX     �   CREATE INDEX "WorkflowProcessInstancePersistence_ProcessId_idx" ON "WorkflowProcessInstancePersistence" USING btree ("ProcessId");
 F   DROP INDEX public."WorkflowProcessInstancePersistence_ProcessId_idx";
       public         postgres    false    200            �	           1259    30645 (   WorkflowProcessInstanceStatus_Status_idx    INDEX     s   CREATE INDEX "WorkflowProcessInstanceStatus_Status_idx" ON "WorkflowProcessInstanceStatus" USING btree ("Status");
 >   DROP INDEX public."WorkflowProcessInstanceStatus_Status_idx";
       public         postgres    false    201            �	           1259    30630 $   WorkflowProcessInstance_SchemeId_idx    INDEX     k   CREATE INDEX "WorkflowProcessInstance_SchemeId_idx" ON "WorkflowProcessInstance" USING btree ("SchemeId");
 :   DROP INDEX public."WorkflowProcessInstance_SchemeId_idx";
       public         postgres    false    199            �	           1259    30654 0   WorkflowProcessScheme_DefiningParametersHash_idx    INDEX     �   CREATE INDEX "WorkflowProcessScheme_DefiningParametersHash_idx" ON "WorkflowProcessScheme" USING btree ("DefiningParametersHash");
 F   DROP INDEX public."WorkflowProcessScheme_DefiningParametersHash_idx";
       public         postgres    false    202            �	           1259    30656 $   WorkflowProcessScheme_IsObsolete_idx    INDEX     k   CREATE INDEX "WorkflowProcessScheme_IsObsolete_idx" ON "WorkflowProcessScheme" USING btree ("IsObsolete");
 :   DROP INDEX public."WorkflowProcessScheme_IsObsolete_idx";
       public         postgres    false    202            �	           1259    30655 $   WorkflowProcessScheme_SchemeCode_idx    INDEX     k   CREATE INDEX "WorkflowProcessScheme_SchemeCode_idx" ON "WorkflowProcessScheme" USING btree ("SchemeCode");
 :   DROP INDEX public."WorkflowProcessScheme_SchemeCode_idx";
       public         postgres    false    202            �	           1259    30665    WorkflowProcessTimer_Ignore_idx    INDEX     a   CREATE INDEX "WorkflowProcessTimer_Ignore_idx" ON "WorkflowProcessTimer" USING btree ("Ignore");
 5   DROP INDEX public."WorkflowProcessTimer_Ignore_idx";
       public         postgres    false    203            �	           1259    30663    WorkflowProcessTimer_Name_idx    INDEX     ]   CREATE INDEX "WorkflowProcessTimer_Name_idx" ON "WorkflowProcessTimer" USING btree ("Name");
 3   DROP INDEX public."WorkflowProcessTimer_Name_idx";
       public         postgres    false    203            �	           1259    30664 .   WorkflowProcessTimer_NextExecutionDateTime_idx    INDEX        CREATE INDEX "WorkflowProcessTimer_NextExecutionDateTime_idx" ON "WorkflowProcessTimer" USING btree ("NextExecutionDateTime");
 D   DROP INDEX public."WorkflowProcessTimer_NextExecutionDateTime_idx";
       public         postgres    false    203            �	           1259    30662 "   WorkflowProcessTimer_ProcessId_idx    INDEX     g   CREATE INDEX "WorkflowProcessTimer_ProcessId_idx" ON "WorkflowProcessTimer" USING btree ("ProcessId");
 8   DROP INDEX public."WorkflowProcessTimer_ProcessId_idx";
       public         postgres    false    203            �	           1259    30676 4   WorkflowProcessTransitionHistory_ActorIdentityId_idx    INDEX     �   CREATE INDEX "WorkflowProcessTransitionHistory_ActorIdentityId_idx" ON "WorkflowProcessTransitionHistory" USING btree ("ActorIdentityId");
 J   DROP INDEX public."WorkflowProcessTransitionHistory_ActorIdentityId_idx";
       public         postgres    false    204            �	           1259    30675 7   WorkflowProcessTransitionHistory_ExecutorIdentityId_idx    INDEX     �   CREATE INDEX "WorkflowProcessTransitionHistory_ExecutorIdentityId_idx" ON "WorkflowProcessTransitionHistory" USING btree ("ExecutorIdentityId");
 M   DROP INDEX public."WorkflowProcessTransitionHistory_ExecutorIdentityId_idx";
       public         postgres    false    204            �	           1259    30674 .   WorkflowProcessTransitionHistory_ProcessId_idx    INDEX        CREATE INDEX "WorkflowProcessTransitionHistory_ProcessId_idx" ON "WorkflowProcessTransitionHistory" USING btree ("ProcessId");
 D   DROP INDEX public."WorkflowProcessTransitionHistory_ProcessId_idx";
       public         postgres    false    204            �	           2606    30741 C   DocumentTransitionHistory DocumentTransitionHistory_DocumentId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "DocumentTransitionHistory"
    ADD CONSTRAINT "DocumentTransitionHistory_DocumentId_fkey" FOREIGN KEY ("DocumentId") REFERENCES "Document"("Id") ON DELETE CASCADE;
 q   ALTER TABLE ONLY public."DocumentTransitionHistory" DROP CONSTRAINT "DocumentTransitionHistory_DocumentId_fkey";
       public       postgres    false    211    209    2472            �	           2606    30746 C   DocumentTransitionHistory DocumentTransitionHistory_EmployeeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "DocumentTransitionHistory"
    ADD CONSTRAINT "DocumentTransitionHistory_EmployeeId_fkey" FOREIGN KEY ("EmployeeId") REFERENCES "dwSecurityUser"("Id");
 q   ALTER TABLE ONLY public."DocumentTransitionHistory" DROP CONSTRAINT "DocumentTransitionHistory_EmployeeId_fkey";
       public       postgres    false    188    2423    211            �	           2606    30720    Document Document_AuthorId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Document"
    ADD CONSTRAINT "Document_AuthorId_fkey" FOREIGN KEY ("AuthorId") REFERENCES "dwSecurityUser"("Id");
 M   ALTER TABLE ONLY public."Document" DROP CONSTRAINT "Document_AuthorId_fkey";
       public       postgres    false    2423    188    209            �	           2606    30725     Document Document_ManagerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Document"
    ADD CONSTRAINT "Document_ManagerId_fkey" FOREIGN KEY ("ManagerId") REFERENCES "dwSecurityUser"("Id");
 N   ALTER TABLE ONLY public."Document" DROP CONSTRAINT "Document_ManagerId_fkey";
       public       postgres    false    188    2423    209            �	           2606    30516 =   dwSecurityCredential dwSecurityCredential_SecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityCredential"
    ADD CONSTRAINT "dwSecurityCredential_SecurityUserId_fkey" FOREIGN KEY ("SecurityUserId") REFERENCES "dwSecurityUser"("Id") ON DELETE CASCADE;
 k   ALTER TABLE ONLY public."dwSecurityCredential" DROP CONSTRAINT "dwSecurityCredential_SecurityUserId_fkey";
       public       postgres    false    2423    190    188            �	           2606    30561 P   dwSecurityGroupToSecurityRole dwSecurityGroupToSecurityRole_SecurityGroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityGroupToSecurityRole"
    ADD CONSTRAINT "dwSecurityGroupToSecurityRole_SecurityGroupId_fkey" FOREIGN KEY ("SecurityGroupId") REFERENCES "dwSecurityGroup"("Id");
 ~   ALTER TABLE ONLY public."dwSecurityGroupToSecurityRole" DROP CONSTRAINT "dwSecurityGroupToSecurityRole_SecurityGroupId_fkey";
       public       postgres    false    193    183    2413            �	           2606    30556 O   dwSecurityGroupToSecurityRole dwSecurityGroupToSecurityRole_SecurityRoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityGroupToSecurityRole"
    ADD CONSTRAINT "dwSecurityGroupToSecurityRole_SecurityRoleId_fkey" FOREIGN KEY ("SecurityRoleId") REFERENCES "dwSecurityRole"("Id");
 }   ALTER TABLE ONLY public."dwSecurityGroupToSecurityRole" DROP CONSTRAINT "dwSecurityGroupToSecurityRole_SecurityRoleId_fkey";
       public       postgres    false    2419    186    193            �	           2606    30576 P   dwSecurityGroupToSecurityUser dwSecurityGroupToSecurityUser_SecurityGroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityGroupToSecurityUser"
    ADD CONSTRAINT "dwSecurityGroupToSecurityUser_SecurityGroupId_fkey" FOREIGN KEY ("SecurityGroupId") REFERENCES "dwSecurityGroup"("Id");
 ~   ALTER TABLE ONLY public."dwSecurityGroupToSecurityUser" DROP CONSTRAINT "dwSecurityGroupToSecurityUser_SecurityGroupId_fkey";
       public       postgres    false    194    183    2413            �	           2606    30571 O   dwSecurityGroupToSecurityUser dwSecurityGroupToSecurityUser_SecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityGroupToSecurityUser"
    ADD CONSTRAINT "dwSecurityGroupToSecurityUser_SecurityUserId_fkey" FOREIGN KEY ("SecurityUserId") REFERENCES "dwSecurityUser"("Id");
 }   ALTER TABLE ONLY public."dwSecurityGroupToSecurityUser" DROP CONSTRAINT "dwSecurityGroupToSecurityUser_SecurityUserId_fkey";
       public       postgres    false    194    2423    188            �	           2606    30456 6   dwSecurityPermission dwSecurityPermission_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityPermission"
    ADD CONSTRAINT "dwSecurityPermission_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "dwSecurityPermissionGroup"("Id") ON DELETE CASCADE;
 d   ALTER TABLE ONLY public."dwSecurityPermission" DROP CONSTRAINT "dwSecurityPermission_GroupId_fkey";
       public       postgres    false    185    2415    184            �	           2606    30480 _   dwSecurityRoleToSecurityPermission dwSecurityRoleToSecurityPermission_SecurityPermissionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityRoleToSecurityPermission"
    ADD CONSTRAINT "dwSecurityRoleToSecurityPermission_SecurityPermissionId_fkey" FOREIGN KEY ("SecurityPermissionId") REFERENCES "dwSecurityPermission"("Id") ON DELETE CASCADE;
 �   ALTER TABLE ONLY public."dwSecurityRoleToSecurityPermission" DROP CONSTRAINT "dwSecurityRoleToSecurityPermission_SecurityPermissionId_fkey";
       public       postgres    false    185    187    2417            �	           2606    30475 Y   dwSecurityRoleToSecurityPermission dwSecurityRoleToSecurityPermission_SecurityRoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityRoleToSecurityPermission"
    ADD CONSTRAINT "dwSecurityRoleToSecurityPermission_SecurityRoleId_fkey" FOREIGN KEY ("SecurityRoleId") REFERENCES "dwSecurityRole"("Id");
 �   ALTER TABLE ONLY public."dwSecurityRoleToSecurityPermission" DROP CONSTRAINT "dwSecurityRoleToSecurityPermission_SecurityRoleId_fkey";
       public       postgres    false    2419    186    187            �	           2606    30531 N   dwSecurityUserImpersonation dwSecurityUserImpersonation_ImpSecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityUserImpersonation"
    ADD CONSTRAINT "dwSecurityUserImpersonation_ImpSecurityUserId_fkey" FOREIGN KEY ("ImpSecurityUserId") REFERENCES "dwSecurityUser"("Id");
 |   ALTER TABLE ONLY public."dwSecurityUserImpersonation" DROP CONSTRAINT "dwSecurityUserImpersonation_ImpSecurityUserId_fkey";
       public       postgres    false    188    191    2423            �	           2606    30526 K   dwSecurityUserImpersonation dwSecurityUserImpersonation_SecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityUserImpersonation"
    ADD CONSTRAINT "dwSecurityUserImpersonation_SecurityUserId_fkey" FOREIGN KEY ("SecurityUserId") REFERENCES "dwSecurityUser"("Id") ON DELETE CASCADE;
 y   ALTER TABLE ONLY public."dwSecurityUserImpersonation" DROP CONSTRAINT "dwSecurityUserImpersonation_SecurityUserId_fkey";
       public       postgres    false    188    2423    191            �	           2606    30503 ;   dwSecurityUserState dwSecurityUserState_SecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityUserState"
    ADD CONSTRAINT "dwSecurityUserState_SecurityUserId_fkey" FOREIGN KEY ("SecurityUserId") REFERENCES "dwSecurityUser"("Id") ON DELETE CASCADE;
 i   ALTER TABLE ONLY public."dwSecurityUserState" DROP CONSTRAINT "dwSecurityUserState_SecurityUserId_fkey";
       public       postgres    false    188    2423    189            �	           2606    30541 M   dwSecurityUserToSecurityRole dwSecurityUserToSecurityRole_SecurityRoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityUserToSecurityRole"
    ADD CONSTRAINT "dwSecurityUserToSecurityRole_SecurityRoleId_fkey" FOREIGN KEY ("SecurityRoleId") REFERENCES "dwSecurityRole"("Id");
 {   ALTER TABLE ONLY public."dwSecurityUserToSecurityRole" DROP CONSTRAINT "dwSecurityUserToSecurityRole_SecurityRoleId_fkey";
       public       postgres    false    186    2419    192            �	           2606    30546 M   dwSecurityUserToSecurityRole dwSecurityUserToSecurityRole_SecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityUserToSecurityRole"
    ADD CONSTRAINT "dwSecurityUserToSecurityRole_SecurityUserId_fkey" FOREIGN KEY ("SecurityUserId") REFERENCES "dwSecurityUser"("Id");
 {   ALTER TABLE ONLY public."dwSecurityUserToSecurityRole" DROP CONSTRAINT "dwSecurityUserToSecurityRole_SecurityUserId_fkey";
       public       postgres    false    192    188    2423            O
      x������ � �      Q
      x������ � �      M
   �   x���1n1�z|�\��a0�$UN���M)��e����/�'{.p�L�֜�k,�܎�9�������G^-;B��#��i���j?��_�X���V��jq�4ދ�ԓ�<�W��6x�ڏ�	zMյ,��\�&]3���W��	���3Vp4ad�oҵ��2��E�}�+���n燸S^	P<�}ԧ[C�
�i�sh]ў&^3�R�Ɛ�      L
      x������ � �      D
   �   x��A�E1�/{�"�^zB�_B3uo)����G3@�7$���2���+�s���7<<7�����W�|N�)M���Gn���>7�K:t�:��&�I�l,y��v��(�4z�n6�\;iDϑ���g��~�}:�wK��[�Y�>����Y��\q;o=_(O����r�꾶�����+��4��%>�+��� �
�����=���o��G�T�      E
   �   x�Ց�n�0Dg�_�%�k:�C
t�BI���Ac������;v!p��w�-XΒ�|�@���A�`L,�0G�u���4��<>J���/z�ȄA|1��"�\b6^��:]擽�lY����������Q7�8,50�r+wH
�h�1��0��pY�/�������i5|2m��RQ��{���+�־�(��F�%���-8�sνL��$      F
      x������ � �      G
   �   x���� D��S (��^!�ֹ�z�t������0�L`D�H���g~TW�$Y���ek�
qfjy�T]�0�E7����6�c�,fl�ݠ�!�0�p��mg������ۊ�	���+l����e��@������˖�1��c�7�9�      H
   T  x��Zmo�8�LE��Ro	V�B�E�m��[�Re�@}l�q`����s;1!���EU+��3c?Of&vL���ⰒWƥ\�\�0�\ݮV̊5�X`f]Fmp]�M���G6☒|�����0mp� 3�ifs�Y�_�?U�7��9en�jI���,k�<G�:n���W�{�x�CiJ̾AM ezԱ}�G<�H]W�o=���G��ER�_�6�G�o֠����׶��EL��oO$�VZt�/)k�3��/]Ӌ>g�L���2<G.Z��g<<7�FT�|Q�΍��p�A���r΍�7t��,���e�]���! ˪��
��QW��tFb�x		������Eȶ\B�#���#��"u���k��	='������F��9�p�c$����3�I��l>�n#/�N_��l��ު�=�l�V��"<z#�G-�d�T��Sd4�Q�	���ȉ�Y�b�q#n)��cx����r7Z�z05s~��s�1�ח,��y���!��!�W����v�P�����y:#ڔ��K=j��o?���Fq���t怿�YV�qߑ�q�F�ĶhX����>���q��إ�	�~����g�������J�YԴ
Z��+�6�)Ӟ��
ǤX�/���X*>A�&�����BP|��1,�Ĕ�w� ���>8ʤ'˾8)�ɷ`e�w_a��¨��F�D\E�Ԕ��fh��rts�s��t=���x������̗�C-J�" ���̻$BOO(e����|��iD@�oQxl��dSe.v��Q��}��FΨ�F�ۮ��v-)��j�6��[G:U��O&��]ʤrYDk��̊�5=�x�tݑ4r}����+,Vj2X:cFm��j�~T�}4�R2Cȱd��9�/2�~����cK1��4�Yf5�X�Vړc�8���N�m�b�ȰWbe���.�G�r�(�i�e$K�5I�d�z��[�YX��c�1����s��]������өߣg�Z	c`q_z��[����I����T�:;����s�:����%yVxY=��t'����ݱ_T03��Asm�����l�5z�L�M��D�6��,GgB�ܓ	�rʫ��qTH��z��s��M���MpKy4��$�J־�L#�>�l�N2��>Ɏ���f9�Y}[��4�3���ꧼJ��Qy-��շ+Y �/��q7�� ��S^�K��&��C�L��կ�vیP���j�,m��Ye���Q��1X�uXÛ�ʤu�-l���҉��*�K�����E���-G��܇̯�2����j�_���j	�kg�lf�͌3��/�G�={�8;;�Bgo      I
      x������ � �      J
   q  x�͓�n1���S�h�)�ޚv�� ��Pi�b��k����E g�� E����K�0�uE�`:��S�4^�HV�����ZA� �*�*-<?3RA��h� �8�Xk��k��]��z�n�~�m����6�ozѳm����^��eX`r��	����X9��uݬ�o�}�u�_�����in`�(P��I^��0S�$��*�N{�HN�$`�	��0��
i,,�R-��'1$��-��QY2�q�4�������R�5ݡ>�����F������~q7����v�c�س���P)�=s��Du�����R����r��B�0��0(UI�c��|Ǆi�����x8�i�5�      K
     x��ZmS"9�|����슀
V�U���Q�*�wWe�g�9$\��e�%3I�E=<��ও�N�y��\#	L� �	��_nȍh���s�M��^g����1��:�'��g��T���_�?'�o��x�2�[���vBqO���@�z��z��0�k��#і��4���9���3��h�ރ�0��/�ϣ!��r�1v]*��i������ʴ�.�*�\g����p�L��a2�wt���	8�R_�ݾs-uJ��G��߾�2hC�������} �nx�5����F�)��lF�49��2�iG���RE�O��%ڑ�@L%s��];H�Y(
�"��W��51��Q���`������e�J�t��v��'_�Mg6ct�ߑ��x�~��ߝ�mE#<�|��/�?�68��G��9
l�N1	��T\́1�Co��;�[���rƤ�sx��l�V�Eqb�2���w�Ot�x�H�(�!���瘨�y<%٦lB�1�db�C���m�'=��� ��,�j�j2c�������5�"�a��5��H��,�/S&|�^��k���W��J�2�Y��j�0��*�R�u*5�� ��M �A����k�b��FӼx��cz�6��Ȕ�`��ѱ����ϐ��Y�<u��$�%���,�u����W�
�Z��L']�Yaa��=ch,n�k#Z^]�3:]��� q��X���Γ�w��>v)���D��R�C���Tʰ'���܏(����&p�QBASTc���e�\�Kj�fD 3����{tI��"�=�"_�R'����j�lO�����]�d��ܺ�<����?k�M�NY~&<{�{�z��p��jX�Yb��+�4���vJ��G�^�I��g�"��{��IĽZ���rq�$�g��T����{���
̻��1_R�<��Nk:1��<�rqPS0�v����/.)�G|�h_�~��;�H���Y{�dmU���1��m��0G^��</c��U�;�&�S�I��E����qC�����ŗ���nVޤbܞ͊	~����svmݜ}I�p�j���"��Iǥ���q�^]��|�&v�-&E�c���2�FX��p��xMM�z�@���{I6|�{6!���''U�b��>��"{���z(�?�g�F
��BL���6���N�����u��Ԫ�
�Z���vV��;�Fk���͖��j$|-O"@�1��qXԵi�e{Bm�tK�Q�����RZ����A�#y��Dwu��c��������{���      6
   L   x�s,(��LN,���sI-N��tD(���d�s���2@�����i\H��sS9]½3K�k��u��qqq J�&p      ?
   J  x����J1���w�6mڦ��]�(�(nқ�:�w}{s|�a�袴?�o1��`�� 5� Uj��UK%�>\��|?o�z:����a��q����v�O?�Y�����qN�u<����v�d�G*�;�R��B����A�<=f��]l�r�@��)����r'�V:E�OO_ӯ�$�zU��9�@�m8��I��+%��gy�{QGm���$u�^�
9c+�[&[V:E�򣊄�f���KA��� hB6�h\ŰR�(���~W�F������:C��1`D�ą:�JƢh��_����zũ�w߅y�%�އ�S��X��Ge��m6�?'�      8
      x������ � �      B
      x������ � �      C
      x������ � �      :
      x������ � �      9
      x������ � �      ;
   �   x�M���1D��+���gK� ��hb'F�H,�?˭N:i4�!/hz-�	�!�\f7��=�c��-�_�X{�:t �R��&Pi
��������v�:����y9o�L	���vHH�d�	��Q�5G��ky����!w׬�%
�&�9��%��f����u<v�K�C��1�@k      <
      x������ � �      =
   i  x�����1E�1�=�c�4���NO�����Ǐ��h��H���s=��������]0���zi�c�Ϸ��������]�����d�+"�����Onv��}�v�1��%��/���C��a�oȽe�Lk܏���-��iy��L��.�V���������
�>��%K�@�"#�BH�Gq��}XUX���&��#��)���c#Gξ�{[pT��
4�}_�T����V�I>`2NؓɮѮ�r�~����il�e� ƨ�8زR��_���v����DkT��a��H���������"�,Z�҃A��c�e6IP��+@QI-���t������{�Ԇޭ>�'T�O����	�ش�      @
      x������ � �      >
      x������ � �      A
   G  x����1D��^�?�����^��f�G����،ْ�y0�d��1@��v�Iv%�YӸ������= �GN�e�/��&���4��e)��ۑ�i�C8Q)'����5����>�KdwA�u��
L� qR�]����XU��C�b�
�	��Neک��>�E\1)kȒƹ��	��Y���K���,��Hw��1�]F�{���u�މ�]v'�V��m�9UEc���v?��;1Ǖ:��ybwQ�����v{����]v����"�f�4���g��5���w��Q�;��4�Ҏ+������� �      7
      x������ � �     