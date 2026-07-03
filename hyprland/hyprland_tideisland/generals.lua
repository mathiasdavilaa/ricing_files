hl.config({
  general = {
    gaps_in  = 1,
    gaps_out = 1,
    border_size = 2,

    col = {
      active_border   = "rgba(ffffffff)",
      inactive_border = "rgba(00000000)",
    },

    resize_on_border = true,
    allow_tearing = false,
    layout = "scrolling",

    snap = {
      enabled = true,
      respect_gaps = false
    }
  },
})
