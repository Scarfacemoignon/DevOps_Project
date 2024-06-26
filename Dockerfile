# Étape de construction avec Go 1.19
FROM golang:1.19-buster AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de gestion des dépendances
COPY go.mod go.sum ./

# Télécharger et vérifier les dépendances
RUN go mod download

# Copier tout le code source
COPY . .

# Compiler l'application
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
