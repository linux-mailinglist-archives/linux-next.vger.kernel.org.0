Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0829B504
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2019 19:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfHWRDP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Aug 2019 13:03:15 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35899 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbfHWRDP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Aug 2019 13:03:15 -0400
Received: by mail-pg1-f196.google.com with SMTP id l21so6089623pgm.3
        for <linux-next@vger.kernel.org>; Fri, 23 Aug 2019 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version:content-transfer-encoding;
        bh=xzzMf3cNhyldWlrimtAsqo8fKrY0W548A06xyx+iH1E=;
        b=PaGcYhXzTdI92hXsXzYVTfXjnnhy2GyUs91u6zhR1/ou4HbRhbWUv4z6jLMmNzfPPG
         Sa12lmhBMC4XEYl9vY1Qa9fYyJZbPCDJj+wX0WLl1jd7pByMR7gW2wAZo/d+upbIBcPW
         RWwhFvvTdCh2tHaG9C9UyxQOrFSdMFfLdMbjirCu2egKCvSjmhd7X10ePHm8lL1ciMkP
         dlWiA/WkZmOzkR8VnTLfUjCPJP46M3xniQn7kEgcThBDlkvqr2ugX0yX0CENIW5U/rpO
         GDf1+MoLgtoMbAJg64SV/Sx2s2VYjmYeL7sPQniFO8HqNy3Ho15Q7LkPwkwAyBlTa05l
         fEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=xzzMf3cNhyldWlrimtAsqo8fKrY0W548A06xyx+iH1E=;
        b=l+xwh+JzPnVWJ6cbepWlypjXyZ41T2MYWkUjUWGxEPVlxa4TEu/HhKRY7LQMyzuMGX
         lYh2nifA4ya5v3lAxU8+pKdc+uDdapp4kjsQBhfpyxQuj63Zg0JGBz8uDl33wsxtGRNI
         sWFyM2Ru8BDVTnyvULxoZbOYHDUeL1NIf6hm5/IN/dW/wrUtOGT956Cv9gvhORWjG13p
         VQAxYiBmR2r7qmdeIiEzowUP+r1pMv72uhaevgLIClVXn8AqI9Ldrj74djZJklKpbd1g
         1OOKnEwZYd2pwSJZRHz1wEn+Up+2I03uO3ORhMUGljT8kFp4+nOAM9cW23ZHWc9OjbX9
         cTlw==
X-Gm-Message-State: APjAAAU0gafz1MpZaD5os6J4A2fuprpC8Y3SfnxOluRWlmPMTEzxuNdQ
        b1Dqw62VikiULncRH2GqW6LESkkmuho=
X-Google-Smtp-Source: APXvYqxFd+POg93iuUyEhapgDp8fxNKrivCuW3o3cXew6gsbcWrNuE13xTPUDZV7qDkGFFMGnsL5vw==
X-Received: by 2002:a17:90a:f0c9:: with SMTP id fa9mr4466806pjb.137.1566579794113;
        Fri, 23 Aug 2019 10:03:14 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:89d4:68d1:fc04:721])
        by smtp.gmail.com with ESMTPSA id v22sm2395885pgk.69.2019.08.23.10.03.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:03:13 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Kever Yang <kever.yang@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-rockchip@lists.infradead.org, linux-next@vger.kernel.org,
        =?utf-8?B?5byg5pm0?= <elaine.zhang@rock-chips.com>,
        =?utf-8?B?6Zer5a2d?= =?utf-8?B?5Yab?= <andy.yan@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: CPUfreq fail on rk3399-firefly
In-Reply-To: <7hd0gvzuvw.fsf@baylibre.com>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com> <20190718162005.GF5761@sirena.org.uk> <7hmugdynmk.fsf@baylibre.com> <2314814.WbdfqDVNqK@phil> <7hv9uq9wfe.fsf@baylibre.com> <c973d3fa-5f0d-c277-7c83-6227942a671a@rock-chips.com> <7hd0gvzuvw.fsf@baylibre.com>
Date:   Fri, 23 Aug 2019 10:03:12 -0700
Message-ID: <7h8srjzuen.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Kevin Hilman <khilman@baylibre.com> writes:

