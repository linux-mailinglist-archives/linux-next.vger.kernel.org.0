Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46DE02540EA
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 10:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgH0Icw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 04:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgH0Icv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 04:32:51 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F44C06121B
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 01:32:51 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id u46so1419542uau.6
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 01:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=rhR9VT3qebWft3rYGOJFMfWNZvBnzCun5bg3Dhn/9i0=;
        b=aZGBoTuOF8rVF32THhxOpsi9PYhXbUvkb7iA9BiVqWrK8A9fNOuzqoabQppcZSffWj
         lc1HEiWuoGdzD6xADgq6iHj7Fl3VuPh/n/fFXFQ88/6ljd7tIoV7MRPg+on6RG0TDF3E
         WZVnI9QP0LWXlrWq+gSpRdsQcwC/wmONP0YEk5M43P6cDAFKaN0MD5m41Mnbnp6tYec8
         NhdAF7hFFTIvK94EmZ9H6ockxQRNv3NPxgwHS8tesQCzKWP8hHh1hW39cZOXeSsMvgnO
         uJVmcQv3X91JXfI1eEi49uao06EanOa1XLRbh7RdNsgusTUSoY4C9sVztXE4Ay8XzGyV
         sHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=rhR9VT3qebWft3rYGOJFMfWNZvBnzCun5bg3Dhn/9i0=;
        b=qzR2/XYgfcgccutAxX8wqyy0ajBOF0Q42mWsvdvfvYeQhxaKiof8v7mePcqsymXQhD
         PFHfNw/7wXh4wrwfTtyyjE7o7SnzJgxf0c+eO5sKyzOpmrzV155iyXVlNgzKMYb5fM0c
         5YI3ybbzMyB9ZJwwftTGLuNe9r1xDwzMmIZnL5RqbjCwKZfoQmUA1ZGQVRRL8WVoLxVV
         dAF823hP+cQLkWmzG08gl9H6C+UTKAFyYIxTelHgiJzYPxgDpyxUvNfA9hEQgC6JfR9U
         HrMs4h3QX11MCw5IQGl52XvfXGVdKRZyZXnpbJCn2EuQmU0FRZWdtCrC+SqqhXu2WxL/
         LNag==
X-Gm-Message-State: AOAM532NS6XvKSKlyDISKc89Yu0aEJA8jyC4/SGk3Jwp2Vnz5Fsfhcqv
        BTODc+qOKhYq7U8FrH96qcm0sWrXicdCFRr48HHUKQ==
X-Google-Smtp-Source: ABdhPJyoDOX/UthsLuZecX/ETu8CpM1kRCQDNaNdec9QOaHPHOZ2e7G31MPopmbp4IpYYMkzGeVnrnBFXG52IvlRFt8=
X-Received: by 2002:ab0:679a:: with SMTP id v26mr11228375uar.27.1598517170448;
 Thu, 27 Aug 2020 01:32:50 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 27 Aug 2020 14:02:39 +0530
Message-ID: <CA+G9fYvUwH2FA9GOeA_7GYpLA31uOmEpg32VKnJ8-d5QSK4PdQ@mail.gmail.com>
Subject: Kernel panic : Unable to handle kernel paging request at virtual
 address - dead address between user and kernel address ranges
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-clk <linux-clk@vger.kernel.org>, linux-mmc@vger.kernel.org,
        lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, lars.povlsen@microchip.com,
        madhuparnabhowmik10@gmail.com,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

arm64 dragonboard db410c boot failed while running linux next 20200827 kernel.

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: 88abac0b753dfdd85362a26d2da8277cb1e0842b
  git describe: next-20200827
  make_kernelversion: 5.9.0-rc2
  kernel-config:
https://builds.tuxbuild.com/vThV35pOF_GMlWdiTs3Bdw/kernel.config

