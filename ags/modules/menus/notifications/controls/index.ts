import { closeNotifications } from "globals/notification";
import { Notifications } from "types/service/notifications";

const Controls = (notifs: Notifications) => {
    return Widget.Box({
        class_name: "notification-menu-controls",
        expand: false,
        vertical: false,
        children: [
            Widget.Box({
                class_name: "menu-label-container notifications",
                hpack: "start",
                vpack: "center",
                expand: true,
                children: [
                    Widget.Label({
                        class_name: "menu-label notifications",
                        label: "Notifications",
                    }),
                ],
            }),
            Widget.Box({
                hpack: "end",
                vpack: "center",
                expand: false,
                children: [
                    Widget.Switch({
                        class_name: "menu-switch notifications",
                        vpack: "center",
                        active: notifs.bind("dnd").as((dnd: boolean) => !dnd),
                        on_activate: ({ active }) => {
                            notifs.dnd = !active;
                        },
                    }),
                    Widget.Box({
                        children: [
                            Widget.Separator({
                                hpack: "center",
                                vexpand: true,
                                vertical: true,
                                class_name: "menu-separator notification-controls",
                            }),
                            Widget.Button({
                                className: "clear-notifications-button",
                                tooltip_text: "Clear Notifications",
                                on_primary_click: () => {
                                    if (removingNotifications.value) {
                                        return;
                                    }

                                    closeNotifications(notifs.notifications);
                                },
                                child: Widget.Label({
                                    class_name: removingNotifications.bind("value").as((removing: boolean) => {
                                        return removing
                                            ? "clear-notifications-label txt-icon removing"
                                            : "clear-notifications-label txt-icon";
                                    }),
                                    label: "",
                                }),
                            }),
                        ],
                    }),
                ],
            }),
        ],
    });
};

export { Controls };