> Kever Yang <kever.yang@rock-chips.com> writes:
>
>> Hi Kevin, Heiko,
>>
>> On 2019/8/22 =E4=B8=8A=E5=8D=882:59, Kevin Hilman wrote:
>>> Hi Heiko,
>>>
>>> Heiko Stuebner <heiko@sntech.de> writes:
>>>
>>>> Am Dienstag, 13. August 2019, 19:35:31 CEST schrieb Kevin Hilman:
>>>>> [ resent with correct addr for linux-rockchip list ]
>>>>>
>>>>> Mark Brown <broonie@kernel.org> writes:
>>>>>
>>>>>> On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:
>>>>>>
>>>>>> Today's -next started failing to boot defconfig on rk3399-firefly:
>>>>>>
>>>>>>> arm64:
>>>>>>>      defconfig:
>>>>>>>          gcc-8:
>>>>>>>              rk3399-firefly: 1 failed lab
>>>>>> It hits a BUG() trying to set up cpufreq:
>>>>>>
>>>>>> [   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted fr=
eq: 200000 KHz
>>>>>> [   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial frequ=
ency changed to: 408000 KHz
>>>>>> [   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted fr=
eq: 12000 KHz
>>>>>> [   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set cl=
ock rate: -22
>>>>>> [   87.491881] cpufreq: __target_index: Failed to change cpu frequen=
cy: -22
>>>>>> [   87.495335] ------------[ cut here ]------------
>>>>>> [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
>>>>>> [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
>>>>>>
>>>>>> I'm struggling to see anything relevant in the diff from yesterday, =
the
>>>>>> unlisted frequency warnings were there in the logs yesterday but no =
oops
>>>>>> and I'm not seeing any changes in cpufreq, clk or anything relevant
>>>>>> looking.
>>>>>>
>>>>>> Full bootlog and other info can be found here:
>>>>>>
>>>>>> 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/
>>>>> I confirm that disabling CPUfreq in the defconfig (CONFIG_CPU_FREQ=3D=
n)
>>>>> makes the firefly board start working again.
>>>>>
>>>>> Note that the default defconfig enables the "performance" CPUfreq
>>>>> governor as the default governor, so during kernel boot, it will alwa=
ys
>>>>> switch to the max frequency.
>>>>>
>>>>> For fun, I set the default governor to "userspace" so the kernel
>>>>> wouldn't make any OPP changes, and that leads to a slightly more
>>>>> informative splat[1]
>>>>>
>>>>> There is still an OPP change happening because the detected OPP is not
>>>>> one that's listed in the table, so it tries to change to a listed OPP
>>>>> and fails in the bowels of clk_set_rate()
>>>> Though I think that might only be a symptom as well.
>>>> Both the PLL setting code as well as the actual cpu-clock implementati=
on
>>>> is unchanged since 2017 (and runs just fine on all boards in my farm).
>>>>
>>>> One source for these issues is often the regulator supplying the cpu
>>>> going haywire - aka the voltage not matching the opp.
>>>>
>>>> As in this error-case it's CPU4 being set, this would mean it might
>>>> be the big cluster supplied by the external syr825 (fan5355 clone)
>>>> that might act up. In the Firefly-rk3399 case this is even stranger.
>>>>
>>>> There is a discrepancy between the "fcs,suspend-voltage-selector"
>>>> between different bootloader versions (how the selection-pin is set up=
),
>>>> so the kernel might actually write his requested voltage to the wrong
>>>> register (not the one for actual voltage, but the second set used for
>>>> the suspend voltage).
>>>>
>>>> Did you by chance swap bootloaders at some point in recent past?
>>> No, haven't touched bootloader since I initially setup the board.
>>
>> The CPU voltage does not affect by bootloader for kernel should have its=
=20
>> own opp-table,
>>
>> the bootloader may only affect the center/logic power supply.
>>
>>>
>>>> I'd assume [2] might actually be the same issue last year, though
>>>> the CI-logs are not available anymore it seems.
>>>>
>>>> Could you try to set the vdd_cpu_b regulator to disabled, so that
>>>> cpufreq for this cluster defers and see what happens?
>>> Yes, this change[1] definitely makes things boot reliably again, so
>>> there's defintiely something a bit unstable with this regulator, at
>>> least on this firefly.
>>
>> Is it possible to target which patch introduce this bug? This board=C2=
=A0=20
>> should have work correctly for a long time with upstream source code.
>
> Unfortunately, it seems to be a regular, but intermittent failure, so
> bisection is not producing anything reliable.
>
> You can see that both in mainline[1] and in linux-next[2] there are
> periodic failures, but it's hard to see any patterns.

Even worse, I (re)tested mainline for versions that were previously
passing (v5.2, v5.3-rc5) and they are also failing now.

They work again if I disable that regulator as suggested by Heiko.

So this is increasingly pointing to failing hardware.

Kevin
