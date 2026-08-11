import 'package:flutter/material.dart';

/// Centralized utility for ensuring consistent accessibility (A11y) across the app.
class A11yUtils {
  
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
}
