import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:site_sync/features/resources/domain/entity/resource_response_entity.dart';

class ResourceDetailCard extends StatelessWidget {
  final ResourceDataEntity resourceData;
  final VoidCallback? onDelete;

  const ResourceDetailCard({
    Key? key,
    required this.resourceData,
    this.onDelete,
  }) : super(key: key);

  String formatDateTime(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Resource Type and ID
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            resourceData.resourceType == 'Image'
                                ? Icons.image
                                : Icons.file_present,
                            size: 16,
                            color: Colors.blue.shade900,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            resourceData.resourceType ?? "",
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'ID: ${resourceData.resourceId}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    const Icon(Icons.drive_file_rename_outline, size: 20, color: Colors.black87,),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        resourceData.resourceName ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Resource Details
                Row(
                  children: [
                    const Icon(Icons.info_outline, size: 20, color: Colors.black87,),
                    const SizedBox(width: 8),
                    Text(
                      'Details: ${resourceData.resourceDetails}',
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Created At
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 20, color: Colors.black87,),
                    const SizedBox(width: 8),
                    Text(
                      'Created: ${formatDateTime(resourceData.createdAt ?? "")}',
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                // Status Indicators and Delete Button Row
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // This spreads out the children
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: resourceData.isDeleted == 0
                            ? Colors.green.shade50
                            : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            resourceData.isDeleted == 0
                                ? Icons.check
                                : Icons.delete,
                            size: 16,
                            color: resourceData.isDeleted == 0
                                ? Colors.green
                                : Colors.red,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            resourceData.isDeleted == 0
                                ? 'Active'
                                : 'Deleted',
                            style: TextStyle(
                              color: resourceData.isDeleted == 0
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Delete Button
                    InkWell(
                      onTap: onDelete,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.delete_outline,
                              color: Colors.red.shade700,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.red.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}