# JSONPlaceholder-Dart

A library that provides API bindings for [JSONPlaceholder](https://jsonplaceholder.typicode.com/).

## Usage

A simple usage example:

```dart
import 'package:jsonplaceholder/json_placeholder.dart';

main(List<String> args) async {
  JSONPlaceholder api = JSONPlaceholder();
  var posts = api.getPosts();
  await for (Post post in posts) print(post.toString());
  api.close();
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/glacion/jsonplaceholder-dart/issues