Boot log,

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
[    0.000000] Linux version 5.9.0-rc2-next-20200827
(TuxBuild@12963d21faa5) (aarch64-linux-gnu-gcc (Debian 9.3.0-8) 9.3.0,
GNU ld (GNU Binutils for Debian) 2.34) #1 SMP PREEMPT Thu Aug 27
05:19:00 UTC 2020
[    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
[    0.000000] efi: UEFI not found.
[    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please
fix your bootloader!
<trmi>
[    3.451425] i2c_qup 78ba000.i2c: using default clock-frequency 100000
[    3.451491] i2c_qup 78ba000.i2c:
[    3.451491]  tx channel not available
[    3.493455] sdhci: Secure Digital Host Controller Interface driver
[    3.493508] sdhci: Copyright(c) Pierre Ossman
[    3.500902] Synopsys Designware Multimedia Card Interface Driver
[    3.507441] sdhci-pltfm: SDHCI platform and OF driver helper
[    3.514308] Unable to handle kernel paging request at virtual
address dead000000000108
[    3.514695] Mem abort info:
[    3.522421]   ESR = 0x96000044
[    3.525096]   EC = 0x25: DABT (current EL), IL = 32 bits
[    3.528236]   SET = 0, FnV = 0
[    3.533703]   EA = 0, S1PTW = 0
[    3.536561] Data abort info:
[    3.539601]   ISV = 0, ISS = 0x00000044
[    3.542727]   CM = 0, WnR = 1
[    3.546287] [dead000000000108] address between user and kernel address ranges
[    3.549414] Internal error: Oops: 96000044 [#1] PREEMPT SMP
[    3.556520] Modules linked in:
[    3.561901] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.9.0-rc2-next-20200827 #1
[    3.565034] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    3.572584] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
[    3.579271] pc : __clk_put+0x40/0x140
[    3.584556] lr : __clk_put+0x2c/0x140
[    3.588373] sp : ffff80001002bb00
[    3.592016] x29: ffff80001002bb00 x28: 000000000000002e
[    3.595320] x27: ffff000009f7ba68 x26: ffff80001146d878
[    3.600703] x25: ffff00003fcfd8f8 x24: ffff00003d0bc410
[    3.605999] x23: ffff80001146d0e0 x22: ffff000009f7ba40
[    3.611293] x21: ffff00003d0bc400 x20: ffff000009f7b580
[    3.616588] x19: ffff00003bccc780 x18: 0000000007824000
[    3.621883] x17: ffff000009f7ba00 x16: ffff000009f7b5d0
[    3.627177] x15: ffff800011966cf8 x14: ffffffffffffffff
[    3.632472] x13: ffff800012917000 x12: ffff800012917000
[    3.637769] x11: 0000000000000020 x10: 0101010101010101
[    3.643063] x9 : ffff8000107a984c x8 : 7f7f7f7f7f7f7f7f
[    3.648358] x7 : ffff000009fd8000 x6 : ffff80001237a000
[    3.653653] x5 : 0000000000000000 x4 : ffff000009fd8000
[    3.658949] x3 : ffff8000124e6768 x2 : ffff000009fd8000
[    3.664243] x1 : ffff00003bccca80 x0 : dead000000000100
[    3.669539] Call trace:
[    3.674830]  __clk_put+0x40/0x140
[    3.677003]  clk_put+0x18/0x28
[    3.680477]  dev_pm_opp_put_clkname+0x30/0x58
[    3.683431]  sdhci_msm_probe+0x284/0x9a0
[    3.687857]  platform_drv_probe+0x5c/0xb0
[    3.691847]  really_probe+0xf0/0x4d8
[    3.695753]  driver_probe_device+0xfc/0x168
[    3.699399]  device_driver_attach+0x7c/0x88
[    3.703306]  __driver_attach+0xac/0x178
[    3.707472]  bus_for_each_dev+0x78/0xc8
[    3.711291]  driver_attach+0x2c/0x38
[    3.715110]  bus_add_driver+0x14c/0x230
[    3.718929]  driver_register+0x6c/0x128
[    3.722489]  __platform_driver_register+0x50/0x60
[    3.726312]  sdhci_msm_driver_init+0x24/0x30
[    3.731173]  do_one_initcall+0x4c/0x2c0
[    3.735511]  kernel_init_freeable+0x21c/0x284
[    3.739072]  kernel_init+0x1c/0x120
[    3.743582]  ret_from_fork+0x10/0x30
[    3.746885] Code: 35000720 a9438660 f9000020 b4000040 (f9000401)
[    3.750720] ---[ end trace a8d4100497387a2e ]---
[    3.756736] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    3.761392] SMP: stopping secondary CPUs
[    3.768877] Kernel Offset: 0x80000 from 0xffff800010000000
[    3.772924] PHYS_OFFSET: 0x80000000
[    3.778216] CPU features: 0x0240002,24802005
[    3.781602] Memory Limit: none

full test log,
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200827/testrun/3123101/suite/linux-log-parser/test/check-kernel-oops-1714695/log

-- 
Linaro LKFT
https://lkft.linaro.org
