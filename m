Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDDFF2542B2
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 11:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgH0Jsg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 05:48:36 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:45001 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgH0Jse (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 05:48:34 -0400
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MZCX1-1k6g3F0IPR-00V6R6; Thu, 27 Aug 2020 11:48:32 +0200
Received: by mail-qk1-f177.google.com with SMTP id b14so5304867qkn.4;
        Thu, 27 Aug 2020 02:48:31 -0700 (PDT)
X-Gm-Message-State: AOAM533PqC7FW0F9apO+VvY32N+imGt4/eCRKL3/P3ADinNDmB59vGnX
        kILQAN7WtF3MbOK2DIeRAaEnBhyYfqYMGzNbq6g=
X-Google-Smtp-Source: ABdhPJz2qhthuFoFNG4F2I+EHUQH4Qe8BIJ2ZWE72T4SO8H6UduQHBh9aqiZepbwZau2BYWUFIYrMocg239BQNaJVrc=
X-Received: by 2002:ae9:f106:: with SMTP id k6mr17041488qkg.3.1598521710483;
 Thu, 27 Aug 2020 02:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvUwH2FA9GOeA_7GYpLA31uOmEpg32VKnJ8-d5QSK4PdQ@mail.gmail.com>
 <20200827090813.fjugeqbb47fachy7@vireshk-i7>
In-Reply-To: <20200827090813.fjugeqbb47fachy7@vireshk-i7>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 27 Aug 2020 11:48:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2zxybiMDzHXkTsT=VpHJOLkwd1=YTtCNU04vuMjZLkxA@mail.gmail.com>
Message-ID: <CAK8P3a2zxybiMDzHXkTsT=VpHJOLkwd1=YTtCNU04vuMjZLkxA@mail.gmail.com>
Subject: Re: Kernel panic : Unable to handle kernel paging request at virtual
 address - dead address between user and kernel address ranges
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        lkft-triage@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        madhuparnabhowmik10@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fwlx/IMYYiXA3qvzMsnEDzN1plCrqtL40GLEAVXgbA2abererWp
 l1HtCMtPv6r4WYvtn/lkTMP/VBUk8FJ6N7pqXUC7yxzrDgR6zxYOX2a7x0etPNfry//JOQK
 8MiRqaMQBInHBpcZPc0Aq9sqI6VpaLpu7TRWrgXBDWffL8PqI1kXI0c6m0NqAnluVuyvpDh
 a9+Pz7uJqJuYTXuhMPerg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:voSHDp8wyfM=:9j3PFFzCV532iDAx6MQsHT
 MLh0ZLXpRuyMCLtlNOSO2oNlPehRJPQzx8bfKLUgcLUn7g2FfK4IhkTIQtpI2ed4KbCWSbsTI
 fPVbGy9QA8d7EQ0HpYXUbLoAdu+hTy4bmetLU7HHBtRdcQeMe7vLjfQPPfrufxTH7IES1d6C7
 nXSHfmvn+i7e1/p+f2yfz6AhzUowu5ptAcrw/rqglhwi1wlfZw88hO/+ec8LE6zkJSAwQtPwj
 epW8QbqePDs95NdjvZg5r00bUwJPEbIF2+LkOoFjODTFXKMfvGD9WqVMt/ddeqDOCZWtuPLc/
 HTLmtYU/QiwGQiDRKPMQyATf2eKg2QaAZ/ZFoVnVPejTR1jYh2ZpFS+pQzjhFGcqy+jfHCz/1
 pUezpMKKG+Cmn66GaUXSnLquLT13rejSqcYLJzPcGSMb7/hJ521oB4QXgqiHYToHPrIYGc5BR
 YG9LUaBZC0RuqUG80mnOuEuJpsCyrwbRpbruF2e84PCwo87yYwmOrX5QivYnEp2sTvilW74LJ
 MJxZfzfcsoqhiOBwjcUg2feZ6Pd84lvnyXnQf0ZCiHAyRgsg3e66gOdtVLNpmZW/xNIlXyD2b
 B1ueYH0nbt2Ba7DodeSs26cwBbmiM3WbE/Ct+arljPSpwOvlukEnuE0DexGicroJvNJCKRIbB
 9/bS6Q9Digc63Q268lCMZWabjS3zlBhXHX8w30Hizk4MWwD9DxaaPCtgNvPJ1bgtxCRJD7LFV
 IA7BJe22fUN/notHUG49QmEkDkIxD7/Ybi6r/mUN7JUCOAeHdxj/jRpPjXdfekM9b9tCRcbdn
 Ig/MZ6eIr7+QGFXeFI3lV5g07DRz7hTI2sXuNdoETbwmvhGIaJ/iQKK68h3vzH+Y2S7EubC
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 27, 2020 at 11:08 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> +Rajendra
>
> On 27-08-20, 14:02, Naresh Kamboju wrote:
> > arm64 dragonboard db410c boot failed while running linux next 20200827 kernel.
> >
> > metadata:
> >   git branch: master
> >   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >   git commit: 88abac0b753dfdd85362a26d2da8277cb1e0842b
> >   git describe: next-20200827
> >   make_kernelversion: 5.9.0-rc2
> >   kernel-config:
> > https://builds.tuxbuild.com/vThV35pOF_GMlWdiTs3Bdw/kernel.config
> >
> > Boot log,
> >
> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
> > [    0.000000] Linux version 5.9.0-rc2-next-20200827
> > (TuxBuild@12963d21faa5) (aarch64-linux-gnu-gcc (Debian 9.3.0-8) 9.3.0,
> > GNU ld (GNU Binutils for Debian) 2.34) #1 SMP PREEMPT Thu Aug 27
> > 05:19:00 UTC 2020
> > [    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
> > [    0.000000] efi: UEFI not found.
> > [    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please
> > fix your bootloader!
> > <trmi>
> > [    3.451425] i2c_qup 78ba000.i2c: using default clock-frequency 100000
> > [    3.451491] i2c_qup 78ba000.i2c:
> > [    3.451491]  tx channel not available
> > [    3.493455] sdhci: Secure Digital Host Controller Interface driver
> > [    3.493508] sdhci: Copyright(c) Pierre Ossman
> > [    3.500902] Synopsys Designware Multimedia Card Interface Driver
> > [    3.507441] sdhci-pltfm: SDHCI platform and OF driver helper
> > [    3.514308] Unable to handle kernel paging request at virtual
> > address dead000000000108

This is where the address comes from:

#define POISON_POINTER_DELTA _AC(CONFIG_ILLEGAL_POINTER_VALUE, UL)
#define LIST_POISON1  ((void *) 0x100 + POISON_POINTER_DELTA)

static inline void hlist_del(struct hlist_node *n)
{
        __hlist_del(n);
        n->next = LIST_POISON1;
        n->pprev = LIST_POISON2;
}

> > [    3.514695] Mem abort info:
> > [    3.522421]   ESR = 0x96000044
> > [    3.525096]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [    3.528236]   SET = 0, FnV = 0
> > [    3.533703]   EA = 0, S1PTW = 0
> > [    3.536561] Data abort info:
> > [    3.539601]   ISV = 0, ISS = 0x00000044
> > [    3.542727]   CM = 0, WnR = 1
> > [    3.546287] [dead000000000108] address between user and kernel address ranges
> > [    3.549414] Internal error: Oops: 96000044 [#1] PREEMPT SMP
> > [    3.556520] Modules linked in:
> > [    3.561901] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> > 5.9.0-rc2-next-20200827 #1
> > [    3.565034] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > [    3.572584] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
> > [    3.579271] pc : __clk_put+0x40/0x140
> > [    3.584556] lr : __clk_put+0x2c/0x140

Fairly sure this is from the hlist_del(), meaning we try to remove the
same list object a second time, after it was already removed.

> > [    3.588373] sp : ffff80001002bb00
> > [    3.592016] x29: ffff80001002bb00 x28: 000000000000002e
> > [    3.595320] x27: ffff000009f7ba68 x26: ffff80001146d878
> > [    3.600703] x25: ffff00003fcfd8f8 x24: ffff00003d0bc410
> > [    3.605999] x23: ffff80001146d0e0 x22: ffff000009f7ba40
> > [    3.611293] x21: ffff00003d0bc400 x20: ffff000009f7b580
> > [    3.616588] x19: ffff00003bccc780 x18: 0000000007824000
> > [    3.621883] x17: ffff000009f7ba00 x16: ffff000009f7b5d0
> > [    3.627177] x15: ffff800011966cf8 x14: ffffffffffffffff
> > [    3.632472] x13: ffff800012917000 x12: ffff800012917000
> > [    3.637769] x11: 0000000000000020 x10: 0101010101010101
> > [    3.643063] x9 : ffff8000107a984c x8 : 7f7f7f7f7f7f7f7f
> > [    3.648358] x7 : ffff000009fd8000 x6 : ffff80001237a000
> > [    3.653653] x5 : 0000000000000000 x4 : ffff000009fd8000
> > [    3.658949] x3 : ffff8000124e6768 x2 : ffff000009fd8000
> > [    3.664243] x1 : ffff00003bccca80 x0 : dead000000000100
> > [    3.669539] Call trace:
> > [    3.674830]  __clk_put+0x40/0x140
> > [    3.677003]  clk_put+0x18/0x28
> > [    3.680477]  dev_pm_opp_put_clkname+0x30/0x58
> > [    3.683431]  sdhci_msm_probe+0x284/0x9a0

dev_pm_opp_put_clkname() is part of the error handling in the
probe function, so I would deduct there are two problems:

- something failed during the probe and the driver is trying
  to unwind
- the error handling it self is buggy and tries to undo something
  again that has already been undone.

> > [    3.687857]  platform_drv_probe+0x5c/0xb0
> > [    3.691847]  really_probe+0xf0/0x4d8
> > [    3.695753]  driver_probe_device+0xfc/0x168
> > [    3.699399]  device_driver_attach+0x7c/0x88
> > [    3.703306]  __driver_attach+0xac/0x178
> > [    3.707472]  bus_for_each_dev+0x78/0xc8
> > [    3.711291]  driver_attach+0x2c/0x38
> > [    3.715110]  bus_add_driver+0x14c/0x230
> > [    3.718929]  driver_register+0x6c/0x128
> > [    3.722489]  __platform_driver_register+0x50/0x60
> > [    3.726312]  sdhci_msm_driver_init+0x24/0x30
> > [    3.731173]  do_one_initcall+0x4c/0x2c0
> > [    3.735511]  kernel_init_freeable+0x21c/0x284
> > [    3.739072]  kernel_init+0x1c/0x120
> > [    3.743582]  ret_from_fork+0x10/0x30
> > [    3.746885] Code: 35000720 a9438660 f9000020 b4000040 (f9000401)
> > [    3.750720] ---[ end trace a8d4100497387a2e ]---
> > [    3.756736] Kernel panic - not syncing: Attempted to kill init!
> > exitcode=0x0000000b
> > [    3.761392] SMP: stopping secondary CPUs
> > [    3.768877] Kernel Offset: 0x80000 from 0xffff800010000000
> > [    3.772924] PHYS_OFFSET: 0x80000000
> > [    3.778216] CPU features: 0x0240002,24802005
> > [    3.781602] Memory Limit: none
> >
> > full test log,
> > https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200827/testrun/3123101/suite/linux-log-parser/test/check-kernel-oops-1714695/log

Naresh writes later:
> The reported issue is started from linux next tag next-20200825.
> BAD:  next-20200825
> GOOD:  next-20200824

This points to Viresh's
d05a7238fe1c mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()

Most likely this is not the entire problem but it uncovered a preexisting
bug.

      Arnd
