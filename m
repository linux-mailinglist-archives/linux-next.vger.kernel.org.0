Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF789B4EA
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2019 18:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390224AbfHWQwz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Aug 2019 12:52:55 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42078 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729834AbfHWQwz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Aug 2019 12:52:55 -0400
Received: by mail-pg1-f196.google.com with SMTP id p3so6064189pgb.9
        for <linux-next@vger.kernel.org>; Fri, 23 Aug 2019 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version:content-transfer-encoding;
        bh=zIEqGVFm20QH2rrlURxbZuA/nBxUqeTlHMT3qLXaCW0=;
        b=G0L5ZUBIAKo7O+9XeV/SKXTVkdkpHit4PiENfeChbIF26Z95QNr4aiXee75Pf4lKuz
         tgZiIpA3XGNp0+SLSy6/FCpD/g+ij2Pf2RjaN64NCp4/hhpZIX1n2jm/xU/gzAp/bkwm
         NXJuIbefPjqnsYnHBdVJQpJSd6z97hMeZPDlWy9kp/uRcFlMRqXdDgQhzwLIijJZAKIB
         zSr7OTAAEuA4fGehoul/WRSJ80fl6pJ935Ych8RZitV4u3zXZXUBb+uGkzELsyCPo7SW
         d68isfQuhmGzfiBZofcP7XarkFvxoOVdvtwsoBX4Vs+W3ZvHyyR05JmRx0x0Uo/U4ZqZ
         TDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=zIEqGVFm20QH2rrlURxbZuA/nBxUqeTlHMT3qLXaCW0=;
        b=RN9OcG0PeBS/KnCAlh2ke8y7x5lQJDJ7z16G2Clff9tRbn1WY94+qyjp0z3e/ud6WU
         UdM7d3S/fD9sJ/zp1kG2COa03PR52eDPDiPvtUxGFWc3U+WTR8N9zEQ5nCazIXJRPb/+
         qfhjS31d2GmwuTqSvFulHSqrXVN6FUPd+kgZTNBKevMg6DRN6qZL58P+qkxZZEMthhug
         1gTkmljS2O8w6mWL4Tg0tkUyCudnKEC+csL3Cd5Jency+wgaitzk03CxvMx0j4N6L/PR
         nHwhbUmWWXEjWOpX+4aslT5Fj2/wDX2xHMYbK7/acwElm9Ldu/o9Inhf/dFDk8pZrb3O
         N0jA==
X-Gm-Message-State: APjAAAUf9mHrCDBh1rlELjJs/DYA5pXUPgFv4nOHpJ/SnM9a0wOH6Apf
        o+LBAvS2PJlYp09c3d4FZJO0Zw==
X-Google-Smtp-Source: APXvYqwUBOoIdTD1TRV8B52/BmDqa47JsmySRJ8hznDrFqykLcLfGM9wbDEcLGWYB8RrKF9R2CVB7w==
X-Received: by 2002:a17:90b:8e:: with SMTP id bb14mr6088866pjb.35.1566579173540;
        Fri, 23 Aug 2019 09:52:53 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:89d4:68d1:fc04:721])
        by smtp.gmail.com with ESMTPSA id h17sm4438026pfo.24.2019.08.23.09.52.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 09:52:52 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Kever Yang <kever.yang@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-rockchip@lists.infradead.org, linux-next@vger.kernel.org,
        =?utf-8?B?5byg5pm0?= <elaine.zhang@rock-chips.com>,
        =?utf-8?B?6Zer5a2d?= =?utf-8?B?5Yab?= <andy.yan@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: CPUfreq fail on rk3399-firefly
In-Reply-To: <c973d3fa-5f0d-c277-7c83-6227942a671a@rock-chips.com>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com> <20190718162005.GF5761@sirena.org.uk> <7hmugdynmk.fsf@baylibre.com> <2314814.WbdfqDVNqK@phil> <7hv9uq9wfe.fsf@baylibre.com> <c973d3fa-5f0d-c277-7c83-6227942a671a@rock-chips.com>
Date:   Fri, 23 Aug 2019 09:52:51 -0700
Message-ID: <7hd0gvzuvw.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Kever Yang <kever.yang@rock-chips.com> writes:

