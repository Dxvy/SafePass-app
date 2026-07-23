import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

serve(async (req) => {
  if (req.method !== "POST") return new Response("Method Not Allowed", { status: 405 });

  const authHeader = req.headers.get("Authorization");
  if (!authHeader) return new Response("Unauthorized", { status: 401 });

  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
  );

  const { alertType, userId, contactIds } = await req.json();

  // Fetch emergency contacts ordered by priority
  const { data: contacts } = await supabase
    .from("emergency_contacts")
    .select("phone, name, priority")
    .in("id", contactIds ?? [])
    .order("priority");

  // Log the alert (no PII in clear — OWASP A09)
  await supabase.from("alert_log").insert({
    user_id: userId,
    alert_type: alertType,
    contact_count: contacts?.length ?? 0,
    dispatched_at: new Date().toISOString(),
  });

  // In production: send SMS via Twilio / push via FCM
  // Demo: returns the list of contacts that would be notified
  return new Response(
    JSON.stringify({ dispatched: contacts?.length ?? 0, alertType }),
    { headers: { "Content-Type": "application/json" } }
  );
});
