import 'package:flutter/material.dart';

/// Centralized utility for ensuring consistent accessibility (A11y) across the app.
/// WCAG 2.1 AA compliance constants and semantic wrappers for Project Bloom.
/// Reference: docs/UX-004_Accessibility_Spec.md
class A11yUtils {
  // ─── WCAG 2.1 AA Contrast Ratio Constants ─────────────────────────────────
  /// Minimum contrast ratio for normal text (WCAG AA). 
  static const double wcagAaTextContrastRatio = 4.5;

  /// Minimum contrast ratio for large text (≥18pt or bold ≥14pt) (WCAG AA).
  static const double wcagAaLargeTextContrastRatio = 3.0;

  /// Minimum contrast ratio for interactive UI components and icons (WCAG AA).
  static const double wcagAaUiComponentContrastRatio = 3.0;

  // ─── Semantic Wrappers ─────────────────────────────────────────────────────

  /// Wraps a standard button in Semantics to ensure screen readers announce it properly.
  static Widget semanticButton({
    required Widget child,
    required String label,
    required String hint,
    VoidCallback? onTap,
  }) {
    return Semantics(
      button: true,
      enabled: onTap != null,
      label: label,
      hint: hint,
      onTap: onTap,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }

  /// Wraps complex task cards to summarize the content for screen readers.
  static Widget semanticTaskCard({
    required Widget card,
    required String taskTitle,
    required String taskType,
    required String priority,
  }) {
    return Semantics(
      label: 'Task: $taskTitle. Type: $taskType. Priority: $priority.',
      hint: 'Double tap to open task details',
      child: card,
    );
  }

  /// Wraps a mood entry button so screen readers announce it clearly.
  /// E.g. "Happy mood button. Double tap to log your mood as Happy."
  static Widget semanticMoodButton({
    required Widget child,
    required String moodName,
    VoidCallback? onTap,
  }) {
    return Semantics(
      button: true,
      enabled: onTap != null,
      label: '$moodName mood',
      hint: 'Double tap to log your mood as $moodName',
      onTap: onTap,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }

  /// Validates whether the app's text labels meet minimum semantic requirements.
  /// Returns a list of missing/empty labels found in the provided map.
  /// Use during widget testing to catch unlabelled interactive elements early.
  static List<String> validateSemanticLabels(Map<String, String?> labels) {
    final missing = <String>[];
    for (final entry in labels.entries) {
      if (entry.value == null || entry.value!.trim().isEmpty) {
        missing.add(entry.key);
      }
    }
    return missing;
  }

  /// Ensures interactive list items have a minimum tap target of 48x48dp.
  /// Wraps [child] in a SizedBox enforcing WCAG 2.5.5 (Target Size).
  static Widget minTapTarget({required Widget child}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      child: child,
    );
  }
}
