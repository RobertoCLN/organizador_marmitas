# MealPrep - Organizador de Marmitas 🍱

## 📝 Resumo do Projeto

Aplicativo desenvolvido em Flutter para auxiliar na organização e controle das refeições semanais. O projeto permite cadastrar marmitas detalhando o nome, tipo de refeição, se estão congeladas e marcar as que já foram consumidas, além de fornecer estatísticas de progresso.

O aplicativo foi construído seguindo rigorosamente os requisitos acadêmicos da disciplina, aplicando conceitos fundamentais de desenvolvimento mobile.

**Principais Tecnologias e Requisitos Atendidos:**

- **Armazenamento:** Persistência de dados locais com `shared_preferences` (serialização/desserialização JSON).
- **Arquitetura Visual:** Separação clara entre `StatelessWidget` (Estatísticas) e `StatefulWidget` (Telas principais).
- **Layout:** Navegação estruturada em abas utilizando `BottomNavigationBar`.
- **Componentes de Entrada:** Uso de `TextEditingController`, `RadioListTile`, `CheckboxListTile` e `ElevatedButton`.
- **Interatividade Extra:** Exclusão de itens na lista utilizando o gesto de arrastar (`Dismissible`).
- **Feedback:** Interação e avisos ao usuário utilizando `SnackBar`.

---

## 📂 Estrutura do Projeto

O código-fonte foi organizado para separar as responsabilidades, facilitando a manutenção e a leitura:

- `lib/models/`: Contém a classe de representação dos dados (`marmita.dart`).
- `lib/screens/`: Contém todas as telas e componentes visuais do aplicativo.
- `lib/services/`: Contém a lógica de acesso e gravação no banco de dados local (`preferences_service.dart`).

---

## 🛠️ Pré-requisitos

Antes de executar o projeto, certifique-se de que a máquina possui as seguintes ferramentas configuradas:

- [Git](https://git-scm.com/)
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Editor de código (VS Code, Android Studio, etc.)
- Um emulador (Android/iOS) configurado ou dispositivo físico conectado com modo de depuração USB ativo.

---

## 🚀 Como Rodar o Projeto Passo a Passo

**Passo 1: Clonar o repositório**
Abra o terminal e execute o comando abaixo para baixar o código:

````bash
git clone https://github.com/RobertoCLN/organizador_marmitas.git

**Passo 2: Acessar a pasta do projeto**
```bash
cd organizador_marmitas


**Passo 3: Baixar as dependências**
Execute:
```bash
flutter pub get

**Passo 4: Executar o app**
Execute:
```bash
flutter run


````
