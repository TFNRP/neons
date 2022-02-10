Config = {
  Animations = {
    {
      name = 'Criss Cross',
      patterns = {
        {
          [Constants.Left] = true,
          [Constants.Right] = true,
          [Constants.Front] = false,
          [Constants.Back] = false,
        },
        {
          [Constants.Left] = false,
          [Constants.Right] = false,
          [Constants.Front] = true,
          [Constants.Back] = true,
        },
      },
    },
    {
      name = 'Fourways',
      patterns = {
        {
          [Constants.Left] = false,
          [Constants.Right] = false,
          [Constants.Front] = false,
          [Constants.Back] = true,
        },
        {
          [Constants.Left] = false,
          [Constants.Right] = true,
          [Constants.Front] = false,
          [Constants.Back] = false,
        },
        {
          [Constants.Left] = false,
          [Constants.Right] = false,
          [Constants.Front] = true,
          [Constants.Back] = false,
        },
        {
          [Constants.Left] = true,
          [Constants.Right] = false,
          [Constants.Front] = false,
          [Constants.Back] = false,
        },
      },
    },
    {
      name = 'Lightning',
      patterns = {
        {
          [Constants.Left] = false,
          [Constants.Right] = false,
          [Constants.Front] = false,
          [Constants.Back] = true,
        },
        {
          [Constants.Left] = true,
          [Constants.Right] = true,
          [Constants.Back] = false,
        },
        {
          [Constants.Left] = false,
          [Constants.Right] = false,
          [Constants.Front] = true,
        },
        {
          [Constants.Left] = true,
          [Constants.Right] = true,
          [Constants.Front] = false,
        },
      },
    },
    {
      name = 'Blink',
      patterns = {
        {
          [Constants.Left] = true,
          [Constants.Right] = true,
          [Constants.Front] = true,
          [Constants.Back] = true,
        },
        {
          [Constants.Left] = false,
          [Constants.Right] = false,
          [Constants.Front] = false,
          [Constants.Back] = false,
        },
      },
    },
    {
      name = 'Snake',
      patterns = {
        {
          [Constants.Left] = false,
          [Constants.Right] = false,
          [Constants.Front] = false,
          [Constants.Back] = true,
        },
        {
          [Constants.Left] = false,
          [Constants.Right] = true,
          [Constants.Front] = false,
          [Constants.Back] = false,
        },
        {
          [Constants.Left] = false,
          [Constants.Right] = false,
          [Constants.Front] = true,
          [Constants.Back] = false,
        },
        {
          [Constants.Left] = true,
          [Constants.Right] = false,
          [Constants.Front] = false,
          [Constants.Back] = false,
        },
        {
          [Constants.Left] = false,
          [Constants.Right] = false,
          [Constants.Front] = false,
          [Constants.Back] = true,
        },
        {
          [Constants.Left] = true,
          [Constants.Right] = false,
          [Constants.Front] = false,
          [Constants.Back] = false,
        },
        {
          [Constants.Left] = false,
          [Constants.Right] = false,
          [Constants.Front] = true,
          [Constants.Back] = false,
        },
        {
          [Constants.Left] = false,
          [Constants.Right] = true,
          [Constants.Front] = false,
          [Constants.Back] = false,
        },
      },
    },
  },
}

-- hybrid pattern, all patterns combined
table.insert(Config.Animations, {
  name = 'Hybrid',
  patterns = {},
})

for _, anim in ipairs(Config.Animations) do
  table.insert(Config.Animations[#Config.Animations].patterns, anim.patterns)
end