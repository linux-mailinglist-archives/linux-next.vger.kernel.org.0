Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 721A9983DE
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 21:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfHUS7g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 14:59:36 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35416 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbfHUS7g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Aug 2019 14:59:36 -0400
Received: by mail-pf1-f195.google.com with SMTP id d85so2034874pfd.2
        for <linux-next@vger.kernel.org>; Wed, 21 Aug 2019 11:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=mK1H0BvZsgTtsN1s5a6lp4IM3J/uRRiK2PoPe1e2FBo=;
        b=QgfpK50JA0eIc4O+SUBfw4lElixOn+KQxHu2zfLfPhj1We5aBoVJjf+8aaw4BE4d1W
         +M3acVRkCaqLRcIEUW2Rr6upzYiZxPEG0bVknYlce2/PENpcsrEJhAbNOFSB4yNdHBTN
         BmS7j86s5IqAIeqDC+qAbiYArBLkywVcJUdq83mzbQcACZWrTpf5d5pzOFDqXhOTDbZj
         pXTrohVPu7jw/EXdjP6FhIEEO6J+4mqp+MXL9W0TBaMFPkV4sOha6DygB5FUFRrrL8MH
         DN16kfcAfTjim7UKGaoaLogOVKmTnyO2C4ksm/EhLR7bzYIqJoB0/Y+eNyguZXbnN98o
         +4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=mK1H0BvZsgTtsN1s5a6lp4IM3J/uRRiK2PoPe1e2FBo=;
        b=lglo4qbzpwkEOF5rTrbmt5+GLwXY+x84+A7JDkfgZ9TYG8DVO0K7M6J2Zs4BzUu7GP
         vjC8oFf9jhrZMiSa2WVx5kWLLb7363g2Qok0IeWSI5lJ1I05pqY2+MeAlb4Sxz44ERbK
         3W9LU/4da1KuvE6QwsdXrwseWPFMGnohu0C3XGqJ9rCRUihZYip3CVkeu6lM0s8y0L92
         bM3JXBuoK/m+aoyWHK23zRieIPH3dTY3JFErKpu7nWUZX2AuN2V7P4iFDJJJi8f8LUbb
         RFYxKh5qWvoA1y1O5EUYKH3IZRXf4DGREJ96enWdApKCSdRRmR3DMhX4bVI2ugxFvQ+s
         925w==
X-Gm-Message-State: APjAAAWavyUe+lZtobL+DUIGyVals3BRPyrp4vxGTkfKL3M82heslIhp
        Azcco11dRV+fJE0DOj5Paf987g==
X-Google-Smtp-Source: APXvYqzmd1DBEeem+J6VymgZcgptitZGRrRZZYDED2sT/w52SP7MXWbGr5otGq7GgjxXnnaMfcHksA==
X-Received: by 2002:a17:90b:f12:: with SMTP id br18mr1368456pjb.127.1566413974806;
        Wed, 21 Aug 2019 11:59:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id a10sm34416479pfl.159.2019.08.21.11.59.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2019 11:59:34 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Mark Brown <broonie@kernel.org>,
        kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: CPUfreq fail on rk3399-firefly (was: next/master boot: 285 boots: 16 failed, 264 passed with 3 offline, 1 untried/unknown, 1 conflict (next-20190718))
In-Reply-To: <2314814.WbdfqDVNqK@phil>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com> <20190718162005.GF5761@sirena.org.uk> <7hmugdynmk.fsf@baylibre.com> <2314814.WbdfqDVNqK@phil>
Date:   Wed, 21 Aug 2019 11:59:33 -0700
Message-ID: <7hv9uq9wfe.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Heiko,

Heiko Stuebner <heiko@sntech.de> writes:

> Am Dienstag, 13. August 2019, 19:35:31 CEST schrieb Kevin Hilman:
>> [ resent with correct addr for linux-rockchip list ]
>> 
>> Mark Brown <broonie@kernel.org> writes:
>> 
>> > On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:
>> >
>> > Today's -next started failing to boot defconfig on rk3399-firefly:
>> >
>> >> arm64:
>> >
>> >>     defconfig:
>> >>         gcc-8:
>> >>             rk3399-firefly: 1 failed lab
>> >
>> > It hits a BUG() trying to set up cpufreq:
>> >
>> > [   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 200000 KHz
>> > [   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 408000 KHz
>> > [   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 12000 KHz
>> > [   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set clock rate: -22
>> > [   87.491881] cpufreq: __target_index: Failed to change cpu frequency: -22
>> > [   87.495335] ------------[ cut here ]------------
>> > [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
>> > [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
>> >
>> > I'm struggling to see anything relevant in the diff from yesterday, the
>> > unlisted frequency warnings were there in the logs yesterday but no oops
>> > and I'm not seeing any changes in cpufreq, clk or anything relevant
>> > looking.
>> >
>> > Full bootlog and other info can be found here:
>> >
>> > 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/
>> 
>> I confirm that disabling CPUfreq in the defconfig (CONFIG_CPU_FREQ=n)
>> makes the firefly board start working again.
>> 
>> Note that the default defconfig enables the "performance" CPUfreq
>> governor as the default governor, so during kernel boot, it will always
>> switch to the max frequency.
>> 
>> For fun, I set the default governor to "userspace" so the kernel
>> wouldn't make any OPP changes, and that leads to a slightly more
>> informative splat[1]
>> 
>> There is still an OPP change happening because the detected OPP is not
>> one that's listed in the table, so it tries to change to a listed OPP
>> and fails in the bowels of clk_set_rate()
>
> Though I think that might only be a symptom as well.
> Both the PLL setting code as well as the actual cpu-clock implementation
> is unchanged since 2017 (and runs just fine on all boards in my farm).
>
> One source for these issues is often the regulator supplying the cpu
> going haywire - aka the voltage not matching the opp.
>
> As in this error-case it's CPU4 being set, this would mean it might
> be the big cluster supplied by the external syr825 (fan5355 clone)
> that might act up. In the Firefly-rk3399 case this is even stranger.
>
> There is a discrepancy between the "fcs,suspend-voltage-selector"
> between different bootloader versions (how the selection-pin is set up),
> so the kernel might actually write his requested voltage to the wrong
> register (not the one for actual voltage, but the second set used for
> the suspend voltage).
>
> Did you by chance swap bootloaders at some point in recent past?

No, haven't touched bootloader since I initially setup the board.

> I'd assume [2] might actually be the same issue last year, though
> the CI-logs are not available anymore it seems.
>
> Could you try to set the vdd_cpu_b regulator to disabled, so that
> cpufreq for this cluster defers and see what happens?

Yes, this change[1] definitely makes things boot reliably again, so
there's defintiely something a bit unstable with this regulator, at
least on this firefly.

Kevin

[1]
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index c706db0ee9ec..6b70bdcc3328 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -454,6 +454,7 @@
 
 	vdd_cpu_b: regulator@40 {
 		compatible = "silergy,syr827";
+		status = "disabled";
 		reg = <0x40>;
 		fcs,suspend-voltage-selector = <0>;
 		regulator-name = "vdd_cpu_b";
