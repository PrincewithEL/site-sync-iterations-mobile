import 'package:flutter/material.dart';
import 'package:site_sync/features/transactions/domain/entity/transactions_response_entity.dart';

class TransactionSummaryCard extends StatelessWidget {
  final TransactionDataEntity dataEntity;

  const TransactionSummaryCard({
    Key? key,
    required this.dataEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summary',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem(context, 'Total Transactions',
                    dataEntity.transactionQuantity.toString()),
                _buildSummaryItem(context, 'Total Amount',
                    'Ksh ${dataEntity.totalTransactionPrice ?? ""}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
