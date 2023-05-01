import 'package:dio/dio.dart';
import 'package:lanchonete_app/domain/services/label_service.dart';

class LabelServiceImpl implements LabelService {
  final String _apiUrl;

  const LabelServiceImpl(this._apiUrl);

  @override
  Future<List<dynamic>> getAll() async {
    final dio = Dio();
    final response = await dio.get('$_apiUrl/Label/All');
    final data = response.data;
    return data;
  }
}
