import 'package:faye_dart/src/client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MockWebSocketChannel extends Mock implements WebSocketChannel {}

class MockWebSocketSink extends Mock implements WebSocketSink {}

void main() {
  test('a failed connection is retried after a delay, not in a loop', () async {
    final error = WebSocketChannelException('WebSocket connection failed.');
    final sink = MockWebSocketSink();
    when(() => sink.close(any())).thenAnswer((_) async {});
    var connections = 0;
    final client = FayeClient(
      'ws://localhost',
      logHandlerFunction: (_) {},
      webSocketChannelProvider: (uri, {protocols}) {
        connections += 1;
        final channel = MockWebSocketChannel();
        when(() => channel.ready).thenAnswer((_) => Future.error(error));
        when(() => channel.stream).thenAnswer((_) => Stream.error(error));
        when(() => channel.sink).thenReturn(sink);
        return channel;
      },
    );
    addTearDown(client.cancelAllTimeout);

    client.handshake();
    await Future<void>.delayed(const Duration(milliseconds: 500));
    expect(connections, 1);

    await Future<void>.delayed(const Duration(milliseconds: 700));
    expect(connections, 2);
    verify(() => sink.close(1000)).called(2);
  });
}
