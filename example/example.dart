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
  var post = await api.getPost(1);
  print('Post with id of 1 is: ${post.toString().replaceAll('\n', '')}');

  // POST Todo object

  // Create objects with their builders.
  // id is nullable since the server will assign one.
  post = Post((b) => b
    ..title = 'Title'
    ..body = 'Body'
    ..userId = 1);
  var response = await api.postPost(post);
  print('ID of the Todo object created without an id is ${response.id}');

  // DELETE Photo object

  // The DELETE methods are void.
  await api.deletePost(post);

  // PATCH Album object

  // Create Album object matching the id.
  // Method returns the patched object.
  var album = Album().rebuild((b) => b
    ..title = "Title"
    ..userId = 1);
  album = await api.updateAlbum(album);
  print(album);

  // Close the client.
  api.close();
}
