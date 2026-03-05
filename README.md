# Bitácoras de Soporte (Laravel + MySQL)

Aplicación web para registrar y gestionar atenciones de soporte por cliente, con historial, roles, importación de clientes y reportes exportables.

## Estado actual

Se dejó definido un **blueprint de implementación Laravel listo para ejecutar** en cuanto el entorno tenga acceso a dependencias de Composer (en este entorno, la descarga de paquetes está bloqueada por red).

Incluye:

- Modelo funcional de datos (migraciones propuestas)
- Flujos por rol (Administrador / Asesor)
- Diseño de módulos, rutas y permisos
- Estructura de reportes y exportaciones (Excel/PDF)
- Guía de despliegue y enlace con GitHub

---

## 1) Alcance funcional

### Gestión de clientes

- Crear, editar y actualizar clientes manualmente.
- Seleccionar cliente existente en registro de bitácora.
- Importación masiva por Excel usando plantilla.

### Bitácora de atenciones

Cada atención debe registrar:

- Cliente
- Fecha
- Asesor
- Descripción del soporte
- Tipo de soporte
- Estado o resultado

Cada cliente mantiene su historial completo.

### Gestión de usuarios y roles

- **Administrador**:
  - Gestiona usuarios.
  - Gestiona clientes.
  - Ve todos los reportes.
- **Asesor de soporte**:
  - Registra bitácoras.
  - Consulta clientes.
  - Ve sus propios registros (o asignados).

### Reportes

- Atenciones por asesor.
- Atenciones por cliente.
- Atenciones por rango de fechas.
- Tipos de soporte más frecuentes.
- Exportación a Excel y PDF.

---

## 2) Arquitectura sugerida (Laravel)

### Paquetes recomendados

- Autenticación: Laravel Breeze o Laravel UI.
- Roles/permisos: `spatie/laravel-permission`.
- Excel: `maatwebsite/excel`.
- PDF: `barryvdh/laravel-dompdf`.

### Módulos

- `Auth` (login/usuarios).
- `Clientes`.
- `Bitacoras`.
- `Reportes`.
- `Importaciones`.

---

## 3) Modelo de base de datos (MySQL)

Archivo de referencia: `docs/database_schema.sql`

Tablas principales:

- `users`
- `roles` (si no se usa paquete)
- `model_has_roles` (si se usa Spatie)
- `clients`
- `support_types`
- `support_logs`

Relaciones clave:

- `support_logs.client_id -> clients.id`
- `support_logs.advisor_id -> users.id`
- `support_logs.support_type_id -> support_types.id`

---

## 4) Rutas Laravel propuestas

Archivo de referencia: `docs/routes_blueprint.md`

- `GET /dashboard`
- `resource /clients`
- `resource /support-logs`
- `POST /clients/import`
- `GET /reports/advisors`
- `GET /reports/clients`
- `GET /reports/date-range`
- `GET /reports/support-types`
- `GET /reports/export/excel`
- `GET /reports/export/pdf`

---

## 5) Seguridad y permisos

- Middleware `auth` para todo módulo interno.
- Middleware `role:admin` para usuarios/reportes globales.
- Middleware `role:admin|advisor` para bitácoras.
- Policy en `SupportLogPolicy` para restringir vista por asesor.

---

## 6) Plan de implementación rápida

1. Crear proyecto Laravel.
2. Configurar `.env` con MySQL.
3. Instalar Breeze + Spatie + Excel + PDF.
4. Crear migraciones y seeders base.
5. Implementar CRUD de clientes.
6. Implementar CRUD de bitácoras.
7. Implementar importación por plantilla.
8. Implementar reportes y exportaciones.
9. Pruebas funcionales y de permisos.

---

## 7) Cómo dejar enlazado directamente a tu cuenta GitHub

> Como en este entorno no tengo tu token ni sesión de GitHub, te dejo el proceso exacto para dejarlo conectado a tu cuenta.

1. Crea un repositorio en tu GitHub (por ejemplo `bitacoras-col`).
2. En tu máquina local, configura remoto:

```bash
git remote add origin git@github.com:TU_USUARIO/bitacoras-col.git
# o por HTTPS:
# git remote add origin https://github.com/TU_USUARIO/bitacoras-col.git
```

3. Sube la rama actual:

```bash
git push -u origin work
```

4. (Opcional recomendado) Configura GitHub CLI:

```bash
gh auth login
gh repo set-default TU_USUARIO/bitacoras-col
```

Con eso quedará enlazado directamente a tu cuenta y podrás seguir haciendo push/PR sin reconfigurar.

---

## 8) Script de bootstrap (cuando haya red disponible)

Se incluye `scripts/bootstrap_laravel.sh` para crear rápidamente el proyecto e instalar dependencias en un entorno con acceso a Composer/Packagist.

