import 'dart:async';
import 'dart:io';

import 'package:booking_backend/controller/booking_controller.dart';
import 'package:booking_backend/models/general_response.dart';
import 'package:dart_frog/dart_frog.dart';

FutureOr<Response> onRequest(
  RequestContext context,
  String hotelId,
  String roomId,
) {
  switch (context.request.method) {
    case HttpMethod.post:
      return BookingController.addBooking(context, roomId);
    case HttpMethod.put:
    case HttpMethod.delete:
    case HttpMethod.get:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
      return Response.json(
        statusCode: HttpStatus.methodNotAllowed,
        body: GeneralResponse(
          status: false,
        ),
      );
  }
}
