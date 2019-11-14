Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B544FC0F0
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 08:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKNHmA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 02:42:00 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41622 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbfKNHmA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Nov 2019 02:42:00 -0500
Received: by mail-lj1-f194.google.com with SMTP id m4so591367ljj.8
        for <linux-next@vger.kernel.org>; Wed, 13 Nov 2019 23:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Euwm9dM60NE5Ab+qnRavctQQieBZqDd4s+U1ZZvA9qA=;
        b=NinnNGN86HYVH5IOqHovmW+cTWdxMv5WXObq29Mk1JD554ggs5nBeB/dOGRh19DllJ
         dUBpED7ivY/l71Y8r49IWwhF3QjDnpXJ+ob0unMhIphBMIIFujm5tuYD5xvD7Td58J+l
         sjaQt6O4jdniCPcWs8qRUZuoOoLvASFwjnDjmyjXHILNLpraAEY8dQb9ub7daz2ButRM
         LJ6lTRh5FToHSFgU1UnSizHZrD3NiWjQ5A9wKXNRv4k7umCoQHuD4yvjfpH8nFvDaX4J
         G1LpE4roS+b0cwUZ99LG29BsbmKScFqE/LS+ksU1bqtT7yh/3pa46a8/yGleEfOIDF05
         8UWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Euwm9dM60NE5Ab+qnRavctQQieBZqDd4s+U1ZZvA9qA=;
        b=RBKlGDJ4U1QRDX5dL31hx6ak4SPTj8q2r0MfFtD5EQ50n1cvmc5tEUMSV/uaKSSD7y
         zGQ1tkFrUvbGLuzMrS6leE6LaP4VlaZ51yoNuuzD6KRrFZMkhgbtwTRpuER4ziLwp+cY
         c+/Dhq/o7Rt4CIMSaWlXPh7YHmYKR914jUjdwZ8HyNVALEojrK731oqVxd1BY3ZbHpah
         BHnOqbBNsHAds8bghAs6vMPbJiDgF777scJ1bwqWxrNSPfv+q51OFnkEA4fy+DMGGM4u
         J+kFnNDD5caTnZ7iqDQJBDNzme6/3dZBf2m0a3BrrfJYy2WBfaoOUvqCMu0XBqJaJGME
         RsqA==
X-Gm-Message-State: APjAAAVY9a+TEnHd8QAxj21zGeviR6VV6zucDwjSuhiKQSBhoIJLLzxM
        ZvmIMpZuI+u13vtAbl5APc5UIHyWTY9GO7GBSDQ7WQ==
X-Google-Smtp-Source: APXvYqy3yTkaodJ5GrMMLKb6Vj0D5eS9zRaerP2DvalEHhbWdJ+TmcJuTrHUZpfZV71AlWWtv/AyFTGDZUXRidoaxuY=
X-Received: by 2002:a2e:b0d3:: with SMTP id g19mr5339965ljl.135.1573717318600;
 Wed, 13 Nov 2019 23:41:58 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtJNyMOw4rkfHMv+XxwhVPbqdsCHoCkn4aL2TsofyCfvw@mail.gmail.com>
In-Reply-To: <CA+G9fYtJNyMOw4rkfHMv+XxwhVPbqdsCHoCkn4aL2TsofyCfvw@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 14 Nov 2019 13:11:47 +0530
Message-ID: <CA+G9fYvn-vSpeSbXC19+tzS=PP06K5MtcwqJi=Dt6K2r5XcjSw@mail.gmail.com>
Subject: Re: Linux next 5.4.0-rc7-next-20191112: rcu: INFO: rcu_sched
 self-detected stall on CPU
To:     frederic@kernel.org
Cc:     acme@kernel.org, linux-perf-users@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, mhiramat@kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Frederic,

FYI,

On Tue, 12 Nov 2019 at 22:38, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> INFO: rcu_sched self-detected stall on CPU detected on Linux next
> 5.4.0-rc7-next-20191112 running on x86_64 device and continuously
> popped up kernel.
>
> Steps to reproduce:
> 1. boot x86_64 with Linux next 5.4.0-rc7-next-20191112
> 2. Run "perf test -v"
>
> x86_64 device:
> Running perf test cases
> perf test -v
> ...
> test child forked, pid 418
> mmap size 528384B
> [   74.040659] rcu: INFO: rcu_sched self-detected stall on CPU
> [   74.046275] rcu: 0-....: (26000 ticks this GP)
> idle=25a/1/0x4000000000000002 softirq=7882/7882 fqs=6495

> [   74.151951] RIP: 0010:irq_work_sync+0x51/0x60

Thanks for providing fix patch.
[PATCH] irq_work: Fix IRQ_WORK_BUZY bit clearing

Applied this patch and tested perf test on x86_64 and reported issue is gone.

ref:
https://lore.kernel.org/lkml/20191113171201.14032-1-frederic@kernel.org/T/#u

- Naresh
