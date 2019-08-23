Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05A2B9A45A
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2019 02:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732115AbfHWAkF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 20:40:05 -0400
Received: from regular1.263xmail.com ([211.150.70.203]:35970 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732102AbfHWAkF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Aug 2019 20:40:05 -0400
X-Greylist: delayed 451 seconds by postgrey-1.27 at vger.kernel.org; Thu, 22 Aug 2019 20:40:02 EDT
Received: from kever.yang?rock-chips.com (unknown [192.168.167.242])
        by regular1.263xmail.com (Postfix) with ESMTP id 2A9103B7;
        Fri, 23 Aug 2019 08:32:24 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.9] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P30028T140715568903936S1566520342108067_;
        Fri, 23 Aug 2019 08:32:23 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f55e1e1282680506dd7004fdda20f569>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: zhangqing@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: CPUfreq fail on rk3399-firefly
To:     Kevin Hilman <khilman@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-rockchip@lists.infradead.org,
        Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-build-reports@lists.linaro.org,
        =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
        =?UTF-8?B?5byg5pm0?= <elaine.zhang@rock-chips.com>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com>
 <20190718162005.GF5761@sirena.org.uk> <7hmugdynmk.fsf@baylibre.com>
 <2314814.WbdfqDVNqK@phil> <7hv9uq9wfe.fsf@baylibre.com>
From:   Kever Yang <kever.yang@rock-chips.com>
Message-ID: <c973d3fa-5f0d-c277-7c83-6227942a671a@rock-chips.com>
Date:   Fri, 23 Aug 2019 08:32:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7hv9uq9wfe.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Kevin, Heiko,

On 2019/8/22 上午2:59, Kevin Hilman wrote:
> Hi Heiko,
>
> Heiko Stuebner <heiko@sntech.de> writes:
>
>> Am Dienstag, 13. August 2019, 19:35:31 CEST schrieb Kevin Hilman:
>>> [ resent with correct addr for linux-rockchip list ]
>>>
>>> Mark Brown <broonie@kernel.org> writes:
>>>
>>>> On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:
>>>>
>>>> Today's -next started failing to boot defconfig on rk3399-firefly:
>>>>
>>>>> arm64:
>>>>>      defconfig:
>>>>>          gcc-8:
>>>>>              rk3399-firefly: 1 failed lab
>>>> It hits a BUG() trying to set up cpufreq:
>>>>
>>>> [   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 200000 KHz
>>>> [   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 408000 KHz
>>>> [   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 12000 KHz
>>>> [   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set clock rate: -22
>>>> [   87.491881] cpufreq: __target_index: Failed to change cpu frequency: -22
>>>> [   87.495335] ------------[ cut here ]------------
>>>> [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
>>>> [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
>>>>
>>>> I'm struggling to see anything relevant in the diff from yesterday, the
>>>> unlisted frequency warnings were there in the logs yesterday but no oops
>>>> and I'm not seeing any changes in cpufreq, clk or anything relevant
>>>> looking.
>>>>
>>>> Full bootlog and other info can be found here:
>>>>
>>>> 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/
>>> I confirm that disabling CPUfreq in the defconfig (CONFIG_CPU_FREQ=n)
>>> makes the firefly board start working again.
>>>
>>> Note that the default defconfig enables the "performance" CPUfreq
>>> governor as the default governor, so during kernel boot, it will always
>>> switch to the max frequency.
>>>
>>> For fun, I set the default governor to "userspace" so the kernel
>>> wouldn't make any OPP changes, and that leads to a slightly more
>>> informative splat[1]
>>>
>>> There is still an OPP change happening because the detected OPP is not
>>> one that's listed in the table, so it tries to change to a listed OPP
>>> and fails in the bowels of clk_set_rate()
>> Though I think that might only be a symptom as well.
>> Both the PLL setting code as well as the actual cpu-clock implementation
>> is unchanged since 2017 (and runs just fine on all boards in my farm).
>>
>> One source for these issues is often the regulator supplying the cpu
>> going haywire - aka the voltage not matching the opp.
>>
>> As in this error-case it's CPU4 being set, this would mean it might
>> be the big cluster supplied by the external syr825 (fan5355 clone)
>> that might act up. In the Firefly-rk3399 case this is even stranger.
>>
>> There is a discrepancy between the "fcs,suspend-voltage-selector"
>> between different bootloader versions (how the selection-pin is set up),
>> so the kernel might actually write his requested voltage to the wrong
>> register (not the one for actual voltage, but the second set used for
>> the suspend voltage).
>>
>> Did you by chance swap bootloaders at some point in recent past?
> No, haven't touched bootloader since I initially setup the board.

The CPU voltage does not affect by bootloader for kernel should have its 
own opp-table,

the bootloader may only affect the center/logic power supply.

>
>> I'd assume [2] might actually be the same issue last year, though
>> the CI-logs are not available anymore it seems.
>>
>> Could you try to set the vdd_cpu_b regulator to disabled, so that
>> cpufreq for this cluster defers and see what happens?
> Yes, this change[1] definitely makes things boot reliably again, so
> there's defintiely something a bit unstable with this regulator, at
> least on this firefly.


Is it possible to target which patch introduce this bug? This board  
should have work correctly

for a long time with upstream source code.


Thanks,

- Kever

>
> Kevin
>
> [1]
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> index c706db0ee9ec..6b70bdcc3328 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> @@ -454,6 +454,7 @@
>   
>   	vdd_cpu_b: regulator@40 {
>   		compatible = "silergy,syr827";
> +		status = "disabled";
>   		reg = <0x40>;
>   		fcs,suspend-voltage-selector = <0>;
>   		regulator-name = "vdd_cpu_b";
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>
>


