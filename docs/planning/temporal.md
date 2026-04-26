# Temporal Planning

## Time Representation

### Duration

```pddl
(:durative-action cook
  :duration (= ?duration 30)
  :condition (at start (has-ingredients))
  :effect (at end (food-ready))
)
```

## Concurrent Actions

Actions can execute simultaneously if non-interfering.

### Synchronization

- **Start conditions**: When action can begin
- **End conditions**: When action completes
- **Over all conditions**: Must hold throughout

## Scheduling

Integration of planning and scheduling:

1. **Planning**: What actions to execute
2. **Scheduling**: When to execute them

## Metrics

- **Makespan**: Total completion time
- **Total cost**: Sum of action costs
- **Earliness**: Penalize late goals

---

*[← Back to Overview](course_overview.md)*
