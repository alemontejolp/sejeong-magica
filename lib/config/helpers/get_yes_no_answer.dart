import 'package:dio/dio.dart';
import 'package:sejeong_magica/domain/entities/message.dart';
import 'package:sejeong_magica/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  
  Future<Message> getAnswer() async {
    final res = await _dio.get("https://yesno.wtf/api");
    final yesNoModel = YesNoModel.fromMap(res.data);
    return Message(
      text: yesNoModel.answer == "yes" ? "Sí" : "No",
      image: yesNoModel.image,
      fromWho: FromWho.HER,
    );
  }
}
