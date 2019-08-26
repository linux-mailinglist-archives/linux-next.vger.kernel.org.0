Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE759D4A5
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 19:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732912AbfHZRJL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 13:09:11 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37331 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729338AbfHZRJL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Aug 2019 13:09:11 -0400
Received: by mail-pf1-f196.google.com with SMTP id y9so11819417pfl.4
        for <linux-next@vger.kernel.org>; Mon, 26 Aug 2019 10:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version:content-transfer-encoding;
        bh=yPeEMddIi0z8KsbVoXmX4P9JjZRScu3qoYzqC8dRJtQ=;
        b=aL4eazpgspu49x5bhKNzO0ttOCOEIJSQo3jsWqBwo2CIZ5b0YXuTw84rMEeXLIyDTS
         9CsdkHCOlwsyqfDQT8RK12Bx4seoREL5VE+27nqmQbTpAWk5JrDBVEPcIwQJjeseaVxV
         F2RA8lyjbKRhkyxs2559lPjl4GDWJRY6IGHYTVtzBRjIyOzreU6+Q1UX+L3xLd4NwCB8
         /mGh9pEOqeI6lWsEh7xXx+K3cWSEHF4wL9LcDJAErjXicJz7nppR8mOeDuTixy8Ofdb9
         eXQWzi3CPV5V409yrVcmmM9IV8coOG9j5aMG6AWsCrOT3AhapKOI/gbcc5T9Fau/Loyw
         5aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=yPeEMddIi0z8KsbVoXmX4P9JjZRScu3qoYzqC8dRJtQ=;
        b=TcDr2M8M2yzgK0Pvx8Nqm8Wvpw/iQ1WSZ+XwcxEm/9voNaSo6ugmq8ajX6YNddZpkw
         cdgDv6lGZtDQ0a7S9LIfPQhkdurSYoCyfQQ5EhZLZC7QoPrI8u0TRizIaGXxs5LZPZSE
         m4Q8zmYEnSYDwDgkof7xys4GpjIEEQbIuaHQTf2+he7TpqHchpT0Wx0iizXAzOXSW1kq
         1wRQdQTRwaZN7HEULtB/QGvu+RC2pygKgzrQCUgri0nyL0/Utgfduzc3CUWZC7XagI33
         tcLGIvafWBsQWEo4d0onYyDrTg/w8IRWdVn7VhuBQFlbOdoT1Q5BIRHRIRkPLIrhCbxE
         zogA==
X-Gm-Message-State: APjAAAWVPniCsXkAfAzDcNg6zrQMXmOzd/55/1Wq2A95NSli5PwNk3nF
        L/ff9w9P4eTSAI0mZqGcgIUUxw==
X-Google-Smtp-Source: APXvYqxVp9zJ5zqqJbitmKSrHWunH37Vo1H3Mu2yAOmtWhXd2V8RC0WBZxuI0F9r1DUFJW2cz7mheg==
X-Received: by 2002:a62:754a:: with SMTP id q71mr20811624pfc.15.1566839350017;
        Mon, 26 Aug 2019 10:09:10 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:cc35:e750:308e:47f])
        by smtp.gmail.com with ESMTPSA id 22sm15757652pfv.134.2019.08.26.10.09.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 10:09:09 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Kever Yang <kever.yang@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-rockchip@lists.infradead.org, linux-next@vger.kernel.org,
        =?utf-8?B?5byg5pm0?= <elaine.zhang@rock-chips.com>,
        =?utf-8?B?6Zer5a2d?= =?utf-8?B?5Yab?= <andy.yan@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: CPUfreq fail on rk3399-firefly
In-Reply-To: <db7af16f-d8cc-fbcb-726d-2aeba5563076@rock-chips.com>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com> <20190718162005.GF5761@sirena.org.uk> <7hmugdynmk.fsf@baylibre.com> <2314814.WbdfqDVNqK@phil> <7hv9uq9wfe.fsf@baylibre.com> <c973d3fa-5f0d-c277-7c83-6227942a671a@rock-chips.com> <7hd0gvzuvw.fsf@baylibre.com> <7h8srjzuen.fsf@baylibre.com> <db7af16f-d8cc-fbcb-726d-2aeba5563076@rock-chips.com>
Date:   Mon, 26 Aug 2019 10:09:08 -0700
Message-ID: <7h4l23zwej.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Kever,

Kever Yang <kever.yang@rock-chips.com> writes:

> Hi Kevin,
>
>  =C2=A0=C2=A0=C2=A0 I want to have a test with my board, I can get the Im=
age and dtb=20
> from the link for the job,
>
> but how can I get the randisk which is named initrd-SDbyy2.cpio.gz?

The ramdisk images are here:

  https://storage.kernelci.org/images/rootfs/buildroot/kci-2019.02/arm64/ba=
se/

in the kernelCI logs the ramdisk is slightly modified because the kernel
modules have been inserted into the cpio archive.

However, for the purposes of this test, you can just test with the
unmodified rootfs.cpio.gz above.

Kevin


