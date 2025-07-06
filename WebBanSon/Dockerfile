# Runtime base
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy .csproj và restore
COPY WebBanSon.csproj ./
RUN dotnet restore WebBanSon.csproj

# Copy toàn bộ project
COPY . .

# Xoá Dockerfile để tránh bị compile nhầm
RUN rm -f Dockerfile .dockerignore

# Build và publish
RUN dotnet publish WebBanSon.csproj -c Release -o /app/publish /p:UseAppHost=false

# Runtime final image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "WebBanSon.dll"]
