import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ====================================================================
// DEFINIÇÕES GLOBAIS DE CORES
// ====================================================================

const Color primaryOrange = Color(0xFFFF9800);
const Color secondaryGreen = Color(0xFF5AB6A5);
const Color primaryBlue = Color(0xFF81D4FA);

// ====================================================================
<<<<<<< HEAD
// WIDGET RAIZ E DEFINIÇÕES DE ROTAS
=======
// WIDGET RAIZ E TELA DE LOGIN
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
// ====================================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lume App',
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/parentSignUp': (context) => const ParentSignUpPage(),
        '/childSignUp': (context) => const ChildSignUpPage(),
        '/parentDashboard': (context) => const ParentDashboard(),
        '/childHome': (context) => const ChildHomePage(),
      },
=======
      home: const LoginPage(),
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
    );
  }
}

<<<<<<< HEAD
// ====================================================================
// TELA DE LOGIN (FRAME 1)
// ====================================================================

=======
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
<<<<<<< HEAD
            TopSection(height: 420),
=======
            TopSection(),
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
            Padding(
              padding: EdgeInsets.all(32.0),
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------------------------
<<<<<<< HEAD
// WIDGET TOPSECTION (Fundo Curvo e Logo) - Reutilizável
// --------------------------------------------------------------------

class TopSection extends StatelessWidget {
  final double height;
  final String? title;

  const TopSection({this.height = 420, this.title, super.key});
=======
// WIDGET TOPSECTION (Fundo Laranja e Logo)
// --------------------------------------------------------------------

class TopSection extends StatelessWidget {
  const TopSection({super.key});
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
<<<<<<< HEAD
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: height,
=======
        // Fundo Laranja Curvo (ClipPath)
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 420, // Altura ajustada
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
            color: primaryOrange,
          ),
        ),

<<<<<<< HEAD
        Positioned(
          top: height / 2.5,
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.shield, size: 150, color: Colors.white),
              ),
              if (title != null)
                Text(
                  title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
=======
        // Imagem da Logo
        Positioned(
          top: 180, // Posição vertical ajustada
          child: Image.asset(
            'assets/images/logo.png', // Verifique o caminho
            height: 250, // Tamanho ajustado
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
          ),
        ),
      ],
    );
  }
}

// --------------------------------------------------------------------
// CLASSE AUXILIAR DO CLIPPER (Cria a forma de onda/curva)
// --------------------------------------------------------------------

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 50);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 100);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// --------------------------------------------------------------------
// WIDGET LOGINFORM (Campos de texto, switch e botão)
// --------------------------------------------------------------------

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isLoginEnabled = true;

<<<<<<< HEAD
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

=======
  // Controladores: Usando late para inicializá-los no initState
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

<<<<<<< HEAD
=======
  // Lógica de autenticação simulada e navegação
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
  void _handleLogin(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;

<<<<<<< HEAD
=======
    // Simulação de validação
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }

<<<<<<< HEAD
    Navigator.pushReplacementNamed(context, '/parentDashboard');
  }

  void _navigateToParentSignUp(BuildContext context) {
    Navigator.pushNamed(context, '/parentSignUp');
=======
    print('Tentativa de login: $email / $password');
    
    // **Navegação para a HomeScreen**
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
<<<<<<< HEAD
=======
        // Título "Bem-vindo ao Lume"
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
<<<<<<< HEAD
            Text('Bem-vindo ao ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black54)),
            Text('Lume', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryOrange)),
=======
            Text(
              'Bem-vindo ao ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            Text(
              'Lume',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryOrange,
              ),
            ),
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
          ],
        ),
        const SizedBox(height: 40),

<<<<<<< HEAD
        _buildLabel('E-mail'),
        _buildTextField('Digite seu email', false, _emailController),
        const SizedBox(height: 20),

        _buildLabel('Senha'),
        _buildTextField('Digite sua senha', true, _passwordController),
        const SizedBox(height: 30),

