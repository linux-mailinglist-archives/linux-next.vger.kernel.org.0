Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2FCA421AE3
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 01:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhJDX4g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Oct 2021 19:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhJDX4f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2021 19:56:35 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10708C061745;
        Mon,  4 Oct 2021 16:54:46 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u18so78672221lfd.12;
        Mon, 04 Oct 2021 16:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GVLNEuznYXl4qyfikIVqD3Z4gsOX+ZYDeAnVRaE3myk=;
        b=LywrXSBEvj6oMjXcR7dtfkX5UYR4/5ZsAKAAsjaK699+wCMh3PeVdOOa3eXscQIDaK
         JpS/25Sh/9dumCC9WIQ8V1vBow0Sna+v6NI3HycyprkSA4cvw1y+6rfxn9oRBtiToAFk
         CIffZ0BhNCkz0chPK+yvdtiWYONrIA4lp0XBtOy4+WzFPBObJL5HYieK5YxLvwCfC0IE
         Co2LtTjEusxu+RVvGFTXvTdko0aUBYD/yxHpOgif98oT0pV6hgUqQjNsYaEvXp7ooJ+C
         6hGHAwFKKPA0ksX//+TD7yVE+N5yLmEO9og4u1KwDhqJkcp6ih38ODTJxEKmge63iLqp
         QRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GVLNEuznYXl4qyfikIVqD3Z4gsOX+ZYDeAnVRaE3myk=;
        b=nz2OvmjZRbEA1JhyM/gsJIK5wSVHq/eZ0CpcjWXC78iMGn8qWFlrX3s2UBbB2F01dQ
         0aMNWc3vQp4IdmJ2nCSLZq9FGSDPSF6Zxie4yB9ARq07qoO3GskhvuarN2rADVfqJmS2
         6ubIOuXervxFKV325T0+jWDbyHpq4FGUWo1YVvRPOtKLR0ZrybtlrAo4A/WANP4QGBLl
         XGp7g+u1cRwI7sg2KqDU3TGBRIYvsHr+Y/OgcCQs0kNAlvYbuCI2pE/TxQmq5nCammP+
         NOj/URW78Vle6E/accXABucVlywOMMW6M4oer3xdK9WvYJReKkwfoSv8fhDktgLvH3mX
         Co5Q==
X-Gm-Message-State: AOAM533BkfAmAA/wOC8c0gcsX8CfGVuhcNAo6VJH8QY6v6dW+WsOaE9n
        UGke4+40WP6RkCtzsdnJYlvLE8J+6Yw=
X-Google-Smtp-Source: ABdhPJynkg8k3DWk+NW0Stxn6uy0Nnft7LRXmwg03tSsGGdeFP1eeAo49lhV8SjnY7EtpfAm+fHsvw==
X-Received: by 2002:a2e:bba6:: with SMTP id y38mr513695lje.265.1633391684013;
        Mon, 04 Oct 2021 16:54:44 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id d19sm1737478lfv.74.2021.10.04.16.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 16:54:43 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the tegra tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211005103952.0914094d@canb.auug.org.au>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <445e6daa-f210-74c5-cf8d-4aa138136b7e@gmail.com>
Date:   Tue, 5 Oct 2021 02:54:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211005103952.0914094d@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

