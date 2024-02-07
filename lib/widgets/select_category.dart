import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/utils/utils.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/providers/providers.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = TaskCategories.values.toList();
    final selectedCategory = ref.watch(categoryProvider);

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category',
            style: context.textTheme.titleLarge,
          ),
          const Gap(10),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = categories[index];
                  },
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleContainer(
                      color: categories[index].color.withOpacity(0.3),
                      child: Icon(
                        categories[index].icon,
                        color: categories[index] == selectedCategory
                            ? categories[index].color
                            : Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Gap(8);
              },
            ),
          ),
        ],
      ),
    );
  }
}