=======
        // Campo de E-mail
        const Text('E-mail',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildTextField('Digite seu email', false, _emailController),
        const SizedBox(height: 20),

        // Campo de Senha
        const Text('Senha',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildTextField('Digite sua senha', true, _passwordController),
        const SizedBox(height: 30),

        // Switch e texto "Login"
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
        Row(
          children: [
            Switch(
              value: _isLoginEnabled,
              onChanged: (bool newValue) {
<<<<<<< HEAD
                setState(() => _isLoginEnabled = newValue);
=======
                setState(() {
                  _isLoginEnabled = newValue;
                });
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
              },
              activeColor: primaryOrange,
              inactiveTrackColor: Colors.grey[300],
            ),
<<<<<<< HEAD
            const Text('Login', style: TextStyle(fontSize: 18, color: Colors.black87)),
=======
            const Text(
              'Login',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
          ],
        ),
        const SizedBox(height: 50),

<<<<<<< HEAD
        _buildAccessButton(context, 'Acessar', _handleLogin),
        const SizedBox(height: 20),

        Center(
          child: TextButton(
            onPressed: () => _navigateToParentSignUp(context),
            child: const Text(
              'Não tem conta? Cadastre-se como Pai',
              style: TextStyle(color: secondaryGreen, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        Center(
          child: TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/childHome'),
            child: const Text(
              'Acessar como Filho (Teste)',
              style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
            ),
          ),
        ),
=======
        // Botão "Acessar"
        _buildAccessButton(context),
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
      ],
    );
  }

<<<<<<< HEAD
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  // CORREÇÃO APLICADA AQUI (Removido 'const' do OutlineInputBorder)
  Widget _buildTextField(String hint, bool isPassword, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        // Removido const
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.grey.shade400)),
        // Removido const
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0)),
        // Removido const do OutlineInputBorder
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: secondaryGreen, width: 2.0)),
      ),
    );
  }

  Widget _buildAccessButton(
      BuildContext context, String text, Function(BuildContext) onPressed) {
=======
  // Widget Auxiliar para os campos de texto (TextField)
  Widget _buildTextField(String hint, bool isPassword, TextEditingController controller) {
  return TextField(
    controller: controller, 
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder( // <<-- CORREÇÃO: 'const' REMOVIDO
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide( // O 'const' pode ficar aqui, pois secondaryGreen é const global
            color: secondaryGreen, width: 2.0),
      ),
    ),
  );
}

  // Widget Auxiliar para o botão Acessar (com navegação)
  Widget _buildAccessButton(BuildContext context) {
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
<<<<<<< HEAD
        gradient: const LinearGradient(colors: [primaryBlue, secondaryGreen], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 1, blurRadius: 4, offset: const Offset(0, 3))],
      ),
      child: TextButton(
        onPressed: () => onPressed(context),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ====================================================================
// TELA DE CADASTRO DO PAI
// ====================================================================

class ParentSignUpPage extends StatelessWidget {
  const ParentSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const TopSection(
              height: 350,
              title: 'Crie sua conta parental',
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: ParentSignUpForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class ParentSignUpForm extends StatefulWidget {
  const ParentSignUpForm({super.key});

  @override
  _ParentSignUpFormState createState() => _ParentSignUpFormState();
}

class _ParentSignUpFormState extends State<ParentSignUpForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp(BuildContext context) {
    print('Cadastro do Pai: ${_nameController.text} / ${_emailController.text}');
    Navigator.pushReplacementNamed(context, '/parentDashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 40),

        _buildLabel('Nome'),
        _buildTextField('Seu nome completo', false, _nameController),
        const SizedBox(height: 20),

        _buildLabel('E-mail'),
        _buildTextField('Digite seu email', false, _emailController),
        const SizedBox(height: 20),

        _buildLabel('Senha'),
        _buildTextField('Crie uma senha', true, _passwordController),
        const SizedBox(height: 40),

        _buildAccessButton(context, 'CADASTRAR', _handleSignUp),
        const SizedBox(height: 20),

        Center(
          child: TextButton(
            onPressed: () => Navigator.pushNamed(context, '/childSignUp'),
            child: const Text(
              'Cadastrar/Vincular Filho',
              style: TextStyle(color: primaryOrange, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  // CORREÇÃO APLICADA AQUI
  Widget _buildTextField(
      String hint, bool isPassword, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.grey.shade400)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: secondaryGreen, width: 2.0)),
      ),
    );
  }

  Widget _buildAccessButton(
      BuildContext context, String text, Function(BuildContext) onPressed) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [primaryBlue, secondaryGreen], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 1, blurRadius: 4, offset: const Offset(0, 3))],
      ),
      child: TextButton(
        onPressed: () => onPressed(context),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ====================================================================
// TELA DE CADASTRO DO FILHO E CÓDIGO DE VÍNCULO
// ====================================================================

class ChildSignUpPage extends StatefulWidget {
  const ChildSignUpPage({super.key});

  @override
  State<ChildSignUpPage> createState() => _ChildSignUpPageState();
}

class _ChildSignUpPageState extends State<ChildSignUpPage> {
  String? _parentCode;
  late final TextEditingController _childNameController;

  @override
  void initState() {
    super.initState();
    _childNameController = TextEditingController();
    _generateCode();
  }

  @override
  void dispose() {
    _childNameController.dispose();
    super.dispose();
  }

  void _generateCode() {
    setState(() {
      _parentCode = (100000 + DateTime.now().millisecondsSinceEpoch % 900000).toString();
    });
  }

  void _handleChildSignUp(BuildContext context) {
    if (_childNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, digite o nome do filho.')),
      );
      return;
    }

    print('Cadastro do Filho: ${_childNameController.text} com Código: $_parentCode');
    Navigator.pushReplacementNamed(context, '/childHome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro do Filho',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: secondaryGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text('Vínculo Parental', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: secondaryGreen), textAlign: TextAlign.center),
            const SizedBox(height: 20),

            _buildMascotSection(),
            const SizedBox(height: 30),

            _buildCodeSection(),
            const SizedBox(height: 30),

            _buildLabel('Nome do Filho'),
            _buildTextField('Nome que será usado no app', false, _childNameController),
            const SizedBox(height: 40),

            _buildAccessButton(context, 'CONCLUIR CADASTRO', _handleChildSignUp),
          ],
        ),
      ),
    );
  }

  Widget _buildMascotSection() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: primaryBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: primaryBlue),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/mascote.png',
            height: 120,
            errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.star, size: 120, color: primaryOrange),
          ),
          const SizedBox(height: 10),
          const Text('Olá! Sou o Lume. Seu pai/mãe precisa deste código!', textAlign: TextAlign.center, style: TextStyle(color: primaryBlue, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildCodeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: primaryOrange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primaryOrange, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Código de Vínculo', style: TextStyle(fontSize: 16, color: Colors.black54)),
              Text(_parentCode ?? 'GERANDO...', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: primaryOrange)),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.copy, color: primaryOrange, size: 30),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Código $_parentCode copiado!')),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  // CORREÇÃO APLICADA AQUI
  Widget _buildTextField(
      String hint, bool isPassword, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.grey.shade400)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: secondaryGreen, width: 2.0)),
      ),
    );
  }

  Widget _buildAccessButton(
      BuildContext context, String text, Function(BuildContext) onPressed) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [primaryBlue, secondaryGreen], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), spreadRadius: 1, blurRadius: 4, offset: const Offset(0, 3))],
      ),
      child: TextButton(
        onPressed: () => onPressed(context),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
=======
        gradient: const LinearGradient(
          colors: [
            primaryBlue,
            secondaryGreen,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () => _handleLogin(context), 
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: const Text(
          'Acessar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
        ),
      ),
    );
  }
}

