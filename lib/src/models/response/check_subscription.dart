class CheckSubscription {
  final bool? result;
  final int? userId;
  final bool? ok;
  final int? praysClick;
  final int? praysPayme;

  CheckSubscription({
    this.result,
    this.userId,
    this.ok,
    this.praysClick,
    this.praysPayme,
  });

  CheckSubscription.fromJson(Map<String, dynamic> json)
      : result = json['result'],
        userId = json['user_id'],
        ok = json['ok'],
        praysClick = json['prays_click'],
        praysPayme = json['prays_payme'];

  CheckSubscription copyWith({
    bool? result,
    int? userId,
    bool? ok,
    int? praysClick,
    int? praysPayme,
  }) =>
      CheckSubscription(
        result: result ?? this.result,
        userId: userId ?? this.userId,
        ok: ok ?? this.ok,
        praysClick: praysClick ?? this.praysClick,
        praysPayme: praysPayme ?? this.praysPayme,
      );
}
