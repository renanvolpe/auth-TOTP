# ✨ Flutter Developer Test: TOTP Authentication App

## 📚 About the App

-   O Aplicativo foi feito em 3 dias, quinta, sexta e domingo
-   Conseguir realizar todas as Funcionalidades e Features pedidas

## 🏗 Arquitetura

-   Realizei Dividindo a UI ↔️ BLoC ↔️ Repository ↔️ API
-   Utilizando Flutter Modular para modularizar os Modulos, `AppModule`, `AuthModule` e `HomeModule`
-   Organização de arquivos:
    -   **Core:** Arquivos de estilos e algumas funções de auxílio para o aplicativo, como `Endpoints`, `Generate_totp`, `Logger`...
    -   **Shared:** `DioService`, que serve para adequar cada à Api consumida

-   Separação de cada módulo:
    -   **Data:** Pasta onde se realiza o repositório, com suas abstrações e implementações. Nessa parte pega as requisições do Bloc e busca do DioService.
    -   **Presenter:** Pasta que concentra páginas do módulo e os widgets que são usados no módulo. Além disso, o BLoC, como gerenciador de estado.
    -   `nome_module.dart`: Arquivo principal do módulo.

## 🧪 Testes

Realizei testes para os cenários que podiam acontecer.
Entre elas:
-   **🔐 Falha de login por credencial**
-   **❌ Falha por código Totp**
-   **✅ Login com sucesso**
-   **🔄 Falha código Totp**
-   **✔️ Êxito código Totp**

### 💻 Observação para Rodar Localmente

Para rodar localmente, em um emulador, utilizei `baseUrl = "http://10.0.2.2:5000";`