// ====================================================================
<<<<<<< HEAD
// DASHBOARD DO PAI (Controle de Apps e Tarefas)
// ====================================================================

class ParentDashboard extends StatelessWidget {
  const ParentDashboard({super.key});
=======
// TELA HOME (FRAME 2) E SEUS COMPONENTES
// ====================================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: CustomAppBar(
        onChildAdd: () => Navigator.pushNamed(context, '/childSignUp'),
      ),
=======
      appBar: const CustomAppBar(),
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
<<<<<<< HEAD
              Center(
                child: Image.asset('assets/images/lume_logo_completa.png', height: 80, errorBuilder: (context, error, stackTrace) =>
                    const Text('Lume | Controle Parental', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secondaryGreen))),
              ),
              const SizedBox(height: 30),

              const Text('Filhos Vinculados', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryOrange)),
              const SizedBox(height: 15),

              ChildControlCard(
                name: "Miguel",
                color: primaryOrange,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChildDetailScreen(childName: "Miguel", color: primaryOrange))),
              ),
              const SizedBox(height: 15),
              ChildControlCard(
                name: "Alice",
                color: secondaryGreen,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChildDetailScreen(childName: "Alice", color: secondaryGreen))),
              ),
              const SizedBox(height: 15),

              AddChildButton(onPressed: () => Navigator.pushNamed(context, '/childSignUp')),
