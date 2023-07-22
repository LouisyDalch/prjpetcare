import 'package:sql_conn/sql_conn.dart';

Future<void> getDataBase () async {
  await SqlConn.connect(
          ip: "192.168.0.1",
          port: "1433",
          databaseName: "petcare1",
          username: "sa",
          password: "123456");
          print(SqlConn.isConnected);
}