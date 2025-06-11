# app-monitoring

Projeto: Plataforma de Monitoramento de Aplicações em Tempo Real
Descrição do Projeto
O objetivo deste projeto é criar uma plataforma de monitoramento de aplicações em tempo real utilizando AWS, Terraform e Ansible. A plataforma irá coletar métricas de desempenho de uma aplicação web, armazená-las em um banco de dados e exibi-las em um painel de controle interativo. Este projeto permitirá que você e seu parceiro pratiquem a automação da infraestrutura e a configuração de serviços na nuvem.
Componentes do Projeto
Infraestrutura na AWS:
EC2: Instâncias para hospedar a aplicação web e o servidor de monitoramento.
RDS: Banco de dados relacional (por exemplo, PostgreSQL) para armazenar as métricas.
S3: Para armazenar logs ou backups, se necessário.
CloudWatch: Para monitoramento e alertas.
Aplicação Web:
Uma aplicação simples (pode ser construída com Node.js, Flask ou qualquer outra tecnologia que você preferir) que simula uma carga de trabalho e gera métricas.
Monitoramento:
Prometheus: Para coletar e armazenar métricas da aplicação.
Grafana: Para visualizar as métricas em um painel interativo.
Requisitos do Projeto
1. Requisitos Técnicos
Terraform:
Criar scripts para provisionar a infraestrutura na AWS (EC2, RDS, S3).
Configurar grupos de segurança e VPCs adequados.
Ansible:
Automatizar a instalação e configuração da aplicação web nas instâncias EC2.
Configurar o Prometheus para coletar métricas da aplicação.
Configurar o Grafana para visualizar as métricas.
AWS:
Conhecimento básico sobre serviços como EC2, RDS, S3 e CloudWatch.
Configuração adequada das permissões IAM para os recursos utilizados.
2. Requisitos Funcionais
A aplicação web deve gerar métricas como tempo de resposta, número de requisições e uso de CPU.
O Prometheus deve coletar essas métricas periodicamente.
O Grafana deve exibir as métricas em tempo real em um painel interativo.
3. Requisitos Não Funcionais
A infraestrutura deve ser segura, com práticas recomendadas aplicadas (como uso adequado de grupos de segurança).
O sistema deve ser escalável, permitindo a adição de mais instâncias EC2 conforme necessário.
Etapas do Projeto
Planejamento:
Definir a arquitetura da solução e os serviços AWS a serem utilizados.
Criar um diagrama da arquitetura.
Provisionamento da Infraestrutura:
Usar Terraform para criar a infraestrutura necessária na AWS.
Configuração da Aplicação Web:
Desenvolver uma aplicação simples que gere métricas.
Usar Ansible para implantar a aplicação nas instâncias EC2.
Configuração do Monitoramento:
Instalar e configurar o Prometheus e Grafana usando Ansible.
Testes e Validação:
Testar a coleta de métricas e a visualização no Grafana.
Validar a segurança e escalabilidade da infraestrutura.
Documentação:
Documentar todo o processo, incluindo scripts Terraform e playbooks Ansible.

Conclusão
Esse projeto não apenas proporciona uma experiência prática com Terraform, Ansible e AWS, mas também resulta em uma solução útil que pode ser expandida no futuro. Além disso, é uma excelente oportunidade para aprender sobre monitoramento de aplicações e boas práticas em DevOps.

## Steps
TODO - Write the steps that are pending and done.
