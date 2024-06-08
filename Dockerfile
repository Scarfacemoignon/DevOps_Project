# Étape de construction avec Go 1.19
FROM golang:1.19-buster AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de gestion des dépendances
COPY go.mod ./
COPY go.sum ./

# Télécharger les dépendances
RUN go mod download

# Copier tout le code source dans le répertoire de travail
COPY . .

# Construire l'application
RUN go build -o /calculator

# Étape finale avec l'image Distroless
FROM gcr.io/distroless/base-debian10:nonroot-20230824

# Définir le répertoire de travail
WORKDIR /

# Copier l'application binaire depuis l'étape de construction
COPY --from=build /calculator /calculator

# Changer l'utilisateur à 'nonroot'
USER nonroot:nonroot

# Définir le point d'entrée de l'application
ENTRYPOINT ["/calculator"]