=======
              // Simulação da Logo Lume + Controle Parental
              Center(
                child: Image.asset(
                  'assets/images/lume_logo_completa.png', 
                  height: 120,
                  // Placeholder caso a imagem não seja encontrada
                  errorBuilder: (context, error, stackTrace) => Column(
                    children: [
                      Image.asset('assets/images/logo.png', height: 80), // Tenta usar a logo menor
                      const Text('CONTROLE PARENTAL', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              
              // Cards de Filhos
              const ChildCard(name: "Miguel", color: primaryOrange),
              const SizedBox(height: 15),
              const ChildCard(name: "Alice", color: primaryOrange),
              const SizedBox(height: 15),

              // Botão Adicionar Filho
              const AddChildButton(),
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

// --------------------------------------------------------------------
<<<<<<< HEAD
// WIDGETS DA DASHBOARD DO PAI
// --------------------------------------------------------------------

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onChildAdd;
  const CustomAppBar({this.onChildAdd, super.key});
=======
// WIDGETS DA HOME
// --------------------------------------------------------------------

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
<<<<<<< HEAD
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 20.0),
=======
      automaticallyImplyLeading: false, 
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 20.0), 
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Olá Marta,', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: secondaryGreen)),
                Text('seja bem vinda!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black54)),
              ],
            ),
<<<<<<< HEAD
            Row(
              children: [
                IconButton(icon: const Icon(Icons.group_add, color: primaryBlue), onPressed: onChildAdd, tooltip: 'Adicionar Filho'),
                const CircleAvatar(radius: 25, child: Icon(Icons.person, size: 30), backgroundColor: primaryOrange),
              ],
=======
            const CircleAvatar(
              radius: 25,
              child: Icon(Icons.person, size: 30), // Placeholder
              backgroundColor: Colors.grey,
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
            ),
          ],
        ),
      ),
    );
  }
}

<<<<<<< HEAD
class ChildControlCard extends StatelessWidget {
  final String name;
  final Color color;
  final VoidCallback onTap;

  const ChildControlCard({required this.name, required this.color, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5, offset: const Offset(0, 3))],
        ),
        child: Row(
          children: [
            CircleAvatar(radius: 25, backgroundColor: Colors.white, child: Icon(Icons.face, color: color, size: 30)),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  const Text('Gerenciar tempo e tarefas', style: TextStyle(fontSize: 16, color: Colors.white70)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white, size: 30),
          ],
        ),
=======
class ChildCard extends StatelessWidget {
  final String name;
  final Color color;

  const ChildCard({required this.name, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Icon(Icons.face, color: color), // Placeholder
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                const Text('Verificar progresso', style: TextStyle(fontSize: 16, color: Colors.white70)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 20),
        ],
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
      ),
    );
  }
}

class AddChildButton extends StatelessWidget {
<<<<<<< HEAD
  final VoidCallback onPressed;
  const AddChildButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: secondaryGreen),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 3, offset: const Offset(0, 2))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add_circle_outline, color: secondaryGreen, size: 28),
            SizedBox(width: 10),
            Text('Vincular Novo Filho', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secondaryGreen)),
          ],
        ),
=======
  const AddChildButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.add_circle_outline, color: secondaryGreen, size: 28),
          SizedBox(width: 10),
          Text('Adicionar filho', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secondaryGreen)),
        ],
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
<<<<<<< HEAD
      height: 70,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [primaryBlue, secondaryGreen], begin: Alignment.centerLeft, end: Alignment.centerRight),
=======
      height: 70, 
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryBlue, secondaryGreen],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
<<<<<<< HEAD
          _buildNavItem(Icons.home, 'Home', primaryOrange, () => {}),
          _buildNavItem(Icons.star, 'Recompensas', Colors.white, () => {}),
          _buildNavItem(Icons.settings, 'Config.', Colors.white, () => {}),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, Color color, VoidCallback onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(icon: Icon(icon, color: color, size: 30), onPressed: onTap),
        Text(label, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }
}

// --------------------------------------------------------------------
// TELA DE DETALHE DO FILHO (Controle de Apps e Tarefas)
// --------------------------------------------------------------------