> Thanks,
>
> - Kever
>
> On 2019/8/24 =E4=B8=8A=E5=8D=881:03, Kevin Hilman wrote:
>> Kevin Hilman <khilman@baylibre.com> writes:
>>
>>> Kever Yang <kever.yang@rock-chips.com> writes:
>>>
>>>> Hi Kevin, Heiko,
>>>>
>>>> On 2019/8/22 =E4=B8=8A=E5=8D=882:59, Kevin Hilman wrote:
>>>>> Hi Heiko,
>>>>>
>>>>> Heiko Stuebner <heiko@sntech.de> writes:
>>>>>
>>>>>> Am Dienstag, 13. August 2019, 19:35:31 CEST schrieb Kevin Hilman:
>>>>>>> [ resent with correct addr for linux-rockchip list ]
>>>>>>>
>>>>>>> Mark Brown <broonie@kernel.org> writes:
>>>>>>>
>>>>>>>> On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:
>>>>>>>>
>>>>>>>> Today's -next started failing to boot defconfig on rk3399-firefly:
>>>>>>>>
>>>>>>>>> arm64:
>>>>>>>>>       defconfig:
>>>>>>>>>           gcc-8:
>>>>>>>>>               rk3399-firefly: 1 failed lab
>>>>>>>> It hits a BUG() trying to set up cpufreq:
>>>>>>>>
>>>>>>>> [   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted =
freq: 200000 KHz
>>>>>>>> [   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial fre=
quency changed to: 408000 KHz
>>>>>>>> [   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted =
freq: 12000 KHz
>>>>>>>> [   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set =
clock rate: -22
>>>>>>>> [   87.491881] cpufreq: __target_index: Failed to change cpu frequ=
ency: -22
>>>>>>>> [   87.495335] ------------[ cut here ]------------
>>>>>>>> [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
>>>>>>>> [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
>>>>>>>>
>>>>>>>> I'm struggling to see anything relevant in the diff from yesterday=
, the
>>>>>>>> unlisted frequency warnings were there in the logs yesterday but n=
o oops
>>>>>>>> and I'm not seeing any changes in cpufreq, clk or anything relevant
>>>>>>>> looking.
>>>>>>>>
>>>>>>>> Full bootlog and other info can be found here:
>>>>>>>>
>>>>>>>> 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/
>>>>>>> I confirm that disabling CPUfreq in the defconfig (CONFIG_CPU_FREQ=
=3Dn)
>>>>>>> makes the firefly board start working again.
>>>>>>>
>>>>>>> Note that the default defconfig enables the "performance" CPUfreq
>>>>>>> governor as the default governor, so during kernel boot, it will al=
ways
>>>>>>> switch to the max frequency.
>>>>>>>
>>>>>>> For fun, I set the default governor to "userspace" so the kernel
>>>>>>> wouldn't make any OPP changes, and that leads to a slightly more
>>>>>>> informative splat[1]
>>>>>>>
>>>>>>> There is still an OPP change happening because the detected OPP is =
not
>>>>>>> one that's listed in the table, so it tries to change to a listed O=
PP
>>>>>>> and fails in the bowels of clk_set_rate()
>>>>>> Though I think that might only be a symptom as well.
>>>>>> Both the PLL setting code as well as the actual cpu-clock implementa=
tion
>>>>>> is unchanged since 2017 (and runs just fine on all boards in my farm=
).
>>>>>>
>>>>>> One source for these issues is often the regulator supplying the cpu
>>>>>> going haywire - aka the voltage not matching the opp.
>>>>>>
>>>>>> As in this error-case it's CPU4 being set, this would mean it might
>>>>>> be the big cluster supplied by the external syr825 (fan5355 clone)
>>>>>> that might act up. In the Firefly-rk3399 case this is even stranger.
>>>>>>
>>>>>> There is a discrepancy between the "fcs,suspend-voltage-selector"
>>>>>> between different bootloader versions (how the selection-pin is set =
up),
>>>>>> so the kernel might actually write his requested voltage to the wrong
>>>>>> register (not the one for actual voltage, but the second set used for
>>>>>> the suspend voltage).
>>>>>>
>>>>>> Did you by chance swap bootloaders at some point in recent past?
>>>>> No, haven't touched bootloader since I initially setup the board.
>>>> The CPU voltage does not affect by bootloader for kernel should have i=
ts
>>>> own opp-table,
>>>>
>>>> the bootloader may only affect the center/logic power supply.
>>>>
>>>>>> I'd assume [2] might actually be the same issue last year, though
>>>>>> the CI-logs are not available anymore it seems.
>>>>>>
>>>>>> Could you try to set the vdd_cpu_b regulator to disabled, so that
>>>>>> cpufreq for this cluster defers and see what happens?
>>>>> Yes, this change[1] definitely makes things boot reliably again, so
>>>>> there's defintiely something a bit unstable with this regulator, at
>>>>> least on this firefly.
>>>> Is it possible to target which patch introduce this bug? This board
>>>> should have work correctly for a long time with upstream source code.
>>> Unfortunately, it seems to be a regular, but intermittent failure, so
>>> bisection is not producing anything reliable.
>>>
>>> You can see that both in mainline[1] and in linux-next[2] there are
>>> periodic failures, but it's hard to see any patterns.
>> Even worse, I (re)tested mainline for versions that were previously
>> passing (v5.2, v5.3-rc5) and they are also failing now.
>>
>> They work again if I disable that regulator as suggested by Heiko.
>>
>> So this is increasingly pointing to failing hardware.
>>
>> Kevin
>>
>>
>>
