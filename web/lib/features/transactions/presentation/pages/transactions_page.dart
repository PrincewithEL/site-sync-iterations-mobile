import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/core/common/widgets/loader.dart';
import 'package:site_sync/core/common/widgets/secondary_app_button.dart';
import 'package:site_sync/core/utils/contextual_components.dart';
import 'package:site_sync/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:site_sync/features/transactions/presentation/pages/add_transactions_page.dart';
import 'package:site_sync/features/transactions/presentation/widgets/transaction_details_component.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../dashboard/presentation/widgets/empty_component.dart';

class TransactionsPage extends StatefulWidget {
  static route(final String projectId) => MaterialPageRoute(
        builder: (context) => TransactionsPage(
          projectId: projectId,
        ),
      );

  final String projectId;

  const TransactionsPage({super.key, required this.projectId});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionsBloc>().add(ViewTransaction(
          projectId: widget.projectId,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: true,
      ),
      body: BlocConsumer<TransactionsBloc, TransactionsState>(
        listener: (context, state) {
          if (state is ViewTransactionLoading) {
            const Loader();
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: AppPallete.errorColor,
                ),
                child: const Text(
                  "Project Transactions",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Expanded(
                child: Builder(builder: (context) {
                  if (state is ViewTransactionLoading ||
                      state is DeleteTransactionLoading) {
                    return const Center(
                      child: Loader(),
                    );
                  }

                  if (state is ViewTransactionFailure) {
                    showSnackBar(context, state.message ?? "");
                  }

                  if (state is ViewTransactionSuccess) {
                    final transactions = state.response.data ?? [];
                    if (transactions.isEmpty) {
                      return const EmptyComponent(subject: "Transactions");
                    }
                    return TransactionDetailsComponent(
                      onDeletePressed: (transactionId) =>
                          context.read<TransactionsBloc>().add(
                                DeleteTransaction(
                                  projectId: widget.projectId,
                                  transactionId: transactionId,
                                ),
                              ),
                      dataEntity: state.response,
                    );
                  }
                  context.read<TransactionsBloc>().add(
                        ViewTransaction(
                          projectId: widget.projectId,
                        ),
                      );
                  return const EmptyComponent(subject: "Transactions");
                }),
              ),
              SecondaryAppButton(
                onPressed: () => Navigator.push(
                  context,
                  AddTransactionsPage.route(widget.projectId),
                ),
                buttonText: "Add Transaction",
              )
            ],
          );
        },
      ),
    );
  }
}
