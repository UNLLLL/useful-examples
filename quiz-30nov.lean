/-
  Quiz of 30 Nov 2026
-/

def a : Nat := 2
def b : Nat := 3

-- Probs 1-4. Predict the output.
-- Prob 1.
#eval a - b

-- Prob 2.
#eval ↑a - ↑b

-- Prob 3.
#eval (a : Int) - b

-- Prob 4.
#eval (↑a - ↑b : Int)

-- Prob 5. Predict the type that `#check` reports.
#check fun (n : Nat) (i : Int) => n + i

/-
  ★ Prob 6. (Starred exercise!) The command below declares a new notation that
  overlaps with the built-in `+`. Predict the output of each `#eval`.
  (Warning: is notation stays in effect
  later in this file!)
-/
notation:65 x " + " y:66 " + " z:66 => x + y - z

-- (a)
#eval 1 + 2 + 3

-- (b)
#eval 1 + 2 + 4



































/-
  ANSWER KEY

  1. `0`. `a - b` is subtraction in `Nat`, which is truncated: a result
     that would be negative becomes 0.

  2. `0`. `↑` means "coerce to whatever type is expected here," not
     "cast to Int." Nothing here says what type is expected, so the
     target type resolves to `Nat`. The coercion `Nat → Nat` is the
     identity, so this is just `a - b` again.

  3. `-1`. The ascription makes `a` an `Int`. Lean's elaborator for
     arithmetic operators then coerces the other operand to `Int` too,
     so this elaborates as `↑a - ↑b : Int`.

  4. `-1`. The ascription `: Int` on the whole expression gives both
     `↑`s a target type, so the subtraction happens in `Int`.

  5. `fun n i => ↑n + i : Nat → Int → Int`. Lean finds the "largest"
     type among the operands (`Int`) and coerces the others into it.

  ★6. (a) `0`. The new notation overlaps the built-in binary `+`, and
     Lean's parser takes the longest match. So `1 + 2 + 3` is read as
     the three-argument version, i.e., `1 + 2 - 3`, not as
     `(1 + 2) + 3`.
     (b) `0` again. This parses as `1 + 2 - 4`, which is computed in
     `Nat`, so the subtraction truncates: 3 - 4 = 0.
-/
