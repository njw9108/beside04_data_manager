import 'package:beside04_data_manager/domain/model/emoticon_data.dart';

class EmoticonDataSource {
  Future<List<EmoticonData>> getEmoticons() async {
    return _emoticons;
  }
}

List<EmoticonData> _emoticons = [
  EmoticonData(
    emoticon: 'assets/disappoint.png',
    description: ['실망', '우울'],
  ),
  EmoticonData(
    emoticon: 'assets/mask.png',
    description: ['아픔', '우울'],
  ),
  EmoticonData(
    emoticon: 'assets/squinting.png',
    description: ['신남', '장난'],
  ),
  EmoticonData(
    emoticon: 'assets/star.png',
    description: ['행복함', '신남'],
  ),
  EmoticonData(
    emoticon: 'assets/thinking.png',
    description: ['고민', '진지'],
  ),
];
