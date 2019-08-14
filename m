Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCD38CEE9
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 11:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbfHNJBf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Aug 2019 05:01:35 -0400
Received: from gloria.sntech.de ([185.11.138.130]:40044 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbfHNJBf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Aug 2019 05:01:35 -0400
Received: from wf0413.dip.tu-dresden.de ([141.76.181.157] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1hxp9u-0004Ye-Dp; Wed, 14 Aug 2019 11:01:30 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Mark Brown <broonie@kernel.org>,
        kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: CPUfreq fail on rk3399-firefly (was: next/master boot: 285 boots: 16 failed, 264 passed with 3 offline, 1 untried/unknown, 1 conflict (next-20190718))
Date:   Wed, 14 Aug 2019 11:01:29 +0200
Message-ID: <2314814.WbdfqDVNqK@phil>
In-Reply-To: <7hmugdynmk.fsf@baylibre.com>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com> <20190718162005.GF5761@sirena.org.uk> <7hmugdynmk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Am Dienstag, 13. August 2019, 19:35:31 CEST schrieb Kevin Hilman:
> [ resent with correct addr for linux-rockchip list ]
> 
> Mark Brown <broonie@kernel.org> writes:
> 
> > On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:
> >
> > Today's -next started failing to boot defconfig on rk3399-firefly:
> >
> >> arm64:
> >
> >>     defconfig:
> >>         gcc-8:
> >>             rk3399-firefly: 1 failed lab
> >
> > It hits a BUG() trying to set up cpufreq:
> >
> > [   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 200000 KHz
> > [   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 408000 KHz
> > [   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 12000 KHz
> > [   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set clock rate: -22
> > [   87.491881] cpufreq: __target_index: Failed to change cpu frequency: -22
> > [   87.495335] ------------[ cut here ]------------
> > [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
> > [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> >
> > I'm struggling to see anything relevant in the diff from yesterday, the
> > unlisted frequency warnings were there in the logs yesterday but no oops
> > and I'm not seeing any changes in cpufreq, clk or anything relevant
> > looking.
> >
> > Full bootlog and other info can be found here:
> >
> > 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/
> 
> I confirm that disabling CPUfreq in the defconfig (CONFIG_CPU_FREQ=n)
> makes the firefly board start working again.
> 
> Note that the default defconfig enables the "performance" CPUfreq
> governor as the default governor, so during kernel boot, it will always
> switch to the max frequency.
> 
> For fun, I set the default governor to "userspace" so the kernel
> wouldn't make any OPP changes, and that leads to a slightly more
> informative splat[1]
> 
> There is still an OPP change happening because the detected OPP is not
> one that's listed in the table, so it tries to change to a listed OPP
> and fails in the bowels of clk_set_rate()

Though I think that might only be a symptom as well.
Both the PLL setting code as well as the actual cpu-clock implementation
is unchanged since 2017 (and runs just fine on all boards in my farm).

One source for these issues is often the regulator supplying the cpu
going haywire - aka the voltage not matching the opp.

As in this error-case it's CPU4 being set, this would mean it might
be the big cluster supplied by the external syr825 (fan5355 clone)
that might act up. In the Firefly-rk3399 case this is even stranger.

There is a discrepancy between the "fcs,suspend-voltage-selector"
between different bootloader versions (how the selection-pin is set up),
so the kernel might actually write his requested voltage to the wrong
register (not the one for actual voltage, but the second set used for
the suspend voltage).

Did you by chance swap bootloaders at some point in recent past?

I'd assume [2] might actually be the same issue last year, though
the CI-logs are not available anymore it seems.


Could you try to set the vdd_cpu_b regulator to disabled, so that
cpufreq for this cluster defers and see what happens?

I don't really have a Firefly in my boardfarm, so I let 5.3-rc run on
a Theobroma Puma which has the same regulator setup as the Firefly
and all including the performance governor did run nicely, so it really
looks like some sort of Firefly specific issue.

Heiko

> [1] https://termbin.com/3oum

[2] https://lkml.org/lkml/2018/6/19/1167




