Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1691BBFB74
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2019 00:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfIZWvX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 18:51:23 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35582 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfIZWvX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 18:51:23 -0400
Received: by mail-pl1-f193.google.com with SMTP id y10so264154plp.2
        for <linux-next@vger.kernel.org>; Thu, 26 Sep 2019 15:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version:content-transfer-encoding;
        bh=kg+W2f5e/pogc4hGhrCGEqMguXq5FDO31U9eHUNSVU8=;
        b=doq6egEf3LmGnlfezLhjQYmyH9WNiUDMElP8GikmAOh7DM8SV20L7QhN+Jvey9pbDt
         C9c2VT7GuS73tOkt5Ed0UHo5K8cTBGyf4trSfNwwP1JlrNpcP1tS6txwiKHKn6aRA7D0
         KK7BevD9aR5UOMIXyhDUxNBAV1wC/0MVWxgjBUlih/SCPDlFaDZFJShXDZjC8WY86VZ4
         2EgPqNpG/IpiEV2sgHZYGNGfLp5J3/o4zl+kOinTMaO+LipU23kg0/3Tz8BhoGodzKON
         hbsMy0+A397W+GVOMRGyRzkyXOTywv4U3+LNiQyTP264fqQIZ5g2eGH6Oktu/xqCnMaW
         KNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=kg+W2f5e/pogc4hGhrCGEqMguXq5FDO31U9eHUNSVU8=;
        b=a0GStilJAojVZQJ19g5Mtwdui5Gvi2G8/Mo38FMTkSKFAH6HFaXfQC5xHgYnOp2XGG
         L6druv0ISqx9XcSm29n0WXkppiGzvhS+tYiL3L2q/4Mhplpr+VK6tuOaGsRTmTh+yjdD
         twSrBfat7sQ2k9D6FmnDsiuh9+xjG5FShk7rPN4s91RozYnjE4C6gt8XvF3tv/F/9AX3
         RwMb5tHjkrov873hFhQWnCJailWMMQDiu8RsgYCqDYMp32dR+JO9JDScge1lgfz011HU
         7A/XVzNIoMTFUkTQX8tY4QkAlZubRvybD9llcTclhpQBD/3H5PSjWBrfafPF9jSNVbZZ
         RZqQ==
X-Gm-Message-State: APjAAAUg4Y0MWhfUmxunNI7hzY98e+y8BgTgcvZnOI+RBajIwuxITmt6
        qr8zUUZnMi7GkthRYtAJN4dmZA==
X-Google-Smtp-Source: APXvYqwm2QmMOmlapOmvCZzfzmqAyybOChJa6QGvuyVRnsVKtwIzD0kUT3oqqJ7MALibHdkkoDNQbA==
X-Received: by 2002:a17:902:bc46:: with SMTP id t6mr1047383plz.307.1569538282342;
        Thu, 26 Sep 2019 15:51:22 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id 64sm322938pfx.31.2019.09.26.15.51.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 15:51:21 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Kever Yang <kever.yang@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-rockchip@lists.infradead.org, linux-next@vger.kernel.org,
        =?utf-8?B?5byg5pm0?= <elaine.zhang@rock-chips.com>,
        =?utf-8?B?6Zer5a2d?= =?utf-8?B?5Yab?= <andy.yan@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: CPUfreq fail on rk3399-firefly
In-Reply-To: <7h8srjzuen.fsf@baylibre.com>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com> <20190718162005.GF5761@sirena.org.uk> <7hmugdynmk.fsf@baylibre.com> <2314814.WbdfqDVNqK@phil> <7hv9uq9wfe.fsf@baylibre.com> <c973d3fa-5f0d-c277-7c83-6227942a671a@rock-chips.com> <7hd0gvzuvw.fsf@baylibre.com> <7h8srjzuen.fsf@baylibre.com>
Date:   Thu, 26 Sep 2019 15:51:20 -0700
Message-ID: <7hh84yisd3.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Kevin Hilman <khilman@baylibre.com> writes:

