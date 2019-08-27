Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D38229DB91
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2019 04:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbfH0COo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 26 Aug 2019 22:14:44 -0400
Received: from gloria.sntech.de ([185.11.138.130]:56964 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfH0COo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 22:14:44 -0400
Received: from c-73-71-116-68.hsd1.ca.comcast.net ([73.71.116.68] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1i2R0H-0007W0-Ns; Tue, 27 Aug 2019 04:14:37 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Kever Yang <kever.yang@rock-chips.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        kernel-build-reports@lists.linaro.org,
        linux-rockchip@lists.infradead.org, linux-next@vger.kernel.org,
        =?utf-8?B?5byg5pm0?= <elaine.zhang@rock-chips.com>,
        =?utf-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: CPUfreq fail on rk3399-firefly
Date:   Tue, 27 Aug 2019 04:14:33 +0200
Message-ID: <8953975.ee0vQab4qn@phil>
In-Reply-To: <852dd7d4-520b-7eb0-f307-c3fa9c0ebf2a@rock-chips.com>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com> <7h4l23zwej.fsf@baylibre.com> <852dd7d4-520b-7eb0-f307-c3fa9c0ebf2a@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Kever,

Am Dienstag, 27. August 2019, 03:54:26 CEST schrieb Kever Yang:
> On 2019/8/27 上午1:09, Kevin Hilman wrote:
> > Kever Yang <kever.yang@rock-chips.com> writes:
> >>       I want to have a test with my board, I can get the Image and dtb
> >> from the link for the job,
> >>
> >> but how can I get the randisk which is named initrd-SDbyy2.cpio.gz?
> > The ramdisk images are here:
> >
> >    https://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02/arm64/base/
> >
> > in the kernelCI logs the ramdisk is slightly modified because the kernel
> > modules have been inserted into the cpio archive.
> >
> > However, for the purposes of this test, you can just test with the
> > unmodified rootfs.cpio.gz above.
> 
> 
> I try with this ramdisk, and it hangs at fan53555 init, but not get into 
> cpufreq.
> 
> Any suggestion?

My guess would be the fcs,suspend-voltage-selector maybe?

I.e. old uboots somehow set the voltage gpio strangely, so you'd need
	fcs,suspend-voltage-selector = <0>
while newer uboots I think do configure the gpio, needing a value of <1>;

So try to swap that number in the dts perhaps for a start?


Heiko


>   My boot log:
> 
> https://paste.ubuntu.com/p/WYZKPWp7sk/
> 
> Thanks,
> 
> - Kever
> 
> >
> > Kevin
> >
> >
> >> Thanks,
> >>
> >> - Kever
> >>
> >> On 2019/8/24 上午1:03, Kevin Hilman wrote:
> >>> Kevin Hilman <khilman@baylibre.com> writes:
> >>>
> >>>> Kever Yang <kever.yang@rock-chips.com> writes:
> >>>>
> >>>>> Hi Kevin, Heiko,
> >>>>>
> >>>>> On 2019/8/22 上午2:59, Kevin Hilman wrote:
> >>>>>> Hi Heiko,
> >>>>>>
> >>>>>> Heiko Stuebner <heiko@sntech.de> writes:
> >>>>>>
> >>>>>>> Am Dienstag, 13. August 2019, 19:35:31 CEST schrieb Kevin Hilman:
> >>>>>>>> [ resent with correct addr for linux-rockchip list ]
> >>>>>>>>
> >>>>>>>> Mark Brown <broonie@kernel.org> writes:
> >>>>>>>>
> >>>>>>>>> On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:
> >>>>>>>>>
> >>>>>>>>> Today's -next started failing to boot defconfig on rk3399-firefly:
> >>>>>>>>>
> >>>>>>>>>> arm64:
> >>>>>>>>>>        defconfig:
> >>>>>>>>>>            gcc-8:
> >>>>>>>>>>                rk3399-firefly: 1 failed lab
> >>>>>>>>> It hits a BUG() trying to set up cpufreq:
> >>>>>>>>>
> >>>>>>>>> [   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 200000 KHz
> >>>>>>>>> [   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 408000 KHz
> >>>>>>>>> [   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 12000 KHz
> >>>>>>>>> [   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set clock rate: -22
> >>>>>>>>> [   87.491881] cpufreq: __target_index: Failed to change cpu frequency: -22
> >>>>>>>>> [   87.495335] ------------[ cut here ]------------
> >>>>>>>>> [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
> >>>>>>>>> [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> >>>>>>>>>
> >>>>>>>>> I'm struggling to see anything relevant in the diff from yesterday, the
> >>>>>>>>> unlisted frequency warnings were there in the logs yesterday but no oops
> >>>>>>>>> and I'm not seeing any changes in cpufreq, clk or anything relevant
> >>>>>>>>> looking.
> >>>>>>>>>
> >>>>>>>>> Full bootlog and other info can be found here:
> >>>>>>>>>
> >>>>>>>>> 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/
> >>>>>>>> I confirm that disabling CPUfreq in the defconfig (CONFIG_CPU_FREQ=n)
> >>>>>>>> makes the firefly board start working again.
> >>>>>>>>
> >>>>>>>> Note that the default defconfig enables the "performance" CPUfreq
> >>>>>>>> governor as the default governor, so during kernel boot, it will always
> >>>>>>>> switch to the max frequency.
> >>>>>>>>
> >>>>>>>> For fun, I set the default governor to "userspace" so the kernel
> >>>>>>>> wouldn't make any OPP changes, and that leads to a slightly more
> >>>>>>>> informative splat[1]
> >>>>>>>>
> >>>>>>>> There is still an OPP change happening because the detected OPP is not
> >>>>>>>> one that's listed in the table, so it tries to change to a listed OPP
> >>>>>>>> and fails in the bowels of clk_set_rate()
> >>>>>>> Though I think that might only be a symptom as well.
> >>>>>>> Both the PLL setting code as well as the actual cpu-clock implementation
> >>>>>>> is unchanged since 2017 (and runs just fine on all boards in my farm).
> >>>>>>>
> >>>>>>> One source for these issues is often the regulator supplying the cpu
> >>>>>>> going haywire - aka the voltage not matching the opp.
> >>>>>>>
> >>>>>>> As in this error-case it's CPU4 being set, this would mean it might
> >>>>>>> be the big cluster supplied by the external syr825 (fan5355 clone)
> >>>>>>> that might act up. In the Firefly-rk3399 case this is even stranger.
> >>>>>>>
> >>>>>>> There is a discrepancy between the "fcs,suspend-voltage-selector"
> >>>>>>> between different bootloader versions (how the selection-pin is set up),
> >>>>>>> so the kernel might actually write his requested voltage to the wrong
> >>>>>>> register (not the one for actual voltage, but the second set used for
> >>>>>>> the suspend voltage).
> >>>>>>>
> >>>>>>> Did you by chance swap bootloaders at some point in recent past?
> >>>>>> No, haven't touched bootloader since I initially setup the board.
> >>>>> The CPU voltage does not affect by bootloader for kernel should have its
> >>>>> own opp-table,
> >>>>>
> >>>>> the bootloader may only affect the center/logic power supply.
> >>>>>
> >>>>>>> I'd assume [2] might actually be the same issue last year, though
> >>>>>>> the CI-logs are not available anymore it seems.
> >>>>>>>
> >>>>>>> Could you try to set the vdd_cpu_b regulator to disabled, so that
> >>>>>>> cpufreq for this cluster defers and see what happens?
> >>>>>> Yes, this change[1] definitely makes things boot reliably again, so
> >>>>>> there's defintiely something a bit unstable with this regulator, at
> >>>>>> least on this firefly.
> >>>>> Is it possible to target which patch introduce this bug? This board
> >>>>> should have work correctly for a long time with upstream source code.
> >>>> Unfortunately, it seems to be a regular, but intermittent failure, so
> >>>> bisection is not producing anything reliable.
> >>>>
> >>>> You can see that both in mainline[1] and in linux-next[2] there are
> >>>> periodic failures, but it's hard to see any patterns.
> >>> Even worse, I (re)tested mainline for versions that were previously
> >>> passing (v5.2, v5.3-rc5) and they are also failing now.
> >>>
> >>> They work again if I disable that regulator as suggested by Heiko.
> >>>
> >>> So this is increasingly pointing to failing hardware.
> >>>
> >>> Kevin
> >>>
> >>>
> >>>
> >
> >
> 
> 
> 




