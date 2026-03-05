#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME=${1:-bitacoras-col}

composer create-project laravel/laravel "$PROJECT_NAME"
cd "$PROJECT_NAME"

composer require laravel/breeze --dev
php artisan breeze:install
composer require spatie/laravel-permission
composer require maatwebsite/excel
composer require barryvdh/laravel-dompdf

npm install
npm run build

php artisan migrate

echo "Proyecto Laravel base listo en $PROJECT_NAME"
