Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1567B9DB68
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2019 03:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbfH0Byu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 21:54:50 -0400
Received: from regular1.263xmail.com ([211.150.70.200]:52518 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728519AbfH0Byu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Aug 2019 21:54:50 -0400
Received: from kever.yang?rock-chips.com (unknown [192.168.167.156])
        by regular1.263xmail.com (Postfix) with ESMTP id D310532F;
        Tue, 27 Aug 2019 09:54:30 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.9] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P28225T139814766622464S1566870866860190_;
        Tue, 27 Aug 2019 09:54:27 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <c6f7ffeeffe8903cd5c421165cfd4b49>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: CPUfreq fail on rk3399-firefly
To:     Kevin Hilman <khilman@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-rockchip@lists.infradead.org, linux-next@vger.kernel.org,
        =?UTF-8?B?5byg5pm0?= <elaine.zhang@rock-chips.com>,
        =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com>
 <20190718162005.GF5761@sirena.org.uk> <7hmugdynmk.fsf@baylibre.com>
 <2314814.WbdfqDVNqK@phil> <7hv9uq9wfe.fsf@baylibre.com>
 <c973d3fa-5f0d-c277-7c83-6227942a671a@rock-chips.com>
 <7hd0gvzuvw.fsf@baylibre.com> <7h8srjzuen.fsf@baylibre.com>
 <db7af16f-d8cc-fbcb-726d-2aeba5563076@rock-chips.com>
 <7h4l23zwej.fsf@baylibre.com>
From:   Kever Yang <kever.yang@rock-chips.com>
Message-ID: <852dd7d4-520b-7eb0-f307-c3fa9c0ebf2a@rock-chips.com>
Date:   Tue, 27 Aug 2019 09:54:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7h4l23zwej.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 2019/8/27 上午1:09, Kevin Hilman wrote:
> Hi Kever,
>
> Kever Yang <kever.yang@rock-chips.com> writes:
>
>> Hi Kevin,
>>
>>       I want to have a test with my board, I can get the Image and dtb
>> from the link for the job,
>>
>> but how can I get the randisk which is named initrd-SDbyy2.cpio.gz?
> The ramdisk images are here:
>
>    https://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02/arm64/base/
>
> in the kernelCI logs the ramdisk is slightly modified because the kernel
> modules have been inserted into the cpio archive.
>
> However, for the purposes of this test, you can just test with the
> unmodified rootfs.cpio.gz above.


I try with this ramdisk, and it hangs at fan53555 init, but not get into 
cpufreq.

Any suggestion?

  My boot log:

https://paste.ubuntu.com/p/WYZKPWp7sk/

Thanks,

- Kever