> Hi Kevin, Heiko,
>
> On 2019/8/22 =E4=B8=8A=E5=8D=882:59, Kevin Hilman wrote:
>> Hi Heiko,
>>
>> Heiko Stuebner <heiko@sntech.de> writes:
>>
>>> Am Dienstag, 13. August 2019, 19:35:31 CEST schrieb Kevin Hilman:
>>>> [ resent with correct addr for linux-rockchip list ]
>>>>
>>>> Mark Brown <broonie@kernel.org> writes:
>>>>
>>>>> On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:
>>>>>
>>>>> Today's -next started failing to boot defconfig on rk3399-firefly:
>>>>>
>>>>>> arm64:
>>>>>>      defconfig:
>>>>>>          gcc-8:
>>>>>>              rk3399-firefly: 1 failed lab
>>>>> It hits a BUG() trying to set up cpufreq:
>>>>>
>>>>> [   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted fre=
q: 200000 KHz
>>>>> [   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial freque=
ncy changed to: 408000 KHz
>>>>> [   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted fre=
q: 12000 KHz
>>>>> [   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set clo=
ck rate: -22
>>>>> [   87.491881] cpufreq: __target_index: Failed to change cpu frequenc=
y: -22
>>>>> [   87.495335] ------------[ cut here ]------------
>>>>> [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
>>>>> [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
>>>>>
>>>>> I'm struggling to see anything relevant in the diff from yesterday, t=
he
>>>>> unlisted frequency warnings were there in the logs yesterday but no o=
ops
>>>>> and I'm not seeing any changes in cpufreq, clk or anything relevant
>>>>> looking.
>>>>>
>>>>> Full bootlog and other info can be found here:
>>>>>
>>>>> 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/
>>>> I confirm that disabling CPUfreq in the defconfig (CONFIG_CPU_FREQ=3Dn)
>>>> makes the firefly board start working again.
>>>>
>>>> Note that the default defconfig enables the "performance" CPUfreq
>>>> governor as the default governor, so during kernel boot, it will always
>>>> switch to the max frequency.
>>>>
>>>> For fun, I set the default governor to "userspace" so the kernel
>>>> wouldn't make any OPP changes, and that leads to a slightly more
>>>> informative splat[1]
>>>>
>>>> There is still an OPP change happening because the detected OPP is not
>>>> one that's listed in the table, so it tries to change to a listed OPP
>>>> and fails in the bowels of clk_set_rate()
>>> Though I think that might only be a symptom as well.
>>> Both the PLL setting code as well as the actual cpu-clock implementation
>>> is unchanged since 2017 (and runs just fine on all boards in my farm).
>>>
>>> One source for these issues is often the regulator supplying the cpu
>>> going haywire - aka the voltage not matching the opp.
>>>
>>> As in this error-case it's CPU4 being set, this would mean it might
>>> be the big cluster supplied by the external syr825 (fan5355 clone)
>>> that might act up. In the Firefly-rk3399 case this is even stranger.
>>>
>>> There is a discrepancy between the "fcs,suspend-voltage-selector"
>>> between different bootloader versions (how the selection-pin is set up),
>>> so the kernel might actually write his requested voltage to the wrong
>>> register (not the one for actual voltage, but the second set used for
>>> the suspend voltage).
>>>
>>> Did you by chance swap bootloaders at some point in recent past?
>> No, haven't touched bootloader since I initially setup the board.
>
> The CPU voltage does not affect by bootloader for kernel should have its=
=20
> own opp-table,
>
> the bootloader may only affect the center/logic power supply.
>
>>
>>> I'd assume [2] might actually be the same issue last year, though
>>> the CI-logs are not available anymore it seems.
>>>
>>> Could you try to set the vdd_cpu_b regulator to disabled, so that
>>> cpufreq for this cluster defers and see what happens?
>> Yes, this change[1] definitely makes things boot reliably again, so
>> there's defintiely something a bit unstable with this regulator, at
>> least on this firefly.
>
> Is it possible to target which patch introduce this bug? This board=C2=A0=
=20
> should have work correctly for a long time with upstream source code.

Unfortunately, it seems to be a regular, but intermittent failure, so
bisection is not producing anything reliable.

You can see that both in mainline[1] and in linux-next[2] there are
periodic failures, but it's hard to see any patterns.

I'm starting to think that maybe the regulator on my particular board is
just starting to fail, since disabling the regulator for that cluster
prevents any voltage changes and makes things reliable again.

If we don't find a solution to this, I'll probably just have to retire
this board from my kernelCI lab (of course, I'd be happy to replace it
if someone wants to donate another one.)  :)

Kevin

[1] https://kernelci.org/boot/rk3399-firefly/job/mainline/
[2] https://kernelci.org/boot/rk3399-firefly/job/next/
