# Teste de Desenvolvedor Flutter: Aplicativo de Autenticação TOTP

## Sobre o APP
- O Aplicativo foi feito em 3 dias, quinta, sexta e domingo
- Conseguir realizar todas as Funcionalidades e Features pedidas

## Arquitetura:
- Realizei Dividindo a UI <-> BLOC <-> Repository <-> API
- Utilizando Flutter Modular para modularizar os Modulos, AppModule, AuthModule e HomeModule
- Organização de arquivos Arquivos:
Core: Arquivos de estilos e algumas funções de auxílio para o aplicativo, como Endpoints, Generate_totp, Logger...
Shared: DioService, que serve para adequar cada à Api consumida

- Separação de cada módulo:
Data -> Camada onde se realizar o repositório, com suas abastracções e implementações
Presenter -> Cada onde se concentra as páginas, wigets comuns e gerencimanto de estdado
nome_modeule.dart

- Data
Pasta em que concentra as abstrações do repositorio e suas implementações
Nessa parte pega as requisições do Bloc e busca do DioService

- Presenter
Pasta que concentra páginas do módulo e os widgets que são usados no módulo
Além disso, o bloc, como gerenciador de estado

## Testes:
Realizei testes para os cenários que podiam acontencer
Entre elas: 
- Falha de login por credencial 
- Falha por código Totp
- Login com sucesso
- Falha código Totp
- Exito código Totp

Obs: Para rodar localmente, em um emulador, utilizei baseUrl = "http://10.0.2.2:5000"; 