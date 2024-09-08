# Escolhe uma imagem base com Ruby
FROM ruby:3.2

# Instala dependências do sistema e bibliotecas
RUN apt-get update -qq && apt-get install -y \
  apt-utils \
  build-essential \
  default-libmysqlclient-dev

# Cria o diretório
RUN mkdir /app

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o Gemfile e o Gemfile.lock para o contêiner
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Instala as gems especificadas no Gemfile
RUN bundle install

# Copia o restante do código da aplicação para o contêiner
ADD . /app

# Expõe a porta 3000 para a aplicação Rails
EXPOSE 3000

# Define o comando para iniciar o servidor Rails
CMD bin/start-puma