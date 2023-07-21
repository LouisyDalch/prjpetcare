import 'package:sql_conn/sql_conn.dart';

Future<void> getDataBase () async {
  await SqlConn.connect(
          ip: "LOULOULAPTOP",
          port: "1433",
          databaseName: "petcare1",
          username: "sa",
          password: "123456");
          print(SqlConn.isConnected);
}