05.10.2021 02:39, Stephen Rothwell пишет:
> Hi all,
> 
> After merging the tegra tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from arch/x86/include/asm/bug.h:84,
>                  from include/linux/bug.h:5,
>                  from arch/x86/include/asm/paravirt.h:15,
>                  from arch/x86/include/asm/irqflags.h:63,
>                  from include/linux/irqflags.h:16,
>                  from include/linux/rcupdate.h:26,
>                  from include/linux/rculist.h:11,
>                  from include/linux/pid.h:5,
>                  from include/linux/sched.h:14,
>                  from include/linux/ratelimit.h:6,
>                  from include/linux/dev_printk.h:16,
>                  from include/linux/device.h:15,
>                  from include/linux/of_reserved_mem.h:5,
>                  from drivers/memory/tegra/tegra210-emc-table.c:6:
> include/linux/clk/tegra.h: In function 'tegra_cpu_rail_off_ready':
> include/linux/clk/tegra.h:112:15: error: 'tegra_cpu_car_ops' undeclared (first use in this function)
>   112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
>       |               ^~~~~~~~~~~~~~~~~
> include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
>   121 |  int __ret_warn_on = !!(condition);    \
>       |                         ^~~~~~~~~
> include/linux/clk/tegra.h:112:15: note: each undeclared identifier is reported only once for each function it appears in
>   112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
>       |               ^~~~~~~~~~~~~~~~~
> include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
>   121 |  int __ret_warn_on = !!(condition);    \
>       |                         ^~~~~~~~~
> include/linux/clk/tegra.h: In function 'tegra_cpu_clock_suspend':
> include/linux/clk/tegra.h:120:15: error: 'tegra_cpu_car_ops' undeclared (first use in this function)
>   120 |  if (WARN_ON(!tegra_cpu_car_ops->suspend))
>       |               ^~~~~~~~~~~~~~~~~
> include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
>   121 |  int __ret_warn_on = !!(condition);    \
>       |                         ^~~~~~~~~
> include/linux/clk/tegra.h: In function 'tegra_cpu_clock_resume':
> include/linux/clk/tegra.h:128:15: error: 'tegra_cpu_car_ops' undeclared (first use in this function)
>   128 |  if (WARN_ON(!tegra_cpu_car_ops->resume))
>       |               ^~~~~~~~~~~~~~~~~
> include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
>   121 |  int __ret_warn_on = !!(condition);    \
>       |                         ^~~~~~~~~
> In file included from arch/x86/include/asm/bug.h:84,
>                  from include/linux/bug.h:5,
>                  from include/linux/cpumask.h:14,
>                  from arch/x86/include/asm/cpumask.h:5,
>                  from arch/x86/include/asm/msr.h:11,
>                  from arch/x86/include/asm/processor.h:22,
>                  from arch/x86/include/asm/timex.h:5,
>                  from include/linux/timex.h:65,
>                  from include/linux/time32.h:13,
>                  from include/linux/time.h:60,
>                  from include/linux/stat.h:19,
>                  from include/linux/module.h:13,
>                  from drivers/media/cec/platform/tegra/tegra_cec.c:14:
> include/linux/clk/tegra.h: In function 'tegra_cpu_rail_off_ready':
> include/linux/clk/tegra.h:112:15: error: 'tegra_cpu_car_ops' undeclared (first use in this function)
>   112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
>       |               ^~~~~~~~~~~~~~~~~
> include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
>   121 |  int __ret_warn_on = !!(condition);    \
>       |                         ^~~~~~~~~
> include/linux/clk/tegra.h:112:15: note: each undeclared identifier is reported only once for each function it appears in
>   112 |  if (WARN_ON(!tegra_cpu_car_ops->rail_off_ready))
>       |               ^~~~~~~~~~~~~~~~~
> include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
>   121 |  int __ret_warn_on = !!(condition);    \
>       |                         ^~~~~~~~~
> include/linux/clk/tegra.h: In function 'tegra_cpu_clock_suspend':
> include/linux/clk/tegra.h:120:15: error: 'tegra_cpu_car_ops' undeclared (first use in this function)
>   120 |  if (WARN_ON(!tegra_cpu_car_ops->suspend))
>       |               ^~~~~~~~~~~~~~~~~
> include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
>   121 |  int __ret_warn_on = !!(condition);    \
>       |                         ^~~~~~~~~
> include/linux/clk/tegra.h: In function 'tegra_cpu_clock_resume':
> include/linux/clk/tegra.h:128:15: error: 'tegra_cpu_car_ops' undeclared (first use in this function)
>   128 |  if (WARN_ON(!tegra_cpu_car_ops->resume))
>       |               ^~~~~~~~~~~~~~~~~
> include/asm-generic/bug.h:121:25: note: in definition of macro 'WARN_ON'
>   121 |  int __ret_warn_on = !!(condition);    \
>       |                         ^~~~~~~~~
> 
> Presumably caused by commit
> 
>   bbe30ae68d14 ("cpuidle: tegra: Enable compile testing")
> 
> I have used the tegra tree from next-20211001 for today.
> 

Stephen, thank you. Now I recall what was the actual reason for my
version of the patch [1]. Thierry, please use my original patch, thanks.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20210912202907.28471-5-digetx@gmail.com/
