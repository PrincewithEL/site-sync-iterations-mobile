import 'package:flutter/material.dart';
import 'package:site_sync/features/transactions/domain/entity/transactions_response_entity.dart';
import 'package:site_sync/features/transactions/presentation/widgets/transaction_details_grid.dart';
import 'package:site_sync/features/transactions/presentation/widgets/transaction_metadata.dart';

import '../../../../core/theme/app_pallete.dart';

class TransactionDetailsComponent extends StatelessWidget {
  final Function(String) onDeletePressed;
  final TransactionsResponseEntity? dataEntity;

  const TransactionDetailsComponent({
    super.key,
    this.dataEntity,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: dataEntity?.data?.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16),
            color: AppPallete.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          dataEntity!.data?[index].transactionName ?? "",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      _buildStatusChip(
                          dataEntity!.data?[index].transactionStatus ?? ""),
                    ],
                  ),
                  Text(
                    dataEntity!.data?[index].transactionDetails ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TransactionDetailsGrid(
                    dataEntity: dataEntity!.data![index],
                  ),
                  const SizedBox(height: 16),
                  TransactionMetadata(
                    onDeletePressed: (transactionId) {
                      onDeletePressed(transactionId);
                    },
                    dataEntity: dataEntity!.data![index],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: _getStatusColor(status),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