class ChildDetailScreen extends StatelessWidget {
  final String childName;
  final Color color;
  const ChildDetailScreen({required this.childName, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de $childName', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: color,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Restrição de Aplicativos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
            Divider(color: color),
            const SizedBox(height: 10),

            _buildAppControlCard('YouTube', '60 min/dia', primaryOrange),
            _buildAppControlCard('Jogos (Geral)', '90 min/dia', secondaryGreen),
            _buildAppControlCard('TikTok', 'Bloqueado', primaryBlue),
            const SizedBox(height: 30),

            Text('Verificação de Tarefas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
            Divider(color: color),
            const SizedBox(height: 10),

            _buildTaskVerificationCard('Arrumar o Quarto', true, secondaryGreen),
            _buildTaskVerificationCard('Ler 30 minutos', false, primaryOrange),
            _buildTaskVerificationCard('Lição de Casa (Mat)', true, secondaryGreen),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildAppControlCard(String appName, String limit, Color cardColor) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(Icons.phone_android, color: cardColor, size: 30),
        title: Text(appName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Tempo: $limit'),
        trailing: IconButton(icon: const Icon(Icons.edit, color: Colors.grey), onPressed: () {}),
      ),
    );
  }

  Widget _buildTaskVerificationCard(String taskName, bool isCompleted, Color taskColor) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(isCompleted ? Icons.check_circle_outline : Icons.access_time, color: taskColor, size: 30),
        title: Text(taskName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(isCompleted ? 'Enviado para Aprovação' : 'Pendente/Rejeitado'),
        trailing: isCompleted
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.thumb_up, color: secondaryGreen), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.thumb_down, color: primaryOrange), onPressed: () {}),
                ],
              )
            : const Icon(Icons.pending, color: Colors.grey),
      ),
    );
  }
}

// ====================================================================
// HOME DO FILHO (GAMIFICADA)
// ====================================================================

class ChildHomePage extends StatelessWidget {
  const ChildHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text('Miguel, Nível 5! ⭐️',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [primaryOrange, primaryBlue], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/mascote.png', height: 100, errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.star, size: 100, color: Colors.white)),
                      const SizedBox(height: 10),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const LinearProgressIndicator(
                            value: 0.75,
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(secondaryGreen),
                            minHeight: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text('75% para Nível 6!', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('⏳ Tempo de Aplicativos Restante', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secondaryGreen)),
                      const Divider(color: secondaryGreen),
                      _buildAppTimeTile('YouTube', '45 min', primaryOrange),
                      _buildAppTimeTile('Jogos', '30 min', primaryBlue),
                      _buildAppTimeTile('TikTok', 'Bloqueado', Colors.red),
                      const SizedBox(height: 30),

                      const Text('✅ Minhas Tarefas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: secondaryGreen)),
                      const Divider(color: secondaryGreen),
                      _buildChildTaskTile('Arrumar o Quarto', '100 Pontos', true, context),
                      _buildChildTaskTile('Lição de Casa (Mat)', '50 Pontos', false, context),
                      _buildChildTaskTile('Lavar a Louça', '200 Pontos', false, context),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
=======
          IconButton(icon: const Icon(Icons.settings, color: Colors.white, size: 30), onPressed: () {}),
          Stack(
            children: [
              IconButton(icon: const Icon(Icons.notifications, color: Colors.white, size: 30), onPressed: () {}),
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: primaryOrange,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                  child: const Text('25', style: TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.center),
                ),
              )
            ],
          ),
          IconButton(icon: const Icon(Icons.person, color: Colors.white, size: 30), onPressed: () {}),
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
        ],
      ),
    );
  }
<<<<<<< HEAD

  Widget _buildAppTimeTile(String appName, String time, Color color) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(Icons.timer, color: color, size: 30),
        title: Text(appName, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color)),
      ),
    );
  }

  Widget _buildChildTaskTile(
      String taskName, String reward, bool isCompleted, BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      color: isCompleted ? secondaryGreen.withOpacity(0.1) : Colors.white,
      child: ListTile(
        leading: Icon(isCompleted ? Icons.send : Icons.pending_actions, color: isCompleted ? secondaryGreen : primaryOrange, size: 30),
        title: Text(taskName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(isCompleted ? 'Aguardando aprovação do Pai' : reward),
        trailing: isCompleted
            ? const Icon(Icons.check_circle, color: secondaryGreen)
            : ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Enviar Tarefa'),
                      content: Text('Deseja enviar a tarefa "$taskName" para aprovação do seu pai/mãe?'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tarefa enviada com sucesso!')));
                            },
                            child: const Text('Enviar', style: TextStyle(color: secondaryGreen))),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: primaryOrange),
                child: const Text('Concluir', style: TextStyle(color: Colors.white)),
              ),
      ),
    );
  }
=======
>>>>>>> 36aa2c77c3c657b2c41c7c9e504881f0c3c4d9f2
}