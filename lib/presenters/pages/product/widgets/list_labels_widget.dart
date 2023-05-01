import 'package:flutter/widgets.dart';
import 'package:lanchonete_app/domain/responses/label_response.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/shimmer_widget.dart';
import 'package:lanchonete_app/presenters/widgets/label_widget.dart';

class ListLabelsWidget extends StatelessWidget {
  final bool isLoading;
  final List<LabelResponse>? labels;
  const ListLabelsWidget({
    super.key,
    required this.isLoading,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      isLoading: isLoading,
      height: 20,
      child: _list(),
    );
  }

  Widget _list() {
    if (labels == null || labels!.isEmpty) {
      return Container();
    }

    return Row(
      children: [
        ...labels!.map(
          (e) {
            final hasMargin = labels!.indexOf(e) < labels!.length - 1;
            return LabelWidget(
              label: e,
              hasMargin: hasMargin,
            );
          },
        ),
      ],
    );
  }
}
