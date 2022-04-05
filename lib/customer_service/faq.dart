class Faq {
  int id;
  String header;
  String body;
  bool expanded = false;

  Faq(this.header, this.body, {this.expanded = false, this.id});
}

List<Faq> generateFaq(int numberOfFaq) {
  return List.generate(numberOfFaq, (index) => Faq(list[index].header, list[index].body, id: index));
}

List<Faq> list = [
  Faq(
    '기프티카노는 어디에서 사용할 수 있나요?',
    '기프티카노에서 제공해드리는 아메리카노 쿠폰은 ‘스타벅스 전 매장’에서 사용 가능하십니다.\n이용 불가 매장: 미군부대 매장, 워터파크 입점 매장, 인천공항 입점 매장, 마장휴게소점 등 일부 매장'),
  Faq('아무 기프티콘이나 등록이 가능한가요?',
      '4500원 이상의 기프티콘이면 어느 브랜드이든 등록할 수 있어요.'),
  Faq('등록한 기프티콘을 환불하고 싶어요',
      '검수를 받기 이전이라면 ‘메인화면>메뉴바>등록내역’에서 취소하실 수 있어요. 그런데 만약 기프티콘이 이미 검수를 통과했다면 환불은 할 수 없어요.'),
  Faq('기프티카노의 유효 기간을 연장하고 싶어요',
      '제공해드린 쿠폰의 유효기간은 연장해드리기 어려워요.'),
  Faq('포인트를 환급받고 싶어요',
      '기프티카노의 포인트는 현금으로 전환되지 않아요. 대신 4500원 이상 모으시면 기프티카노 한 장으로 교환하실 수 있어요.'),
  Faq('등록한 기프티콘을 실수로 사용했어요',
      '괜찮아요! \'채팅으로 상담하기\'를 통해 문의 사항 남겨주시면 환불 절차 도와드릴게요.'),
];