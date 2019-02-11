import 'package:flutter/material.dart';
import 'package:nextflix_test1/src/blocs/flix_detail_bloc.dart';
export 'package:nextflix_test1/src/blocs/flix_detail_bloc.dart';

class FlixDetailBlocProvider extends InheritedWidget {
  final FlixDetailBloc bloc;

  FlixDetailBlocProvider({Key key, Widget child})
      : bloc = FlixDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static FlixDetailBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(FlixDetailBlocProvider)
            as FlixDetailBlocProvider)
        .bloc;
  }
}