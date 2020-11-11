Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C2D2AE8EA
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 07:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgKKG0C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 01:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbgKKG0B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2020 01:26:01 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41435C0613D1
        for <linux-next@vger.kernel.org>; Tue, 10 Nov 2020 22:25:59 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id v22so1059485edt.9
        for <linux-next@vger.kernel.org>; Tue, 10 Nov 2020 22:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=oka4K+VdT0FCED2J+gWqYdNAE+zjvU+W0LSF6uQEnHM=;
        b=UZFz3mzFqP/l4HDvWK+EJQHw1gtS2mUdF9PXrezhPBrM+yg3qHXMvTL4cHz5p7LL/A
         63HNiixMl3ohQHpT3l6sSyLPrrXCv1lpfZrmKGDkkM52ygiMgG4qOQe++OXRl8UgF0tg
         c44AOtJUAKG/PihB+idAraKDTZQpUeSyCul+KclKSqx2ajYGaRk4jzRvjFGfhw5bIf1b
         6UUduFWcAdX32WOR0vCKkOHFGx+4XybSLztX2di8ALNHJhZAe/Jtjmoq8+Pwm+w7DXtR
         U22oCcE+Fg97ywgvWgCLRx9SUmI2TtHDy/IKBRZfvJvMUJ0BuhtL8xCONCGDlEjqQn4/
         6Dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=oka4K+VdT0FCED2J+gWqYdNAE+zjvU+W0LSF6uQEnHM=;
        b=WC9s+5cQlZU19uOxWsQkMKwn8JQ+/mEv2h3R0bY6zJR+CWsPCPc6HWj0S+3w1eY5s/
         RQZoS6TenO1C3xsGg0r11r+GO6fMffBrr328wlElJPBlwpihhyF71QGWv8mCPWB7r90y
         tWXPBlOKxfkASU4RZZZujmSlMSaymZrra74N2YZ/9Isl9YEWbUtD/9ShIMRdU/ijrqeM
         QMjFMkprQv5pmRyNO+o1ez2hs5B3mi++G+qjY/QkwEVLFVG5erMMQnyU4FhrM8gBEhVT
         4pycW/RxLdQctQz/ZqCb0qHBpGibYjEPtTpwAJ6pHqYS/PhRQXv/r9rxts2ExJ2hWj43
         n8MA==
X-Gm-Message-State: AOAM5333GeOjryK4SytssPQVKww9yxKAzu1cdrf8YTYlvLnVzDMwLv48
        Z5MTO+cRSP5x5DcMfyO6f5jHLBbBVDPOLOo6de/2rg==
X-Google-Smtp-Source: ABdhPJyzhfl2fRiNBqzmcYvHodmIID7rR3hgQZfrywesr9ze5eSjKmnl2/ystkF2tHriqClY7OKhuOtKcVKMYYTinrQ=
X-Received: by 2002:aa7:df81:: with SMTP id b1mr3276236edy.365.1605075957882;
 Tue, 10 Nov 2020 22:25:57 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 11 Nov 2020 11:55:46 +0530
Message-ID: <CA+G9fYvQ9R2i8FsQcvb7f8aYv1v1+vq_OsOtg9YEtHGRvx+zxQ@mail.gmail.com>
Subject: BUG: KASAN: global-out-of-bounds in soc_device_match on arm
To:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The following kernel warning noticed on arm KASAN enabled config while
booting on
TI beagleboard x15 device.

[   32.127451] BUG: KASAN: global-out-of-bounds in soc_device_match+0x64/0xe4
[   32.127485] Read of size 4 at addr c21701f8 by task swapper/0/1
[   32.127508]
[   32.127549] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
  5.10.0-rc3-next-20201110 #2
