-- Pop Quiz, Mon 16 Nov

/-
`rw` searches the goal outermost-first, left to right.
The first match fixes the holes (`?x`).
Then every copy of that one instance is replaced
in a single pass, and `rw` doesn't look inside what it just replaced.
Finally, `rw` tries `rfl`.
-/

-- Setup for all questions:
variable (f g : Nat → Nat) (a b c : Nat)

/-! ## Q1 -/

-- Which single `rw [...]` command closes the goal? Is there more than one?
example (h : a = b) : f a + c = f b + c := by
  sorry

/-! ## Q2 -/

/-
(a) Which single `rw [...]` command closes the goal?
    (Recall: `Nat.add_comm : ∀ n m, n + m = m + n`)
(b) Why doesn't `rw [Nat.add_comm]` or `rw [Nat.add_comm a]` work?
    What goal does each one leave?
-/
example : a + (b + c) = a + (c + b) := by
  sorry

/-! ## Q3 -/

/-
(a) The pattern `f ?x` matches six subterms of the goal. List them.
(b) Which one does `rewrite [h]` match first, and what does that make `?x`?
    Write down the goal after `rewrite [h]`.
(c) What is the goal after `rewrite [h (f b)]` instead?
(d) Starting from the original goal, how many times do you have to run `rewrite [h]`
    before no `f` is left? Write down the goal after each step.
-/
example (h : ∀ x, f x = g x) : g (f a) + f (f b) = f b * f (g (f a)) := by
  rewrite [h]
  sorry

/-! ## Q4* -/

example (a b : Nat) : a + b = b + a := by
  -- exactly one of these two lines closes the proof. which one?
  -- rewrite [Nat.add_comm]
  -- rw [Nat.add_comm]
  sorry
