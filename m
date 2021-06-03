Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65F73997D7
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 04:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhFCCEr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Jun 2021 22:04:47 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:43750 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhFCCEq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Jun 2021 22:04:46 -0400
Received: by mail-lj1-f181.google.com with SMTP id w15so5051937ljo.10;
        Wed, 02 Jun 2021 19:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/8IZndxOiLWDoXbA8jpiE1ISCuoDjLto8/f1jFi4j/E=;
        b=XvBT6QdgkOd/bFWJe4sr1HTGZAB3hFKDQSQQql6Y+63pobzzAazIb4UWMkxG0MfkDE
         dQNR1dTVSCKrvHKdfbW+b5tway53NGBDd0EOXOYX4i1t+KvNcyIZflkeeKoCpzAZDuY+
         Q4szIbZopSgOHjCesa0CZ4R/nY8Dwa2XioAAvWueSr5W7DdrjtHKeAxNSwvgU92b49fq
         4uVkhBhYdDpGTYz+/wZG56dBHrI3lF5I069u965w1XQAWQTEOsIjKAcLmIz1T6Z4HHWV
         +Im0LxdM1ovlRn+rIxVfaKdMvsVii33VrVA4FCqFhm8a0kun15z9SxPSun7aIRKxJKDA
         aWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/8IZndxOiLWDoXbA8jpiE1ISCuoDjLto8/f1jFi4j/E=;
        b=OEhIY5kgamECwmgl8FKaO9zTEvpGYlSTEwROLgNcma0v/uOxulv5b/qlpNkIyoRIo5
         ds1V8xETz8cBLQMgjUdoH8Fe3oX7QnzajYfHsetBoWKu1Ur5hVeJSlNEzLAeMmlXaqrP
         B+nQSksmqiPvCZtIbvrYsUXijG2u9viRjgplnVeSyKWCuGMuyBccSnEbFHpCHk1IS+90
         E6ogkdSV2sepwSSj/QMNp8wlDkO7o0XWpsEyeFhRst42ol/BFItSZzqwkDfmF7otJ4fn
         4xdsN/LTQGwd7ByVrNigPovRTsp8hB17+MXYSAE5s6NxoaxY721wQegiaT5+CjeINT/R
         tsPg==
X-Gm-Message-State: AOAM531xki25PR4CRl2fvVJBaPT03E482GEO7rEHQ6LgOoulEKt5py1Z
        zgpcjslytL+9ViI9s17BgvrLilknByc=
X-Google-Smtp-Source: ABdhPJxK6SCugXeoioO9yW78vOgwhoCh0v4FOVMRToxZ9/D5pkfnAmFfoOb/KzEvYTHUhD+YSwRVQw==
X-Received: by 2002:a2e:553:: with SMTP id 80mr8891837ljf.144.1622685709295;
        Wed, 02 Jun 2021 19:01:49 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id r202sm158698lff.251.2021.06.02.19.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 19:01:48 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the tegra tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210603103507.304b7626@canb.auug.org.au>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8d8f947e-2ba4-f7b8-cb85-dcee940c96b4@gmail.com>
Date:   Thu, 3 Jun 2021 05:01:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603103507.304b7626@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

03.06.2021 03:35, Stephen Rothwell пишет:
> Hi all,
> 
> After merging the tegra tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: unmet direct dependencies detected for TEGRA210_EMC_TABLE
>   Depends on [n]: MEMORY [=y] && TEGRA_MC [=y] && ARCH_TEGRA_210_SOC [=n]
>   Selected by [m]:
>   - TEGRA210_EMC [=m] && MEMORY [=y] && TEGRA_MC [=y] && (ARCH_TEGRA_210_SOC [=n] || COMPILE_TEST [=y])
> 
> Probably introduced by commit
> 
>   08decdd5b448 ("memory: tegra: Enable compile testing for all drivers")
> 

Thank you. This is a new warning to me, apparently this case wasn't previously tested by kernel build bot.

Perhaps this should fix it:

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 71bba2345bce..3f2fa7750118 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -47,7 +47,6 @@ config TEGRA124_EMC
 
 config TEGRA210_EMC_TABLE
 	bool
-	depends on ARCH_TEGRA_210_SOC
 
 config TEGRA210_EMC
 	tristate "NVIDIA Tegra210 External Memory Controller driver"


Thierry, please squash this change into the original patch if it looks good to you.
