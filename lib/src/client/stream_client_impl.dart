import 'package:stream_feed_dart/src/client/batch_operations_client.dart';
import 'package:stream_feed_dart/src/client/batch_operations_client_impl.dart';
import 'package:stream_feed_dart/src/client/collections_client.dart';
import 'package:stream_feed_dart/src/client/feed/aggregated_feed.dart';
import 'package:stream_feed_dart/src/client/feed/flat_feed.dart';
import 'package:stream_feed_dart/src/client/feed/notification_feed.dart';
import 'package:stream_feed_dart/src/client/reactions_client.dart';
import 'package:stream_feed_dart/src/client/stream_client.dart';
import 'package:stream_feed_dart/src/client/users_client.dart';
import 'package:stream_feed_dart/src/core/api/stream_api.dart';

class StreamClientImpl implements StreamClient {
  final String secret;
  final StreamApi api;

  const StreamClientImpl(this.secret, this.api);

  @override
  AggregatedFeed aggregatedFeed(String slug, String userId) {
    // TODO: implement aggregatedFeed
    throw UnimplementedError();
  }

  @override
  BatchOperationsClient get batch =>
      BatchOperationsClientImpl(secret, api.batch);

  @override
  // TODO: implement collections
  CollectionsClient get collections => throw UnimplementedError();

  @override
  FlatFeet flatFeed(String slug, String userId) {
    // TODO: implement flatFeed
    throw UnimplementedError();
  }

  @override
  NotificationFeed notificationFeed(String slug, String userId) {
    // TODO: implement notificationFeed
    throw UnimplementedError();
  }

  @override
  // TODO: implement reactions
  ReactionsClient get reactions => throw UnimplementedError();

  @override
  // TODO: implement users
  UsersClient get users => throw UnimplementedError();
}