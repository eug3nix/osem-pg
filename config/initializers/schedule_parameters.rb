#sanitize the OSEM_SCHEUDLE_CELL_SIZE to be used for EventType::LENGTH_STEP
sched_cell_size = ENV['OSEM_SCHEDULE_CELL_SIZE'].to_i
sched_start_hour = ENV['OSEM_SCHEDULE_START_HOUR'].to_i
sched_end_hour = ENV['OSEM_SCHEDULE_END_HOUR'].to_i
if (sched_cell_size > 0 and 60 % sched_cell_size == 0)
  SCHEDULE_CELL_SIZE = sched_cell_size
end

if (sched_start_hour && sched_end_hour && (sched_start_hour < sched_end_hour))
  SCHEDULE_START_HOUR = sched_start_hour
  SCHEDULE_END_HOUR = sched_end_hour
else
  SCHEDULE_START_HOUR = 9
  SCHEDULE_END_HOUR = 18
end