> Kevin Hilman <khilman@baylibre.com> writes:
>
>> Kever Yang <kever.yang@rock-chips.com> writes:
>>
>>> Hi Kevin, Heiko,
>>>
>>> On 2019/8/22 =E4=B8=8A=E5=8D=882:59, Kevin Hilman wrote:
>>>> Hi Heiko,
>>>>
>>>> Heiko Stuebner <heiko@sntech.de> writes:
>>>>
>>>>> Am Dienstag, 13. August 2019, 19:35:31 CEST schrieb Kevin Hilman:
>>>>>> [ resent with correct addr for linux-rockchip list ]
>>>>>>
>>>>>> Mark Brown <broonie@kernel.org> writes:
>>>>>>
>>>>>>> On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:
>>>>>>>
>>>>>>> Today's -next started failing to boot defconfig on rk3399-firefly:
>>>>>>>
>>>>>>>> arm64:
>>>>>>>>      defconfig:
>>>>>>>>          gcc-8:
>>>>>>>>              rk3399-firefly: 1 failed lab
>>>>>>> It hits a BUG() trying to set up cpufreq:
>>>>>>>
>>>>>>> [   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted f=
req: 200000 KHz
>>>>>>> [   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial freq=
uency changed to: 408000 KHz
>>>>>>> [   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted f=
req: 12000 KHz
>>>>>>> [   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set c=
lock rate: -22
>>>>>>> [   87.491881] cpufreq: __target_index: Failed to change cpu freque=
ncy: -22
>>>>>>> [   87.495335] ------------[ cut here ]------------
>>>>>>> [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
>>>>>>> [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
>>>>>>>
>>>>>>> I'm struggling to see anything relevant in the diff from yesterday,=
 the
>>>>>>> unlisted frequency warnings were there in the logs yesterday but no=
 oops
>>>>>>> and I'm not seeing any changes in cpufreq, clk or anything relevant
>>>>>>> looking.
>>>>>>>
>>>>>>> Full bootlog and other info can be found here:
>>>>>>>
>>>>>>> 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/
>>>>>> I confirm that disabling CPUfreq in the defconfig (CONFIG_CPU_FREQ=
=3Dn)
>>>>>> makes the firefly board start working again.
>>>>>>
>>>>>> Note that the default defconfig enables the "performance" CPUfreq
>>>>>> governor as the default governor, so during kernel boot, it will alw=
ays
>>>>>> switch to the max frequency.
>>>>>>
>>>>>> For fun, I set the default governor to "userspace" so the kernel
>>>>>> wouldn't make any OPP changes, and that leads to a slightly more
>>>>>> informative splat[1]
>>>>>>
>>>>>> There is still an OPP change happening because the detected OPP is n=
ot
>>>>>> one that's listed in the table, so it tries to change to a listed OPP
>>>>>> and fails in the bowels of clk_set_rate()
>>>>> Though I think that might only be a symptom as well.
>>>>> Both the PLL setting code as well as the actual cpu-clock implementat=
ion
>>>>> is unchanged since 2017 (and runs just fine on all boards in my farm).
>>>>>
>>>>> One source for these issues is often the regulator supplying the cpu
>>>>> going haywire - aka the voltage not matching the opp.
>>>>>
>>>>> As in this error-case it's CPU4 being set, this would mean it might
>>>>> be the big cluster supplied by the external syr825 (fan5355 clone)
>>>>> that might act up. In the Firefly-rk3399 case this is even stranger.
>>>>>
>>>>> There is a discrepancy between the "fcs,suspend-voltage-selector"
>>>>> between different bootloader versions (how the selection-pin is set u=
p),
>>>>> so the kernel might actually write his requested voltage to the wrong
>>>>> register (not the one for actual voltage, but the second set used for
>>>>> the suspend voltage).
>>>>>
>>>>> Did you by chance swap bootloaders at some point in recent past?
>>>> No, haven't touched bootloader since I initially setup the board.
>>>
>>> The CPU voltage does not affect by bootloader for kernel should have it=
s=20
>>> own opp-table,
>>>
>>> the bootloader may only affect the center/logic power supply.
>>>
>>>>
>>>>> I'd assume [2] might actually be the same issue last year, though
>>>>> the CI-logs are not available anymore it seems.
>>>>>
>>>>> Could you try to set the vdd_cpu_b regulator to disabled, so that
>>>>> cpufreq for this cluster defers and see what happens?
>>>> Yes, this change[1] definitely makes things boot reliably again, so
>>>> there's defintiely something a bit unstable with this regulator, at
>>>> least on this firefly.
>>>
>>> Is it possible to target which patch introduce this bug? This board=C2=
=A0=20
>>> should have work correctly for a long time with upstream source code.
>>
>> Unfortunately, it seems to be a regular, but intermittent failure, so
>> bisection is not producing anything reliable.
>>
>> You can see that both in mainline[1] and in linux-next[2] there are
>> periodic failures, but it's hard to see any patterns.
>
> Even worse, I (re)tested mainline for versions that were previously
> passing (v5.2, v5.3-rc5) and they are also failing now.
>
> They work again if I disable that regulator as suggested by Heiko.
>
> So this is increasingly pointing to failing hardware.

This is now failing in the v5.2 stable tree.

Any suggestions on what to do?  otherwise, I'll just need to disable
this board.

Or, if someone wants to donate a new rk3399-firefly for my lab, I'd be
glad to try replacing it.

Kevin
