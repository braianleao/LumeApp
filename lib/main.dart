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
// WIDGET RAIZ E TELA DE LOGIN
// ====================================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lume App',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TopSection(),
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
// WIDGET TOPSECTION (Fundo Laranja e Logo)
// --------------------------------------------------------------------

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // Fundo Laranja Curvo (ClipPath)
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 420, // Altura ajustada
            color: primaryOrange,
          ),
        ),

        // Imagem da Logo
        Positioned(
          top: 180, // Posição vertical ajustada
          child: Image.asset(
            'assets/images/logo.png', // Verifique o caminho
            height: 250, // Tamanho ajustado
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

  // Controladores: Usando late para inicializá-los no initState
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  
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

  // Lógica de autenticação simulada e navegação
  void _handleLogin(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Simulação de validação
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }

    print('Tentativa de login: $email / $password');
    
    // **Navegação para a HomeScreen**
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Título "Bem-vindo ao Lume"
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
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
          ],
        ),
        const SizedBox(height: 40),

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
        Row(
          children: [
            Switch(
              value: _isLoginEnabled,
              onChanged: (bool newValue) {
                setState(() {
                  _isLoginEnabled = newValue;
                });
              },
              activeColor: primaryOrange,
              inactiveTrackColor: Colors.grey[300],
            ),
            const Text(
              'Login',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        ),
        const SizedBox(height: 50),

        // Botão "Acessar"
        _buildAccessButton(context),
      ],
    );
  }

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
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
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
        ),
      ),
    );
  }
}

// ====================================================================
// TELA HOME (FRAME 2) E SEUS COMPONENTES
// ====================================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
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
// WIDGETS DA HOME
// --------------------------------------------------------------------

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, 
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 20.0), 
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
            const CircleAvatar(
              radius: 25,
              child: Icon(Icons.person, size: 30), // Placeholder
              backgroundColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

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
      ),
    );
  }
}

class AddChildButton extends StatelessWidget {
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
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, 
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryBlue, secondaryGreen],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
        ],
      ),
    );
  }
}