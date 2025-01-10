#!/bin/bash

# Aplicar as migrações
echo "Aplicando migrações..."
python manage.py migrate


if [ "$SEED" = "true" ]; then
    echo "Populando o banco de dados..."
    python seed.py
else
    echo "Pulando o preenchimento do banco de dados."
fi

# Executar o servidor
echo "Iniciando o servidor em modo de desenvolvimento..."
python manage.py runserver 0.0.0.0:8000