>
> Kevin
>
>
>> Thanks,
>>
>> - Kever
>>
>> On 2019/8/24 上午1:03, Kevin Hilman wrote:
>>> Kevin Hilman <khilman@baylibre.com> writes:
>>>
>>>> Kever Yang <kever.yang@rock-chips.com> writes:
>>>>
>>>>> Hi Kevin, Heiko,
>>>>>
>>>>> On 2019/8/22 上午2:59, Kevin Hilman wrote:
>>>>>> Hi Heiko,
>>>>>>
>>>>>> Heiko Stuebner <heiko@sntech.de> writes:
>>>>>>
>>>>>>> Am Dienstag, 13. August 2019, 19:35:31 CEST schrieb Kevin Hilman:
>>>>>>>> [ resent with correct addr for linux-rockchip list ]
>>>>>>>>
>>>>>>>> Mark Brown <broonie@kernel.org> writes:
>>>>>>>>
>>>>>>>>> On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:
>>>>>>>>>
>>>>>>>>> Today's -next started failing to boot defconfig on rk3399-firefly:
>>>>>>>>>
>>>>>>>>>> arm64:
>>>>>>>>>>        defconfig:
>>>>>>>>>>            gcc-8:
>>>>>>>>>>                rk3399-firefly: 1 failed lab
>>>>>>>>> It hits a BUG() trying to set up cpufreq:
>>>>>>>>>
>>>>>>>>> [   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 200000 KHz
>>>>>>>>> [   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 408000 KHz
>>>>>>>>> [   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 12000 KHz
>>>>>>>>> [   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set clock rate: -22
>>>>>>>>> [   87.491881] cpufreq: __target_index: Failed to change cpu frequency: -22
>>>>>>>>> [   87.495335] ------------[ cut here ]------------
>>>>>>>>> [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
>>>>>>>>> [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
>>>>>>>>>
>>>>>>>>> I'm struggling to see anything relevant in the diff from yesterday, the
>>>>>>>>> unlisted frequency warnings were there in the logs yesterday but no oops
>>>>>>>>> and I'm not seeing any changes in cpufreq, clk or anything relevant
>>>>>>>>> looking.
>>>>>>>>>
>>>>>>>>> Full bootlog and other info can be found here:
>>>>>>>>>
>>>>>>>>> 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/
>>>>>>>> I confirm that disabling CPUfreq in the defconfig (CONFIG_CPU_FREQ=n)
>>>>>>>> makes the firefly board start working again.
>>>>>>>>
>>>>>>>> Note that the default defconfig enables the "performance" CPUfreq
>>>>>>>> governor as the default governor, so during kernel boot, it will always
>>>>>>>> switch to the max frequency.
>>>>>>>>
>>>>>>>> For fun, I set the default governor to "userspace" so the kernel
>>>>>>>> wouldn't make any OPP changes, and that leads to a slightly more
>>>>>>>> informative splat[1]
>>>>>>>>
>>>>>>>> There is still an OPP change happening because the detected OPP is not
>>>>>>>> one that's listed in the table, so it tries to change to a listed OPP
>>>>>>>> and fails in the bowels of clk_set_rate()
>>>>>>> Though I think that might only be a symptom as well.
>>>>>>> Both the PLL setting code as well as the actual cpu-clock implementation
>>>>>>> is unchanged since 2017 (and runs just fine on all boards in my farm).
>>>>>>>
>>>>>>> One source for these issues is often the regulator supplying the cpu
>>>>>>> going haywire - aka the voltage not matching the opp.
>>>>>>>
>>>>>>> As in this error-case it's CPU4 being set, this would mean it might
>>>>>>> be the big cluster supplied by the external syr825 (fan5355 clone)
>>>>>>> that might act up. In the Firefly-rk3399 case this is even stranger.
>>>>>>>
>>>>>>> There is a discrepancy between the "fcs,suspend-voltage-selector"
>>>>>>> between different bootloader versions (how the selection-pin is set up),
>>>>>>> so the kernel might actually write his requested voltage to the wrong
>>>>>>> register (not the one for actual voltage, but the second set used for
>>>>>>> the suspend voltage).
>>>>>>>
>>>>>>> Did you by chance swap bootloaders at some point in recent past?
>>>>>> No, haven't touched bootloader since I initially setup the board.
>>>>> The CPU voltage does not affect by bootloader for kernel should have its
>>>>> own opp-table,
>>>>>
>>>>> the bootloader may only affect the center/logic power supply.
>>>>>
>>>>>>> I'd assume [2] might actually be the same issue last year, though
>>>>>>> the CI-logs are not available anymore it seems.
>>>>>>>
>>>>>>> Could you try to set the vdd_cpu_b regulator to disabled, so that
>>>>>>> cpufreq for this cluster defers and see what happens?
>>>>>> Yes, this change[1] definitely makes things boot reliably again, so
>>>>>> there's defintiely something a bit unstable with this regulator, at
>>>>>> least on this firefly.
>>>>> Is it possible to target which patch introduce this bug? This board
>>>>> should have work correctly for a long time with upstream source code.
>>>> Unfortunately, it seems to be a regular, but intermittent failure, so
>>>> bisection is not producing anything reliable.
>>>>
>>>> You can see that both in mainline[1] and in linux-next[2] there are
>>>> periodic failures, but it's hard to see any patterns.
>>> Even worse, I (re)tested mainline for versions that were previously
>>> passing (v5.2, v5.3-rc5) and they are also failing now.
>>>
>>> They work again if I disable that regulator as suggested by Heiko.
>>>
>>> So this is increasingly pointing to failing hardware.
>>>
>>> Kevin
>>>
>>>
>>>
>
>


