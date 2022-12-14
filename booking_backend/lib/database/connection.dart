import 'package:booking_backend/config/constants.dart';
import 'package:dotenv/dotenv.dart';
import 'package:postgres/postgres.dart';

class Connection {
  factory Connection() {
    _connection = PostgreSQLConnection(
      kHost,
      kPort,
      env['database'] ?? kDatabase,
      username: env['username'],
      password: env['password'],
    );
    return _instance;
  }

  Connection._();

  static final Connection _instance = Connection._();

  static late PostgreSQLConnection _connection;

  static final DotEnv env = DotEnv()..load();

  Future<void> _openConnection() async {
    if (_connection.isClosed) await _connection.open();
  }

  Future<void> _closeConnection() async {
    if (!_connection.isClosed) await _connection.close();
  }

  Future<void> get connect => _openConnection();

  Future<void> get disconnect => _closeConnection();

  PostgreSQLConnection get getConnection => _connection;
}
