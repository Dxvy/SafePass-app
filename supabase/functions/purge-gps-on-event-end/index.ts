import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

// Triggered by a Supabase scheduled job when event.end_date is reached.
// Deletes ALL GPS positions — RGPD Art. 5(1)(e) storage limitation.
serve(async (req) => {
  if (req.method !== "POST") return new Response("Method Not Allowed", { status: 405 });

  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
  );

  const { eventId } = await req.json();

  // Delete positions for users who attended this event
  const { count, error } = await supabase
    .from("gps_positions")
    .delete({ count: "exact" })
    .in(
      "user_id",
      supabase.from("event_attendees").select("user_id").eq("event_id", eventId)
    );

  if (error) {
    console.error("[purge-gps] error:", error.message);
    return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  }

  console.log(`[purge-gps] event=${eventId} purged=${count} rows`);
  return new Response(
    JSON.stringify({ purged: count, eventId }),
    { headers: { "Content-Type": "application/json" } }
  );
});
