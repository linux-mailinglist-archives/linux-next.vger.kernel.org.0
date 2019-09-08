Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E628ACF2F
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2019 16:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbfIHONO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Sep 2019 10:13:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41366 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbfIHONO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Sep 2019 10:13:14 -0400
Received: by mail-lj1-f193.google.com with SMTP id a4so10178051ljk.8;
        Sun, 08 Sep 2019 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rl68yzDtiXjk+0mVtpDfigDDjvTqEJDktzLp9GLqTHA=;
        b=hbYYV7IzPg9tAtxiX5tge8NaZg0ebITZtuz+KGDjo6fUj7MTNK08DjY7ZDf5KYA5kL
         YHJx2gWK2Csa04Mxv2fdM8ljDW51EIdTvXLFIDHrIvSOHegN+xrFJ9Z+hY7kRhaun25k
         Sf+zNP9fnz8JVhSeIqR948aAuVM1K8L75LeGg1iqYtymnqMJmhGAew5oz7qMaNhHCx8F
         mtiCpzDjaH6tRyb/VfhJTHsY8H8Ro9+Oz8COTtrMI9y39euKJE681jHHEr/An6m4AFyQ
         c6RPN3X+5wbt2gINIPWLxZLLvnAOGAhi3LV3OCRam6oIIq103EDX6oux3UdQFg8QwrML
         RQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rl68yzDtiXjk+0mVtpDfigDDjvTqEJDktzLp9GLqTHA=;
        b=DzbGQmsWTld8QoPF7crGOqaLRcFNvgYJEM2nTod5SvN4nLfbs4qB1s//IM1OCSHa0V
         tGFsd14Fv5xnVk5TOcLk0AZFWAlox8fLxSx2ULAEHq9gBQHDTfnqe6CF0hlZUdj8T+Xa
         ZakWpH2c68KqslHa6t713Yk3H5bjSrK+qs2DczttkWSa7ru6AJDmWs5TBDVMHmTbqgy+
         PWhWdgY8NMwy+ZN7puR9QkkN+JGojd+SaHU6FPgoIL9WwmtYUFExSTiQOVlX3NyzyzFZ
         m04gthsYbH1Coru1Wo2S78lw1tVdRonriPftGjqwlacICqdhRZA/hbMeOSCJWMc6iyxh
         F55A==
X-Gm-Message-State: APjAAAXJmmBGhQS5IGHUq1ox2Nftyc3OzzOHvz0Ag7eH2+Wp57DL1pRL
        xTVmspedtJqDZlSJi2XwwsSyAd0FMKA=
X-Google-Smtp-Source: APXvYqwIeBK/gvrerEGu1X8ZuW7Za5m7LCWytTK/LPXvbWpqsXrle8/zJ99H3fZPqflVgqVA/nx8gA==
X-Received: by 2002:a2e:9a18:: with SMTP id o24mr12518417lji.123.1567951990419;
        Sun, 08 Sep 2019 07:13:10 -0700 (PDT)
Received: from pc-sasha.localdomain ([95.47.123.158])
        by smtp.gmail.com with ESMTPSA id d25sm2244780lfj.15.2019.09.08.07.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2019 07:13:09 -0700 (PDT)
Date:   Sun, 8 Sep 2019 17:13:07 +0300
From:   Alexander Kapshuk <alexander.kapshuk@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sean@poorly.run, airlied@linux.ie
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
Message-ID: <20190908141307.GA7115@pc-sasha.localdomain>
References: <20190907090534.GB1712@pc-sasha.localdomain>
 <CAKMK7uHYdXwruQxxBM12Q5MVeH9fjFpZvxZz06BSo7YrCQbM2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHYdXwruQxxBM12Q5MVeH9fjFpZvxZz06BSo7YrCQbM2w@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Sep 07, 2019 at 12:32:41PM +0200, Daniel Vetter wrote:
