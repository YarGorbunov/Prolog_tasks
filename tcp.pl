:- use_module(library(socket)).

% CHAT GPT
% подключаемся к серверу
connect_to_server(Host, Port, Socket) :-
    tcp_socket(Socket),
    tcp_connect(Socket, Host:Port).

% отправка сообщения и получение ответа
send_and_receive(Host, Port, Message, Response) :-
    connect_to_server(Host, Port, Socket),
    tcp_open_socket(Socket, InStream, OutStream),
    format(OutStream, "~w~n", [Message]), % отправка сообщения
    flush_output(OutStream),
    read_line_to_string(InStream, Response), % чтение ответа
    close(InStream),
    close(OutStream).

% Пример использования:
% send_and_receive('localhost', 12345, "Hello, server!", Response).


% SWI PROLOG DOCS
dump_page :-
    setup_call_cleanup(
        tcp_connect('www.example.com':http, Stream, []),
        ( format(Stream,
                 'HEAD / HTTP/1.1~n\c
                  Host: www.example.com~n\c
                  Connection: close~n~n', []),
          flush_output(Stream),
          copy_stream_data(Stream, current_output)
        ),
        close(Stream)).
