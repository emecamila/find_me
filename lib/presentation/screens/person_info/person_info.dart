library com.findme.app.presentation.person_info;

import 'package:find_me/presentation/l10n/generated/l10n.dart';
import 'package:find_me/presentation/widgets/ions/ions.dart';
import 'package:find_me/presentation/widgets/templates/templates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entities/entities.dart';
import '../../utils/utils.dart';

part 'screen.dart';
part 'state.dart';
part 'view_model.dart';

part 'person_info.g.dart';