> On Sat, Sep 7, 2019 at 11:05 AM Alexander Kapshuk
> <alexander.kapshuk@gmail.com> wrote:
> >
> > To Whom It May Concern
> >
> > Every kernel I have built since 5.3.0-rc2-next-20190730 and up to
> > 5.3.0-rc7-next-20190903 has resulted in the kernel panic described below.
> >
> > The panic occurs early on in the boot process, so no records of it get
> > written on disk. I resourted to taking photos and videos to get the info
> > for debugging.
> >
> > [Kernel panic]
> > Code: 00 48 83 bb f0 00 00 00 00 74 16 48 83 c3 18 b9 17 00 00 00 31 c0 48 89 df f3 48 ab 5b 41 5c 5d c3 4c 89 a3 f0 00 00 00 eb e1 <0f> 0b 0f 1f 40 00 55 48 89 e5 41 54 49 89 d4 53 48 89 f3 e8 7e ff
> >
> > Kernel panic - Not syncing: Attempted to kill init! exitcode=0x0000000b.
> >
> > Top of call stack:
> > __drm_fb_helper_initial_config_and_unlock
> > drm_fb_helper_initial_config
> >
> > <scripts/decodecode <~/tmp/panic_code.txt
> > Code: 00 48 83 bb f0 00 00 00 00 74 16 48 83 c3 18 b9 17 00 00 00 31 c0 48 89 df f3 48 ab 5b 41 5c 5d c3 4c 89 a3 f0 00 00 00 eb e1 <0f> 0b 0f 1f 40 00 55 48 89 e5 41 54 49 89 d4 53 48 89 f3 e8 7e ff
> > All code
> > ========
> >    0:   00 48 83                add    %cl,-0x7d(%rax)
> >    3:   bb f0 00 00 00          mov    $0xf0,%ebx
> >    8:   00 74 16 48             add    %dh,0x48(%rsi,%rdx,1)
> >    c:   83 c3 18                add    $0x18,%ebx
> >    f:   b9 17 00 00 00          mov    $0x17,%ecx
> >   14:   31 c0                   xor    %eax,%eax
> >   16:   48 89 df                mov    %rbx,%rdi
> >   19:   f3 48 ab                rep stos %rax,%es:(%rdi)
> >   1c:   5b                      pop    %rbx
> >   1d:   41 5c                   pop    %r12
> >   1f:   5d                      pop    %rbp
> >   20:   c3                      retq
> >   21:   4c 89 a3 f0 00 00 00    mov    %r12,0xf0(%rbx)
> >   28:   eb e1                   jmp    0xb
> >   2a:*  0f 0b                   ud2             <-- trapping instruction
> >   2c:   0f 1f 40 00             nopl   0x0(%rax)
> >   30:   55                      push   %rbp
> >   31:   48 89 e5                mov    %rsp,%rbp
> >   34:   41 54                   push   %r12
> >   36:   49 89 d4                mov    %rdx,%r12
> >   39:   53                      push   %rbx
> >   3a:   48 89 f3                mov    %rsi,%rbx
> >   3d:   e8                      .byte 0xe8
> >   3e:   7e ff                   jle    0x3f
> >
> > Code starting with the faulting instruction
> > ===========================================
> >    0:   0f 0b                   ud2
> >    2:   0f 1f 40 00             nopl   0x0(%rax)
> >    6:   55                      push   %rbp
> >    7:   48 89 e5                mov    %rsp,%rbp
> >    a:   41 54                   push   %r12
> >    c:   49 89 d4                mov    %rdx,%r12
> >    f:   53                      push   %rbx
> >   10:   48 89 f3                mov    %rsi,%rbx
> >   13:   e8                      .byte 0xe8
> >   14:   7e ff                   jle    0x15
> >
> > The panic occurs after the 'Driver supports precise vblank timestamp
> > query.' line gets printed to console:
> > [    2.858970] Linux agpgart interface v0.103
> > [    2.859308] nouveau 0000:01:00.0: NVIDIA G84 (084300a2)
> > [    2.968950] nouveau 0000:01:00.0: bios: version 60.84.68.00.19
> > [    2.989923] nouveau 0000:01:00.0: bios: M0203T not found
> > [    2.990010] nouveau 0000:01:00.0: bios: M0203E not matched!
> > [    2.990096] nouveau 0000:01:00.0: fb: 512 MiB DDR2
> > [    3.062362] [TTM] Zone  kernel: Available graphics memory: 2015014 KiB
> > [    3.062494] [TTM] Initializing pool allocator
> > [    3.062581] [TTM] Initializing DMA pool allocator
> > [    3.062683] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
> > [    3.062769] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
> > [    3.062859] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> > [    3.062944] nouveau 0000:01:00.0: DRM: DCB version 4.0
> > [    3.063030] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000300 00000028
> > [    3.063117] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000302 00000030
> > [    3.063203] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011310 00000028
> > [    3.063290] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011312 00c000b0
> > [    3.063377] nouveau 0000:01:00.0: DRM: DCB conn 00: 1030
> > [    3.063462] nouveau 0000:01:00.0: DRM: DCB conn 01: 2130
> > [    3.065982] nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
> > [    3.066622] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> > [    3.066754] [drm] Driver supports precise vblank timestamp query.
> >
> > I was not able to capture the value of RIP for this crash.
> >
> > With drm_kms_helper.fbdev_emulation=0 enabled, as documented in
> > the commentary to function drm_fb_helper_initial_config defined in
> > drivers/gpu/drm/drm_fb_helper.c, I get the following output:
> >
> > RIP: 0010: _raw_spin_lock+0x7/0x20
> > Code: ba ff 00 00 00 f0 0f b1 17 75 01 c3 55 48 89 e5 e8 23 a2 6d ff 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 90 31 c0 ba 01 00 00 00 <f0> 0f b1 17 75 01 c3 55 89 c6 40 89 e5 e8 e7 8f 6d ff 5d c3 0f 1f
> >
> > <scripts/decodecode <~/tmp/panic_code.txt
> > Code: ba ff 00 00 00 f0 0f b1 17 75 01 c3 55 48 89 e5 e8 23 a2 6d ff 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 90 31 c0 ba 01 00 00 00 <f0> 0f b1 17 75 01 c3 55 89 c6 40 89 e5 e8 e7 8f 6d ff 5d c3 0f 1f
> > All code
> > ========
> >    0:   ba ff 00 00 00          mov    $0xff,%edx
> >    5:   f0 0f b1 17             lock cmpxchg %edx,(%rdi)
> >    9:   75 01                   jne    0xc
> >    b:   c3                      retq
> >    c:   55                      push   %rbp
> >    d:   48 89 e5                mov    %rsp,%rbp
> >   10:   e8 23 a2 6d ff          callq  0xffffffffff6da238
> >   15:   5d                      pop    %rbp
> >   16:   c3                      retq
> >   17:   66 66 2e 0f 1f 84 00    data16 nopw %cs:0x0(%rax,%rax,1)
> >   1e:   00 00 00 00
> >   22:   90                      nop
> >   23:   31 c0                   xor    %eax,%eax
> >   25:   ba 01 00 00 00          mov    $0x1,%edx
> >   2a:*  f0 0f b1 17             lock cmpxchg %edx,(%rdi)                <-- trapping instruction
> >   2e:   75 01                   jne    0x31
> >   30:   c3                      retq
> >   31:   55                      push   %rbp
> >   32:   89 c6                   mov    %eax,%esi
> >   34:   40 89 e5                rex mov %esp,%ebp
> >   37:   e8 e7 8f 6d ff          callq  0xffffffffff6d9023
> >   3c:   5d                      pop    %rbp
> >   3d:   c3                      retq
> >   3e:   0f                      .byte 0xf
> >   3f:   1f                      (bad)
> >
> > Code starting with the faulting instruction
> > ===========================================
> >    0:   f0 0f b1 17             lock cmpxchg %edx,(%rdi)
> >    4:   75 01                   jne    0x7
> >    6:   c3                      retq
> >    7:   55                      push   %rbp
> >    8:   89 c6                   mov    %eax,%esi
> >    a:   40 89 e5                rex mov %esp,%ebp
> >    d:   e8 e7 8f 6d ff          callq  0xffffffffff6d8ff9
> >   12:   5d                      pop    %rbp
> >   13:   c3                      retq
> >   14:   0f                      .byte 0xf
> >   15:   1f                      (bad)
> >
> > (gdb) list *(_raw_spin_lock+0x7)
> > 0xffffffff81a13b27 is in _raw_spin_lock (./arch/x86/include/asm/atomic.h:200).
> > 195     }
> > 196
> > 197     #define arch_atomic_try_cmpxchg arch_atomic_try_cmpxchg
> > 198     static __always_inline bool arch_atomic_try_cmpxchg(atomic_t *v, int *old, int new)
> > 199     {
> > 200             return try_cmpxchg(&v->counter, old, new);
> > 201     }
> > 202
> > 203     static inline int arch_atomic_xchg(atomic_t *v, int new)
> > 204     {
> >
> > (gdb) disassemble _raw_spin_lock+0x7
> > Dump of assembler code for function _raw_spin_lock:
> >    0xffffffff81a13b20 <+0>:     xor    %eax,%eax
> >    0xffffffff81a13b22 <+2>:     mov    $0x1,%edx
> >    0xffffffff81a13b27 <+7>:     lock cmpxchg %edx,(%rdi)
> >    0xffffffff81a13b2b <+11>:    jne    0xffffffff81a13b2e <_raw_spin_lock+14>
> >    0xffffffff81a13b2d <+13>:    retq
> >    0xffffffff81a13b2e <+14>:    push   %rbp
> >    0xffffffff81a13b2f <+15>:    mov    %eax,%esi
> >    0xffffffff81a13b31 <+17>:    mov    %rsp,%rbp
> >    0xffffffff81a13b34 <+20>:    callq  0xffffffff810ecb20 <queued_spin_lock_slowpath>
> >    0xffffffff81a13b39 <+25>:    pop    %rbp
> >    0xffffffff81a13b3a <+26>:    retq
> > End of assembler dump.
> >
> > Any pointers on how to proceed with this would be appreciated.
> > See the files attached for copies of my .config and output of ver_linux.
> 
> Lotta people are travelling to plumbers now for next week, so might be
> slow responses. One option would be to try to bisect where things
> broke. You've collected a lot of data here painstakingly, but from
> looking at it I'm not really connecting the docs. Knowing which change
> broke your machine can help enormously.
> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch

Thanks for your prompt reply, Daniel.
This is my first bisect. Here's what I've tried so far and based on the
output I got, I seem to be taken in the opposit direction.

git bisect start
git bisect bad				# 7dc4585e0378:next-20190903
git bisect good next-20190730	#70f4b4ac1655

Instead of being shown commits between 70f4b4ac1655 and 7dc4585e0378,
I got this:
Bisecting: a merge base must be tested
[5d21595b17f693dce313b58f9617a8ea2a45b1b1] pinctrl: Ingenic: Add pinctrl driver for X1500.

git show 5d21595b17f6 | grep -i date
Date:   Sun Jul 14 11:53:56 2019 +0800

I went ahead and actually built that kernel, which ended up being
5.3.0-rc1-00010-g5d21595b17f6, which booted just fine.
So, I said:
git bisect good 5d21595b17f6

And got:
Bisecting: a merge base must be tested
[8c4407de3be44c2a0ec3e316cd3e4a711bc2aaba] pinctrl: aspeed: Make aspeed_pinmux_ips static

git show 8c4407de3be4 | grep -i date
Date:   Thu Jul 11 22:24:57 2019 +0800

Clearly, I'm doing something wrong there.
I'd appreciate being pointed in the right direction.
