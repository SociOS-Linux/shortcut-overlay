public class ShortcutOverlay.InteractionBinding : Object {
    public string? name { get; private set; }
    public string? description { get; private set; }
    public string? command_bus_ref { get; private set; }

    public static InteractionBinding? load_default () {
        try {
            var bytes = resources_lookup_data (
                "/io/elementary/shortcut-overlay/sourceos/shortcut-overlay.interaction-surface.json",
                ResourceLookupFlags.NONE
            );

            var parser = new Json.Parser ();
            parser.load_from_data ((string) bytes.get_data (), (ssize_t) bytes.get_size ());

            var root = parser.get_root ();
            if (root == null || root.get_node_type () != Json.NodeType.OBJECT) {
                warning ("SourceOS interaction binding resource is not a JSON object");
                return null;
            }

            var object = root.get_object ();
            var binding = new InteractionBinding ();

            if (object.has_member ("name")) {
                binding.name = object.get_string_member ("name");
            }

            if (object.has_member ("description")) {
                binding.description = object.get_string_member ("description");
            }

            if (object.has_member ("commandBinding")) {
                var command_binding = object.get_object_member ("commandBinding");
                if (command_binding != null && command_binding.has_member ("commandBusRef")) {
                    binding.command_bus_ref = command_binding.get_string_member ("commandBusRef");
                }
            }

            return binding;
        } catch (Error e) {
            warning ("Unable to load SourceOS interaction binding: %s", e.message);
        }

        return null;
    }
}