[   32.127577] Hardware name: Generic DRA74X (Flattened Device Tree)
[   32.127604] Backtrace:
[   32.127670] [<c199f710>] (dump_backtrace) from [<c199fb94>]
(show_stack+0x20/0x24)
[   32.127717]  r9:00000080 r8:c4208000 r7:c3023060 r6:40000093
r5:00000000 r4:c3023060
[   32.127766] [<c199fb74>] (show_stack) from [<c19a7ad0>]
(dump_stack+0xe8/0x10c)
[   32.127824] [<c19a79e8>] (dump_stack) from [<c05e0290>]
(print_address_description.constprop.0+0x3c/0x4b0)
[   32.127871]  r10:00000030 r9:c5da4010 r8:c5da4000 r7:00000000
r6:c0fd5c20 r5:eebf33c0
[   32.127903]  r4:c21701f8 r3:eebf33c4
[   32.127958] [<c05e0254>] (print_address_description.constprop.0)
from [<c05e0920>] (kasan_report+0x160/0x17c)
[   32.128000]  r8:c5da4000 r7:00000000 r6:c0fd5c20 r5:00000001 r4:c21701f8
[   32.128053] [<c05e07c0>] (kasan_report) from [<c05e0c68>]
(__asan_load4+0x6c/0x9c)
[   32.128093]  r7:c3c3ede0 r6:c354dea0 r5:c0fd5b88 r4:c21701f8
[   32.128144] [<c05e0bfc>] (__asan_load4) from [<c0fd5c20>]
(soc_device_match+0x64/0xe4)
[   32.128197] [<c0fd5bbc>] (soc_device_match) from [<c0e2b4a8>]
(omap8250_probe+0x628/0x75c)
[   32.128236]  r7:b7841730 r6:c6db2c4e r5:00000001 r4:c6db2c40
[   32.128290] [<c0e2ae80>] (omap8250_probe) from [<c0f9889c>]
(platform_drv_probe+0x70/0xc8)
[   32.128335]  r10:c5da4044 r9:c5da4048 r8:c34ff834 r7:c3c3e240
r6:c34ff834 r5:00000000
[   32.128363]  r4:c5da4010
[   32.128413] [<c0f9882c>] (platform_drv_probe) from [<c0f94924>]
(really_probe+0x184/0x72c)
[   32.128452]  r7:c3c3e240 r6:00000000 r5:c3c3e1c0 r4:c5da4010
[   32.128499] [<c0f947a0>] (really_probe) from [<c0f9515c>]
(driver_probe_device+0xa4/0x270)
[   32.128544]  r10:c34ff834 r9:c416fa58 r8:c379e840 r7:c5d75a00
r6:c5da4034 r5:c37c01c0
[   32.128572]  r4:c5da4010
[   32.128620] [<c0f950b8>] (driver_probe_device) from [<c0f956ac>]
(device_driver_attach+0x94/0x9c)
[   32.128665]  r10:00000000 r9:c416fa58 r8:c0f956b4 r7:c5d75a00
r6:c5da4034 r5:c34ff834
[   32.128693]  r4:c5da4010
[   32.128741] [<c0f95618>] (device_driver_attach) from [<c0f95798>]
(__driver_attach+0xe4/0x19c)
[   32.128780]  r7:c34ff834 r6:c5da4010 r5:c34ff834 r4:00000000
[   32.128826] [<c0f956b4>] (__driver_attach) from [<c0f917e4>]
(bus_for_each_dev+0x100/0x154)
[   32.128865]  r7:c34ff834 r6:b78417a4 r5:c420bd40 r4:c5d75a34
[   32.128910] [<c0f916e4>] (bus_for_each_dev) from [<c0f93f28>]
(driver_attach+0x38/0x3c)
[   32.128955]  r9:c34ff87c r8:c416fa00 r7:c3541a70 r6:c3541a20
r5:c6db4f00 r4:c34ff834
[   32.129001] [<c0f93ef0>] (driver_attach) from [<c0f93470>]
(bus_add_driver+0x21c/0x2dc)
[   32.129034]  r5:c6db4f00 r4:c34ff834
[   32.129080] [<c0f93254>] (bus_add_driver) from [<c0f96874>]
(driver_register+0xdc/0x1b0)
[   32.129125]  r10:00000000 r9:c2b00468 r8:c378a0c0 r7:c2170360
r6:c34ff838 r5:c3541a20
[   32.129153]  r4:c34ff834
[   32.129202] [<c0f96798>] (driver_register) from [<c0f987c8>]
(__platform_driver_register+0x7c/0x84)
[   32.129241]  r7:ffffc000 r6:c2bc509c r5:00000000 r4:c34ff820
[   32.129300] [<c0f9874c>] (__platform_driver_register) from
[<c2bc50c0>] (omap8250_platform_driver_init+0x24/0x28)
[   32.129333]  r5:c420bf20 r4:b78417d0
[   32.129387] [<c2bc509c>] (omap8250_platform_driver_init) from
[<c030370c>] (do_one_initcall+0xc4/0x400)
[   32.129437] [<c0303648>] (do_one_initcall) from [<c2b015e8>]
(kernel_init_freeable+0x214/0x268)
[   32.129482]  r10:c2d128a8 r9:c2b00468 r8:c2c50834 r7:c2c50854
r6:c2a55ac8 r5:00000007
[   32.129511]  r4:c425a700
[   32.129563] [<c2b013d4>] (kernel_init_freeable) from [<c19bfd1c>]
(kernel_init+0x18/0x140)
[   32.129607]  r10:00000000 r9:00000000 r8:00000000 r7:00000000
r6:00000000 r5:c19bfd04
[   32.129635]  r4:00000000
[   32.129684] [<c19bfd04>] (kernel_init) from [<c030017c>]
(ret_from_fork+0x14/0x38)
[   32.129715] Exception stack(0xc420bfb0 to 0xc420bff8)
[   32.129753] bfa0:                                     00000000
00000000 00000000 00000000
[   32.129798] bfc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   32.129839] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   32.129872]  r5:c19bfd04 r4:00000000
[   32.129894]
[   32.129917] The buggy address belongs to the variable:
[   32.129957]  k3_soc_devices+0x38/0x1e0
[   32.129981] The buggy address belongs to the page:
[   32.130018] page:(ptrval) refcount:1 mapcount:0 mapping:00000000
index:0x0 pfn:0x82170
[   32.130051] flags: 0x1000(reserved)
[   32.130104] raw: 00001000 eebf33c4 eebf33c4 00000000 00000000
00000000 ffffffff 00000001
[   32.130133] raw: 00000000
[   32.130159] page dumped because: kasan: bad access detected
[   32.130182]
[   32.130205] Memory state around the buggy address:
[   32.130239]  c2170080: 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00 00 05 f9 f9
[   32.130272]  c2170100: f9 f9 f9 f9 00 00 00 00 00 01 f9 f9 f9 f9 f9 f9
[   32.130306] >c2170180: 00 02 f9 f9 f9 f9 f9 f9 00 00 00 00 00 00 00 f9
[   32.130331]                                                         ^
[   32.130364]  c2170200: f9 f9 f9 f9 00 00 00 06 f9 f9 f9 f9 00 00 00 02
[   32.130397]  c2170280: f9 f9 f9 f9 00 00 00 00 02 f9 f9 f9 f9 f9 f9 f9
[   32.130422] ==================================================================
[   32.130446] Disabling lock debugging due to kernel taint

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git describe: next-20201110
  make_kernelversion: 5.10.0-rc3
  build : https://builds.tuxbuild.com/1k5bYasxkHF7omMh7mjtxjRtkMe/

Full log:
https://lkft.validation.linaro.org/scheduler/job/1927838#L2190

--
Linaro LKFT
https://lkft.linaro.org
