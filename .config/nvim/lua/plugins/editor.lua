return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- ต้องการ Treesitter และ Nerd Font
    opts = {}, -- ใช้ค่า Default ก็สวยแล้ว
    -- หรือถ้าอยากปรับแต่งเพิ่ม:
    config = function()
      require("render-markdown").setup({
        heading = {
          -- ปรับแต่งสัญลักษณ์หน้าหัวข้อ
          sign = true,
          icons = { "qc ", "qc ", "qc ", "qc ", "qc ", "qc " },
        },
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      -- เอาตัวที่กดยากๆ ออก (เช่น z, x, c) เน้น Home Row
      labels = "asdfghjklqwertyuiop",

      search = {
        -- Search แบบ Smart Case (พิมพ์เล็กหาเจอทั้งเล็กและใหญ่)
        mode = function(str)
          return "\\<" .. str
        end,
      },

      jump = {
        -- Autojump: ถ้ามีตัวเลือกเดียว ไม่ต้องรอ label ให้วาร์ปไปเลย (ลดไป 1 click)
        autojump = true,
        -- ปิดการเซฟเข้า jumplist (optional: ถ้าไม่อยากให้กด Ctrl-o แล้วกลับมาที่เดิมเยอะเกินไป)
        nohlsearch = true,
      },

      modes = {
        -- จูนโหมด Char (f, F, t, T)
        char = {
          enabled = true, -- ให้ Flash มาช่วยไฮไลท์ตอนกด f ด้วย (มองง่ายกว่าเดิมเยอะ)
          -- autohide = true, -- ซ่อน label ทันทีที่กด (ถ้าชอบความ Clean)
          jump_labels = true, -- โชว์ label ให้กดข้ามไปตัวถัดไปได้เลย ไม่ต้องกด ; ย้ำๆ
        },

        search = {
          enabled = false, -- ปิด Flash ตอนกด / (บางคนชอบ Search แบบปกติมากกว่า เพราะ Flash มันบังจอ)
        },
      },
    },

    keys = {
      -- 1. Basic Jump (s): วาร์ปไปไหนก็ได้
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },

      -- 2. Treesitter Select (S): เลือก Scope อัจฉริยะ (ทั้ง Function, ทั้ง Loop)
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },

      -- 3. Remote Action (r): ท่าไม้ตายสูงสุด! (ทำ action กับ text ที่อยู่ไกลๆ โดยไม่ต้องขยับตัว)
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },

      -- 4. Toggle Resume (R): ทำซ้ำการ search ล่าสุด (เหมาะกับทำ macro)
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
    },
  },
}
