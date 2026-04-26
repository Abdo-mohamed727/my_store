import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/style/theme/color_extension.dart';
import 'package:my_store/features/auth/data/models/user_role_response.dart';
import 'package:my_store/features/coustomer/profile/data/models/profile_setting_item_model.dart';
import 'package:my_store/features/coustomer/profile/presintation/bloc/profile_bloc.dart';
import 'package:my_store/features/coustomer/profile/presintation/bloc/profile_event.dart';
import 'package:my_store/features/coustomer/profile/presintation/bloc/profile_state.dart';
import 'package:my_store/features/coustomer/profile/presintation/widgets/profile_background_layer.dart';
import 'package:my_store/features/coustomer/profile/presintation/widgets/profile_header_section.dart';
import 'package:my_store/features/coustomer/profile/presintation/widgets/profile_logout_tile.dart';
import 'package:my_store/features/coustomer/profile/presintation/widgets/profile_section_title.dart';
import 'package:my_store/features/coustomer/profile/presintation/widgets/profile_setting_tile.dart';
import 'package:my_store/features/coustomer/profile/presintation/widgets/profile_shimmer_view.dart';

class CoustomerProfileScreen extends StatelessWidget {
  const CoustomerProfileScreen({super.key, this.bloc});

  final ProfileBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          (bloc ?? sl<ProfileBloc>())..add(const ProfileEvent.started()),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<MyColors>()!;
    return Scaffold(
      backgroundColor: colors.mainColor,
      body: Stack(
        children: [
          const ProfileBackgroundLayer(),
          SafeArea(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) => state.maybeMap(
                loading: (_) => const ProfileShimmerView(),
                content: (value) => _ContentView(
                  summary: value.summary,
                  sections: value.sections,
                  isFallback: false,
                ),
                fallback: (value) => _ContentView(
                  summary: value.summary,
                  sections: value.sections,
                  isFallback: true,
                ),
                error: (value) => Center(child: Text(value.message)),
                orElse: () => const ProfileShimmerView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView({
    required this.summary,
    required this.sections,
    required this.isFallback,
  });

  final UserRoleResponse summary;
  final List<ProfileSectionModel> sections;
  final bool isFallback;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(24.w, 72.h, 24.w, 28.h),
      itemCount: sections.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.only(bottom: 34.h),
            child: ProfileHeaderSection(
              summary: summary,
              isFallback: isFallback,
            ),
          );
        }
        final section = sections[index - 1];
        return Padding(
          padding: EdgeInsets.only(bottom: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileSectionTitle(title: section.title),
              ...section.items.map(
                (item) => item.kind == ProfileSettingKind.logout
                    ? ProfileLogoutTile(item: item)
                    : ProfileSettingTile(item: item),
              ),
            ],
          ),
        );
      },
    );
  }
}
