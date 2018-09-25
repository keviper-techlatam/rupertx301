# RupertX V-3.0.1


## Gemas

Para esta version en GraphQL se requieren varias gemas que compondran el ecosistema de la aplicacion


Gemas para gestionas la base de datos, alguinas entidades se guardaran en PostgreSQL (SQL) y otras que manejaran gran cantidad de datos se guardaran en MongoDB (NoSQL). Las colecciones de MongoDB se relacionaran con Entidades en PostgreSQL
```
gem 'pg'
gem "mongoid"
gem 'bson_ext'
```

Se gestionara el API con GraphQL, para hacer reguest de informacion de forma masiva a travez de un solo endpoint, con Queries GraphQL y Mutations para manejar los datos.

```
gem 'graphql', '~> 1.8', '>= 1.8.8'
gem 'graphiql-rails', group: :development
```

Para la autenticacion y seguridad OAuth2 se instalo Devise + Doorkeeper.

```
gem 'devise'
gem 'doorkeeper'
```

## Entidades

* User
* Accounts
* Contract
* Risk
* Notification

## Relaciones

* User 1 -> M Account
* User 1 -> M Notification
* Account 1 -> 1 Contract
* Account M <-> M Risk

## Endpoints

Consultas desde el agente.
```
URL: http://localhost:3000/graphiql
```

Optener el token
```
URL: http://localhost:3000/oauth/token
Header:
	Content-Type:application/json
Body:
	grant_type:password
	email:email@email.com
	password:password
```

Consultas con token

```
URL: http://localhost:3000/graphiql-api

Header:
	Content-Type:application/json
	Accept:application/json
	Authorization:Bearer {{token}}
Body:
	{"query":"query{users{email, accounts{balance}}}"}
```