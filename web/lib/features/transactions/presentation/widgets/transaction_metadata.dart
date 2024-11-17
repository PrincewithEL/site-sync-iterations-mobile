import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entity/transactions_response_entity.dart';

class TransactionMetadata extends StatelessWidget {
  final Function(String) onDeletePressed;

  final TransactionDataEntity dataEntity;

  const TransactionMetadata({
    Key? key,
    required this.dataEntity,
    required this.onDeletePressed,
  }) : super(key: key);

  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Delete Transaction'),
              content: const Text(
                  'Are you sure you want to delete this transaction? This action cannot be undone.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  onPressed: () {
                    onDeletePressed(
                      dataEntity.transactionId.toString(),
                    );
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Delete'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              _buildMetadataItem(
                Icons.calendar_today,
                DateFormat("yyyy-MM-dd")
                    .format(DateTime.parse(dataEntity.createdAt ?? "")),
              ),
              const SizedBox(width: 16),
              _buildMetadataItem(
                Icons.access_time,
                DateFormat.Hms()
                    .format(DateTime.parse(dataEntity.createdAt ?? "")),
              ),
              const SizedBox(width: 16),
              _buildMetadataItem(
                Icons.assignment,
                'Task #${dataEntity.transactionId}',
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline),
          color: Colors.red,
          tooltip: 'Delete transaction',
          onPressed: () => _confirmDelete(context),
        ),
      ],
    );
  }

  Widget _buildMetadataItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
