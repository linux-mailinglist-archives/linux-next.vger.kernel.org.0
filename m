Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1EBF8BFAF
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 19:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbfHMRfd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 13:35:33 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39568 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbfHMRfd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Aug 2019 13:35:33 -0400
Received: by mail-pg1-f196.google.com with SMTP id u17so51609624pgi.6
        for <linux-next@vger.kernel.org>; Tue, 13 Aug 2019 10:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=WbGX54T+GLj+zPkzCEpReOe90S/IUb6BeDK7HimtLmU=;
        b=nDafrdQYDbFKoWpGKZDib1byU7s2nmVRNs05fk7K/lgw1aXNG484GhW1PnA9+b4zTx
         uRd9lZNZDyXkp8lHKhxnrGm7Z9s98DPKhzQ1O9/uhMk6aIDRtPwpv3VJvrhBWeZ3yzrH
         h2lF+cDxogFlmL0aKaaOMkXzW46MRgfDUm22luM2emggZsUyxZlOek9hDLUOXv1SdmCn
         tExEmFKBpR2XDfnZ2Fj+H+lnIXfZ0jDE5JRPl5+ePHJBTZxruvspIr3PVxdyx5M93Y5G
         JF3miRoVc3sVxh8NF8McW9QMMDg3PxqWrBm2aSNvSqPFDcC55d20M6wIEpJP/f3sBT15
         comw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=WbGX54T+GLj+zPkzCEpReOe90S/IUb6BeDK7HimtLmU=;
        b=AGxFO1hNi1pYPGzBNwxhZv/7U/fHmPV3IYhKwqkgwE70d7sPY6C0gUWeo2XuR7GeDU
         UPq6VsbpAwUDsVlt0VMApfE5zRFyQ4xGwkq0bHvR12cLKcr2YJB7ItFP0HW0NyeC4h4h
         fYbEYH7DY5WjuQ/nZwZyAcWS9GW+1xAEeSVWvAT/O3PSaroZ8ocHp+uDzV8oLhlPFAkh
         3hJNiHefVFZD0e4cwpFvTpPGUgGgiNMFcg+uPlJlNeO/jLs50dpzdkZ7lTYav5Zp8e+4
         i0xWIeQEzBMpey4rTrAS2dc71H9N9Z+/UCxLZOoJ+kkt44iMi3PAUOjzA7CkJkqnO7Tq
         a3+g==
X-Gm-Message-State: APjAAAVT7QMSnY/2OF1uuquMW2RzjvvYOF14jl3O0V3Fy4tHzYSBpBSS
        zBOKFnxRbZfrxdtcg2mDzYprYNH0L1w=
X-Google-Smtp-Source: APXvYqwjp1eJbOfxWiQsD6T/UtM1bSp6EzzjibV4p+1ELJtzHOanjJvdb42B1HkqKUwkNQQf5sx5nQ==
X-Received: by 2002:a65:6850:: with SMTP id q16mr36352863pgt.423.1565717732280;
        Tue, 13 Aug 2019 10:35:32 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:35:cf9b:bad:702c])
        by smtp.gmail.com with ESMTPSA id h11sm23241982pgv.5.2019.08.13.10.35.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 10:35:31 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: CPUfreq fail on rk3399-firefly (was: next/master boot: 285 boots: 16 failed, 264 passed with 3 offline, 1 untried/unknown, 1 conflict (next-20190718))
In-Reply-To: <20190718162005.GF5761@sirena.org.uk>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com> <20190718162005.GF5761@sirena.org.uk>
Date:   Tue, 13 Aug 2019 10:35:31 -0700
Message-ID: <7hmugdynmk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[ resent with correct addr for linux-rockchip list ]

Mark Brown <broonie@kernel.org> writes:

> On Thu, Jul 18, 2019 at 04:28:08AM -0700, kernelci.org bot wrote:
>
> Today's -next started failing to boot defconfig on rk3399-firefly:
>
>> arm64:
>
>>     defconfig:
>>         gcc-8:
>>             rk3399-firefly: 1 failed lab
>
> It hits a BUG() trying to set up cpufreq:
>
> [   87.381606] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 200000 KHz
> [   87.393244] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 408000 KHz
> [   87.469777] cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 12000 KHz
> [   87.488595] cpu cpu4: _generic_set_opp_clk_only: failed to set clock rate: -22
> [   87.491881] cpufreq: __target_index: Failed to change cpu frequency: -22
> [   87.495335] ------------[ cut here ]------------
> [   87.496821] kernel BUG at drivers/cpufreq/cpufreq.c:1438!
> [   87.498462] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
>
> I'm struggling to see anything relevant in the diff from yesterday, the
> unlisted frequency warnings were there in the logs yesterday but no oops
> and I'm not seeing any changes in cpufreq, clk or anything relevant
> looking.
>
> Full bootlog and other info can be found here:
>
> 	https://kernelci.org/boot/id/5d302d8359b51498d049e983/

I confirm that disabling CPUfreq in the defconfig (CONFIG_CPU_FREQ=n)
makes the firefly board start working again.

Note that the default defconfig enables the "performance" CPUfreq
governor as the default governor, so during kernel boot, it will always
switch to the max frequency.

For fun, I set the default governor to "userspace" so the kernel
wouldn't make any OPP changes, and that leads to a slightly more
informative splat[1]

There is still an OPP change happening because the detected OPP is not
one that's listed in the table, so it tries to change to a listed OPP
and fails in the bowels of clk_set_rate()

Kevin

[1] https://termbin.com/3oum
