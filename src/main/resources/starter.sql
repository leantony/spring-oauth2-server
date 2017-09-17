CREATE TABLE authorities (
  id integer,
  authorities varchar(255),
  primary key (id)
);

CREATE TABLE credentials (
  id integer,
  enabled boolean not null,
  name varchar(255) not null,
  password varchar(255) not null,
  version integer,
  primary key (id)
);

CREATE TABLE credentials_authorities (
  credentials_id bigint not null,
  authorities_id bigint not null
);

CREATE TABLE todo (
  id integer,
  version integer,
  done boolean,
  done_time timestamp,
  message varchar(255) not null
);

create table oauth_client_details (
  client_id VARCHAR(255) PRIMARY KEY,
  resource_ids VARCHAR(255),
  client_secret VARCHAR(255),
  scope VARCHAR(255),
  authorized_grant_types VARCHAR(255),
  web_server_redirect_uri VARCHAR(255),
  authorities VARCHAR(255),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(255)
);

create table oauth_client_token (
  token_id VARCHAR(255),
  token BLOB,
  authentication_id VARCHAR(255),
  user_name VARCHAR(255),
  client_id VARCHAR(255)
);

create table oauth_access_token (
  token_id VARCHAR(255),
  token BLOB,
  authentication_id VARCHAR(255),
  user_name VARCHAR(255),
  client_id VARCHAR(255),
  authentication BLOB,
  refresh_token VARCHAR(255)
);

create table oauth_refresh_token (
  token_id VARCHAR(255),
  token BLOB,
  authentication BLOB
);

create table oauth_code (
  code VARCHAR(255), authentication BLOB
);

INSERT INTO authorities VALUES(0,'ROLE_OAUTH_ADMIN');
INSERT INTO authorities VALUES(1,'ROLE_ADMIN');
INSERT INTO authorities VALUES(2,'ROLE_USER');
INSERT INTO credentials VALUES(0,1,'oauth_admin','admin',0);
INSERT INTO credentials VALUES(1,1,'resource_admin','admin',0);
INSERT INTO credentials VALUES(2,1,'user','user',0);
INSERT INTO credentials_authorities VALUES(0,0);
INSERT INTO credentials_authorities VALUES(1,1);
INSERT INTO credentials_authorities VALUES(2,2);
INSERT INTO todo (id, done, done_time, message, version) VALUES (1, 0, null, 'Write an oauth example application.', 0);
INSERT INTO todo (id, done, done_time, message, version) VALUES (2, 1, '1403947411000', 'Do grocery shopping.', 0);

INSERT INTO oauth_client_details
  (client_id, resource_ids, client_secret, scope, authorized_grant_types, web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity, additional_information, autoapprove)
VALUES
  ('read-only-client', 'todo-services', null, 'read', 'implicit', 'http://localhost,http://localhost:9090', NULL, 7200, 0, NULL, 'false');

INSERT INTO oauth_client_details
  (client_id, resource_ids, client_secret, scope, authorized_grant_types, web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity, additional_information, autoapprove)
VALUES
  ('curl-client', 'todo-services', 'client-secret', 'read,write', 'client_credentials', '', 'ROLE_ADMIN', 7200, 0, NULL, 'false');
