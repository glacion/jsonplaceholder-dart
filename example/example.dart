import 'package:jsonplaceholder/jsonplaceholder.dart';

main(List<String> args) async {
  // Create client.
  JSONPlaceholder api = JSONPlaceholder();

  // GET Post objects
  var posts = await api.getPosts();
  var postsLength = await posts.length;
  print('Size of posts is $postsLength');

  // GET filtered Post objects
  var filteredPosts = await api.getPosts(userId: 1);
  var filteredPostsLength = await filteredPosts.length;
  print('Size of filtered posts by userId of 1 is $filteredPostsLength');

  // GET Post object of id
  var post = await api.getPost(id: 1);
  print('Post with id of 1 is: ${post.toString().replaceAll('\n', '')}');

  // POST Todo object

  // When creating objects like this,
  // the optional id parameter refers to the id assigned by the server.
  // Even when you assign a value, it will be ignored by the server.
  Todo todo = Todo(1, 'Make a library', true);
  Todo response = await api.postTodo(todo);
  // Server assigns an id to the Todo.
  print('ID of the Todo object created without an id is ${response.id}');

  Todo todoWithId = Todo(1, 'Assign custom id', false, 42);
  Todo responseWithId = await api.postTodo(todoWithId);
  // The id is not 42.
  print('ID of the Todo object created with an id is ${responseWithId.id}');

  // DELETE Photo object

  // The DELETE methods return true if the resource has successfully been deleted.
  bool result = await api.deletePhoto(id: 1);
  print(
    "Deleting Photo with id of 1 was ${result ? 'successful' : 'unsuccessful'}",
  );

  // PATCH Album object

  // Create Album object matching the id.
  // Method returns the patched object.
  Album album = Album().rebuild((b) => b
    ..title = "Title"
    ..userId = 1);
  album = await api.patchAlbum(album);
  print(album);

  // Close the client.
  api.close();
}
