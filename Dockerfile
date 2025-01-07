# Use uma imagem base do Python
FROM python:3.9-slim

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos de requisitos e instala as dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante dos arquivos do projeto
COPY . .

# Expõe a porta que o Flask vai usar
EXPOSE 5001

# Define o comando para rodar o projeto
CMD ["sh", "-c", "python agent.py dev & python call_phone.py"]
