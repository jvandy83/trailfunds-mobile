export const palette = {
  white: "#FFFFFF",
  light_orange: "#FEFDFB",
  snow: "#FFF9F5",
  atomic_tangerine: "#F89059",
  seashell: "#F7EEE8",
  tiffany_blue: "#7CDEDE",
  licorice: "#27150C",
  davy_gray: "#4A4A4A",
  brown: "#974012",
  caribbean_current: "#146C6C",
  imperial_red: "#EF5350",
  amber: "#642e12",
  true_gray: "#757575",
  maximum_yellow_red: "#f0ad4e",
  apple: "#5cb85c",
  sea_serpent: "#5bc0de",
};

export const colors = {
  background_primary: [
    palette.seashell,
    palette.light_orange,
    palette.light_orange,
    palette.seashell,
  ],
  background_child_flow: palette.white,
  background_overlays: palette.snow,

  /**
   * Bar Graph Colors
   */
  bar_graph_text: palette.licorice,
  bar_graph_bg_primary: palette.atomic_tangerine,
  bar_graph_primary_title: palette.brown,
  bar_graph_bg_secondary: palette.tiffany_blue,
  bar_graph_secondary_title: palette.caribbean_current,
  bar_graph_axis: palette.davy_gray,

  /**
   * Spinner
   */
  spinner_color: palette.atomic_tangerine,

  /**
   * Snackbar
   */
  snackbar_background: palette.imperial_red,
  snackbar_error_background: palette.imperial_red,
  snackbar_success_background: palette.apple,
  snackbar_info_background: palette.sea_serpent,
  snackbar_warning_background: palette.maximum_yellow_red,
  /**
   * Tab bar colors
   */
  tab_bar_active: palette.amber,
  tab_bar_inactive: palette.true_gray,
};
