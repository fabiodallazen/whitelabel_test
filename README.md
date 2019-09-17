## REQUIREMENTS

*   Ruby 2.6+
*   Rails 5.2+
*   ActiveRecord 5.2+
*   PostgreSQL 9.5+
*   [PostgreSQL extensions](https://github.com/Casecommons/pg_search/wiki/Installing-PostgreSQL-Extensions) for certain features

## INSTALL

Create database
```
$ rails db:create
```

Run migrations
```
$ rails db:migrate
```

Prepare basic information
```
$ rails db:seed
```

## TABLES (DB)

| categories  |          |              |          |
| ------------|----------|--------------|----------|
| id          | (PK)     | integer      | NOT NULL |
| description | (Unique) | varchar(100) | NOT NULL |
| created_at  |          | timestamp    | NOT NULL |
| updated_at  |          | timestamp    | NOT NULL |

| subcategories  |          |              |          |
| ---------------|----------|--------------|----------|
| id             | (PK)     | integer      | NOT NULL |
| category_id    | (FK)     | integer      | NOT NULL |
| description    | (Unique) | varchar(100) | NOT NULL |
| created_at     |          | timestamp    | NOT NULL |
| updated_at     |          | timestamp    | NOT NULL |

| products       |          |              |          |
| ---------------|----------|--------------|----------|
| id             | (PK)     | integer      | NOT NULL |
| subcategory_id | (FK)     | integer      | NOT NULL |
| description    | (Unique) | varchar(100) | NOT NULL |
| created_at     |          | timestamp    | NOT NULL |
| updated_at     |          | timestamp    | NOT NULL |

| users                   |          |              |          |
| ------------------------|----------|--------------|----------|
| id                      | (PK)     | integer      | NOT NULL |
| email                   | (Unique) | string       | NOT NULL |
| encrypted_password      |          | string       | NOT NULL |
| reset_password_token    | (Unique) | varchar      |          |
| reset_password_sent_at  |          | timestamp    |          |
| remember_created_at     |          | timestamp    |          |
| created_at              |          | timestamp    | NOT NULL |
| updated_at              |          | timestamp    | NOT NULL |
| name                    |          | varchar(100) | NOT NULL |

| user_lists              |          |              |          |
| ------------------------|----------|--------------|----------|
| id                      | (PK)     | integer      | NOT NULL |
| name                    |          | varchar(100) | NOT NULL |
| notes                   |          | varchar(4000)|          |
| user_id                 | (FK)     | integer      | NOT NULL |
| created_at              |          | timestamp    | NOT NULL |
| updated_at              |          | timestamp    | NOT NULL |
| /** UNIQUE INDEX (user_id, name) **/ ||||

| product_user_lists      |          |              |          |
| ------------------------|----------|--------------|----------|
| id                      | (PK)     | integer      | NOT NULL |
| user_list_id            | (FK)     | integer      | NOT NULL |
| product_id              | (FK)     | integer      | NOT NULL |
| quantity                |          | integer      | NOT NULL |
| created_at              |          | timestamp    | NOT NULL |
| updated_at              |          | timestamp    | NOT NULL |
| /** UNIQUE INDEX (product_id, user_list_id) **/ ||||
