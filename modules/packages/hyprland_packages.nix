{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    glfw3-minecraft
    hyprshot
    mcpelauncher-ui-qt
    pkgconf
    python312Packages.qtconsole
    playerctl
    wine
    protontricks
    qalculate-gtk
    eww
    lutgen
    drawing
    networkmanagerapplet
    grim
    hyprpicker
    waybar
    kanshi
    wl-clipboard
    catppuccinifier-gui
    catppuccinifier-cli
    plantuml
  ];
}
