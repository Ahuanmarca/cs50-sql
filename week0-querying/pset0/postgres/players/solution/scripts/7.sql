select
  count(*)
from
  players
where
  (
    bats = 'L'
    and throws = 'R'
  )
  or (
    bats = 'R'
    and throws = 'L'
  );