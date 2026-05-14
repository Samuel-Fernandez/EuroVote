# Utiliser une image Python officielle légère
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers de dépendances et installer
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du code de l'application
COPY . .

# Exposer le port sur lequel Gunicorn va s'exécuter
EXPOSE 1003

# Démarrer l'application avec Gunicorn
# app:create_app() permet à Gunicorn d'utiliser la fonction factory de l'application
CMD ["gunicorn", "--bind", "0.0.0.0:1003", "run:app"]
