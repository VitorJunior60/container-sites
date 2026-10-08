# Imagem base: Ubuntu
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Instala o Nginx para servir o site
RUN apt-get update \
    && apt-get install -y --no-install-recommends nginx \
    && rm -rf /var/lib/apt/lists/*

# O ADD extrai automaticamente o .tar dentro do diretório de destino
ADD meu_site.tar /var/www/html/

EXPOSE 80

# Nginx em primeiro plano para manter o container ativo
CMD ["nginx", "-g", "daemon off;"]
