FROM python:3.13.5-alpine3.22
# Define um diretório de trabalho dentro do contêiner
WORKDIR /app
# Copia o requirements.txt para o diretório de trabalho
COPY requirements.txt .
# Roda o comando pip de instalação, recursivo
# O no-cache evita o cache do pip, e reduz o tamanho da imagem
RUN pip install --no-cache-dir -r requirements.txt
# Copia todos os arquivos da pasta para o diretório de trabalho
COPY . .
# Expõe a porta 8000 (que a aplicação FastAPI vai precisar)
EXPOSE 8000
# Comando para rodar a aplicação usando o uvicorn, de forma acessível
# ao contêiner (com host 0.0.0.0)
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000","--reload"]
# Depois, no prompt:
# docker build -t api . (vou buildar a imagem nome = api nesse dir)
# docker images (lista as imagens que tenho no meu docker system)
# docker run -p 8000:8000 api (rodei, mapeando a porta 8000 do container na porta 8000 da aplicação)
# Então, no prompt: http://localhost:8000/docs