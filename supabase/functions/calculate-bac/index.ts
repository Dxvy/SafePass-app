import { serve } from "https://deno.land/std@0.168.0/http/server.ts";

const R = { male: 0.70, female: 0.55, unspecified: 0.615 } as const;
const ELIMINATION_RATE = 0.15; // g/L/h

interface BacRequest {
  drinksInGrams: number;
  weightKg: number;
  sex: "male" | "female" | "unspecified";
  hoursSinceFirstDrink: number;
}

interface BacResponse {
  bac: number;
  zone: "safe" | "moderate" | "high";
  alcoholPurchaseBlocked: boolean;
}

serve(async (req) => {
  if (req.method !== "POST") {
    return new Response("Method Not Allowed", { status: 405 });
  }

  let body: BacRequest;
  try {
    body = await req.json();
  } catch {
    return new Response(JSON.stringify({ error: "Invalid JSON" }), { status: 400 });
  }

  const { drinksInGrams, weightKg, sex, hoursSinceFirstDrink } = body;

  if (hoursSinceFirstDrink < 0) {
    return new Response(
      JSON.stringify({ error: "hoursSinceFirstDrink must be >= 0" }),
      { status: 422 }
    );
  }

  if (drinksInGrams <= 0 || weightKg <= 0) {
    const resp: BacResponse = { bac: 0, zone: "safe", alcoholPurchaseBlocked: false };
    return new Response(JSON.stringify(resp), {
      headers: { "Content-Type": "application/json" },
    });
  }

  const r = R[sex] ?? R.unspecified;
  const raw = drinksInGrams / (weightKg * r) - ELIMINATION_RATE * hoursSinceFirstDrink;
  const bac = Math.max(0, raw);
  const zone: BacResponse["zone"] = bac >= 0.8 ? "high" : bac >= 0.5 ? "moderate" : "safe";

  const resp: BacResponse = { bac, zone, alcoholPurchaseBlocked: zone === "high" };
  return new Response(JSON.stringify(resp), {
    headers: { "Content-Type": "application/json" },
  });
});
