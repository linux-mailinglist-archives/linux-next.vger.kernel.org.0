Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E41838BF98
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 19:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfHMR1A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 13:27:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46160 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfHMR07 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Aug 2019 13:26:59 -0400
Received: by mail-pg1-f194.google.com with SMTP id w3so14397177pgt.13
        for <linux-next@vger.kernel.org>; Tue, 13 Aug 2019 10:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=+dEEz2DPMg5NRkLHjMzIkO8s6nJqDPDJQGPheHmMdr8=;
        b=kOd3/31cW/3Hcupyj3kEvbLs90dUy6tmI/PaM3d8UXwIhtgtxvzoGB7Z5/bKK6ODe5
         TJKgYx7Q0FbrPQWOJg+FeLPeo5OUPr9bPzlrRPy6xejniOO9mQN2cN/Sc3hsmkaKmux5
         ldgRRhLnflOpsHyCvgrNqD6tAVGGJwPV+StaW0cHE2XUHCwfg6hBdjT+0Mg5geWVoY+G
         D1THVUo08yYVH92fQRjqx4xKgOFh+XkcYDpz3XB5GhkEAYU4fojaezbs+HbBO/T+mcuN
         C130zPb1aga3kzo4wvCJs8OpXMaHbYCmTQyoEs2tQRLOMlbLolOMz1CRXp6hy4wraFty
         x7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=+dEEz2DPMg5NRkLHjMzIkO8s6nJqDPDJQGPheHmMdr8=;
        b=qk0GhbDfwvG+cf8WrxUX9Ecy5W/z8frEo/zMsetEeW7e1J189JyGzN7CV2IlqhaO73
         JKgzr8F7eoAPHZqk4E7/+toExtQRQnTrBzkUl05hvBVFf0DNpuk9PUX/T1mvDZw3xN5A
         Hqa+wEF0y/k8uMwgIZ5lFRImhbDewSg98nT9ATKiwpaoBSAh+uKjyNAnH8z/EjaE1ywR
         XXv5yEw8562o50lwbPiCbcbH6aEFZ2moe3BCq03fu267rKlidbTpHuhjgbfBoWfK+ZFb
         0Y1qi/PbJRbWvyQZy/xAZ0/a2SAJsspvCdfAcP8iKGxCuPe2UkU0lgm70FpQw/tt//LO
         pkJg==
X-Gm-Message-State: APjAAAXXpTdYyNzJB3tFjX8q80Nc0cSGlXAI3BKJlSGrxIN6STg/yM0O
        U+iueNwOeWK9vxxacwXDnahOAw==
X-Google-Smtp-Source: APXvYqxUs8WoMH+cvgCWvT0LeVRPkQ3vVM9aC3GV0KMJZmv0+f5n4lnRPLM5gIQ36LPzfDOH9XHD4g==
X-Received: by 2002:a62:198d:: with SMTP id 135mr41718269pfz.169.1565717218947;
        Tue, 13 Aug 2019 10:26:58 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:35:cf9b:bad:702c])
        by smtp.gmail.com with ESMTPSA id a12sm2090093pje.3.2019.08.13.10.26.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 10:26:58 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        linux-rockchip@vger.kernel.org
Subject: Re: next/master boot: 285 boots: 16 failed, 264 passed with 3 offline, 1 untried/unknown, 1 conflict (next-20190718)
In-Reply-To: <20190718162005.GF5761@sirena.org.uk>
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com> <20190718162005.GF5761@sirena.org.uk>
Date:   Tue, 13 Aug 2019 10:26:57 -0700
Message-ID: <7hv9v1yo0u.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

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
