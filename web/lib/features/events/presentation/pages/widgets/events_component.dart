import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:site_sync/core/common/widgets/main_app_button.dart';
import 'package:site_sync/core/theme/app_pallete.dart';

import '../../../domain/entity/event_details_response_entity.dart';

class EventDetailsPage extends StatelessWidget {
  final bool isVisible;
  final EventDataEntity event;
  final Function(String) onPressed;

  const EventDetailsPage({
    Key? key,
    required this.event,
    required this.isVisible,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppPallete.whiteColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEventHeader(),
            _buildEventDetails(),
            _buildEventLocation(),
            _buildEventTiming(),
            _buildEventStatus(),
            Visibility(
              visible: isVisible,
              child: Center(
                child: MainAppButton(
                  buttonText: "Delete Meeting",
                  onPressed: () => onPressed(event.eventId.toString()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEventHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        color: AppPallete.greyColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event.eventName ?? "",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            DateFormat('MMMM dd, yyyy').format(
              DateTime.parse(
                event.eventDate ?? "",
              ),
            ),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      child: Card(
        color: AppPallete.whiteColor,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Description',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                event.eventDetails ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventLocation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      child: Card(
        color: AppPallete.whiteColor,
        child: ListTile(
          leading: const Icon(Icons.location_on, color: Colors.blue),
          title: const Text(
            'Location',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            event.eventLocation ?? "",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventTiming() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      child: Card(
        color: AppPallete.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              _buildTimeRow(
                'Starts',
                event.eventStartTime ?? "",
                Icons.access_time,
              ),
              const Divider(),
              _buildTimeRow(
                'Ends',
                event.eventEndTime ?? "",
                Icons.access_time_filled,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeRow(String label, String time, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 20),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        Text(
          time,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildEventStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: Icon(
            Icons.event_available,
            color: _getStatusColor(),
          ),
          title: const Text(
            'Status',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            event.eventStatus ?? "",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (event.eventStatus) {
      case 'scheduled':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      case 'postponed':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }
}
