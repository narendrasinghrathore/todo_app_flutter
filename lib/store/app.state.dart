// import 'package:todo_app_flutter/store/todo.model.dart';
// import 'package:rxdart/rxdart.dart';
// enum AppStateProps {
//   todos
// }

// class IState {
//   List<Todo> todos;
// }

// class State implements IState{
//   @override
//   List<Todo> todos = [];

// }

// class Store {
//     static final subject = new BehaviorSubject<State>();
//     static final store = subject.
//         .pipe(
//             distinctUntilChanged()
//         );

//     get value {
//         return subject.value;
//     }

//     select<T>(AppStateProps name): Observable<T> {
//         return store
//             .pipe(
//                 pluck(name)
//             );
//     }

//     set(AppStateProps name, dynamic state_) {
//         subject.sink.add({ ...value, [name]: state_ });
//     }
// }
