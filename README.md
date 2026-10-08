# Meu Site em Container (Ubuntu + Nginx)

Site estático empacotado em `meu_site.tar` e servido por um container baseado em **Ubuntu 24.04**.

## Estrutura

```
meu_projeto/
├── Dockerfile
├── meu_site.tar      # gerado a partir da pasta site/
└── site/
    ├── index.html
    └── style.css
```

## Como reproduzir

```bash
# 1. Gerar o .tar (dentro da pasta do site)
cd site
tar -czf ../meu_site.tar ./
cd ..

# 2. Construir a imagem
docker build -t meu_site:1.0 .

# 3. Rodar o container
docker run -d --name meu_site -p 8080:80 meu_site:1.0

# 4. Testar
curl -I http://localhost:8080
# ou abra http://localhost:8080 no navegador
```

## Comandos para as evidências (tirar prints)

```bash
cat Dockerfile
tar -tzvf meu_site.tar
docker images | grep meu_site
docker ps
curl http://localhost:8080
docker exec meu_site cat /etc/os-release   # confirma Ubuntu
docker logs meu_site
```

## Parar e remover

```bash
docker stop meu_site && docker rm meu_site
```
