PGDMP  7                    |           keycloak    15.5    16.2 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    keycloak    DATABASE     s   CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE keycloak;
                postgres    false            �            1259    17022    admin_event_entity    TABLE     �  CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);
 &   DROP TABLE public.admin_event_entity;
       public         heap    postgres    false                       1259    17465    associated_policy    TABLE     �   CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);
 %   DROP TABLE public.associated_policy;
       public         heap    postgres    false                       1259    17037    authentication_execution    TABLE     �  CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);
 ,   DROP TABLE public.authentication_execution;
       public         heap    postgres    false                       1259    17032    authentication_flow    TABLE     t  CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.authentication_flow;
       public         heap    postgres    false                        1259    17027    authenticator_config    TABLE     �   CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);
 (   DROP TABLE public.authenticator_config;
       public         heap    postgres    false                       1259    17042    authenticator_config_entry    TABLE     �   CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 .   DROP TABLE public.authenticator_config_entry;
       public         heap    postgres    false                       1259    17480    broker_link    TABLE     L  CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);
    DROP TABLE public.broker_link;
       public         heap    postgres    false            �            1259    16403    client    TABLE     �  CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16761    client_attributes    TABLE     �   CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 %   DROP TABLE public.client_attributes;
       public         heap    postgres    false            (           1259    17729    client_auth_flow_bindings    TABLE     �   CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);
 -   DROP TABLE public.client_auth_flow_bindings;
       public         heap    postgres    false            '           1259    17604    client_initial_access    TABLE     �   CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);
 )   DROP TABLE public.client_initial_access;
       public         heap    postgres    false            �            1259    16771    client_node_registrations    TABLE     �   CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);
 -   DROP TABLE public.client_node_registrations;
       public         heap    postgres    false                       1259    17270    client_scope    TABLE     �   CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);
     DROP TABLE public.client_scope;
       public         heap    postgres    false                       1259    17284    client_scope_attributes    TABLE     �   CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);
 +   DROP TABLE public.client_scope_attributes;
       public         heap    postgres    false            )           1259    17770    client_scope_client    TABLE     �   CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.client_scope_client;
       public         heap    postgres    false                       1259    17289    client_scope_role_mapping    TABLE     �   CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);
 -   DROP TABLE public.client_scope_role_mapping;
       public         heap    postgres    false            �            1259    16414    client_session    TABLE     �  CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);
 "   DROP TABLE public.client_session;
       public         heap    postgres    false                       1259    17060    client_session_auth_status    TABLE     �   CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);
 .   DROP TABLE public.client_session_auth_status;
       public         heap    postgres    false            �            1259    16766    client_session_note    TABLE     �   CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);
 '   DROP TABLE public.client_session_note;
       public         heap    postgres    false            �            1259    16944    client_session_prot_mapper    TABLE     �   CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);
 .   DROP TABLE public.client_session_prot_mapper;
       public         heap    postgres    false            �            1259    16419    client_session_role    TABLE     �   CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);
 '   DROP TABLE public.client_session_role;
       public         heap    postgres    false                       1259    17141    client_user_session_note    TABLE     �   CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);
 ,   DROP TABLE public.client_user_session_note;
       public         heap    postgres    false            %           1259    17525 	   component    TABLE     )  CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);
    DROP TABLE public.component;
       public         heap    postgres    false            $           1259    17520    component_config    TABLE     �   CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 $   DROP TABLE public.component_config;
       public         heap    postgres    false            �            1259    16422    composite_role    TABLE     �   CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);
 "   DROP TABLE public.composite_role;
       public         heap    postgres    false            �            1259    16425 
   credential    TABLE     $  CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);
    DROP TABLE public.credential;
       public         heap    postgres    false            �            1259    16395    databasechangelog    TABLE     Y  CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);
 %   DROP TABLE public.databasechangelog;
       public         heap    postgres    false            �            1259    16390    databasechangeloglock    TABLE     �   CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);
 )   DROP TABLE public.databasechangeloglock;
       public         heap    postgres    false            *           1259    17786    default_client_scope    TABLE     �   CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);
 (   DROP TABLE public.default_client_scope;
       public         heap    postgres    false            �            1259    16430    event_entity    TABLE     �  CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);
     DROP TABLE public.event_entity;
       public         heap    postgres    false                       1259    17485    fed_user_attribute    TABLE     (  CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);
 &   DROP TABLE public.fed_user_attribute;
       public         heap    postgres    false                       1259    17490    fed_user_consent    TABLE     �  CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);
 $   DROP TABLE public.fed_user_consent;
       public         heap    postgres    false            ,           1259    17812    fed_user_consent_cl_scope    TABLE     �   CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 -   DROP TABLE public.fed_user_consent_cl_scope;
       public         heap    postgres    false                        1259    17499    fed_user_credential    TABLE     �  CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);
 '   DROP TABLE public.fed_user_credential;
       public         heap    postgres    false            !           1259    17508    fed_user_group_membership    TABLE     �   CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 -   DROP TABLE public.fed_user_group_membership;
       public         heap    postgres    false            "           1259    17511    fed_user_required_action    TABLE       CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 ,   DROP TABLE public.fed_user_required_action;
       public         heap    postgres    false            #           1259    17517    fed_user_role_mapping    TABLE     �   CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 )   DROP TABLE public.fed_user_role_mapping;
       public         heap    postgres    false            �            1259    16807    federated_identity    TABLE       CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);
 &   DROP TABLE public.federated_identity;
       public         heap    postgres    false            &           1259    17582    federated_user    TABLE     �   CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);
 "   DROP TABLE public.federated_user;
       public         heap    postgres    false                       1259    17209    group_attribute    TABLE       CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);
 #   DROP TABLE public.group_attribute;
       public         heap    postgres    false                       1259    17206    group_role_mapping    TABLE     �   CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);
 &   DROP TABLE public.group_role_mapping;
       public         heap    postgres    false            �            1259    16812    identity_provider    TABLE     �  CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);
 %   DROP TABLE public.identity_provider;
       public         heap    postgres    false            �            1259    16821    identity_provider_config    TABLE     �   CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 ,   DROP TABLE public.identity_provider_config;
       public         heap    postgres    false            �            1259    16925    identity_provider_mapper    TABLE       CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);
 ,   DROP TABLE public.identity_provider_mapper;
       public         heap    postgres    false            �            1259    16930    idp_mapper_config    TABLE     �   CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.idp_mapper_config;
       public         heap    postgres    false                       1259    17203    keycloak_group    TABLE     �   CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);
 "   DROP TABLE public.keycloak_group;
       public         heap    postgres    false            �            1259    16438    keycloak_role    TABLE     b  CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);
 !   DROP TABLE public.keycloak_role;
       public         heap    postgres    false            �            1259    16922    migration_model    TABLE     �   CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.migration_model;
       public         heap    postgres    false                       1259    17194    offline_client_session    TABLE     �  CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);
 *   DROP TABLE public.offline_client_session;
       public         heap    postgres    false            
           1259    17189    offline_user_session    TABLE     P  CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);
 (   DROP TABLE public.offline_user_session;
       public         heap    postgres    false                       1259    17408    policy_config    TABLE     �   CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 !   DROP TABLE public.policy_config;
       public         heap    postgres    false            �            1259    16796    protocol_mapper    TABLE     1  CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);
 #   DROP TABLE public.protocol_mapper;
       public         heap    postgres    false            �            1259    16802    protocol_mapper_config    TABLE     �   CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.protocol_mapper_config;
       public         heap    postgres    false            �            1259    16444    realm    TABLE     �	  CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);
    DROP TABLE public.realm;
       public         heap    postgres    false            �            1259    16461    realm_attribute    TABLE     �   CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);
 #   DROP TABLE public.realm_attribute;
       public         heap    postgres    false                       1259    17218    realm_default_groups    TABLE     �   CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);
 (   DROP TABLE public.realm_default_groups;
       public         heap    postgres    false            �            1259    16914    realm_enabled_event_types    TABLE     �   CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 -   DROP TABLE public.realm_enabled_event_types;
       public         heap    postgres    false            �            1259    16469    realm_events_listeners    TABLE     �   CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 *   DROP TABLE public.realm_events_listeners;
       public         heap    postgres    false            1           1259    17920    realm_localizations    TABLE     �   CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);
 '   DROP TABLE public.realm_localizations;
       public         heap    postgres    false            �            1259    16472    realm_required_credential    TABLE       CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);
 -   DROP TABLE public.realm_required_credential;
       public         heap    postgres    false            �            1259    16479    realm_smtp_config    TABLE     �   CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.realm_smtp_config;
       public         heap    postgres    false            �            1259    16830    realm_supported_locales    TABLE     �   CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 +   DROP TABLE public.realm_supported_locales;
       public         heap    postgres    false            �            1259    16489    redirect_uris    TABLE        CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 !   DROP TABLE public.redirect_uris;
       public         heap    postgres    false            	           1259    17153    required_action_config    TABLE     �   CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.required_action_config;
       public         heap    postgres    false                       1259    17146    required_action_provider    TABLE     \  CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);
 ,   DROP TABLE public.required_action_provider;
       public         heap    postgres    false            .           1259    17851    resource_attribute    TABLE       CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);
 &   DROP TABLE public.resource_attribute;
       public         heap    postgres    false                       1259    17435    resource_policy    TABLE     �   CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);
 #   DROP TABLE public.resource_policy;
       public         heap    postgres    false                       1259    17420    resource_scope    TABLE     �   CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 "   DROP TABLE public.resource_scope;
       public         heap    postgres    false                       1259    17358    resource_server    TABLE     �   CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);
 #   DROP TABLE public.resource_server;
       public         heap    postgres    false            -           1259    17827    resource_server_perm_ticket    TABLE     �  CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);
 /   DROP TABLE public.resource_server_perm_ticket;
       public         heap    postgres    false                       1259    17394    resource_server_policy    TABLE     _  CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);
 *   DROP TABLE public.resource_server_policy;
       public         heap    postgres    false                       1259    17366    resource_server_resource    TABLE     �  CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);
 ,   DROP TABLE public.resource_server_resource;
       public         heap    postgres    false                       1259    17380    resource_server_scope    TABLE       CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);
 )   DROP TABLE public.resource_server_scope;
       public         heap    postgres    false            /           1259    17869    resource_uris    TABLE     �   CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 !   DROP TABLE public.resource_uris;
       public         heap    postgres    false            0           1259    17879    role_attribute    TABLE     �   CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);
 "   DROP TABLE public.role_attribute;
       public         heap    postgres    false            �            1259    16492    scope_mapping    TABLE     �   CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);
 !   DROP TABLE public.scope_mapping;
       public         heap    postgres    false                       1259    17450    scope_policy    TABLE     �   CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);
     DROP TABLE public.scope_policy;
       public         heap    postgres    false            �            1259    16498    user_attribute    TABLE     �   CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);
 "   DROP TABLE public.user_attribute;
       public         heap    postgres    false            �            1259    16935    user_consent    TABLE     7  CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);
     DROP TABLE public.user_consent;
       public         heap    postgres    false            +           1259    17802    user_consent_client_scope    TABLE     �   CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 -   DROP TABLE public.user_consent_client_scope;
       public         heap    postgres    false            �            1259    16503    user_entity    TABLE     =  CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.user_entity;
       public         heap    postgres    false            �            1259    16511    user_federation_config    TABLE     �   CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.user_federation_config;
       public         heap    postgres    false                       1259    17047    user_federation_mapper    TABLE     $  CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);
 *   DROP TABLE public.user_federation_mapper;
       public         heap    postgres    false                       1259    17052    user_federation_mapper_config    TABLE     �   CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 1   DROP TABLE public.user_federation_mapper_config;
       public         heap    postgres    false            �            1259    16516    user_federation_provider    TABLE     ;  CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);
 ,   DROP TABLE public.user_federation_provider;
       public         heap    postgres    false                       1259    17215    user_group_membership    TABLE     �   CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);
 )   DROP TABLE public.user_group_membership;
       public         heap    postgres    false            �            1259    16521    user_required_action    TABLE     �   CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);
 (   DROP TABLE public.user_required_action;
       public         heap    postgres    false            �            1259    16524    user_role_mapping    TABLE     �   CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);
 %   DROP TABLE public.user_role_mapping;
       public         heap    postgres    false            �            1259    16527    user_session    TABLE     �  CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);
     DROP TABLE public.user_session;
       public         heap    postgres    false            �            1259    16833    user_session_note    TABLE     �   CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);
 %   DROP TABLE public.user_session_note;
       public         heap    postgres    false            �            1259    16495    username_login_failure    TABLE       CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);
 *   DROP TABLE public.username_login_failure;
       public         heap    postgres    false            �            1259    16538    web_origins    TABLE     }   CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
    DROP TABLE public.web_origins;
       public         heap    postgres    false            �          0    17022    admin_event_entity 
   TABLE DATA                 public          postgres    false    255   R      �          0    17465    associated_policy 
   TABLE DATA                 public          postgres    false    284   �R      �          0    17037    authentication_execution 
   TABLE DATA                 public          postgres    false    258   �R      �          0    17032    authentication_flow 
   TABLE DATA                 public          postgres    false    257   Eb      �          0    17027    authenticator_config 
   TABLE DATA                 public          postgres    false    256   *i      �          0    17042    authenticator_config_entry 
   TABLE DATA                 public          postgres    false    259   Kj      �          0    17480    broker_link 
   TABLE DATA                 public          postgres    false    285   ak      ^          0    16403    client 
   TABLE DATA                 public          postgres    false    216   {k      u          0    16761    client_attributes 
   TABLE DATA                 public          postgres    false    239   �n      �          0    17729    client_auth_flow_bindings 
   TABLE DATA                 public          postgres    false    296   �p      �          0    17604    client_initial_access 
   TABLE DATA                 public          postgres    false    295   �p      w          0    16771    client_node_registrations 
   TABLE DATA                 public          postgres    false    241   �p      �          0    17270    client_scope 
   TABLE DATA                 public          postgres    false    273   �p      �          0    17284    client_scope_attributes 
   TABLE DATA                 public          postgres    false    274   �t      �          0    17770    client_scope_client 
   TABLE DATA                 public          postgres    false    297   
x      �          0    17289    client_scope_role_mapping 
   TABLE DATA                 public          postgres    false    275   �|      _          0    16414    client_session 
   TABLE DATA                 public          postgres    false    217   �}      �          0    17060    client_session_auth_status 
   TABLE DATA                 public          postgres    false    262   �}      v          0    16766    client_session_note 
   TABLE DATA                 public          postgres    false    240   �}      �          0    16944    client_session_prot_mapper 
   TABLE DATA                 public          postgres    false    254   ~      `          0    16419    client_session_role 
   TABLE DATA                 public          postgres    false    218   )~      �          0    17141    client_user_session_note 
   TABLE DATA                 public          postgres    false    263   C~      �          0    17525 	   component 
   TABLE DATA                 public          postgres    false    293   ]~      �          0    17520    component_config 
   TABLE DATA                 public          postgres    false    292   Ƃ      a          0    16422    composite_role 
   TABLE DATA                 public          postgres    false    219   ��      b          0    16425 
   credential 
   TABLE DATA                 public          postgres    false    220   �      ]          0    16395    databasechangelog 
   TABLE DATA                 public          postgres    false    215   ��      \          0    16390    databasechangeloglock 
   TABLE DATA                 public          postgres    false    214   ��      �          0    17786    default_client_scope 
   TABLE DATA                 public          postgres    false    298   �      c          0    16430    event_entity 
   TABLE DATA                 public          postgres    false    221   ��      �          0    17485    fed_user_attribute 
   TABLE DATA                 public          postgres    false    286   ��      �          0    17490    fed_user_consent 
   TABLE DATA                 public          postgres    false    287   ��      �          0    17812    fed_user_consent_cl_scope 
   TABLE DATA                 public          postgres    false    300   ��      �          0    17499    fed_user_credential 
   TABLE DATA                 public          postgres    false    288   ��      �          0    17508    fed_user_group_membership 
   TABLE DATA                 public          postgres    false    289   �      �          0    17511    fed_user_required_action 
   TABLE DATA                 public          postgres    false    290   (�      �          0    17517    fed_user_role_mapping 
   TABLE DATA                 public          postgres    false    291   B�      z          0    16807    federated_identity 
   TABLE DATA                 public          postgres    false    244   \�      �          0    17582    federated_user 
   TABLE DATA                 public          postgres    false    294   v�      �          0    17209    group_attribute 
   TABLE DATA                 public          postgres    false    270   ��      �          0    17206    group_role_mapping 
   TABLE DATA                 public          postgres    false    269   ��      {          0    16812    identity_provider 
   TABLE DATA                 public          postgres    false    245   ��      |          0    16821    identity_provider_config 
   TABLE DATA                 public          postgres    false    246   ��      �          0    16925    identity_provider_mapper 
   TABLE DATA                 public          postgres    false    251   ��      �          0    16930    idp_mapper_config 
   TABLE DATA                 public          postgres    false    252   �      �          0    17203    keycloak_group 
   TABLE DATA                 public          postgres    false    268   ,�      d          0    16438    keycloak_role 
   TABLE DATA                 public          postgres    false    222   F�      �          0    16922    migration_model 
   TABLE DATA                 public          postgres    false    250   ��      �          0    17194    offline_client_session 
   TABLE DATA                 public          postgres    false    267   -�      �          0    17189    offline_user_session 
   TABLE DATA                 public          postgres    false    266   k�      �          0    17408    policy_config 
   TABLE DATA                 public          postgres    false    280   '�      x          0    16796    protocol_mapper 
   TABLE DATA                 public          postgres    false    242   A�      y          0    16802    protocol_mapper_config 
   TABLE DATA                 public          postgres    false    243   ��      e          0    16444    realm 
   TABLE DATA                 public          postgres    false    223   �       f          0    16461    realm_attribute 
   TABLE DATA                 public          postgres    false    224         �          0    17218    realm_default_groups 
   TABLE DATA                 public          postgres    false    272                   0    16914    realm_enabled_event_types 
   TABLE DATA                 public          postgres    false    249   *      g          0    16469    realm_events_listeners 
   TABLE DATA                 public          postgres    false    225   D      �          0    17920    realm_localizations 
   TABLE DATA                 public          postgres    false    305   �      h          0    16472    realm_required_credential 
   TABLE DATA                 public          postgres    false    226   	      i          0    16479    realm_smtp_config 
   TABLE DATA                 public          postgres    false    227   �	      }          0    16830    realm_supported_locales 
   TABLE DATA                 public          postgres    false    247   �	      j          0    16489    redirect_uris 
   TABLE DATA                 public          postgres    false    228   �	      �          0    17153    required_action_config 
   TABLE DATA                 public          postgres    false    265   B      �          0    17146    required_action_provider 
   TABLE DATA                 public          postgres    false    264   \      �          0    17851    resource_attribute 
   TABLE DATA                 public          postgres    false    302         �          0    17435    resource_policy 
   TABLE DATA                 public          postgres    false    282         �          0    17420    resource_scope 
   TABLE DATA                 public          postgres    false    281   5      �          0    17358    resource_server 
   TABLE DATA                 public          postgres    false    276   O      �          0    17827    resource_server_perm_ticket 
   TABLE DATA                 public          postgres    false    301   i      �          0    17394    resource_server_policy 
   TABLE DATA                 public          postgres    false    279   �      �          0    17366    resource_server_resource 
   TABLE DATA                 public          postgres    false    277   �      �          0    17380    resource_server_scope 
   TABLE DATA                 public          postgres    false    278   �      �          0    17869    resource_uris 
   TABLE DATA                 public          postgres    false    303   �      �          0    17879    role_attribute 
   TABLE DATA                 public          postgres    false    304   �      k          0    16492    scope_mapping 
   TABLE DATA                 public          postgres    false    229         �          0    17450    scope_policy 
   TABLE DATA                 public          postgres    false    283   �      m          0    16498    user_attribute 
   TABLE DATA                 public          postgres    false    231         �          0    16935    user_consent 
   TABLE DATA                 public          postgres    false    253   -      �          0    17802    user_consent_client_scope 
   TABLE DATA                 public          postgres    false    299   G      n          0    16503    user_entity 
   TABLE DATA                 public          postgres    false    232   a      o          0    16511    user_federation_config 
   TABLE DATA                 public          postgres    false    233   �      �          0    17047    user_federation_mapper 
   TABLE DATA                 public          postgres    false    260         �          0    17052    user_federation_mapper_config 
   TABLE DATA                 public          postgres    false    261   -      p          0    16516    user_federation_provider 
   TABLE DATA                 public          postgres    false    234   G      �          0    17215    user_group_membership 
   TABLE DATA                 public          postgres    false    271   a      q          0    16521    user_required_action 
   TABLE DATA                 public          postgres    false    235   {      r          0    16524    user_role_mapping 
   TABLE DATA                 public          postgres    false    236   �      s          0    16527    user_session 
   TABLE DATA                 public          postgres    false    237   }      ~          0    16833    user_session_note 
   TABLE DATA                 public          postgres    false    248   �      l          0    16495    username_login_failure 
   TABLE DATA                 public          postgres    false    230   �      t          0    16538    web_origins 
   TABLE DATA                 public          postgres    false    238   �      �           2606    17594 &   username_login_failure CONSTRAINT_17-2 
   CONSTRAINT     v   ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);
 R   ALTER TABLE ONLY public.username_login_failure DROP CONSTRAINT "CONSTRAINT_17-2";
       public            postgres    false    230    230            v           2606    17903 ,   keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2 
   CONSTRAINT     �   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);
 X   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2";
       public            postgres    false    222    222            i           2606    17733 )   client_auth_flow_bindings c_cli_flow_bind 
   CONSTRAINT     |   ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);
 S   ALTER TABLE ONLY public.client_auth_flow_bindings DROP CONSTRAINT c_cli_flow_bind;
       public            postgres    false    296    296            k           2606    17932 $   client_scope_client c_cli_scope_bind 
   CONSTRAINT     s   ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);
 N   ALTER TABLE ONLY public.client_scope_client DROP CONSTRAINT c_cli_scope_bind;
       public            postgres    false    297    297            f           2606    17608 .   client_initial_access cnstr_client_init_acc_pk 
   CONSTRAINT     l   ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT cnstr_client_init_acc_pk;
       public            postgres    false    295                       2606    17256 ,   realm_default_groups con_group_id_def_groups 
   CONSTRAINT     k   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);
 V   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT con_group_id_def_groups;
       public            postgres    false    272            C           2606    17531 !   broker_link constr_broker_link_pk 
   CONSTRAINT     w   ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);
 K   ALTER TABLE ONLY public.broker_link DROP CONSTRAINT constr_broker_link_pk;
       public            postgres    false    285    285            �           2606    17165 /   client_user_session_note constr_cl_usr_ses_note 
   CONSTRAINT        ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);
 Y   ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT constr_cl_usr_ses_note;
       public            postgres    false    263    263            ]           2606    17551 +   component_config constr_component_config_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.component_config DROP CONSTRAINT constr_component_config_pk;
       public            postgres    false    292            `           2606    17549    component constr_component_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.component DROP CONSTRAINT constr_component_pk;
       public            postgres    false    293            U           2606    17547 3   fed_user_required_action constr_fed_required_action 
   CONSTRAINT     �   ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);
 ]   ALTER TABLE ONLY public.fed_user_required_action DROP CONSTRAINT constr_fed_required_action;
       public            postgres    false    290    290            E           2606    17533 *   fed_user_attribute constr_fed_user_attr_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.fed_user_attribute DROP CONSTRAINT constr_fed_user_attr_pk;
       public            postgres    false    286            H           2606    17535 +   fed_user_consent constr_fed_user_consent_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.fed_user_consent DROP CONSTRAINT constr_fed_user_consent_pk;
       public            postgres    false    287            M           2606    17541 +   fed_user_credential constr_fed_user_cred_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.fed_user_credential DROP CONSTRAINT constr_fed_user_cred_pk;
       public            postgres    false    288            Q           2606    17543 /   fed_user_group_membership constr_fed_user_group 
   CONSTRAINT     |   ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);
 Y   ALTER TABLE ONLY public.fed_user_group_membership DROP CONSTRAINT constr_fed_user_group;
       public            postgres    false    289    289            Y           2606    17545 *   fed_user_role_mapping constr_fed_user_role 
   CONSTRAINT     v   ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);
 T   ALTER TABLE ONLY public.fed_user_role_mapping DROP CONSTRAINT constr_fed_user_role;
       public            postgres    false    291    291            d           2606    17588 $   federated_user constr_federated_user 
   CONSTRAINT     b   ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.federated_user DROP CONSTRAINT constr_federated_user;
       public            postgres    false    294                       2606    17692 0   realm_default_groups constr_realm_default_groups 
   CONSTRAINT     ~   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);
 Z   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT constr_realm_default_groups;
       public            postgres    false    272    272            �           2606    17709 8   realm_enabled_event_types constr_realm_enabl_event_types 
   CONSTRAINT     �   ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);
 b   ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT constr_realm_enabl_event_types;
       public            postgres    false    249    249            �           2606    17711 4   realm_events_listeners constr_realm_events_listeners 
   CONSTRAINT        ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);
 ^   ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT constr_realm_events_listeners;
       public            postgres    false    225    225            �           2606    17713 6   realm_supported_locales constr_realm_supported_locales 
   CONSTRAINT     �   ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);
 `   ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT constr_realm_supported_locales;
       public            postgres    false    247    247            �           2606    16842    identity_provider constraint_2b 
   CONSTRAINT     f   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);
 I   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT constraint_2b;
       public            postgres    false    245            �           2606    16776    client_attributes constraint_3c 
   CONSTRAINT     j   ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);
 I   ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT constraint_3c;
       public            postgres    false    239    239            s           2606    16550    event_entity constraint_4 
   CONSTRAINT     W   ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.event_entity DROP CONSTRAINT constraint_4;
       public            postgres    false    221            �           2606    16844     federated_identity constraint_40 
   CONSTRAINT     v   ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);
 J   ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT constraint_40;
       public            postgres    false    244    244            |           2606    16552    realm constraint_4a 
   CONSTRAINT     Q   ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.realm DROP CONSTRAINT constraint_4a;
       public            postgres    false    223            j           2606    16554     client_session_role constraint_5 
   CONSTRAINT     s   ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);
 J   ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT constraint_5;
       public            postgres    false    218    218            �           2606    16556    user_session constraint_57 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_session DROP CONSTRAINT constraint_57;
       public            postgres    false    237            �           2606    16558 &   user_federation_provider constraint_5c 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT constraint_5c;
       public            postgres    false    234            �           2606    16778 !   client_session_note constraint_5e 
   CONSTRAINT     q   ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);
 K   ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT constraint_5e;
       public            postgres    false    240    240            b           2606    16562    client constraint_7 
   CONSTRAINT     Q   ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.client DROP CONSTRAINT constraint_7;
       public            postgres    false    216            g           2606    16564    client_session constraint_8 
   CONSTRAINT     Y   ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.client_session DROP CONSTRAINT constraint_8;
       public            postgres    false    217            �           2606    16566    scope_mapping constraint_81 
   CONSTRAINT     i   ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);
 E   ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT constraint_81;
       public            postgres    false    229    229            �           2606    16780 '   client_node_registrations constraint_84 
   CONSTRAINT     r   ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);
 Q   ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT constraint_84;
       public            postgres    false    241    241            �           2606    16568    realm_attribute constraint_9 
   CONSTRAINT     f   ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);
 F   ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT constraint_9;
       public            postgres    false    224    224            �           2606    16570 '   realm_required_credential constraint_92 
   CONSTRAINT     q   ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);
 Q   ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT constraint_92;
       public            postgres    false    226    226            x           2606    16572    keycloak_role constraint_a 
   CONSTRAINT     X   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT constraint_a;
       public            postgres    false    222            �           2606    17696 0   admin_event_entity constraint_admin_event_entity 
   CONSTRAINT     n   ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.admin_event_entity DROP CONSTRAINT constraint_admin_event_entity;
       public            postgres    false    255            �           2606    17073 1   authenticator_config_entry constraint_auth_cfg_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);
 [   ALTER TABLE ONLY public.authenticator_config_entry DROP CONSTRAINT constraint_auth_cfg_pk;
       public            postgres    false    259    259            �           2606    17071 0   authentication_execution constraint_auth_exec_pk 
   CONSTRAINT     n   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT constraint_auth_exec_pk;
       public            postgres    false    258            �           2606    17069 +   authentication_flow constraint_auth_flow_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT constraint_auth_flow_pk;
       public            postgres    false    257            �           2606    17067 '   authenticator_config constraint_auth_pk 
   CONSTRAINT     e   ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT constraint_auth_pk;
       public            postgres    false    256            �           2606    17077 4   client_session_auth_status constraint_auth_status_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);
 ^   ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT constraint_auth_status_pk;
       public            postgres    false    262    262            �           2606    16574    user_role_mapping constraint_c 
   CONSTRAINT     j   ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);
 H   ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT constraint_c;
       public            postgres    false    236    236            l           2606    17690 (   composite_role constraint_composite_role 
   CONSTRAINT     y   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);
 R   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT constraint_composite_role;
       public            postgres    false    219    219            �           2606    16960 /   client_session_prot_mapper constraint_cs_pmp_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);
 Y   ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT constraint_cs_pmp_pk;
       public            postgres    false    254    254            �           2606    16846 %   identity_provider_config constraint_d 
   CONSTRAINT     {   ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);
 O   ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT constraint_d;
       public            postgres    false    246    246            5           2606    17414    policy_config constraint_dpc 
   CONSTRAINT     g   ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);
 F   ALTER TABLE ONLY public.policy_config DROP CONSTRAINT constraint_dpc;
       public            postgres    false    280    280            �           2606    16576    realm_smtp_config constraint_e 
   CONSTRAINT     h   ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);
 H   ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT constraint_e;
       public            postgres    false    227    227            p           2606    16578    credential constraint_f 
   CONSTRAINT     U   ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.credential DROP CONSTRAINT constraint_f;
       public            postgres    false    220            �           2606    16580 $   user_federation_config constraint_f9 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);
 N   ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT constraint_f9;
       public            postgres    false    233    233            x           2606    17831 ,   resource_server_perm_ticket constraint_fapmt 
   CONSTRAINT     j   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT constraint_fapmt;
       public            postgres    false    301            &           2606    17372 )   resource_server_resource constraint_farsr 
   CONSTRAINT     g   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT constraint_farsr;
       public            postgres    false    277            0           2606    17400 (   resource_server_policy constraint_farsrp 
   CONSTRAINT     f   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT constraint_farsrp;
       public            postgres    false    279            @           2606    17469 %   associated_policy constraint_farsrpap 
   CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);
 O   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT constraint_farsrpap;
       public            postgres    false    284    284            :           2606    17439 "   resource_policy constraint_farsrpp 
   CONSTRAINT     t   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);
 L   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT constraint_farsrpp;
       public            postgres    false    282    282            +           2606    17386 '   resource_server_scope constraint_farsrs 
   CONSTRAINT     e   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT constraint_farsrs;
       public            postgres    false    278            7           2606    17424 !   resource_scope constraint_farsrsp 
   CONSTRAINT     r   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);
 K   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT constraint_farsrsp;
       public            postgres    false    281    281            =           2606    17454     scope_policy constraint_farsrsps 
   CONSTRAINT     o   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);
 J   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT constraint_farsrsps;
       public            postgres    false    283    283            �           2606    16582    user_entity constraint_fb 
   CONSTRAINT     W   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT constraint_fb;
       public            postgres    false    232            �           2606    17081 9   user_federation_mapper_config constraint_fedmapper_cfg_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);
 c   ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT constraint_fedmapper_cfg_pm;
       public            postgres    false    261    261            �           2606    17079 -   user_federation_mapper constraint_fedmapperpm 
   CONSTRAINT     k   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT constraint_fedmapperpm;
       public            postgres    false    260            v           2606    17816 6   fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);
 `   ALTER TABLE ONLY public.fed_user_consent_cl_scope DROP CONSTRAINT constraint_fgrntcsnt_clsc_pm;
       public            postgres    false    300    300            s           2606    17806 5   user_consent_client_scope constraint_grntcsnt_clsc_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);
 _   ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT constraint_grntcsnt_clsc_pm;
       public            postgres    false    299    299            �           2606    16954 #   user_consent constraint_grntcsnt_pm 
   CONSTRAINT     a   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT constraint_grntcsnt_pm;
       public            postgres    false    253                       2606    17223    keycloak_group constraint_group 
   CONSTRAINT     ]   ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT constraint_group;
       public            postgres    false    268                       2606    17230 -   group_attribute constraint_group_attribute_pk 
   CONSTRAINT     k   ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT constraint_group_attribute_pk;
       public            postgres    false    270            	           2606    17244 (   group_role_mapping constraint_group_role 
   CONSTRAINT     u   ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);
 R   ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT constraint_group_role;
       public            postgres    false    269    269            �           2606    16950 (   identity_provider_mapper constraint_idpm 
   CONSTRAINT     f   ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT constraint_idpm;
       public            postgres    false    251            �           2606    17130 '   idp_mapper_config constraint_idpmconfig 
   CONSTRAINT     v   ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);
 Q   ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT constraint_idpmconfig;
       public            postgres    false    252    252            �           2606    16948 !   migration_model constraint_migmod 
   CONSTRAINT     _   ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.migration_model DROP CONSTRAINT constraint_migmod;
       public            postgres    false    250                       2606    17909 1   offline_client_session constraint_offl_cl_ses_pk3 
   CONSTRAINT     �   ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);
 [   ALTER TABLE ONLY public.offline_client_session DROP CONSTRAINT constraint_offl_cl_ses_pk3;
       public            postgres    false    267    267    267    267    267            �           2606    17200 /   offline_user_session constraint_offl_us_ses_pk2 
   CONSTRAINT     �   ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);
 Y   ALTER TABLE ONLY public.offline_user_session DROP CONSTRAINT constraint_offl_us_ses_pk2;
       public            postgres    false    266    266            �           2606    16840    protocol_mapper constraint_pcm 
   CONSTRAINT     \   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT constraint_pcm;
       public            postgres    false    242            �           2606    17123 *   protocol_mapper_config constraint_pmconfig 
   CONSTRAINT     ~   ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);
 T   ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT constraint_pmconfig;
       public            postgres    false    243    243            �           2606    17715 &   redirect_uris constraint_redirect_uris 
   CONSTRAINT     r   ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);
 P   ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT constraint_redirect_uris;
       public            postgres    false    228    228            �           2606    17163 0   required_action_config constraint_req_act_cfg_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);
 Z   ALTER TABLE ONLY public.required_action_config DROP CONSTRAINT constraint_req_act_cfg_pk;
       public            postgres    false    265    265            �           2606    17161 2   required_action_provider constraint_req_act_prv_pk 
   CONSTRAINT     p   ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT constraint_req_act_prv_pk;
       public            postgres    false    264            �           2606    17075 /   user_required_action constraint_required_action 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);
 Y   ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT constraint_required_action;
       public            postgres    false    235    235            ~           2606    17878 '   resource_uris constraint_resour_uris_pk 
   CONSTRAINT     u   ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);
 Q   ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT constraint_resour_uris_pk;
       public            postgres    false    303    303            �           2606    17885 +   role_attribute constraint_role_attribute_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT constraint_role_attribute_pk;
       public            postgres    false    304            �           2606    17159 +   user_attribute constraint_user_attribute_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT constraint_user_attribute_pk;
       public            postgres    false    231                       2606    17237 +   user_group_membership constraint_user_group 
   CONSTRAINT     x   ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);
 U   ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT constraint_user_group;
       public            postgres    false    271    271            �           2606    16850 #   user_session_note constraint_usn_pk 
   CONSTRAINT     q   ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);
 M   ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT constraint_usn_pk;
       public            postgres    false    248    248            �           2606    17717 "   web_origins constraint_web_origins 
   CONSTRAINT     n   ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);
 L   ALTER TABLE ONLY public.web_origins DROP CONSTRAINT constraint_web_origins;
       public            postgres    false    238    238            `           2606    16394 0   databasechangeloglock databasechangeloglock_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT databasechangeloglock_pkey;
       public            postgres    false    214                       2606    17340 '   client_scope_attributes pk_cl_tmpl_attr 
   CONSTRAINT     q   ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);
 Q   ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT pk_cl_tmpl_attr;
       public            postgres    false    274    274                       2606    17299    client_scope pk_cli_template 
   CONSTRAINT     Z   ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.client_scope DROP CONSTRAINT pk_cli_template;
       public            postgres    false    273            $           2606    17670 "   resource_server pk_resource_server 
   CONSTRAINT     `   ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.resource_server DROP CONSTRAINT pk_resource_server;
       public            postgres    false    276            "           2606    17328 +   client_scope_role_mapping pk_template_scope 
   CONSTRAINT     x   ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);
 U   ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT pk_template_scope;
       public            postgres    false    275    275            q           2606    17791 )   default_client_scope r_def_cli_scope_bind 
   CONSTRAINT     w   ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);
 S   ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT r_def_cli_scope_bind;
       public            postgres    false    298    298            �           2606    17926 ,   realm_localizations realm_localizations_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);
 V   ALTER TABLE ONLY public.realm_localizations DROP CONSTRAINT realm_localizations_pkey;
       public            postgres    false    305    305            |           2606    17858    resource_attribute res_attr_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT res_attr_pk;
       public            postgres    false    302                       2606    17600    keycloak_group sibling_names 
   CONSTRAINT     o   ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);
 F   ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT sibling_names;
       public            postgres    false    268    268    268            �           2606    16897 /   identity_provider uk_2daelwnibji49avxsrtuf6xj33 
   CONSTRAINT     ~   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);
 Y   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33;
       public            postgres    false    245    245            e           2606    16586 #   client uk_b71cjlbenv945rb6gcon438at 
   CONSTRAINT     m   ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);
 M   ALTER TABLE ONLY public.client DROP CONSTRAINT uk_b71cjlbenv945rb6gcon438at;
       public            postgres    false    216    216                       2606    17744    client_scope uk_cli_scope 
   CONSTRAINT     ^   ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);
 C   ALTER TABLE ONLY public.client_scope DROP CONSTRAINT uk_cli_scope;
       public            postgres    false    273    273            �           2606    16590 (   user_entity uk_dykn684sl8up1crfei6eckhd7 
   CONSTRAINT     y   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);
 R   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_dykn684sl8up1crfei6eckhd7;
       public            postgres    false    232    232            )           2606    17917 4   resource_server_resource uk_frsr6t700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);
 ^   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6;
       public            postgres    false    277    277    277            z           2606    17913 7   resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);
 a   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt;
       public            postgres    false    301    301    301    301    301            3           2606    17661 2   resource_server_policy uk_frsrpt700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);
 \   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6;
       public            postgres    false    279    279            .           2606    17665 1   resource_server_scope uk_frsrst700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);
 [   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT uk_frsrst700s9v50bu18ws5ha6;
       public            postgres    false    278    278            �           2606    17905 )   user_consent uk_jkuwuvd56ontgsuhogm8uewrt 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);
 S   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt;
       public            postgres    false    253    253    253    253                       2606    16598 "   realm uk_orvsdmla56612eaefiq6wl5oi 
   CONSTRAINT     ]   ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);
 L   ALTER TABLE ONLY public.realm DROP CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi;
       public            postgres    false    223            �           2606    17590 (   user_entity uk_ru8tt6t700s9v50bu18ws5ha6 
   CONSTRAINT     q   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);
 R   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6;
       public            postgres    false    232    232            �           1259    17942    idx_admin_event_time    INDEX     i   CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);
 (   DROP INDEX public.idx_admin_event_time;
       public            postgres    false    255    255            A           1259    17614    idx_assoc_pol_assoc_pol_id    INDEX     h   CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);
 .   DROP INDEX public.idx_assoc_pol_assoc_pol_id;
       public            postgres    false    284            �           1259    17618    idx_auth_config_realm    INDEX     Z   CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);
 )   DROP INDEX public.idx_auth_config_realm;
       public            postgres    false    256            �           1259    17616    idx_auth_exec_flow    INDEX     Z   CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);
 &   DROP INDEX public.idx_auth_exec_flow;
       public            postgres    false    258            �           1259    17615    idx_auth_exec_realm_flow    INDEX     j   CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);
 ,   DROP INDEX public.idx_auth_exec_realm_flow;
       public            postgres    false    258    258            �           1259    17617    idx_auth_flow_realm    INDEX     W   CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);
 '   DROP INDEX public.idx_auth_flow_realm;
       public            postgres    false    257            l           1259    17933    idx_cl_clscope    INDEX     R   CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);
 "   DROP INDEX public.idx_cl_clscope;
       public            postgres    false    297            c           1259    17918    idx_client_id    INDEX     E   CREATE INDEX idx_client_id ON public.client USING btree (client_id);
 !   DROP INDEX public.idx_client_id;
       public            postgres    false    216            g           1259    17658    idx_client_init_acc_realm    INDEX     _   CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);
 -   DROP INDEX public.idx_client_init_acc_realm;
       public            postgres    false    295            h           1259    17622    idx_client_session_session    INDEX     [   CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);
 .   DROP INDEX public.idx_client_session_session;
       public            postgres    false    217                       1259    17821    idx_clscope_attrs    INDEX     Y   CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);
 %   DROP INDEX public.idx_clscope_attrs;
       public            postgres    false    274            m           1259    17930    idx_clscope_cl    INDEX     S   CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);
 "   DROP INDEX public.idx_clscope_cl;
       public            postgres    false    297            �           1259    17818    idx_clscope_protmap    INDEX     Z   CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);
 '   DROP INDEX public.idx_clscope_protmap;
       public            postgres    false    242                       1259    17819    idx_clscope_role    INDEX     Z   CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);
 $   DROP INDEX public.idx_clscope_role;
       public            postgres    false    275            ^           1259    17624    idx_compo_config_compo    INDEX     [   CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);
 *   DROP INDEX public.idx_compo_config_compo;
       public            postgres    false    292            a           1259    17892    idx_component_provider_type    INDEX     Z   CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);
 /   DROP INDEX public.idx_component_provider_type;
       public            postgres    false    293            b           1259    17623    idx_component_realm    INDEX     M   CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);
 '   DROP INDEX public.idx_component_realm;
       public            postgres    false    293            m           1259    17625    idx_composite    INDEX     M   CREATE INDEX idx_composite ON public.composite_role USING btree (composite);
 !   DROP INDEX public.idx_composite;
       public            postgres    false    219            n           1259    17626    idx_composite_child    INDEX     T   CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);
 '   DROP INDEX public.idx_composite_child;
       public            postgres    false    219            n           1259    17824    idx_defcls_realm    INDEX     U   CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);
 $   DROP INDEX public.idx_defcls_realm;
       public            postgres    false    298            o           1259    17825    idx_defcls_scope    INDEX     U   CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);
 $   DROP INDEX public.idx_defcls_scope;
       public            postgres    false    298            t           1259    17919    idx_event_time    INDEX     W   CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);
 "   DROP INDEX public.idx_event_time;
       public            postgres    false    221    221            �           1259    17357    idx_fedidentity_feduser    INDEX     c   CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);
 +   DROP INDEX public.idx_fedidentity_feduser;
       public            postgres    false    244            �           1259    17356    idx_fedidentity_user    INDEX     V   CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);
 (   DROP INDEX public.idx_fedidentity_user;
       public            postgres    false    244            F           1259    17718    idx_fu_attribute    INDEX     b   CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);
 $   DROP INDEX public.idx_fu_attribute;
       public            postgres    false    286    286    286            I           1259    17738    idx_fu_cnsnt_ext    INDEX     }   CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);
 $   DROP INDEX public.idx_fu_cnsnt_ext;
       public            postgres    false    287    287    287            J           1259    17901    idx_fu_consent    INDEX     Y   CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);
 "   DROP INDEX public.idx_fu_consent;
       public            postgres    false    287    287            K           1259    17720    idx_fu_consent_ru    INDEX     [   CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);
 %   DROP INDEX public.idx_fu_consent_ru;
       public            postgres    false    287    287            N           1259    17721    idx_fu_credential    INDEX     Z   CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);
 %   DROP INDEX public.idx_fu_credential;
       public            postgres    false    288    288            O           1259    17722    idx_fu_credential_ru    INDEX     a   CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);
 (   DROP INDEX public.idx_fu_credential_ru;
       public            postgres    false    288    288            R           1259    17723    idx_fu_group_membership    INDEX     j   CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);
 +   DROP INDEX public.idx_fu_group_membership;
       public            postgres    false    289    289            S           1259    17724    idx_fu_group_membership_ru    INDEX     m   CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);
 .   DROP INDEX public.idx_fu_group_membership_ru;
       public            postgres    false    289    289            V           1259    17725    idx_fu_required_action    INDEX     o   CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);
 *   DROP INDEX public.idx_fu_required_action;
       public            postgres    false    290    290            W           1259    17726    idx_fu_required_action_ru    INDEX     k   CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);
 -   DROP INDEX public.idx_fu_required_action_ru;
       public            postgres    false    290    290            Z           1259    17727    idx_fu_role_mapping    INDEX     a   CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);
 '   DROP INDEX public.idx_fu_role_mapping;
       public            postgres    false    291    291            [           1259    17728    idx_fu_role_mapping_ru    INDEX     e   CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);
 *   DROP INDEX public.idx_fu_role_mapping_ru;
       public            postgres    false    291    291                       1259    17943    idx_group_att_by_name_value    INDEX     z   CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));
 /   DROP INDEX public.idx_group_att_by_name_value;
       public            postgres    false    270    270                       1259    17629    idx_group_attr_group    INDEX     T   CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);
 (   DROP INDEX public.idx_group_attr_group;
       public            postgres    false    270            
           1259    17630    idx_group_role_mapp_group    INDEX     \   CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);
 -   DROP INDEX public.idx_group_role_mapp_group;
       public            postgres    false    269            �           1259    17632    idx_id_prov_mapp_realm    INDEX     _   CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);
 *   DROP INDEX public.idx_id_prov_mapp_realm;
       public            postgres    false    251            �           1259    17631    idx_ident_prov_realm    INDEX     V   CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);
 (   DROP INDEX public.idx_ident_prov_realm;
       public            postgres    false    245            y           1259    17633    idx_keycloak_role_client    INDEX     T   CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);
 ,   DROP INDEX public.idx_keycloak_role_client;
       public            postgres    false    222            z           1259    17634    idx_keycloak_role_realm    INDEX     R   CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);
 +   DROP INDEX public.idx_keycloak_role_realm;
       public            postgres    false    222                       1259    17936    idx_offline_css_preload    INDEX     m   CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);
 +   DROP INDEX public.idx_offline_css_preload;
       public            postgres    false    267    267            �           1259    17937    idx_offline_uss_by_user    INDEX     s   CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);
 +   DROP INDEX public.idx_offline_uss_by_user;
       public            postgres    false    266    266    266            �           1259    17938    idx_offline_uss_by_usersess    INDEX        CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);
 /   DROP INDEX public.idx_offline_uss_by_usersess;
       public            postgres    false    266    266    266            �           1259    17896    idx_offline_uss_createdon    INDEX     `   CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);
 -   DROP INDEX public.idx_offline_uss_createdon;
       public            postgres    false    266            �           1259    17927    idx_offline_uss_preload    INDEX     }   CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);
 +   DROP INDEX public.idx_offline_uss_preload;
       public            postgres    false    266    266    266            �           1259    17635    idx_protocol_mapper_client    INDEX     [   CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);
 .   DROP INDEX public.idx_protocol_mapper_client;
       public            postgres    false    242            �           1259    17638    idx_realm_attr_realm    INDEX     T   CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);
 (   DROP INDEX public.idx_realm_attr_realm;
       public            postgres    false    224                       1259    17817    idx_realm_clscope    INDEX     N   CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);
 %   DROP INDEX public.idx_realm_clscope;
       public            postgres    false    273                       1259    17639    idx_realm_def_grp_realm    INDEX     \   CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);
 +   DROP INDEX public.idx_realm_def_grp_realm;
       public            postgres    false    272            �           1259    17642    idx_realm_evt_list_realm    INDEX     _   CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);
 ,   DROP INDEX public.idx_realm_evt_list_realm;
       public            postgres    false    225            �           1259    17641    idx_realm_evt_types_realm    INDEX     c   CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);
 -   DROP INDEX public.idx_realm_evt_types_realm;
       public            postgres    false    249            }           1259    17637    idx_realm_master_adm_cli    INDEX     Y   CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);
 ,   DROP INDEX public.idx_realm_master_adm_cli;
       public            postgres    false    223            �           1259    17643    idx_realm_supp_local_realm    INDEX     b   CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);
 .   DROP INDEX public.idx_realm_supp_local_realm;
       public            postgres    false    247            �           1259    17644    idx_redir_uri_client    INDEX     S   CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);
 (   DROP INDEX public.idx_redir_uri_client;
       public            postgres    false    228            �           1259    17645    idx_req_act_prov_realm    INDEX     _   CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);
 *   DROP INDEX public.idx_req_act_prov_realm;
       public            postgres    false    264            ;           1259    17646    idx_res_policy_policy    INDEX     V   CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);
 )   DROP INDEX public.idx_res_policy_policy;
       public            postgres    false    282            8           1259    17647    idx_res_scope_scope    INDEX     R   CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);
 '   DROP INDEX public.idx_res_scope_scope;
       public            postgres    false    281            1           1259    17666    idx_res_serv_pol_res_serv    INDEX     j   CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);
 -   DROP INDEX public.idx_res_serv_pol_res_serv;
       public            postgres    false    279            '           1259    17667    idx_res_srv_res_res_srv    INDEX     j   CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);
 +   DROP INDEX public.idx_res_srv_res_res_srv;
       public            postgres    false    277            ,           1259    17668    idx_res_srv_scope_res_srv    INDEX     i   CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);
 -   DROP INDEX public.idx_res_srv_scope_res_srv;
       public            postgres    false    278            �           1259    17891    idx_role_attribute    INDEX     P   CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);
 &   DROP INDEX public.idx_role_attribute;
       public            postgres    false    304                        1259    17820    idx_role_clscope    INDEX     Y   CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);
 $   DROP INDEX public.idx_role_clscope;
       public            postgres    false    275            �           1259    17651    idx_scope_mapping_role    INDEX     S   CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);
 *   DROP INDEX public.idx_scope_mapping_role;
       public            postgres    false    229            >           1259    17652    idx_scope_policy_policy    INDEX     U   CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);
 +   DROP INDEX public.idx_scope_policy_policy;
       public            postgres    false    283            �           1259    17899    idx_update_time    INDEX     R   CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);
 #   DROP INDEX public.idx_update_time;
       public            postgres    false    250                       1259    17346    idx_us_sess_id_on_cl_sess    INDEX     g   CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);
 -   DROP INDEX public.idx_us_sess_id_on_cl_sess;
       public            postgres    false    267            t           1259    17826    idx_usconsent_clscope    INDEX     f   CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);
 )   DROP INDEX public.idx_usconsent_clscope;
       public            postgres    false    299            �           1259    17353    idx_user_attribute    INDEX     P   CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);
 &   DROP INDEX public.idx_user_attribute;
       public            postgres    false    231            �           1259    17940    idx_user_attribute_name    INDEX     Y   CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);
 +   DROP INDEX public.idx_user_attribute_name;
       public            postgres    false    231    231            �           1259    17350    idx_user_consent    INDEX     L   CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);
 $   DROP INDEX public.idx_user_consent;
       public            postgres    false    253            q           1259    17354    idx_user_credential    INDEX     M   CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);
 '   DROP INDEX public.idx_user_credential;
       public            postgres    false    220            �           1259    17347    idx_user_email    INDEX     G   CREATE INDEX idx_user_email ON public.user_entity USING btree (email);
 "   DROP INDEX public.idx_user_email;
       public            postgres    false    232                       1259    17349    idx_user_group_mapping    INDEX     [   CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);
 *   DROP INDEX public.idx_user_group_mapping;
       public            postgres    false    271            �           1259    17355    idx_user_reqactions    INDEX     W   CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);
 '   DROP INDEX public.idx_user_reqactions;
       public            postgres    false    235            �           1259    17348    idx_user_role_mapping    INDEX     V   CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);
 )   DROP INDEX public.idx_user_role_mapping;
       public            postgres    false    236            �           1259    17941    idx_user_service_account    INDEX     q   CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);
 ,   DROP INDEX public.idx_user_service_account;
       public            postgres    false    232    232            �           1259    17654    idx_usr_fed_map_fed_prv    INDEX     l   CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);
 +   DROP INDEX public.idx_usr_fed_map_fed_prv;
       public            postgres    false    260            �           1259    17655    idx_usr_fed_map_realm    INDEX     \   CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);
 )   DROP INDEX public.idx_usr_fed_map_realm;
       public            postgres    false    260            �           1259    17656    idx_usr_fed_prv_realm    INDEX     ^   CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);
 )   DROP INDEX public.idx_usr_fed_prv_realm;
       public            postgres    false    234            �           1259    17657    idx_web_orig_client    INDEX     P   CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);
 '   DROP INDEX public.idx_web_orig_client;
       public            postgres    false    238            �           2606    17082 1   client_session_auth_status auth_status_constraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 [   ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT auth_status_constraint;
       public          postgres    false    262    3687    217            �           2606    16851 $   identity_provider fk2b4ebc52ae5c3b34    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 N   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT fk2b4ebc52ae5c3b34;
       public          postgres    false    245    3708    223            �           2606    16781 $   client_attributes fk3c47c64beacca966    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);
 N   ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT fk3c47c64beacca966;
       public          postgres    false    239    3682    216            �           2606    16861 %   federated_identity fk404288b92ef007a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 O   ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT fk404288b92ef007a6;
       public          postgres    false    244    3735    232            �           2606    17008 ,   client_node_registrations fk4129723ba992f594    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);
 V   ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT fk4129723ba992f594;
       public          postgres    false    241    3682    216            �           2606    16786 &   client_session_note fk5edfb00ff51c2736    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 P   ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT fk5edfb00ff51c2736;
       public          postgres    false    240    3687    217            �           2606    16891 $   user_session_note fk5edfb00ff51d3472    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);
 N   ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT fk5edfb00ff51d3472;
       public          postgres    false    237    3754    248            �           2606    16601 0   client_session_role fk_11b7sgqw18i532811v7o2dv76    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 Z   ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT fk_11b7sgqw18i532811v7o2dv76;
       public          postgres    false    217    3687    218            �           2606    16606 *   redirect_uris fk_1burs8pb4ouj97h5wuppahv9f    FK CONSTRAINT     �   ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);
 T   ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f;
       public          postgres    false    228    216    3682            �           2606    16611 5   user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 _   ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8;
       public          postgres    false    223    234    3708            �           2606    16986 7   client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 a   ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT fk_33a8sgqw18i532811v7o2dk89;
       public          postgres    false    254    3687    217            �           2606    16621 6   realm_required_credential fk_5hg65lybevavkqfki3kponh9v    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 `   ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT fk_5hg65lybevavkqfki3kponh9v;
       public          postgres    false    223    3708    226            �           2606    17859 /   resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 Y   ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr;
       public          postgres    false    3878    277    302            �           2606    16626 +   user_attribute fk_5hrm2vlf9ql5fu043kqepovbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 U   ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr;
       public          postgres    false    232    3735    231            �           2606    16636 1   user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 [   ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd;
       public          postgres    false    3735    232    235            �           2606    16641 *   keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c    FK CONSTRAINT     �   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);
 T   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c;
       public          postgres    false    3708    223    222            �           2606    16646 .   realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 X   ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o;
       public          postgres    false    227    3708    223            �           2606    16661 ,   realm_attribute fk_8shxd6l3e9atqukacxgpffptw    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 V   ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw;
       public          postgres    false    223    224    3708            �           2606    16666 +   composite_role fk_a63wvekftu8jo1pnj81e7mce2    FK CONSTRAINT     �   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);
 U   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2;
       public          postgres    false    219    3704    222            �           2606    17102 *   authentication_execution fk_auth_exec_flow    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);
 T   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_flow;
       public          postgres    false    258    3811    257            �           2606    17097 +   authentication_execution fk_auth_exec_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 U   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_realm;
       public          postgres    false    258    3708    223            �           2606    17092 &   authentication_flow fk_auth_flow_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 P   ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT fk_auth_flow_realm;
       public          postgres    false    257    3708    223            �           2606    17087 "   authenticator_config fk_auth_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 L   ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT fk_auth_realm;
       public          postgres    false    256    3708    223            �           2606    16671 +   client_session fk_b4ao2vcvat6ukau74wbwtfqo1    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);
 U   ALTER TABLE ONLY public.client_session DROP CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1;
       public          postgres    false    217    237    3754            �           2606    16676 .   user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 X   ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l;
       public          postgres    false    236    3735    232            �           2606    17765 .   client_scope_attributes fk_cl_scope_attr_scope    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);
 X   ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT fk_cl_scope_attr_scope;
       public          postgres    false    3865    274    273            �           2606    17755 .   client_scope_role_mapping fk_cl_scope_rm_scope    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);
 X   ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT fk_cl_scope_rm_scope;
       public          postgres    false    275    3865    273            �           2606    17171 +   client_user_session_note fk_cl_usr_ses_note    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 U   ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT fk_cl_usr_ses_note;
       public          postgres    false    263    3687    217            �           2606    17750 #   protocol_mapper fk_cli_scope_mapper    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);
 M   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_cli_scope_mapper;
       public          postgres    false    242    273    3865            �           2606    17609 .   client_initial_access fk_client_init_acc_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 X   ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT fk_client_init_acc_realm;
       public          postgres    false    3708    223    295            �           2606    17557 $   component_config fk_component_config    FK CONSTRAINT     �   ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);
 N   ALTER TABLE ONLY public.component_config DROP CONSTRAINT fk_component_config;
       public          postgres    false    3936    293    292            �           2606    17552    component fk_component_realm    FK CONSTRAINT     |   ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 F   ALTER TABLE ONLY public.component DROP CONSTRAINT fk_component_realm;
       public          postgres    false    3708    223    293            �           2606    17257 (   realm_default_groups fk_def_groups_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 R   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT fk_def_groups_realm;
       public          postgres    false    272    3708    223            �           2606    17117 .   user_federation_mapper_config fk_fedmapper_cfg    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);
 X   ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT fk_fedmapper_cfg;
       public          postgres    false    261    3820    260            �           2606    17112 ,   user_federation_mapper fk_fedmapperpm_fedprv    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);
 V   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_fedprv;
       public          postgres    false    260    3745    234            �           2606    17107 +   user_federation_mapper fk_fedmapperpm_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 U   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_realm;
       public          postgres    false    260    3708    223            �           2606    17475 .   associated_policy fk_frsr5s213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);
 X   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy;
       public          postgres    false    279    284    3888            �           2606    17460 )   scope_policy fk_frsrasp13xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 S   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy;
       public          postgres    false    279    3888    283            �           2606    17832 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog82sspmt;
       public          postgres    false    301    276    3876            �           2606    17676 5   resource_server_resource fk_frsrho213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 _   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy;
       public          postgres    false    276    3876    277            �           2606    17837 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog83sspmt;
       public          postgres    false    277    301    3878            �           2606    17842 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog84sspmt;
       public          postgres    false    278    3883    301            �           2606    17470 .   associated_policy fk_frsrpas14xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 X   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy;
       public          postgres    false    279    284    3888            �           2606    17455 )   scope_policy fk_frsrpass3xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 S   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy;
       public          postgres    false    283    278    3883            �           2606    17864 8   resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy;
       public          postgres    false    3888    279    301            �           2606    17671 3   resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 ]   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy;
       public          postgres    false    276    279    3876            �           2606    17425 +   resource_scope fk_frsrpos13xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 U   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy;
       public          postgres    false    277    281    3878            �           2606    17440 ,   resource_policy fk_frsrpos53xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 V   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy;
       public          postgres    false    282    3878    277            �           2606    17445 ,   resource_policy fk_frsrpp213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 V   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy;
       public          postgres    false    3888    279    282            �           2606    17430 +   resource_scope fk_frsrps213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 U   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy;
       public          postgres    false    281    3883    278            �           2606    17681 2   resource_server_scope fk_frsrso213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 \   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy;
       public          postgres    false    276    278    3876            �           2606    16691 +   composite_role fk_gr7thllb9lu8q4vqa4524jjy8    FK CONSTRAINT     �   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);
 U   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8;
       public          postgres    false    219    222    3704            �           2606    17807 .   user_consent_client_scope fk_grntcsnt_clsc_usc    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);
 X   ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT fk_grntcsnt_clsc_usc;
       public          postgres    false    3798    299    253            �           2606    16971    user_consent fk_grntcsnt_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 G   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT fk_grntcsnt_user;
       public          postgres    false    253    3735    232            �           2606    17231 (   group_attribute fk_group_attribute_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);
 R   ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT fk_group_attribute_group;
       public          postgres    false    270    3845    268            �           2606    17245 &   group_role_mapping fk_group_role_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);
 P   ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT fk_group_role_group;
       public          postgres    false    269    3845    268            �           2606    16917 6   realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 `   ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j;
       public          postgres    false    3708    249    223            �           2606    16701 3   realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 ]   ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j;
       public          postgres    false    225    223    3708            �           2606    16961 &   identity_provider_mapper fk_idpm_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 P   ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT fk_idpm_realm;
       public          postgres    false    251    3708    223            �           2606    17131    idp_mapper_config fk_idpmconfig    FK CONSTRAINT     �   ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);
 I   ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT fk_idpmconfig;
       public          postgres    false    252    3793    251            �           2606    16711 (   web_origins fk_lojpho213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);
 R   ALTER TABLE ONLY public.web_origins DROP CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy;
       public          postgres    false    216    238    3682            �           2606    16721 *   scope_mapping fk_ouse064plmlr732lxjcn1q5f1    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);
 T   ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1;
       public          postgres    false    3682    229    216            �           2606    16856    protocol_mapper fk_pcm_realm    FK CONSTRAINT     ~   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);
 F   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_pcm_realm;
       public          postgres    false    242    3682    216            �           2606    16736 '   credential fk_pfyr0glasqyl0dei3kl69r6v0    FK CONSTRAINT     �   ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 Q   ALTER TABLE ONLY public.credential DROP CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0;
       public          postgres    false    220    232    3735            �           2606    17124 "   protocol_mapper_config fk_pmconfig    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);
 L   ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT fk_pmconfig;
       public          postgres    false    243    3765    242            �           2606    17792 -   default_client_scope fk_r_def_cli_scope_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 W   ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT fk_r_def_cli_scope_realm;
       public          postgres    false    298    223    3708            �           2606    17166 )   required_action_provider fk_req_act_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 S   ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT fk_req_act_realm;
       public          postgres    false    264    3708    223            �           2606    17872 %   resource_uris fk_resource_server_uris    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 O   ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT fk_resource_server_uris;
       public          postgres    false    3878    303    277            �           2606    17886 #   role_attribute fk_role_attribute_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);
 M   ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT fk_role_attribute_id;
       public          postgres    false    304    222    3704            �           2606    16886 2   realm_supported_locales fk_supported_locales_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 \   ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT fk_supported_locales_realm;
       public          postgres    false    247    223    3708            �           2606    16756 3   user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);
 ]   ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5;
       public          postgres    false    234    3745    233            �           2606    17238 (   user_group_membership fk_user_group_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 R   ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT fk_user_group_user;
       public          postgres    false    271    3735    232            �           2606    17415 !   policy_config fkdc34197cf864c4e43    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 K   ALTER TABLE ONLY public.policy_config DROP CONSTRAINT fkdc34197cf864c4e43;
       public          postgres    false    280    3888    279            �           2606    16866 +   identity_provider_config fkdc4897cf864c4e43    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);
 U   ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT fkdc4897cf864c4e43;
       public          postgres    false    246    245    3775            �   
   x���          �   
   x���          �   �  x��\]o\Gr}��������B�����5�ꪖ'�H���Ϳ�iJ���i]��$����t}�S]�?��������������͇���0��?��l�����7��m���q}�������oo��ʊk�C�ڥQ���e�:jM��x�������߿�Zϣqs����We�\'~D�eJ�(ɜ����Dߒ�s}N�p���SJ!RSW��2�xD��\���w߿��ݝ}Yr}����S�Ֆ�eK����$�3I�^�p����݇k{{sl����k�#e�.X1il�k��cv�;'�a;�z���чۛ_�[�5=�ڸ����!C�l�b��H^-P�nR�-��� �S�:^�"�"�w�����<x*6�
%�B\҄	�[�)9���w$�V���I��#+h����~�������C�����Vi�ܾ�}7�r;j�
�b{+	Պ�2��g����T�n��?��g�jG"d7�fiP�e`C�2&R����3�;C�3w���a_E O+T�q�s���}�͵���3#	_��ۏ����&\{�WF\�6b��S���"#�����/��x��nG�k*f'���)�t�Ox�c���<�0���Sڥ�����~�������}��Cͅ�y�k1RO��o!�l��i0f��ֈzc9$T�ؑ�r�Y���X÷�~IP����u;��l6�iʅ:K�!%�6�N�M!�G�'Ŗ�e��Ϸ���5q=������9s�](�\������H�96��۝���P[E��%�R6�9@������2Hw�d����@����x*�2�C���<ukow��OC���W��&M��J��~FJ,yR+K�HW�j�/�*��hO�CH�cI0��b���Z)gz���{X�!}uN�5/�����Kz�>���=��U�j��M��73TD��<&��ǘF�y�M��C�q9�yW�Q��1e��1-����C�{,���?�ˡ� ,{��0Q�^�^�p�Ii+D������n��Q�V�=u�]q�U%���Ѐ﮸����YY��c���c�wv�b�A�b4~����D�^�;�=UO� ��L�Z�Jr"5��U/Q��s��~��\Med�ս(�e�d����e`� ��!r��O1��#�#�\}���S�'�����m�������dԻ��rV�� _U�k��6H`��k}Ÿ;A�K �����7k,`���<��p����`�ɀYL*8��D���F\{Gi�9�*U���R8�����6�������-nG�/u�𯁬7ŲV��� چde�#+�;�qtgHA����3�*^)�f�z'N((U��yg0�v��p���LV�7��9l ��($�Y�����.mW��*5Bbg��a��Z��k��R�K���]��t_y��<m���OH�Ӑ�Y�Բ}����e��=�i�<��D)pL�%ɼHO�<w�G}�ி��ٟ�w�j ���7r�Q�f�Z�u�2��^�9�Js���$�U|�I�Dy�iW'RZ���hO�n ZH5�T7awj����ܫo�Q��os5jbjI��&H��ܞ��zU�v��mS�=���5���<Bl�����a�����~|��7����{5�ă?��PJ����l��஡�p��C/AB4ƒsvj��ƣጊN9���A���(0N����� n�:B�۹��$qcX���#��Mcˣ���=��"J�������ט}#���E�%� ��48x�������ҩF��Ȩ����V:#�;(KA�8�98����K��'7-겸�M���r2gSXS��ب��~������טv#��ٔ�Y$
��x-H``���eQ�@?�����ȴKlZ�*L��$�83cŜ]��4mcN�9�ONA3��$Ȍ�Q�����ٍ���\%��#���	H�D��Ȧ�G��T�n���z�'�F ��@l;��'*UR(��2�mw�i8U�n]���P�!�������"v#���;��1� ���u�^�M]�$�87>��>�zv;�}�l�>���E�Z�X]��鄣�H�|d���_��)��:trAZ�UP�p�\;�l��f�Z���/�m�*���{��R�,қ�u�kh�=,���ȍ�$�{R��͝d�(��?L�*�A���6���m��������F�a�RN�&{sC9Շ��:���D�W�&GV� �ն5V�@EM����lU=�-/�u4F�������ѵ���=�Vk���H�FKp@0��� ]���z\9�|tmC�:�����&4V�"9��˒�Rp�YxH��ٹMɗ�Ֆp�^�Km:f-�\j��y��.�j��bC�6����<�8���h�alĵw�]�� �y�<
5��*v�ʌ^�3U�3���h��c�ڨŧ`CV�8"q�G���h�h� P�6�
���\�@��Q�op������EF5�ʇR���%r2�5�0�q�O��17�ݾ�M�UX Hy��H�X����~:l��}{tm+\H�.�Q����_D+��Z�(��R��<�=���lA9AC�8��s�3���7�_>�w_���b��W�֠a8."ܹ��+�n����5�c6���������|	 �5���Bd4
e�E,�2����{_�禍��]�&�A�RU>�2n�)�	���;����o;�VS� [\�=L��B-����h�hJ�ѵ�0Kh�{p� !����ɕ�Ȕ����5~Xu��u��<��M*����^%8�+Q�E_��X��n��·����sx6�����`�m�\�f��i��Nۚ�6�0�_4��ѵ���:��-À�SM�«�ØH�҆>帽 ��F�vF���Z.���}ͯ%]����n�ir<A��A��hW�'�>i�qȫ_�k�(�jQ��/1"o]�3� ts�2	l$����c�/r�s�xEB���r0p���JL�|K��%V��)\j;�]gWC�������Q�U�a��+�Wr���r�p#��/��b��<�
�+���Ym�=�<��k_#V�Z��.'5m�o&��p��V�4zQL�ް�I-�w�Po�\~i�kd��5���[��-.����ފr�ףn̳A�͵$����>���$V/���bN:�����C��؃&�P���	�7����<�?�}��T2����
$d�����(�KD=�/�rwM��:VK���HZ�@��u�ɺ<.�]�� ���v�*2A`]���{Envj]u�Y�aMiG	���7�S�K��[��3	����ֆ��4�{!g^I`��'*2Vz���Uƽ�z��� �'�x��Sp�cm,Z�^������2��Us;��h�x��^缚��
Jx7��n]��ߧZOη�shU��5����D��ku��� �f���rqV	�.���Dcݢe!#�8f�IO��:ڀJ��dIxCC�$��'�;���� Q���t�V�,�#[����eM	�_���;,�������F	�V�b�'�\�#`�����h��^׹n$�=Q�j)���u�}��vH�F���}�p����������iT��9�z�BD\eb���x͒�ٟrm>�m��fS.�692��~�|7�VZIm�LT'�d�n�t<�c'�<��+��[n�"�悯=�so+��-��W�f�;�B&�
7'`��M{�e�FX�7������뷦���X�=(��`�������ee��@@-m�&�G[�bH�����L����7�\����O1XG�8�ܝD�F\{�7��e�ɻ52���
�n���:��tj�������R|ģ)�j��PzT[אSwG�m��`�V�U�:�k?E�(�Q�O��T��{�\x&�cM3��� ���{�r�*��A��x]���I�jUʪ�qnd��b:~�w��?��t�      �   �  x��X�RG}�Wԛv#Tr�/�'l�.���E�_7���L#���S=�,�p4��C߳Ne�9�y��ۣ�w���w���U^�e���h9%Mø�O[�����_��e{^S5ˋ���4Ux.�+�(߬��_��y5^�i��!�iM�}��~�e�晄�&��sk��&��2�����
���ٴ�����|v�@��-�U.kp�P�<:�x��S$����bW�~��_�X�L�����/�8]����p����՘ZZ��TM��(
�n�+<�)�4�MJ�8{槭;8�y\֡)-��wo��W����*M���Ć�`��gÚ��W�
n�����qеT޺(8����<��4KD6P7Y��2��UZN���%-��>,��Z�W���Kl�?n�}������qc�%��y�"d�t��t��@�J�J9TG��Ԕ�Fو����C<�j�&Wt:���ǥ~zζ+���ւ��[ݰ|�3>��%g\��].��O/�C��r���]������ypRpgD���&}�,wM+��)��O��8�WbW�x6x�/��S?Vy���xA�ٰ<ݏ� bJ$�y��"l�H<P�DSBn�|x֭�ƫEe��f�x9N/�[㝓��?>9:��آB{���ϲr坂ɔx4e_M�PP�T�&�b�7f�����Af���}�l^y��ܴ��8t_"�U�I�c�Ÿ������3��C�r�(]����)�rͦtNK�<��>ɮ ����\�p��/e�ZN/���P�:�����^�s�.���7�_tSc:�}a?���UJɥ�i�I@|rV��6Ks[���x�`�	;�������e���r\�ۓ��ԋ�i�@
�'��Қ2���kp�W<R�8�F%ku��d�'����������4'o�����돈�^�D��$��4,~�������2�q'���Kؠj��ܥ"�,��N���$��Z�6���9{��_A�c�l�&�a�a@�4V���K��P=�����4 F��Z�u�����͝�`��$�[F���8��2�M�� v��b�.�|6�\��Wwi�/TtJ�:XDw���c�6�蓉Iy�M"}��e?~{��/���7��jl���s��[�[sٌ�u��z:
Q��*Dk�L�u,���u�쵇����V�g����X:M�r=o����~ R�P+\zySE��lM!����EG�����N����%�R����~�B�2ҁn\�`W���·���9��Y�Wazd*�!"����T�Y��Zk�pT���b���CvQ��z?��\��D1y��Y����҂T�;�z���@�e�)�Wng��=8�)t>�`�	�E�SHPgS�$�V�޳�=�.R�B��� A�Ը�҉�d��>lq_O7�h"G#R���Ʒ>�D��Q�xW���v1�ؽ�bE�8��U��s�^H�$3�x�;�E�!	+԰Y�|7�2R+T)k���B�E���" (� 
$|gS�y(7��&�B�{�E�>���"�������Y��]6�ʖ,ѷ�E�!�I�j���L��|���x��ZҰ(�w6���.5i��}BkaT�J`x@(M>4k�j����5�H���kͣ���	����Mg{����i�K�^GR���D��jǳ�=삯xOՀ�V�ƃ��tmP;4_=��=��T��f4�E��j�6m#���Ok��t�x�Ϟ�h L�      �     x���=O1����lF���C�J�H���8�ᤪ-��}R��50�,=z�z��,�j��ު�L��\�yz��4�<��r����o�u�U��,��*�#����)���츻P��o���x�a��sZ�b\g��w��W Z��VG�Y����f%H�q�� ��d)���0���`Ne�<�������+��aG&%1�Si`6	b��S�-���2�v�=���E)�F��Ԅ��d�\%�=�Cl� GGPMAk�x��mn?�[,> <��      �     x����J�0��<EwU0��O����,
2�3�r���MMRķ�#��
n���8��<U���P-+L�R���K���t�q�a<oC�������ꪶ��CK��@��Bs�WN
�5L����jo�����m	�br~���uq� 5�`�	ǐK2%Ĺ����S9)yk�鈐 
�A��iP~a^C�a/�����Ä4�ԇ����B��k;A�mO��@��s�;/��Lk�ZA:�rS1M�撴�v�������hȼ�      �   
   x���          ^   Q  x�͗IO#g���
"u"M��/ʉH�"1C�Qշ�3v��C�O������^������[Uo_^���ܻ���{A?��A�����W��z?7��hm1���P��/������Л���Wq0�C3�ɴ�a\p0��ە�۫��~v��|q�K��j5PLp�V�J�Fbm7}��{{7��.~�����e�,G�<��=~����uH�b���	9��Hm�$G��	Su�t��9���	��l���|�Y��qKh�衴�iԶ%M�M �w�ڟ�w~}�"/�nz�N��x��)Q�.�
h�-Dm�.d�:�D3���]�]y4�RWYSR�$y0�(��d�t�^�j�a����>Jz+��0^B����FB�P���c�>ȂĪ�Q��l�.����a�}I�O���;�,7��u�?�߽<u&E�W)U0�z�D�X&��`����x���|�v"]~ܳ��XӮa4�e�\��� -�����F�A�8�ݠ�h��������J �ߕ!ek��#6� ���IB�Y���&b�weX��VĂ+�qc��Ǜqc@P5�"R�Ɨm%��A�#
�O'�\% �J��U�b��"�W�>��
����D�Zru�Jĉ!�\F�^�o�B���=��`����'7�	]4RsS������<�1��*<XW
�XsV�ל׿��D��|���{3G6���NlFE��C�e1�Ɲ�����Q�QN�HD^E�������J�r��6�7���K��s��hr��itwԥ�������ͳ��@��/�����Ab˰NN�4�o      u   �  x�őMk�0���+|ۖv�,듞r�a���M{-i�+ֱR[Ρ��v��B���`��>�_������q�>�LC��k3Ε�����o����^�#c��IV�%����jQ��V�?6��2U֗S�+)�Be���������E\L:v!t�� ;.�u��6���oʽb���9����D�����(�~9;���sd��v	�.l����U&J������=�Z���<�lQbT@	�!z�h��R�CH�<Hi���"I�4S���2����i,�����\�����j��1(D�4�H�xE�m�n/~�g�"=�%�:�1��5���F?TF�Ǟ��$�O�a��=�'�v��rч���0P�?�4�����x��㼡�?B��T.�JJ}��e��z��~�vG      �   
   x���          �   
   x���          w   
   x���          �   �  x��W�nG��+�&H�/��H|P����(tWWœ�f������,C�@2�:� 	v�{��Ws�����g����{uy���q�iw����ԟ�����T�86�p�蠴��7��z"ȑ3f_�k��u<3��D����嗈6$� >��9�ac�3ٛ����_�t��e�&jWø�aR{ ?�/����o�����lj�TZH9��d6�	:�fm�{6�y��q��B����7j9�nOn���$|�;�h��\
T[
���:���,�/73#���;�o�B�4W-���dW,=tד[���:�+��� �Dc� ����a��k�5��>=��ͺ-~'���-�J_�E'�7��9g�թ��<�޾�8O�v�m����Zo���/!��`�^iw;��d��Z�7K��Ֆ6��ݪݬvI݈�|���)����SXF�kI�K�p����עA�f�k��#V�q���$���;0����pv]*��p�)bߊ�{�n�O�_?IS��9�@����A���u��,�+Ь�B)�Z�6)����f���F��WR�i7`������)�TgCL��^ޖm����\�@�Nj�Oؒ���Z�n�9�[^��Z�F��\%iŐLh���E("���8�S�ʋgCo�Rr�~a�%���gq�NZԌe��,I����\!�ާfX�Ji^�ʋ׬+�=.�,��d)!�5g�ٕ{V��5��
r���nA�c�P�Lm���L��|%��Xyb�Ds� [��IMATI��q�T��g�ku�
V��X��O�REQ�L���Yn�����#�g�r��;h����"5hdGL��I��ڿb�{+���K<[��Vy.J��Ҋ�e�?+,��m�^���=�c��k�V20��h�)�鎕�S�u����?�e��      �   j  x�͗O�#7���)|0L)#��������e;�\�T"Mz�����rr�C@��L.mcLׯ_�^�{����������ϻ׷2Ot�y����B�W��/��T�.��~}���ϻ���-FBH�T��<��o��͈%>��{�����Y��u�N�������Й�����O��Sk�t�wD�,Ϸ��/��q��������[������4X�b��vʙbL�cu��_��e�t��ô\F�b,j�V�T!��%�&%�
W*��*K/���z>�i���"ӑ�ʇIʞ~�����[�W�ι�@����T)n�Ruk�����_�K����X�Ƕ���+�C2��E�����c��7<�� �k��|]�ȶ�(&�,�	�P��
���F��n�s����[�v:���zlۍ�B��Z���.�!���+B�[ARc��`=�8~6zqZ���P���tB�f��PR�0����W�7�G/�ƺ�~�����V�E��(�2��Z�l�$��K0�(̤�֤z���,0N圕>�}��<��)&�[S [�@��J����%�>�p��%.����B?�YO2���8,cu��o䊲�VV2!��A+�X��,����X�*K/��"�ZE6^c�j�1b�7�p�G�~l[�Qǆi�k�	p�ȵV�m�a��"���փ��BN!p�j:Ʈ�� w�\kٶ�SbT ye�'�U!�#�e�����~��)r��c�]�5J�$M��β�D�m�
��X��cgG/��"W/Π��J�[e���J�l���`��u���K���|[�[�I:.�F^��  ͪ*Ǔ�D�������&�9Yl���XR�F�P�(���_M��<<�9g�>      �   �  x���ˎ�5��}�bv�B>�%V,XDBA��6r�m)R��SMn� }��hzz��m��?3o���ݏ�^޼}��������>~8����O������'/�|���������rƼ���F|&�<�S�ܲv-}��_��.\sݜ���lB���ӳM�R����ǧ��7�ހ�J]��{�+��^T���Vʣ/�b��Z󧤻\����R��e�ۮ{T�"5��S�;�Cq*��N��"�_#��W���LG�O)�ϻBғ��VSz�X��VIT���u�=�~�M^��c,���'��E�sP��&���֚IOIc��*y����>&Yi���I��P�k��j��<���j�iY��L�,�Y��v�e�4��h����������$����>wٶ:��U`�U`�U`�U`�U��e��e��f`�U����R�lw�,,�|���:W}B��
l��
l��
l��
l��
p��p��p��l�|t�5+dY�ϼS��߇�螃��m_��[��[��[��[��\�(\�(\�0\�!��a�:����xy&g�Y���=�\A�\A�\A�\A�\A�\A�\A�\Q�\w\ѕ��C�]|��ߴ�[:���f��+���+���+���+���+� �+� �+� �+���k�5v?���ɯ2+�>�����k��*_׺���)���y���;ƾ�G�m��>C�
��O��~Ze���_b��9�yh�+��M�r���l���A���]s�y��܊�J:�(�ͣ5U&]�^����+�^�m�����|/�C(�־���OxG�-E�L�[G%ޣ���*Y�Ikv���Kc�"���c>�(�>�,�����r������gg�t|��i�LKZ�qԼ*����F�7�OU6��w�k�#��������öUϟ��=�W�߯�U%��w^�o|��
l��
l��
l��
l��
p��p��p��p���龺ҩ��<�O}�Ri���.��P�-WT�-WT�-WT�-WT�-WT.W�.W�.W�.��)/�4*?�TI�3���o�����V�-WT�-WT�-WT�-WT�-WT.W�.W�.W�.ו�vc&������J�ZXג]_��[��[��[��[��\�(\�(\�(}��;�A������c
�*{�1���	g��|�
*�g��|�
*�g��}�
2�g� }�
2����T���Q�g^���0����מ+�\Q�\Q�\Q�\Q�\Q�\Q�\Q�\Qƿ,׫WmL�      �   �   x��λj�@��^O��lȘ�vvg�T)\���V��%d[$��[~�4���p<�?�f8���r�yJ�4O��7���RƟ�\�K\���m�����ٴvU$Y�H��\@|�$�Ui_L�%�s6 QE �#/;�%1S�}m�)Pj�$(�a�\z��%$e*5��S!�T�w��	�c�`�T�]x*��� M�      _   
   x���          �   
   x���          v   
   x���          �   
   x���          `   
   x���          �   
   x���          �   Y  x��XMoG��W��(���@OA��A7p��9N"DҪZ9��}�R��hl� @ЊO|O$�q^_�{uu={}y��lsS��S��tk^�f��x�������1h G\�
�G�����P���_oo���o]����PXyp)T(�y�M�`ur���!>~�����~����� ��\H^[���w[�-��|�Iη��'Ww���?�������������Q�p�F�J@�
����
[#���`�_v�~��n[�cҢC,l��>y�Iũj�xR�($�%d 2������Y.g����E�e9N�~�|B�Pm�D���R5�!���j�O59�o�7�evH��],V�ݘ�V�̟RCi�Qqj༨�N�#�.vn�b����I�v��:ꖳ7���vv}��Q�@��
�=�SҌP{W
B�X�U�x+�lI����f�4�v�V`ǫ�w����V�Q6 ����4aMไ��T�y���,H��:B7[�����t]�TZ �̅)�Z�������Z�B�AS,�� �k��l�U����y���׽��#o���|+��yQy;��������(/Ǖ�Kr��6�
�6�Te���-[^��T��^FD˦�	$t���sh�r�l8�\���Wx"���߅(��u ]]��ް��j���[�z� ����]h6�T�L��O�̪����|(6�l�4CyE4�/��iY���]�Ӻ�H�Q4CB+���~SKٶ }X)���FCu|�NAW�M��)qAJ�&�"%�R�*�y�׎�zB�NA42�D9@�h�-Q
9y0��$&�����X��t
�(UJ:Te�,^�!:BE�I�o��9����Z�7��M2��9q�.e�Ɂj��	�1�ۇcӚ��aBy|Őt#@7�R,����67��a�=r�plf��>L(Ug���ݟ�2(����iM�*[���ñyMx�0�4��\��ڥ��X�"�f�!,�3���ãs����)���P]���`�r��3��Σ��X���'�*)L�2�(~3WF,K�,���F����mZ�T�$F��EUY�[l*'���Yc��������      �      x�ռK��ʖ%8�_qg�e4�;o��H<$� ��5��$$���ח+�S}���;o�/NZ�$,BR�����^������o[������M�_��r����{�_˦�[�ڡ����W��Y�Y�hp-�H˜ �#�)ʿ����<��PF�T�|�	\I�H�r bN����|�'��e�<?�1�ox�����_����/���,B)�4�r��Q �X�&/!PN�D�/�x�AI�t��͗�!��+'!�3��su?L�Z4׊pՌ�!{4���qb������=��O��B�+� K��i$#�.�(�J^�PȾ:?7�2�shƟ��I$z4�A��P�(�sZ�@�ɐrN��lQJ����"�p9�-fe)r!���K��A�g�oCR��,/ir)�"t4F$^HA����*I�N�1�|"���i#	%.e���9��6�>��$b����G2�M������g:{<�=��~?Oe$ (@��H�"*i���JA(��b�������u���w�^��8H�
H+%�3Ay��s������+��lIf��Hg8'�,(9�-Y�P� 6/���L��;) �/J�f˂TaF�TF�Be�A��e������8�Y�_�2�%�H��I�%R�2�08�G?��_����L_�˟�N�y�dI��.�t7%/e%�ŒT�<��H�з��f���D��R"��6(f<��9ɓL?��)� �Y�/��ߦF �f�q�9@] ՚�,KK(ǜ,
@`�����L�J ���L�z��",��<_�gcg!�c�	b���PJ�62�Ǔ{�Q�?ޗp��\� cIB��/e��h�8E�1�{���v���,!r�<�I/��t!e�d8Ic �<��$GV°�iAH�%*�	��s��VDY��_�,�ۑp�(,R
�L����>�"��������
�w�K�,a>�H^b�
?�F�y9+s6�8�5L��Wg���T� b�O���%Ln�|��`_�3�]��*A�B+"� T�l!&��/q�D����O=�����Ǆ^sE*�q�(�
G�)��B �X"���p�2��yTH_I!��X*,au�� zT��a�0��B)���64��<��&�RQ(�'��3�,FDhKMД$,����t͗h)�L,EbɁB�;�1��oZTH��>Sξ�l�	
ɳ��5�!$���4(9�g���Y�#����6���C��O�[�*]�8��7J�E���	�q��k����p�5�z����U4˲'W�y��]�����W߾Ab7KE��`(2a��J$b�3�X�B!��wn0;W��/�?6)��������d&��T�g���JN,��JA�`�.,x=�@/3H��w���'��1'
�����e���<�K,�U����$�?��J��#e�M���. w���(����XV��"�q$v�2Y���Cr%��,c����z���NI��Nk7b2����)� �$8bA�#�0:�b�AҬ2(|�Â�eZ�")<�iR�D��@�9$�'W9�]1KcE"#Lr�4!�\�x!2��A�;xrҾ��ɳ�W���v}Y�k5q֫���=dߋꮪ�^w��L`�z��j��x�y�y����#9� =m�M��N�M���α�����k˿y�ݾ����;�Jo���n[�i�N��*�]i��y�R�-ym==��%z�֋M|U��=t໘�U�f%w)�}�4/�yV����ڱ�bc�}69�*�zܝb��V�S����p���!�T���x}������JO���=��͵��j5��ᨧI����])7Uea��I,�̵{��uǮ�þ�P� �����r̽3Sk�t����}`YaqRx���ˆ]m��i]�6��q�]�6�������^A�Zq4Ϛ۽`=o|�JH��z��u�׸9*������K������O�cn�׸y�7aD�����j�TU������m��]��핧j$�+Ugf��'i���B�5�Nj��p�'�Ɂ�O�������~s�3�z�e��V_~�����>�dXу���t��Bp�xX=����M[����uu:���[�Ҳ~V�0��Ώ��Q|����t�"�:��@F�z�&WЗ{X=�`���ŗ�yZ+u粨
Gbq�j�K�e<��9.����yo7�.�DI�Xn�ϺfnCudQ�SS�Z�pv��J*�e��.�~�?9F���\��Rn���@l�݅��x���s� �D���>s�2���,!!'ƨD�>���_Tl�o�!��hx���#xI��+�BP 醼L��M�|f���9��D�^��$��N.=�]�����n���槼�Ny��ѝSD�zCG��v��[ߴ�z��u}��+.�2�n��v��lu<C�zي��x�.�e��$����	ٱ��5�����[5���tTy?^SYY�6̶.{�Y�[g�^���]:U;ف�5�d]����e���T/������9o"o�&�JE�ɮ�Qm�/�3n�P�q�^9ǭ	\Y�����[R[I��VF����0�'G��}Ǡ�5�x}��u�2�e�����;F&���fc��j�����u�\8�ly����+�>U�mj��!	�4z��p-S��Y��@9%*au�}I*
���~���ʒ Vl�	�l�<V�.��yx�����W��GyG�x�*9M��"l"(ŷ�����;CE��p8yW*;Xu�Ri�����j���W��\aolY�
��8UV�(a}�גg�L�D� ���^��I��W` ��5�}��f���:<��`��|2�&1�b�����ֈ]pѰ�"Z7rY�u��d���̱pd\Å��� ����U��KI���u��*�M`Jl`j��q�ol��`��G�Y����1�ku���
7;�%�?�/�1�Ng��e��yݻ���RnZr���2��am�.�6$�p)�x�yN׎%m�:
��V�*�˱��:#�\
��n��>e�r�=��E��w�v'�\=��j:���lYra�:=n[Q�����M��_�r�b�&F��U����)c@=��q���b���q���)�P�.�L�`[r�?�����ki�A�q��m7��cEl�$�V�F3���09��Ÿ�|��F)��w���g��m�i�(�)}�V�'�6>~p�Iće�U����ѯ�P����~����f��>�k�5X�"���5�K���z^��6�<�z��^�]�����3S�;-��{�!:�I{R�]��iw����Gx7r�(�9�=kUm��(��eo8�gy�\���I�;��:Y-�Mʩ��4�� �ȃ[��G���p8����B}��u��<�=�3�{ឱGn{�Ao��)���z���l��]�:�ߢr�#�x��|��x�vWmM�=[�[�͕j3�^?^���f�V����6U��O���JM=���͵��&����Z��P7�p�3̅��fx&��8ag��~��z��^��9SH��J�5��S8D�ٕ�'~;����c%�'j�Qs˛Q�wk*-Ȓ�8=�o09�� -��l3ZɈ���2+��ǅ�55�Y �_9����3�_~��+J��B�r���6O����;��A}_��}|1�Q��zl��3)8[����tM�,&��s�"'hw�AuՏo�/wYu���y��q�90	���Y]�{w[�[�כ�p}V��~zڔ��s�)�u[N�t9k��[�~�ٔ(�Ӣ�b�2�&�T>�����'��=x%ϻt��+yoM�r+��4T�N�ׇ��F?޺�����nū�=�v�6E����yw{�R>��h� �ij����$ݘ���(ɞ
��{��a<E���n��#O���=(���O�Ŝ*�w�lk;O�Z;��<m��zv�am@��J0Ș�+��7����׬/={(����޻�Z?�e�V��n����/u�\�M൜�/ҽ����} �N���Y���g&�FT�>7�]DЉ�r�n���s4\�B�˴�~��eņ�e��p����Be���拥�R'��    ���ţp�pOTx��ړPPӼ��w�Vw.z�����7G�EZ�Û��V�I&��L����a]L>b�]R����4?�gy�	o�^�up�d�
4+��/��D��/�ٝ\��,#
W)��q�T�,��K�˝���Ico���J��7l+����{v�u��`MӡyA�~=�^�9����[��n"�J�];9q7� M�dg����Is�&R��:�}��+��wߎ��t�(]ZM,��C�n���[њ�������q;V�K�3jvѵY��n��5����N�̿�q��ײ�d�o]L��<��$�n�l�AQ�F��b'7Y~Zq�Fy��$]
S���PMΐٝmf�"�]u���B{���1Z�i}ء�Y�J'C����{�_W0����U땓L9=���,{ q��ƫHb�"���<�@DjRoY�6҂[v��x�ΐ(Z�m���^xG7�c��>띲�n=���4	�֠U�����)3�Ȕ�u֫\��桫δ2�g�>Q\�i��;���iw]mi�Ѧg����>������ymW*�M�/��_�]����y+p���Nv/0l�t#W�\�X��*e)0�-�� �v��N~K$~$�ă�G/5��.sCmw�IB���Ԗ,���y����/�w��$�T�����K)�I�Z��I��Α8�a~���Xo�v����j�O�W��R/�}{���3Z�sRFX����MLKhX�2RP-v�l���g�'�4���R�t�G�מּ36�gS�c=G�fշÎ�.�f��;m�������N�ug���i�xy��c󤋢S���\M�;�ȟf�:f׫Ɍ�!b��{Q���<��9�{s|$���Dx2��g%����J^KA�T�x3(�~�+C��s�2gn�����hB���?���zʂ1�SN�~9j1y�q�k�["+N��q�jV���P��V�ĳ����D�cy��â'� �|<��r*�[��,o�c�`�]'b�l���M o_OZ�_�$i6����q��S�-�fi�#�m�ѭ���	r�F�����܂� ���uT��k�pn�!��l��`�$:�<���:{�ہ�@��.y�w��	n/��p�<'ᶚ���IN\�{����ٚ\6�RFA(�ߨ|�8-xmF���[��w5����:�ŨV�B]l/Ez|�w�5V_��A':gu�3��8�ufX�O�!5���^�f��=k������v��q��)�&\���@2���S���c9�>��q��8;J��:p�?Fp&�z�$���2`��C/|lz[ٵ/j>'�U^�(��ĽM�euA K>�=�ü��}�ah�]?�2X��9����+�la����` A�Ѳ4��P }�R	9����i�Tz���/�`IB�ȕ�g��gyI�M���e d�[��1����?!;�R�%@��2.	2�� �P r���_�8���-�y ��,���r��eD����?F��v�b1#D|����Ň���#:�����<�M�m�x�}i��Ǝ���d�m�w��������l��x!
�����}6�I"	#ϳ4*PF����L�Yd߹��X��ȷ!��y� ,�в�}P�32�DY��@�c�LB�"g�L���FM��̃�y�%R�$����X/��}r� �H!�_��Y��Z��
��ִȓ�DH�K�#���vEl�BK@�8㿮S
Y� ��(SHr�BA��ԾL�+��eI�	<�rLNCP "��	�p� �j����ߛ'q$D��gAi��k�,�˥����?L�M��� ��������k��ݟ��2#oR���(��tx.Ͼ5@��B��f��j9�b.�-�2��m�3%�����-�)c�����a�[
�O���u��w��b�U��SK���3��8g 	M��P�|>��f�g��!ےg�{S+��x�~���v:���9�<~���b~�\��Odɓ��80��U��Q�3f��^�Oݾ(7/��V�k�y��գ�L�5���_ph�v���+�ߗ�ԏ��\�)�2׽d�5WY㌓6��j�p�X��}q!1i�0�Kp�b���\�}�+-b��"���u�
���,F�d����]���������qǰ?�uy�����Ü�^�rs3����OO}s��Fo�h?���e�(Le*ɸc���_��6i����iuԋm��F&3�F�,�%�>�l���a����b{Q(�4w.��� �}�}�XD�$�����=O�y	x�]UVS�|�D��j+��U����I��U�� 9���6V��&��.��s�F�R��N+��Y�g�[3n�m��5/�H�}�U��9|��׊q�5Y<�d{V֜��۴�P�`����7�Fe�l�ڋ�7�&kވ��&����
�ruX��j屉����*N_F{oO%�5�z�z��>c�&(����+����ρI|,u�}��[�z�ez �\>�<�%=Z��W��qY5%So�̷�2x�7�A��ݜk�K�R7̎���5Dƞ�0lbk/oر�qo0(��ׅ�r`�]�X����r�Z��X�����8���B���|�\�Xp�A��s1���V*ZQ�"�����1�/���}��u�����4�J���v�v��ۖ�����:�ҹP�Xk��v.筬0�3���QŇFM��t7��O�~'���6��˳f����G��T8j�ڪ��Ά�$�.�f��~�)��E�
����4?��!)"X�s�m�e��C�Ӳ��-�z�6�nĨr7 B�oR�����nZU,�if�>��T/�^Giw�C1�q�:�cUP�ۻ�Ah�l�_�]��E�Ũ����3�=�0���u�j�����}W����m�gl�N�+���O���\E=�E���ă\7���q��"���L����>�&6�"t1nGV��7R`���x�6u�jW�]���o�*e�����"�3�ñ���e��*=�F���֎�>���+*�\��^u�����\�B4r��4��gwٯ��"Q�2�1Ǘ� }���;s��q�V����q�t����3ǯ&���ڊ�X"3����v�A�ΓU��Γ{0n������̵�68��]D^:!�Y5���Q����0R�^l�)�gV��vn���3*�����M����E��b�� ��c=�D�[s�U=.9��{��G����J{3��E��n�k/a$,sȤ�I���_L2�L��[�x��SWC�[��c��Z�<�g��I�fYm�;�d1��+�������M^�޳�=�,Yga�ݛj�>����7�a�&�i]�C�S_jKY^��y���a�	׸�ri�C����X$Qڭ(�>'��!�L��᜹�m|�����@N��%�S�}��X�o�fg���%����H���2�{l�PZ���<�;�p|]m͌v���|�Br���zMH8��z���rQ����x�{1�v��}P-/y�;�����Ԡ$���(���`�(<��N8�0��Us65b��f#��$\�Y$�|Q�ӛؾ��ΆC���5��٭�mc	�ؔg)7��E�k��a�|OF[��ԉ�芍�����I�)\���鍻ۮ�z�^;.�PA��a��Ё�sÞ���yB�/�eN+$f�]� �Y�0�\JR�k[��sA�b��D G�6ʈ%d%���x.������>\	%�O<�Lŋ�B+�H|T.Ʉ���#[�M�>��GHZ����
^�e���`�]�R�VI�h�>h��0�s��R.���㿹�4��{���5����wD�,g4'��Y�%v@� �
��z�kG�(g��˘�"�xhH�jI�g&bVy���� �n{��������9g*.$_p�RS��u3��C3N���t�KzE��KEq��Z!iz��\	�h�ӽzm���ߞ�7���n��ݫ���X�f ���ۡ�f��5��@;W�{S�,g���$���ͼ[�����D�T�d'�cskO�Nq�C雨�ɶ ��_Zn�[Y`^�:y��n�������)n�����ш+�f>�C�=��^��K��]�8�F��`sK� �	  {������p��&ܤi�C�M����|zA�]����fgU0��������ǧ����r{tϦ`�V��;TK�ʍ5Q���W���	�)��!�u%������C�\���f��DdV�sԧ�PiP��݁��^3coزC�Y���8��������6����Ԏ�3�� �Ƿi7�v�{�0�N���Yyj[�'�~�V��{
]�Y��^{�g�VG�o�0R�k�ջ�j�Yd=�G�������Dj
��9�F}-�Ni���Ti�؇G���k��$�˪̊���A{���/�Uʾ\.0�>���5�Ǵ��_-0H�s�>p�̾ӫ�^�G�ç��֕�Sx	c�J� ����z�8lP��ykۏLr>��r�s/�����/{�V�g9H���ڣ�V�)�A����[}p� ����[�u�"u^�u��5J�ȣc�'x����9��v#2�,�|��������g����������/0,ǤL�=�dS \"�����ϯ�5n�h[�5�#5TU6O�].&6�e�n��lvU��J��MCo!���/�x��9ØIs��ז:q��˜��=rF�+�����%<�=����)q��\w���{��̵{ʂi�5��s�|]vs1o��z��*�'�k=T^4�K8@<,v�Bȩ#�~���O[˸d-+O��`����?6H�]��S�=h��K�~���\���T��}�����5���o���c�?u��k������r�=I��]���Ev:�,��	���'�_��R�&;�t�q�iM�l&clgy`��1O�'�����J$�����<wcξO�ú�Ӄ��?��Y�6h��� ߀[�/���κ�FM�#|u���+��S��~9*��8ucm��y;�:��j���xjZe��y������8?��}U̮�wăI�c�yK�ԁ���-�2����_s�j]�_�_�ogǩ�~a_m��:�U�f�& �����aX�r!љ�y�[�x:cŜ�y@�� �-��&O1_d�\'ǟM�G�R�p��Cr(#�+���O�*����
��k�*�v�s�瓐r�M���\�T�4���i(~��K�2��u�;�����J��ϧ������W�a��qCA˻g��%�VF���>���?3|+�[��l�a.���֍ S!�i}Z*�e��k҇=���)�wu}E{����(��{E$_��5�S�d���+V<#��a�sHJiŭ�(;�J��^�I]���8h��0��Օ9�D�v�Tvx�qX�q���]v����^�����+Η�.z�%L�w�9q��a.�]n���%��U�����"�1��+�Rg��Z�YN�ҋ���e<�F�>V�)�o��+ٽ;���AE6�w\Se4���]�{�c��6�v[%��]�y{�V#Lٕ�8���)b#��<�z<��)�6� ��o����bU7��5nP4��ϳ�?^1}���='��WHK���g(�2j���Tʱݩ�Na�\��YO����������tޛ�:�w;���ذ�����{��a\��$-�A����w���M_��ã��Т�w�@����^qŤ�e:�	Q���U%�z>K=�-���lM��X  !���wx���(�<�K����6����`!B���`$�������,㖙�KE&��ٿ�}VYx~�]K����L�%��f3P����|��J�����܏?ڪ���t�~�&��yeIC�	h��(��B"�C9����	BIBF�I���������'��r �tD@b"d�� ��W eN������O9��d�(���p_k��\B��b.dX,%�@_�*x����h�����$�gU)��-$�p_���"e@9�CZ�8G Z9�y���E)~�@�9O�M*�K�(��d�����x�2�NE��,�e,GjC����b����0� �Ŝ?����H+��	EJ���,������9�E�8�<�y�2(EBP&����2�}`���I���2����@��h1�Y�`������#X�!#���X+I�P�%<�PV��H��j�����\�YFs,�~?�$��e*�  ?��>-�D[�0��9#C�Ф�9�E���x6/����ݣ�J�SrbӲ�� B�rQ��2O�8�km���h���T4Z�,�)�H`�,�����OZ�"�DPH�>�I0	VV�%��+C���e@���U~��}��2 
����S���IL(�geE���st&
��EN	�b&J����o��x��e@��0!�%-s��T�P�,�(�n��%$-��.DH��<&�I]Eb��rY�<����Tb3D����\ �N�0-c��E���o������+
_����zE�sxY�_����l����P����ρ'"�h�K�pH��R��~��%Q�e�eira"q%��@BI.9�I0�h�=��/���߸u	      a   l  x��Zˊ%���W��m��x)��+/f�`��{k��������n@&80EA��:��t�������O?��ӟ>��o��������_������������?��/����7��4]E��mR������W��Go,�~��S�eWͅ�.�&�5O�j-%�\�~���?|��C���-O4�Tjme2J#[
�ū�%�"�聂[褡��m�RQ4_�6�T�V��7����h���iüF�����\�l�Ԓ��:5߃e�[��{��-�`t�}�2iG531�.A�ZJ�֨�`j�;�`'��H9;�r�ב�9�)�c�Zb͕f��*�q�l�#2��n[N�OmRW��nA{�<��Z	�mH@W��b+�oAg�Km�CR�8u,�ۮ��X�撵�b�1�p8q��q�����$%��o�Z��X�i���������u�x��+r��eQڊ�b4�H�M����g�E)��9Pk�l8�̤s�;c�!�<ɐ*�I���!"�� �8	���ݚ�� 4Q,�AÍ	�Y���ݚp��rY��,��p#<SJ��J��x	-�zX��VsLnU$S=��� =�����*ج.�r�a`PV�Zx�[�Gbx�׏,��	
������J���P����,��2��%��?	h^1[	Ժ^��%zP�����a�V�-��+ذfV�>�b�Q�cv�ǁ[�ޥc�v9K؏UZ�K�έ�[�K�٣��1Ã�c��Ŧ�jo��i�=Vb>=i��\JW#I�v��y[�S�f�,!��	�DWb-���GΗ|F�Ӝ��B�=��7�7N�7/�r�Vm���v�vĭ��mJ:���^?�f�ɲR'+v��v������=�fK9������r�.ĳ��.%n��k�B�����a���	�e�<�-3�P#wl�(	���3��+-��%����6�I��u���ĽM^����["}�RxJ����i"ի�E�F��b�oy�*�T�2B^өݰ#�p;o]��k���1a.���N�
Y�R���z�jp�%�H/rB6�L|b W� �kw�2pT�f���0f��#��	��ք�6{�5�b�A�{5�1{ϱtߚp ��,t��1K'�٦*������-"�@�mxK�R�<!��w/�ք[�j�x8?VA�a6(���g�o��l�:��Bt]a�!$s徠�o��"�9�G:|���&<���*���0�����l���X��rM�z^`L5?U�@T`�e6y;fO�W���ᰪ�{�j�T�V������˞^0���R!�MP	�a�x��v̞B��Y�Q�(׀r�r)�h���5Ï�/-X��,aB�j�O�	��]o��)t�U��6!�C���u-!A=Y���[cu�����j�ք�G4͜����:��UOX�8w&�G
r������t����Tx#�m̺�R��֭�&�k���:�\Xd�us|b�v���h����'>O�2"��d��L��9���u�����cJ��r!�G�!S�w
�V�s����)t��ŴύBd���Q+��cOh�3����s�"���h����<`��rR�ǭ1K������@�s�*�5�>wn�r��5�Ll���2�\X.8����:�[3�ZF�^+�<�1[d����H�h��lo'�����S�UWQ0�1�|�f�iV�t6�XU����p3��S)��b2����G�5�}	��ܙ�U�*�CA&��QW'��u�����O��q)�(UU>��_SJ��	y�vDz�릵��f�_�3r��sߠ��΃�c$J��-X�6S Z� N����Ƹ��
�eD�E��G��U0�9����!�SJ�˶�	>��?���'(��֕��|{S��)�����ܞE��4�\�mO.�և?����F�ډ[�+���&��|���m@      b   �  x���KS"1 ໿���ni���q˃"�~�0��$���2,X���{X9X���[��ݩ��+��]}4.���A��ib�����j���^v'��җ���3����:���'d�ƈCi+g����=+UU��u�#�Y �q�k@��@3
ǑV�U����!��P	��蹼Uia���V�w�f
ѡ�%rB�����'h����XF1�<ݐ��|V�U��U�Yc;O֫Z֘-���-����k���d�d+��Z-�Ʈ�����K���s��[>�^s�B_���:�̗���^D�|�0�����'����:� $�P�PD��Ց5�:#޷�0���4�H1 �0Jg�qo֔aN�/��K�]��O�h<u��t�ke�X��}E�n�5ܟ�Ely}����u�7W��GIa���y�����$�@.��B	$�^�[�U��>:R)J В1?.ƁR�A-�!yCg1�?Dߪb���!j7�x�_=�~�Ю�����o��ጒ�q�5G���Dt�ͫ�Sч��M��m�����a���v�����/7`��
V�������Xh�/d����06�rdc��	A�|�.7(
Xgޜ5�ݏ1��$�ĴX� ��>iW�mo��C2�vR�ݓX?T{Y�r7�o�''� 	      ]      x��]YsG�~�_�7�Fܺ��؈�@P$h��}a�)qD\�5�~��A@��hi6l�e�]Uh|yTfVf���d4���&����Ź����Xs�gs�)\�?���{p::y�?���_����ѯÃ���g����O�w��7����o��l�v��2��p4�������f��`i��?./�H� 6��V�䯘�h���À�/���l��뿊�B�@p����4�ay�>�Q�&��03�"��K���߻�����l<9:����Φ�����^UO�GG��g'��X�ۨ��j�N�''�٨y�t�+�w�;;;���G��7�C�y�y�[ʄ��J�~�Ͽ�e�+xK�cŰ���v��Ϧ�G%;(���s-������ ܠ������oy�.x�\O|���FB�S���F�1#=�\)�p�Gf���I?�p�ZI�2�b�)�ԑڻ��t�^�����h2�%8�-<����̦������������}.�[$�����������J�C�c�6�x%)
i�M���\��˿8�>$�g����W���������$d�_��)Y�����LWDIq�3��)��B���p�sM��Γ�&H"�x1qZ0�v��x:�M����C�Ѵ㰳��h��nt/�髶�n�爊dY�l+�Z�V:��(w"
Ǎ�>(�$���?ķ���K�D��F�s�A��̤^
nb��i��� ����G�(����n�.�q8~[n�g�����b�x���g�?��d���k�$^e�-3�q0��ћ-�2
o�"��C�~��������bn���z��Ĺ�*��΄]{ĝ�#�-�IQYƲu�(c	M��ᥫ�Ml@��6W�0�	=0)ezM�2���JD(��(b��1"��}9�,mO�;؏.\�{��^�=�ܬ��J3��+BM������Fq�"v:p���wOg��Nf��ӓvB���ƏC�]����R8	�� �L����8l��"s�sf-��O�o���9"�[�͔(�_������8�4��:$t�<^L�d�F�'��Ko�������uy=��_����Hx�	K�2��G!0�Ì(!�^I9ú�µ�Z�t�{p��ۊG����4ǐ'����Y�M�a�:��S�o�/������+7����1�Ww���Q
u��|��4���=Yx�Kx1��	[!~�'�gZ�F�E�XĹG2R���)"�R����L�>}q0�B�B��q��|
��'bB{%�;#���`�̯;�e�݂3_����k֮��L���#�&�}I�6(�)7�<d���y�"B� �BHkKD�.��n�������^ \0b8��Xe_�R����#��������ʗA�j���;��NN���z��@��|T�,G>�-�+x�{8:|3����~z��=���򣥵H�t�~ 3�fW%�7ev�Lq�)�[2QƑh����3��DF
����ZC���ÿ����`���k�:�*>=N���))̣�������QY��|<[|�xoYAf�u�����t��'���<�5��m���z+P�@l!��(,��n/Dsq��\܇e�v�N��ٻ�eԖ���0���Fp���6L���=��m�(�hƕ�N.�C$�GB�
�����R�R��䱓�������<��,��$�MXG=���dV��i��I����2X��O�������a�k��ۻ���5�`/£KúӾ���i�4����HdI~�7�D�(��X�8��jC@x
�����u�v��zEh���IM�y�:ǭa�雃�p�iC@p����Fټ�K�*e�F�x��<D�|ʃq"r%)�
s���#k(�~;T���v7�`l��0Iө3���`SE��0�SO<�W��y%<z��W>���<��0~)����������S�;z��e�*[����]i�W�,U�u�.7���������Ar�&)fKS�h��h�I:`�7	��Q:F)	�����`�z�y::��N�`���J�[�swz�e�ӫ���+��r���vO�l&f����7�X}<��vE�ڝ��Y�s���;�.Mm�='`�%��ƬI)����)s�!�pp��`$��gV�:�����<L��S��M�L�MP)
H6At�^��#����d8�FR�^L�L'������:�����5x�82�S�����Ɣ�l��aWۜibBR����&-��$c��`~BL�`�E��G8�!2*k��yqt����^'Ѝ������:�^}~�?]��^R�	�Y���B�g���<"��E�	�3K�Ü;�b�?/�ԄȐ��^�����R:m�g�s^7����&��Z�+M\pg�)5a�^���D"ҜU�ƴ�Q�$#w0��h��Lj�w�2"����Jm���n�g�Y��4 ��"'�V�0M���0F9��.�;4+3�V]�zMS0�jt�{�p���܇��Ƹ��n�//�������RR�Ҕe.*5�X��+u�9I�܀}eR,4��{���t|��b��L�,ID�q���MԨY%�n�B���u�^��
�}7oo�� "E~�kv�@�0�ET8je58������?y`�<��alփpi�/�������������߽�������9A� �*l�<�"���0���9E�7DQo���!{�-=
xكO7���A���0"����4�>(��>J*U�^�|�>�(I�f�Q[4�d����gG��������>�-m��?�:�z�܃7�*�"�!gi4F����*e"��u�o��Ї��&��� �0օ��;�#$���<�8��;�]2�D�!�tnpS�����^���&TJ�^�2ES��oO���E�D�#�0� ����2%e��{8b=���p6_o�~?��<x�n�Y�q�"XrLt�=Vq���c #���;�)���56R��:=pê��K�%��
P[-|��!NS��y/���1^�_��m��=���o#�f8y�,��S���R��vF>7�2񈹾=�G4�)^gR�5��~����`
�@�H[ExT�Z�X4*�F[fÌЧtP�%�:ұ��_�~S���[�`�҇xX'27������u �O�=S^xÝp.
�_����10�](�"Ud^�#m��؃���n�����%mp�x|�_`���]a�}�0�����?%g�ө���M@����R��^ X�TD�4(�%�.� ��M]�fU�`u��s��EՏE,�t�#�曻"�3R����q�)�X[d�������EC}���P�O�¶��a2��86��#�q�#�(&�ԋD�:�8�`���?t�>4.��/�޴ܓ��-Xf vX��{���[�o��",�J/�u�BZJ��Q����x�|�{w��\����h��.�S���
�D`�σ���p5�4�o�o�6y�
���r��c��q\(�6ZC��^J�Cq���Bg�ᴪ�5�xH%Ss��9��Ch}�/J��^�	��2B)�v�B'�u���h��峭w���jc�Gq�e^��Ѫ���U{1��J�	�hs����JIR4��Ϥ�C�@��)OF̏�Æyg%^�̪ګ�O��^WE�����U��5ֲP�W8��~�"���HO��8'���Hn�p��xb�FXK��!Za�����'&���<�c��a�uMW-�6�+�L�#T$4P�<xS:*X�J�p�ץ���5,y1�k~��b��o��P32������w;&�F����9Q�_�<^ab%2��JzpI��:����y k;�D�"ǙWx�V!!0�8x̙"�!"0�ҧ㧆<�AJM%���ٛ�����m��,��U��-���ݣ����(��l������R~d"F�a�b8ZI<��8	�O3ã����nb)V�h���f`B��cj��/��Q)�Z����)���$eicQV`�!s��O?�~��br4{{r�n��P��>NgYn�����*��5j#��#���=�k��\�8�f%h-\�v���h��s�Sm����4��bG<��F �  ���\�!�����:���S��Y+���We;�RJ�����e�dya���<,]�)�\5q�J�����K�w��y�6��&(4AE.:pU�+^2r�pk��LQ��A�K6ΎG�ó�x�~4ۤ|��p�_Y[�/6,QŌ�ӓ�	����/�����[ENN�z��ݗ~4�d�H0y|  �%l�T��Siㄋ���b���<����m�Z��t��נb � 6~�꽔�<�p�a��g�O����hd�yz�G	1��i)H>�1� c�)R�x�(����dcb�IU�[�G9��"����U��n[�Ge�H�'A��p�YGX����8E��<���}&��0��p��ۢ�L.6&pR�5iZa���`dՅ,z�������ͼS|�5gA ����0�|kj�7� C#�*r���.��_�p>OG{g��٢�`/�e,�<{`��	0pK;�<��5�C$�<�+�"F4����"5�-��߸�X�,�E��H���5rJy�"a}g����t��,E���]B�I�����=�$�T`����*Ͻ�2Q˹�J�l�Ke�K1�κoe޺������̪�DW?4�:U;�J�^��U�s^��>��0��1_;*�6�k*���ȃ A:yԎy!x���CNbe����L�8�:ZT�:�l��q~bu�K<T.c�Iq	�O����/>������s��ah��A����M��ȋ���qʘ����f=D����D�����U�Z�ܵ��b)#�2���(��&��M�FC�&o����;�vO�Z��AO�k�ٖB��y���7s��~�^�Z�/�<#�T&;f��E�����f�R��X�c%��4�B3��B&�rr29;����`�?:9�M�.[���=d�i����~���������ߑ��P���EAd[,�q�
�.+��=3>Hf�BF����)?�G�c�[�����*Ђ9��4 i����<ŒƷ՚jEJpY�(�;�� I�GYk��W�jAa�\����k=ʈz��V�Y��kx�I���ݢ�w���vt��E}���Bl���h�u�#Ԇ�B+j5%6�oũ�vڶUP�%G}g�n������W�ݘI$"QBs�6�� �CEK��RvS�.���`��_���2"&s��X�&�*�P�-C�!%Ơ�c[��~����l�]�2�MS��oǳ���<MǓ���lm޹W���+����|g>-�e��)R�H�<n�q4X	��&��8��s��N�5e������e�k+lf]����~{}a������u�Y��u
���=OY=�;͂��
��0�4nj��� ��$�<�\nq~����W��e��@�qQ>*������4���� ����dӎ���,k���!��|Nsý���n�u=�����@����u[���//����I�P��έ����t�x��Jj�HnLC�Ҫ��<��u�2���
�]�,���&�V7����|���&��}E1�x����EA�����������#��-���rM:�l���P�ڸX;]��Z
_~�g�Z�'���_��n��@w����w5W����@ I��(�G7l�BG�\t��A���&ږPw���f�rd;�ʭ�/�`�Υ�����O�e)�%#I���� p�pp"Ю;��]��Ħ)�q�����K�*N�U�i� ����F0�)�+p���$�EK�N���`�Vm	/�F���C��:"U���[xI$���KP����z�n&�"��2#�N�wq]�-����s˭]�ޥ�.���7�ø�����7���;�S���^yiE�w�u
T���5�x�4&?��r�1����y���Dq�;��3_rwXz������x7�#2D������P���H���o�)"�\2�{�F[#=�	�Vz��0
���R,+��х��7�=�5�������=���;�L���:�(���1��A���Ǖ$e[��@�\\.��\���ܝϯ��x1.�� ��4����.�R[r�"��.,G8�I��I��&������8UV��8x��2�9��_���niX-����H0�p��*.#�(]1-OW*�����Q��AV�y��H��j6���i%��A�(⹆�#x%�xC�A�T��Z�yC���ȭK3];��L�}8�|�{t����f^��4Ff�q�<�Z,��,��������7c^���JJ����t{m���kf�u�1]&l��F�3j�&���-�2U&�;b��,��?7ܫS�*˯�����%HjM���w`Mhq����
��1E��� ��ZG�S�i[�n	yM�2����}���,����/F`�)+T��s��#έ�[fiP�)��Ĺ��+IR��S�@�5����E�h\T����6e��8zD)�,����f�0j,���w����J�f�u�Q�R�TA�f݃��-8��){�87�-��M�,:0 o$�:"$}�DR�	0 �E"ZA-�`'zې��lål���#�KòV(ټ��������gG���n]��J���+��;���\	�iz_���V	����h���2�D7�1�-I��gN�����T7s�ͯ�:59͛,�f}o:#�"�k[�.�֨�X�����h���#�b2u��jL[��cۡ�f
?�}��D�`��[�~�S�QQ�u�)bրC"أ��t��3�p�P����+���EFW����������HrF1��UJ;r�Q���Z�TX�������m��i�s���o=�ZJD�g��%������%0�C��d'!WϦ�o���܁�d����1&�K81�C�@����J�Q� é\�\3ƫ��
��<��(K,��(��5�ss7����*=/��y�y9x)*k�1ʏ�������@P ��0��ƥ��޻9c�.�Lt��-�6B�()zaT�2K#�%w�8�%)��ȭ�2��0�␠�:_Us��YE�ѵ�V�b�U+��e���p�y�}�ʲ)]^�׉ܭ�Q�kU�I�(?�6�H�B�r ��ޱ�{�CŒ����Q��#e����u���q���n�׬���x��k	�)��[�9��[/4��9%R�N�ώ�7�����+��e��nR��Ӯ���5�Q+��^d���G�	�R/��QPH��H���MT"@�`�2\��� ������3��#aTI	�@�ZX`(F"�.L˶_^e�hY=�g�_��y�jD-7����&u�1��6o}0�U˰f��7@�l�%s���z�%X�0�]-)%�ُ$��#�,��E�{HM���X��WӄveL��^��	����E�[ҹ�J9���'dW4GihL}��RK�6�XA���2�o��ip���; �����Ղ�s׋zE�`m!�հ)E�%��zY�p\�sH%���_����`�v<��%�`B�OҼTqְ`��t�y�PT���0Ώ}�����8$J,N=1l�E;�Mz"�6\Z��&�V�b��U�ު*�<��>��%� ��.����M-	p@w��
������͆"g��)�y��Xei�,}> ��!�l������/-�<8�i�F1�Q�H��Ӟ.�A���%-玀 �������X��IT,�����ۨ�&���^��j89���2O�!]��l��'k��ELI�"_����R�so�
��RE-�5���Ȑ���w�����C��/�G��<      \   Y   x���v
Q���W((M��L�KI,ILJ,NM�H�KO��O��O�Vs�	uV�0�QHK�)N�Q��񁐚�\�$�c``@=�p��� ��Ep      �   v  x��V�j1��+�--TŶdK��r����"�B�����K���=첰�zv4�����՗���������|���k��<<���������|ܧo?}��=���:GG��t fD���B����鲖"��s.����2B\��d]���~����ᰱ��7`�
���J@���fks�q<�z��0a�E��LϺ�`MX}��sz��Xc�ޭC	+ٕ�A�!��]W_��1t�1X ����+1Yֱ����lj��tT��5����"RU�k��H�hs�
I��A	�і�=;�����+�䦡�K9bV��57G?�����+%4��!]qkh^���!�0Y����J�a��C�����rh��X�ugߕx��J�����Wg����O�� of���_q�4�n# �5EZ-�T`�k�f�y���v�1�tu�0I:�`0�ލ�g; �R�rvRY�,��`Lk�&R%P��D��E��Ӕ6��{�W�ʿ���$)�9�)R�9+%�u�Y��#\	�$�=�rf%�4`���P������-����u��*��m #x��IDZfZG�<�p
*+��%�刮P��6j��y𡞙"S�3�*Wu�鸸�(�z      c   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          z   
   x���          �   
   x���          �   
   x���          �   
   x���          {   
   x���          |   
   x���          �   
   x���          �   
   x���          �   
   x���          d   t  x��\�nc���+f�	�
��Y�������l'�AW?a4��Fr����&e��f4�dHx���{��q����~��7?�����~��Շ{���z���7��ۛ���oy��o~|������Uʮ(y�)B͸>��0V��㫯c�!��H�	�%6�1�`��2�Q�?v|�w��Ӽi}���;��3��d�ޕ�w������ׯ���篾���vL�d�%�I:��J,�8��e����^�ۀ�8=�\�4+J=�J�Oe�:/��أi9���]�ߠڼ:=�&�����B�7���P�bz�-4��Sp�9��i��FgI�y���$�>ww{�|���U��Vۑ��;���]üi��PS��)�)�2�XU���r�����������n�G�� oG��}$�C-��붮C~���~|D����6�vdG`xaM�o 7^G���C������ލ],K^��ÁiH�Fw��TJT�}��)���%`���'_2��IsPB\ʆYە�~Հ���W�p{�.v��{� �n���*Dx@���^�j��.���J�������^���]ݼǓዐ�Rsgby�#�%+�X�'�&m�$ޕ���]ڲ;p�1/ט�5bS���� h���cD������|�11��G���hb�k��F��C� ���Е��O�[-$�,�����;����%�O�Rn��e��;�p͘?�2�>/��h?>��%ȥ�V��i�P�ِz5!cUֵry!>��%H�e�݈�V����>���J�q�o�q�;ח�ݤ�\J��{dȘH�#��v�����ľ�"��\~�\H3U,9y�;e-��/;n#u�ǈ-�؅����bc��j'Y�rW&c�����J�?����E�����������5�}A�L���0d��ѓ���'¬'xX�Db�kT%~�%�鏫��ȏA����M�v�Gp�|N�ܠ(�Ɩ=�9-F��������L�t�$Z��v�|+`G6V��,���<
r�#I���޿��	9l߸i�b�c�������WԒ�i�ٷ��P>|������A�^��H`�6R��bp��s�&������ɡ�o��݁K@��7mS �_[���;��V"�@�}�M��:t	���-��o��A�&�/�ڸ�vB���%`O1Ql��"V���@��F��Fuf1�֯��Ә�t�$Ђ��n^r��@@ȕ�@�8f<��fFn��ReM��݂7N�I�Ր�G��$ �����m��C�����f>��uƊP+�N�f�؅��b�Z�+˳��w��ܼL��\��L�
���8ZC9J�d�E�ᚒ?�9��	x3"�F��ǭ�?��p�m��l�.�gd�>��o񰤪�{��޿+o����FO�%��G��AfF�(�T��0b2x��I�n�Bq�d�q>c����MN�9�/��o��u�9<���h!��;�J0Tb��F�v@�K0!�Њ�ͪr��xW������8��ߠ����ٻ���/�I|����j��|�����,s?��K���{"�A�@Pr�yv�
����`�6 {1����!Gf�  '{�\�\sK�F�b,�k�4{O�ކ�J�J�1,�BħDn�ñ#r6m�#4{O��`�C5AN
�n��a��i��-�u�O��=�LF)���Ȱ�Pg����;���u29z��D��PB�@h�ԝ�����) $�T�!��{"���E�
#o�R����Y�e�D����x���oR|f8DM C��Vw�b����g��k�f�$ XLJѦ�$0)�o6��*�l�h���Q������ÇӃ�-����p�>��<6�?��'�K�5��	�2n����1jn2RXN��=�4<E�D�'`~3��A.y�r�V�r�|�f���y��ɓ=�:���MT�)�h�������/ݺ�f�Kg�'�F��L�N�0�G��1�����=J�y������ v���6��ư�?��{��8+�A�H���zG)�D}nu��`��'���J�yVV�z��4����,2=n�߹>�����7��&ؐk!�s�]/T���V��b�{Ԉ΍��M�J� u�}T�|�d�8��H���Ftn�vT����l�b
*�:�^`�5����jD�F>�9s�b63����G!�>�#�C�R������Ly�Y!3���a6s�+���C��ѹ���\3�if��HZK�B�s�K0ŭ�~x���2i��N�!�=?���8J������d�ѹ%aR͡��ؗYA�7W�ٳ���b����c��l P*���Ƞ�:r��}�P���/ֈ΍��!un�3z�}�l�� ��8�Z�/׈�-�N�����I���:�F�.�4Wu�^����чv��� 6X�ԑ�r��1����Ԉ�-N!�@c��6��9-�6gŬ���׈�-uip/BH�1�A��49�F�0-��jD���M7���A��h��H�%�X��"WܣFtn����*Bbi���+"BƁ�j޸��J�/Ԉ΍>e��sX�yl�w6TzP��p��_�X#:7z_��#Y;��-�Y3�?f�t�2�911��:�#�V�(��K��Y$�O���~����.ͩ8 ?TȤE�ҢdnFMZ�~�疀$��K.L	�����L#w0z7z$	�q ��҈\�-"$L2��!X/�6S"�uְ߁�sˡ�nM� �	��W�I���&���:9�t ���8W�2P�|�D�@ʳ���cy8��&^>pn	4#&�^�n�HH����ּ�k,�׭�����,���s"��q��j1��)n�>a���]�r��@�T���Pd�}��%,�mw�m�'��VFJ�k(~~�RIx�����ƨ��Ōp���RG�2YV�M� 
�V'�v�Ǧb����zr~��(�G�=�<������y�@Ⱦ����p�����m�.q/;]�j4�|�s.9qڭ�%X��r�}MC��ހ7��$:��'`�<�@�ia�j�v�G�U�ґ���p\�
o|o���������5u��v@�5x��߿��ͬ\��{Nsx�ꚫ�4� q7��U&`��CU��6���xWƸ�2K��x�c��*|�bgo�J�nɬ�y��p~���zUx      �   S   x���v
Q���W((M��L���L/J,��ϋ��OI�Qs�	uV�P���/IW�QP72�3�3���M�̌�-5���� ���      �   .  x����j�0��<�В�Zr�k�I
q�5������.!�^���T�"�;�����tF���Sk�|rZ[��EZ}�x�޸�m���=,K]d
Erֶ����2�JB)5-S�Z*��-�rR�UJx�"
ْ�J�T�j��3���
��y�s?�XL�;@��5v�F��d�+ܻ �W|O������U/�ڏ&F��4:}R�Α�<�ͽ~�@mB\��w!u�X'��uIK�� �ONM�*#��f�c��f�,q���݌!�G�0|���������'�#��      �   �  x�U�Ko�@���
k6��<��G�,"�:�)���b�_��������n����=�Ư�vg�x����ZL�,�u�N}��S��VW��<-����m�e�(WBq	s��mf+!2�EH�'֘y��΅��6$3�J�QR��9j6.Ð̈}�cg>2V�W��H.q����t�$ec �x��Ԟ"0���+՝+i��V��PTe�Dg�F��Y)𐱼U�v�锡�	(�N���kqz�N�z�$u�j����D����Z���N��eӯ��7Ϳ��o�s�iK���M���5uh��ϯ�\DZ�L��F/�އ�]�����r[�����}�!;�q>��ٶJ�t�h�c{s�/��\s��̮�8�y���"=�8�6����igz��:��������c4����      �   
   x���          x   �	  x��ZKo����W�H�~ �|0`8@l�t�tˋ,I�"e8�>5K',@Ɋ�/"��4_�L?�j��o�����|��w�y�$ǃ��������~�����������_~{�7���n���bڈ[wʃ�/.�����?��ݩ�<������gw�Ezwg�x��a)��Q��Qz~��\����(���Ph�"$>�Xi)��������/�:G�^uz�鞨Ԁ8L;I�]�{���^����������#����A�� V��F�T�t� 쩕k_e~ �x�R�,�R��h[��ut�kG�p�����)��|{��Oڟ���xw��ڲ�5QQWx�XCM������xK�({����M��M�7��Ro�{:o���S{�����G���c^AQ*�N�4'��bKE4�s#7Y�Y�y_�/Ƌ�
����s�"������'��(jkܳ �>q�M2I�Hq�r
��	����{� T+/�F� ����V���l�T�������Ej�z��NE#~k�Q�եX{yw��R����5�jh�k�H�b.sq�UOa��^)�eyW',Q���	095CsU[�5��~��pE���j-Ըe �paɓ��V,,nZO�����U[r4�2v>c�G�4�\���-���G����׈��!���87b��.<��X��~�Co�n=S�W�L�Ҟ�P���Ӣ�L�#���:���R������Wy`R]32�=��j4�F�祳�����?���p����y�P�݈;�h�J#�R�\z�Xr����5Gs�:���P+��=�h-�ٟ��ӻ�D�_!�QYQ��e�~U����0j>%�������W�Z+hpp����B�����z>7�99��VW$ f��ۜ�X4�����~���;�ǟ~���j��*!@6��p����	����S������n���A�*tl�A�uR<�_2撝uHmfF��7;�Pɬ�d)��|g�4�@��{��OI�*��;�Y�Fe(M�:������H�Q6�`(��a"pN#CV��k���o��&cw��yu���(��D�̍�t,��ۛ��?�P��8=���c�.KJ!��Xe&�d��t5�4��k"U��̋bG�E����$���%A;�==������RFj��Ap��ō���	�z9�8���cDH���Q�,�=�y�����1�@bo�ow�lX�O��O~�$��Z�E�u�[��GP�`Z��
f{��	kJ�su�<��^X߭�UFĜu�0�dd!_��^d�qv�}�&�NCo���iԵ�L0�U�:���O�^\��@��O��8��!�q7�O�1���%��~�9����>ا���(ne���@�q�eI��Yk`�{�s�� �5��b��Av��N�W��j�/g���db��x�|#q�_V��y^j�� ��٠������i笹��>�KE�AwnN�7���i�L�S]�
E��w	y�B�Wێd"� h�l9ㇼ�K�r�ڥk�~+(Ҁ�j=O�TJ�t�\�r%E�LW7b��Ϧ��e��k�b�����(N�������/�����^�5@d�3�f���4h�) Ԙ���.�^��͸9S�ӽ�԰&F��9}�1.�^&쨱���؉[9CIPZ��Uv4�z�׀PЗ�Crfn�� w�B�P9�]����/�^����a�Z���K�Y}�^S���,��R��Z�3�N˶��ä���jr܇IZ��R�� J��1�/�Vg�@ж�֪����żԫ��,ʼ/5U�Ҕ�c�6�r�vI/��h!���9]�Xc�<��&פ�^�5 @�sbo�����$��{�^r�K��.�^@R���E�k��T)Y+|Q/�*5u�<��ЏP5���2�xO6�R^�,��� �j[�Tl�&4Ŋ� �<��^�X&;s�'y`Uf������^�5p�d��g�ɤ�@(:�rw����e^jB�A�AZȧ6
1Tu]e��ْ����P�\�CcKu(��="^�K��J2Pp�`ulT��k�ƪ[���/8��f�1�o���ք(�ǌ�@��Я�^訮}-x�o-Ǆ�ܳA�ϒʅ�Tu�Y��|B,�@�4�*ǘWK�|�T�yF������]�P*���:��/�^Hr�h���nWg�;HE�c�6��c\�K�
�h�$�����N#Rw�YJH��py/5�R�E!���d/���;���|$�t�,�V����},[�7֮��R��h�#�'=�����%,T������U���TdAN��ǰ�>��aq/�f����,oo��Q������K-��� A+K���м�����q��!v=UÚ�9$�`�3C��DB���3�{�RK�>���@��h�Q�\+��PZ���_|�/f�\�      y   �  x�ŝK�[����ZP��~ +��@� �����2cI�N����#�Q !�"O�7J����>������o���7_���oN�y�+���z,���S:����}����_��o_}���o����n)���XQ(��Id��϶w���������m?w���x9�r�����P�i���������K;������������t��w���^�w�7�9��.��D���!=�����O���|j����Fl�ti2US3��3e�S�%�&��iy��ˠ�o��Yڟ�eW^��/��E�~<?��b�7�O��7B�+���(���9>9�H�XLV�ĒWvT\>���Ev���Q][sDWŅº�[d������;+��/ZG�*2�:
�J
��Z�5���n��n�E��xh�&��7q�07�"��n����\؆A�d �v��S�ݕl�����C�ļuL��Aa��:��Ε��ڗ˚��d�Uh%�a���z�w���r��ĸ�Wob�w?��#l2����Z�z
�Md�6e�d���؝�K�L>2�0��G˗��J�?0���_���L���9�f�Hɴ�(#�����)�Vz��zi��j;ì�Va%.f%��w;i	vR��(k��4;�<V�g�����I\>�I��Ӯ\�ϸQ�-9�J\(�J7�|��f�`/�}�<+�Sdj�{P4�j&�d{�m���|��f��ek�0
3�,�tn��ϭ>~*�ݾ�ţ����ݗN%7;�4�ܸ �\єV����|��f����p�-9�V\(�V7�|��f�`/�m>S3��if�ch��"�洉�Æ�*/q�@/͢�O5][��
s[t���P���:?�+�P���i�bSͲQN��IIQ̩QU�Ē�nb�".i�I�Ӯ�}���٪C�Ą���'��G��k)�+��	2�W
-URU�T�6).�x�򁖚E�x߉�9�P\(�P����v��q����J��kj���jS��k��,=�qA-��|��&�yw����Fp��q�s�-:��I*�O]��rK>l�D/�t2��\D-K���#�4��#g+1�3[���4�;)�$�O�d0�L4����Dj1�b�Vj���|��f��)���lߵ
3[x���P��XZ?���wk���}K\�<�J3��@���v���V/=���#C�藧��s�̙P\�������I"x��I7� �}&#D�l�����DaJy��$�����~����y����\�/߬��Kf���������<>��ut �i������g�->~�J ѷ�B���hf���_��-�z�Y���w�����+�E�Ƃ�)��}���J��T�2�bwz�ݹ|��fѧ�����)X�eG���5s�ҏ�_��{1Fǌ�69�JI�4�~��oc�Uо��Y3b�1�I�'���w��CHL(.��Q�������+@/{�m"U]Iz_ɔ�(z)�]S�ڶ�43������~J����~�e�r���>	>����\��G���U��v�>��Σ�] �|�r�)�A�1�D�d��c�#i��%�Kk�_�|\��j���IV�it1�r��ƼX%�ҙ)���g�Hws���﹥��/�ƹy�>�<~�s^�O�h�k�����&��U\�4���r��v9����V��{
�
2ل*B��.�r�����Y"��l�!y{L諷�����	�m�"�y{���cD;lۆmS���Q:I�K�qs�ȼ�I4<׈�9$q�	�%���|:@�4�i�YU/��e��P[�5�?��"k����"6R�	�5*�Kr�꡸1Ɋ�BΞ��6F�}�/�x�ʁ���g��ʁ��6��V#h�H���۲!D�VZg��Q��GV�D��"���dB��Ȁ ���}T�d�&�	҅b���.I׊�K�e\>r�y� ���:d��	�������!�r�qK�c즑N.�)1Pl�IYSzsM,�[2��ҁ��8��-9�d!����W��2��L���))mu Kق�cbK���|�����O\>�K�h|N[t���P��n��~?MR�Q�����SϮ�Q������}��dUY:6q��j��hx�h�����ݺA����&���Y[m3ټ���(H�;��j���v���C�3Ρ�)�l�1yP`��90:�{��6T���ة��X���vj�:��e�4���#5�F�fK���_���4�D��挈�1�Zǘ�Ǌ-��1��zM�������9�D�۳E�l�2����I0���,���BU�j���M$���۹zo������l;����D�K�%��o3���m���'nO2�%��VM2�LFnE씋�j�c�L=ۥ��|d	�I4��0WsH	a&WBx����$}�V�Ъd[n[�-EQ;Cх�Z�K�r��z�[�T&`Bq�	T)e,H� ����ܕ%դ�x����.��'����l�!M�	}�&�o;��ַ��'��#m�wW(W��I��t�y�>#����$\댭8�KL(�Kl����$�^�����-O�)G)�0�14�M�yi.�>���ԙ�9$�	ť}� ���ޓP�H7!6�����P��Q�9Z���miN.�!2�^S9�-<d[�	�m�p�ƖP�E�K(D�sס�ΒASnI��9�ܽja�J��GFs'��ʁl�!�\&��j|$w��>��D�F�Ql˵b)��I߳6���\[Y9p�VU��/;�:�_]9����$zM�@v�������Ƚe�y�I�ʁ����Ԍ�+ 3����̤C��x���+���#�p>�^Y�-?�m�L(�m�ŗ9���=mE�UmS<�T�0z7��V~����ҵ/���#�D�(�ɖ�M̄ⶉ9J#t΂��uՋ�E�t���2;S#���j��ҷ�q���U!�(��сm�(Y�Igss~�hK��\>��$Z��y���x_�d���7_l*u{g�HUl���ԓ׭h�Z[~�ɿ������{����I�ʁ�x��%[�7�Y2�z
"J�Fc���/Ͳ��qUHdv%dME�N�[Cq�d�Cm5k=�K'�\>���$~H��9����-U�l���Q�R��|s�L�̫�$ߥ�v3���,���8KD�l�!AP&��Kp�"�y/*['�����n3ƿ$s�j�V^�
����c�1�<(.�ye[td]��!��S�T��;{�b��^.Y�a>��VR��	}��<�8����_��"�      e   n  x����j1��y����"[�e�U8I!�ҭm�PHH����IC��@Zha�2�o��i�Nζ�監��/���v�����j��`w�=�|XJ��ХF`���B�vS���o2�o}a��ړ����z�0�7�^޹yV,���p9�&8�쎗ߞ�o�e��|{zr����)?:�M�@d�`�p�	4�	!��%���O����ڰ&쉻�ë���߳�_�߬vh�>f�0�N�0�H:���˱��TK�Asl�9Uk#t��S��e�����XWͦUd�Ml�X'PJ���%�@m�6fҹꌲ�䡭�n�Zh�^�
%���5&�/˪��U'�T1�
��W�5?�`ɦa"�?���x�,$%t�Rq��1%��9�,��ؗ�����e4��<�6�+\�A���0C�
�:_2���ϫzw?n�9����`�&^�LZ!�)"�����,�v��	:ju#A1��;��U�G}i�|rꌎ�c�X���HQ[s8W�()+�A�T�B�<�#��S)[�>���d��BflM�� ��$��d���l��:#�f#�Tc�3,����螁�|��l�h��oa)TB�����\�`-`Hc��&z�����[1      f   �  x�͚kO�8��ϯ���]i��B,�e��l[fWZ��㜴�:v�vJ����=��eb� �R��y}r���ĝ�~�7(u.�R����m�'7����@�K����/�R�	��ՠnF@"P�T
��f��ٕīg=H�2]�g��J�&�5v�F=��v��Q�q#���Z�^�۩�؞W���]g)ӓ���,�nj��/�,�7U� �@-"�& X]�q(z2�F��M����g�$>��.��^�c�rS	������!ЊbNj�q�|PZ��
�H��}#�������6��_�����袽zPJdG!�t���gP3PDh;�Wuѓ�i@�pT�6��J�rPb��,�~�ʄ0�G��gRQX�"��K�vN�TBf�9�Uf�p ��0�)��0y)"���_�83�`I���1:>�C&<�Mg�-�:�*H�x�׻A����/��\�x��LO�2`	x w�5wf�ȥ3Bѽ\hug���d���&=A;*|�DL���.Ѥ]X�aF�$�Fy��$�y�I�r���֘\e``j��uJ��J�������x���>�I�M�1x�[|(ѹG���^��h��es&0��ƕ�L�Yv$ma�x�^+����C���.���P��%�`������HP���P����.��dfT;�	�`��Ǜ�t�},�X�a�.5!܅�p�R����| � �N����1�)��ᷧ)S�;N1�֜clY/���|Ͱ�����OL*�����^�Z]�$_+旿�H=�(3Jl��d�+��+�y�~�`�?�l�W�&V�, ,���vRX���Je&L0a�MH�y&�R1�R��a���bWd�5�w-oQj�4>��.�5>��6>y�4>��кƧ8�O�ܫ��5>y����䥹7>��E+���YӼ��s�r����';����:�b�:�ܥ�_�A9��݉8�9�hכA=��	�>�������}���V�b��%mc�c�x�Ŏ=x<��8�����3���iBoFk��ɼM8�b3��j����E����S��w�%m�
m���T(�Б�"^I�m�)�f�2��Wb����R�+���3/bP�%�D���� Sz0d��;C^��zǺ"Z�J������0���LN�/��|E�po@ُn�D=�|o@���S�#���r�E-�V��*3$���m��������X���Q��*/	ۉ�2ǜۉ�Ϝ���P�v��
�N��ۉr���N��1�m'ʫ'�v�w��|'�
      �   
   x���             
   x���          g   �   x��ͻ�0 Н��VM��>i���@b0t%n	�����w�3����KM��>��˅��/؆G�o��؄1�8���x���P�q�y%�a�@݃�^�k��d��;B�n��<�4��!)���F�]�r�Bj�ִ��e�v������^�B�      �   
   x���          h   �   x����
�0 �>E�(�I��4�ɡCA*��*i�
Uk���k�p���+��85���#���6��o׈Ϲ���#�O���e85Y�����=ݐߞ�_S�x��L@�iR+m���LKf]��oZ�X �[RH�h<���F�$���Qe      i   
   x���          }   
   x���          j   M  x����jA@ѽ��wrB^��W���B�퀧m�7�Ԧ���Q�Ulb�������������螏4����������i7w��W���l�h�-@� 5#d���`)��9��u�~�:��~_�E��2����]�Xm�Y��3+x��7�#��8���i-�B�T��-`,(���\DgC,/Z������0����&�Ȗ [� -!I m$ɱ�\�u��(�A]	p����~o#��ִf��L"(�R�Z�� ���L�[LY!�l �"�Rj"��ڿ�w>D�DH�8��jbg��kh�o�iY���~�O㼜S�'Q���Z���2      �   
   x���          �   �  x���ێG���)�n����\��FH�e�-_���j	�f�Xy��`lo��b�	��5���:�=�����f|7�4���Z�_Z�s�l�,0�����,�6o��Y�ӵM¦b$��ƹ�b����	���W����t|�n1z=���]ֿ��\��g����jH$,��qR�d��i������=�j*���<�?�z5�CQ�(����l4d��OR�Zd�����`>Z�O'7���Ay,������z�<lz�xi�(#�Wc�Hc!� 9o��1��mrw3��a:Z�'����Y���}K�Q��,���66#�"0��̠��E�hB�O�2���N�çu����-�]���uo$!�K�������5]B�+%N�u��G�׳��n���r8��'w��N�m���p�ʲ;e��#�g��9E�ƫ�L�����$�T"���̆Bu�Zю8N��׻N�f�U��,��C.8��ȬL`���
��HAHU���%�?��b��v��d������js�E�Հ'�B�&s�z�A��� f�1bM�t&�]�)�~��Zz����ķG��>{q�
�{CE��#f��ၪ��$R�Ux�������X�v{������ep�{p�ͮ�*RYf��FWA��rRI�s,��]w_�7�qc@P5J�D���Y0�����B����2h(�'���̹܋�lLT.��uV."o�.��b�����PQ0��%צۈI0ߌ���ɫ݌�m��U�KX������)�@�5�4�
�!��ǂ���\��|�ˀd�j�4,�S4Fh"��l�tA|�����k�_�ٜ���Z��Zp���[rH�8О��(^�!{	.Y�
�~��⺬�ғ
���D��;-�h���Bl��R|ܓ|u�W\~      �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          k   �   x���MJ1�}��w�`��$U�r1���J*�����9��x�{o=���y=���[��m��>���^����:?��?���"�5��!�� �C��b�I���q��+�4g��T`k�X���Qi����?�}���v�lP�I�QİR�!d��ܴ��z��-&�c�v���E�$�`H0�L���fb�N\�Y�Tx��J@.dHA��+�E�����      �   
   x���          m   
   x���          �   
   x���          �   
   x���          n   �  x���1��1�=����BTd[�e:u�!R��u-�lC�z�K2�����N�q��[��������ò�?|_����������W>N���v�w�˧��\�� ɱa�P�$�j�[�]֛e���m�um%��bDT�)8;zr��m��t���r�Oo��x�<8A��@*�a�()(�������<��$
*��
~��ھQIX&3"��TP@GcȒ�4�.>��ި�h��j���L:�X%{�R����6�L��q���[��/�ˏ�H�8��d��BU�]u�߶,��S��1]�-��"
����u�ٗ�;#B�@��dc�(�{��Y3{�Y�2(�����^ܯ�@-�#�:�F�V�R��G�ٓ������1$�[�j�@z��      o   
   x���          �   
   x���          �   
   x���          p   
   x���          �   
   x���          q   
   x���          r   �  x�����^G��}��6�(h�h$�ʅ���@�5�v�8���K^�[����H�������x|~��Ǘo��'��ۿ����>��/������|��o�?���CZ���6L\�&ppD�މ]�~z|�M�����a�DX�l;ag�z���W��MN�A�0�&X�_?�Ǌ5��{D�E���\�����V�1��>��2uBkk��AP���i���ѩ*����4�H̆�ͧ�G�G(f#X�EW����Wo������α�贚{�.�d��H��j��>:�Ki��v��O����!�[�GOK^�1W�ΓWUN�#5
�RUo�orn�	=�)��	by`�л�b�������ڮ΋H�"�]_�rnt���Jp�+r�)�D�鞴3�ƷW�Z����w������4�+��Ɯo����Ī󴭪V�ol�"qƾQ�:}�RƮ�e6Q��t=�L7j��b����J��,a�G���vմj5�6��NO�%x��x��-��������L!�5sm��ot\,��	2���U
��׾��֩���K��Z����|T���&媠g�~�'j�;Bn_�m�*��Q�����<_O_�����꺨A�)k�h�iӼ���oo֛�r��������yeCG���̆cY�7)�#^U�.��`���|�{�n��䕉x�@�k�T8�f������Cd�KVk��־�y�=/]V_2:��������      s   
   x���          ~   
   x���          l   
   x���          t   �   x��̱
�0 н_������%���С ��J��IAT��ur���i�z�SM�ۨۓ�c�x|����xy��j��;5)�$r�	�`+@8 C��T�2�r��Y9]͏)�PM�@
�48s6D���;ͽc���h � Q�`t���V���B�G[     