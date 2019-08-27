Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEFC79E514
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2019 11:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfH0J7y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Aug 2019 05:59:54 -0400
Received: from regular1.263xmail.com ([211.150.70.199]:37140 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfH0J7y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Aug 2019 05:59:54 -0400
Received: from kever.yang?rock-chips.com (unknown [192.168.167.227])
        by regular1.263xmail.com (Postfix) with ESMTP id 658E1394;
        Tue, 27 Aug 2019 17:59:44 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [192.168.60.65] (unknown [103.29.142.67])
        by smtp.263.net (postfix) whith ESMTP id P22011T139986332600064S1566899977823430_;
        Tue, 27 Aug 2019 17:59:43 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <479e90231fda7d7f7efe8bfafc1c7fbb>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 103.29.142.67
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: CPUfreq fail on rk3399-firefly
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        kernel-build-reports@lists.linaro.org,
        linux-rockchip@lists.infradead.org, linux-next@vger.kernel.org,
        =?UTF-8?B?5byg5pm0?= <elaine.zhang@rock-chips.com>,
        =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com>
 <7h4l23zwej.fsf@baylibre.com>
 <852dd7d4-520b-7eb0-f307-c3fa9c0ebf2a@rock-chips.com>
 <8953975.ee0vQab4qn@phil>
From:   Kever Yang <kever.yang@rock-chips.com>
Message-ID: <8612fed9-53a9-c6bf-0d39-bb70589c2a44@rock-chips.com>
Date:   Tue, 27 Aug 2019 17:59:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8953975.ee0vQab4qn@phil>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Heiko,

On 2019/8/27 上午10:14, Heiko Stuebner wrote:
> Hi Kever,
>
> Am Dienstag, 27. August 2019, 03:54:26 CEST schrieb Kever Yang:
>> On 2019/8/27 上午1:09, Kevin Hilman wrote:
>>> Kever Yang <kever.yang@rock-chips.com> writes:
>>>>        I want to have a test with my board, I can get the Image and dtb
>>>> from the link for the job,
>>>>
>>>> but how can I get the randisk which is named initrd-SDbyy2.cpio.gz?
>>> The ramdisk images are here:
>>>
>>>     https://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02/arm64/base/
>>>
>>> in the kernelCI logs the ramdisk is slightly modified because the kernel
>>> modules have been inserted into the cpio archive.
>>>
>>> However, for the purposes of this test, you can just test with the
>>> unmodified rootfs.cpio.gz above.
>>
>> I try with this ramdisk, and it hangs at fan53555 init, but not get into
>> cpufreq.
>>
>> Any suggestion?
> My guess would be the fcs,suspend-voltage-selector maybe?
>
> I.e. old uboots somehow set the voltage gpio strangely, so you'd need
> 	fcs,suspend-voltage-selector = <0>


Both U-Boot and Kernel dts are still '<0>' for this property, and this 
is correct setting for cpu_b;

> while newer uboots I think do configure the gpio, needing a value of <1>;


There is no 'vsel-gpio' in both upstream U-Boot and kernel dts, while 
there is a "vsel-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;"

in rockchip kernel 4.4 dts. so I think there is no gpio setting on 
upstream code?

And kernelci's test case, does not update the bootloader, only update 
kernel.


Thanks,

- Kever

>
> So try to swap that number in the dts perhaps for a start?
>
>
> Heiko
>
>
>>    My boot log:
>>
>> https://paste.ubuntu.com/p/WYZKPWp7sk/
>>
>> Thanks,
>>
>> - Kever
>>
>>> Kevin
>>>
>>>
>>>> Thanks,
>>>>
>>>> - Kever
>>>>
>>>> On 2019/8/24 上午1:03, Kevin Hilman wrote:
>>>>> Kevin Hilman <khilman@baylibre.com> writes:
>>>>>
>>>>>> Kever Yang <kever.yang@rock-chips.com> writes:
>>>>>>
>>>>>>> Hi Kevin, Heiko,
>>>>>>>
>>>>>>> On 2019/8/22 上午2:59, Kevin Hilman wrote:
>>>>>>>> Hi Heiko,
>>>>>>>>
>>>>>>>> Heiko Stuebner <heiko@sntech.de> writes:
>>>>>>>>
>>>>>>>>> Am Dienstag, 13. August 2019, 19:35:31 CEST schrieb Kevin Hilman:
>>>>>>>>>> [ resent with correct addr for linux-rockchip list ]
>>>>>>>>>>
>>>>>>>>>> Mark Brown <broonie@kernel.org> writes:
>>>>>>>>>>
>>>>>>>>>>> On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:
>>>>>>>>>>>
>>>>>>>>>>> Today's -next started failing to boot defconfig on rk3399-firefly:
>>>>>>>>>>>
>>>>>>>>>>>> arm64:
>>>>>>>>>>>>         defconfig:
>>>>>>>>>>>>             gcc-8:
>>>>>>>>>>>>                 rk3399-firefly: 1 failed lab
>>>>>>>>>>> It hits a BUG() trying to set up cpufreq:
>>>>>>>>>>>
>>>>>>>>>>> [   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 200000 KHz
>>>>>>>>>>> [   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 408000 KHz
>>>>>>>>>>> [   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 12000 KHz
>>>>>>>>>>> [   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set clock rate: -22
>>>>>>>>>>> [   87.491881] cpufreq: __target_index: Failed to change cpu frequency: -22
>>>>>>>>>>> [   87.495335] ------------[ cut here ]------------
>>>>>>>>>>> [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
>>>>>>>>>>> [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
>>>>>>>>>>>
>>>>>>>>>>> I'm struggling to see anything relevant in the diff from yesterday, the
>>>>>>>>>>> unlisted frequency warnings were there in the logs yesterday but no oops
>>>>>>>>>>> and I'm not seeing any changes in cpufreq, clk or anything relevant
>>>>>>>>>>> looking.
>>>>>>>>>>>
>>>>>>>>>>> Full bootlog and other info can be found here:
>>>>>>>>>>>
>>>>>>>>>>> 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/
>>>>>>>>>> I confirm that disabling CPUfreq in the defconfig (CONFIG_CPU_FREQ=n)
>>>>>>>>>> makes the firefly board start working again.
>>>>>>>>>>
>>>>>>>>>> Note that the default defconfig enables the "performance" CPUfreq
>>>>>>>>>> governor as the default governor, so during kernel boot, it will always
>>>>>>>>>> switch to the max frequency.
>>>>>>>>>>
>>>>>>>>>> For fun, I set the default governor to "userspace" so the kernel
>>>>>>>>>> wouldn't make any OPP changes, and that leads to a slightly more
>>>>>>>>>> informative splat[1]
>>>>>>>>>>
>>>>>>>>>> There is still an OPP change happening because the detected OPP is not
>>>>>>>>>> one that's listed in the table, so it tries to change to a listed OPP
>>>>>>>>>> and fails in the bowels of clk_set_rate()
>>>>>>>>> Though I think that might only be a symptom as well.
>>>>>>>>> Both the PLL setting code as well as the actual cpu-clock implementation
>>>>>>>>> is unchanged since 2017 (and runs just fine on all boards in my farm).
>>>>>>>>>
>>>>>>>>> One source for these issues is often the regulator supplying the cpu
>>>>>>>>> going haywire - aka the voltage not matching the opp.
>>>>>>>>>
>>>>>>>>> As in this error-case it's CPU4 being set, this would mean it might
>>>>>>>>> be the big cluster supplied by the external syr825 (fan5355 clone)
>>>>>>>>> that might act up. In the Firefly-rk3399 case this is even stranger.
>>>>>>>>>
>>>>>>>>> There is a discrepancy between the "fcs,suspend-voltage-selector"
>>>>>>>>> between different bootloader versions (how the selection-pin is set up),
>>>>>>>>> so the kernel might actually write his requested voltage to the wrong
>>>>>>>>> register (not the one for actual voltage, but the second set used for
>>>>>>>>> the suspend voltage).
>>>>>>>>>
>>>>>>>>> Did you by chance swap bootloaders at some point in recent past?
>>>>>>>> No, haven't touched bootloader since I initially setup the board.
>>>>>>> The CPU voltage does not affect by bootloader for kernel should have its
>>>>>>> own opp-table,
>>>>>>>
>>>>>>> the bootloader may only affect the center/logic power supply.
>>>>>>>
>>>>>>>>> I'd assume [2] might actually be the same issue last year, though
>>>>>>>>> the CI-logs are not available anymore it seems.
>>>>>>>>>
>>>>>>>>> Could you try to set the vdd_cpu_b regulator to disabled, so that
>>>>>>>>> cpufreq for this cluster defers and see what happens?
>>>>>>>> Yes, this change[1] definitely makes things boot reliably again, so
>>>>>>>> there's defintiely something a bit unstable with this regulator, at
>>>>>>>> least on this firefly.
>>>>>>> Is it possible to target which patch introduce this bug? This board
>>>>>>> should have work correctly for a long time with upstream source code.
>>>>>> Unfortunately, it seems to be a regular, but intermittent failure, so
>>>>>> bisection is not producing anything reliable.
>>>>>>
>>>>>> You can see that both in mainline[1] and in linux-next[2] there are
>>>>>> periodic failures, but it's hard to see any patterns.
>>>>> Even worse, I (re)tested mainline for versions that were previously
>>>>> passing (v5.2, v5.3-rc5) and they are also failing now.
>>>>>
>>>>> They work again if I disable that regulator as suggested by Heiko.
>>>>>
>>>>> So this is increasingly pointing to failing hardware.
>>>>>
>>>>> Kevin
>>>>>
>>>>>
>>>>>
>>>
>>
>>
>
>
>
>
>


