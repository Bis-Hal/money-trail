class ModelTransaction {
  var title;
  var amount;
  var extra01;
  var extra02;
  var extra03;
  var extra04;
  var extra05;
  var type;
  var date;

  ModelTransaction(
      {this.title,
      this.amount,
      this.extra01,
      this.extra02,
      this.extra03,
      this.extra04,
      this.extra05,
      this.type,
      this.date});

  ModelTransaction.nonParameterized();
}
