import 'package:flutter/material.dart';
import 'package:site_sync/features/transactions/domain/entity/transactions_response_entity.dart';

class TransactionDetailsGrid extends StatelessWidget {
  final TransactionDataEntity dataEntity;

  const TransactionDetailsGrid({
    Key? key,
    required this.dataEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildDetailItem(context, 'Category', dataEntity.transactionCategory ?? ""),
        _buildDetailItem(context, 'Type', dataEntity.transactionType ?? ""),
        _buildDetailItem(context, 'Quantity', dataEntity.transactionQuantity.toString() ?? ""),
        _buildDetailItem(context, 'Price', 'Ksh. ${dataEntity.totalTransactionPrice ?? ""}'),
      ],
    );
  }

  Widget _buildDetailItem(BuildContext context, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
