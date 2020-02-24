import 'package:chopper/chopper.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiServices extends ChopperService {
  //  //Using Headers
//  @Get(headers: {'ContentType':'text/plain'})
//  Future<Response> getPosts(
//      @Header('header-name')String HeaderValue
//      );
  @Get()
  Future<Response> getPosts();

  @Get(path: '/{id}')
  Future<Response> getPost(@Path('id') int id);

  @Post()
  Future<Response> postPost(
    @Body() Map<String, dynamic> body,
  );

  static PostApiServices create() {
    final client = ChopperClient(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        services: [
          _$PostApiServices(),
        ],
        converter: JsonConverter());
    return _$PostApiServices(client);
  }
}
