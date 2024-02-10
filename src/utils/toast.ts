import { colors } from "@theme";
import Snackbar, { SnackBarOptions } from "react-native-snackbar";

type Severity = "success" | "error" | "info" | "warning";
type Length = "short" | "long" | "indefinite";

interface SnackbarProps extends Omit<SnackBarOptions, "duration" | "text"> {
  message: string;
  length?: Length;
  severity?: Severity;
}

/**
 *
 * @param severity
 * @returns return background color
 */
function getPreset(severity: Severity) {
  if (severity === "success") {
    return colors.snackbar_success_background;
  } else if (severity === "error") {
    return colors.snackbar_error_background;
  } else if (severity === "warning") {
    return colors.snackbar_warning_background;
  }
  return colors.snackbar_info_background;
}

/**
 *
 * @param length
 * @returns returns duration length
 */
function getDuration(length: Length) {
  if (length === "long") {
    return Snackbar.LENGTH_LONG;
  } else if (length === "indefinite") {
    return Snackbar.LENGTH_INDEFINITE;
  }
  return Snackbar.LENGTH_SHORT;
}

/**
 * Custom pop-up utility that displays pop-up messages
 *
 * @param text The text to show on the snackbar
 * @param durationLength The duration for which the snack bar should be visible
 */
export function showToast({
  message,
  severity,
  length,
  ...rest
}: SnackbarProps) {
  const duration =
    severity === "error" ? Snackbar.LENGTH_LONG : getDuration(length!);
  const backgroundColor = getPreset(severity!);

  return Snackbar.show({ text: message, duration, backgroundColor, ...rest });
}
