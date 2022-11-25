import 'package:beside04_data_manager/domain/model/emoticon_data.dart';

class EmoticonDataSource {
  Future<List<EmoticonData>> getEmoticons() async {
    return _emoticons;
  }
}

List<EmoticonData> _emoticons = [
  EmoticonData(
    emoticon: 'assets/svg/angry.svg',
    description: ['화남'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/depress.svg',
    description: ['우울'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/depress2.svg',
    description: ['우울'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/Embarrassment.svg',
    description: ['당황'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/Embarrassment2.svg',
    description: ['당황'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/Embarrassment3.svg',
    description: ['당황'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/enjoy.svg',
    description: ['즐거움'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/excited.svg',
    description: ['신남'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/good.svg',
    description: ['좋음'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/happy.svg',
    description: ['행복함'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/haruNyang.svg',
    description: ['하루냥'],
  ),

  EmoticonData(
    emoticon: 'assets/svg/sad.svg',
    description: ['슬픔'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/soso.svg',
    description: ['그냥'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/soso2.svg',
    description: ['그냥'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/stable.svg',
    description: ['평온'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/suprise.svg',
    description: ['놀람'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/suprise2.svg',
    description: ['놀람'],
  ),
  EmoticonData(
    emoticon: 'assets/svg/tired.svg',
    description: ['피곤함'],
  ),
];
