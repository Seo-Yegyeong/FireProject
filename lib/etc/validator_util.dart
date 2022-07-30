
Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      return "제목을 입력해주세요.";
    } else if (value.length > 30) {
      return "제목의 길이를 초과하였습니다.";
    } else {
      return value;
    }
  };
}


Function validateContent() {
  return (String? value) {
    if (value!.isEmpty) {
      return "내용을 입력해주세요.";
    } else if (value.length < 10) {
      "10글자 이상 입력해주세요.";
    } else if (value.length > 1000) {
      return "제목의 길이를 초과하였습니다.";
    } else {
      return value;
    }
  };
}