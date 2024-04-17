import 'package:path/path.dart';
import 'package:sa3_somativa/Model/UsuariosModel.dart';
import 'package:sqflite/sqflite.dart';

class BDD {
  static const String BD_NAME = 'usuarios.db'; // Nome do banco de dados
  static const String TABLE_NAME = 'usuarios'; // Nome da tabela
  static const String SCRIPT_CREATE_TABLE = // Script SQL para criar a tabela
      "CREATE TABLE IF NOT EXISTS usuarios(" +
      "id INTEGER PRIMARY KEY AUTOINCREMENT," +
      "nome TEXT," +
      "email TEXT UNIQUE," + // Índice único na coluna de e-mail
      "senha TEXT)";

  //Criando e Referenciando a tabela
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), BD_NAME),
      onCreate: (db, version) {
        print("Criado");
        return db.execute(SCRIPT_CREATE_TABLE);
      },
      version: 2,
    );
  }

  // Método para criar um novo usuário no banco de dados
  Future<void> create(Usuarios model) async {
    try {
      final Database db = await _getDatabase();

      // Verificar se o e-mail já está em uso
      bool emailExists = await existsUsuario(model.email);

      if (emailExists) {
        throw Exception('Este e-mail já está em uso');
      }else{
            await db.insert(TABLE_NAME, model.toMap());
      }

      // Se o e-mail não estiver em uso, insira o novo usuário no banco de dados
  
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para verificar se um usuário com o e-mail fornecido já existe no banco de dados
  Future<bool> existsUsuario(String email) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME,
          where: 'user_email = ?', whereArgs: [email]);

      return maps.isNotEmpty;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  // Método para obter um usuário do banco de dados com base no e-mail e senha fornecidos
  Future<Usuarios?> getUsuario(String email, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME,
          where: 'user_email = ? AND user_senha = ?',
          whereArgs: [email, senha]);

      if (maps.isNotEmpty) {
        return Usuarios.fromMap(maps.first);
      } else {
        return null;
      }
    } catch (ex) {
      print(ex);
      return null;
    }
  }
}
