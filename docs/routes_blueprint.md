# Blueprint de rutas (Laravel)

## Auth y dashboard

- `GET /login`
- `POST /login`
- `POST /logout`
- `GET /dashboard`

## Clientes

- `GET /clients` (admin|advisor)
- `GET /clients/create` (admin)
- `POST /clients` (admin)
- `GET /clients/{client}/edit` (admin)
- `PUT /clients/{client}` (admin)
- `DELETE /clients/{client}` (admin)
- `POST /clients/import` (admin)
- `GET /clients/template/download` (admin)

## Bitácoras

- `GET /support-logs` (admin|advisor)
- `GET /support-logs/create` (admin|advisor)
- `POST /support-logs` (admin|advisor)
- `GET /support-logs/{supportLog}` (policy)
- `GET /support-logs/{supportLog}/edit` (policy)
- `PUT /support-logs/{supportLog}` (policy)

## Usuarios

- `GET /users` (admin)
- `GET /users/create` (admin)
- `POST /users` (admin)
- `GET /users/{user}/edit` (admin)
- `PUT /users/{user}` (admin)
- `DELETE /users/{user}` (admin)

## Reportes

- `GET /reports/advisors` (admin)
- `GET /reports/clients` (admin)
- `GET /reports/date-range` (admin)
- `GET /reports/support-types` (admin)
- `GET /reports/export/excel` (admin)
- `GET /reports/export/pdf` (admin)
