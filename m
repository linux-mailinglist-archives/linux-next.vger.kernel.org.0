Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A45AD3A7D1B
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 13:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhFOL2t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 07:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhFOL2t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 07:28:49 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E13CC06175F
        for <linux-next@vger.kernel.org>; Tue, 15 Jun 2021 04:26:44 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ho18so21980602ejc.8
        for <linux-next@vger.kernel.org>; Tue, 15 Jun 2021 04:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Blp/IrsrSShZRKUsMEp/iJdzOG+tUUDSwjzDuCyoAwk=;
        b=xX411P79z/T56H3ueR41/3ATmURuhk9lY0Zqm8WA8n0z449r9OJ+eLJpY1Xin8ZKyG
         dHhQAPfj8o4kT0lWHzFUIjXUa+dM35JdLFAWg8Xv68u+KWFfo2Pw3lkcTwYYDKCh7YeG
         tdVrmZWWIbABT2zvE5+EnT6W57ixhegoZ657XwEFCrgHOIJxFLf6edio4WKDZQNa/9X0
         nyroe5B54Djn9vGULpI1nzoIDbmAMUc/jXkBpFAmbu6haeY64pBEWBTR2qpHB8WrK+O3
         VKW8aNaPWt2tvOBj+uY5lmrjk2JrRb5wy3/j795Sakn692JspyTEE49tsd9hf1dORKor
         3pSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Blp/IrsrSShZRKUsMEp/iJdzOG+tUUDSwjzDuCyoAwk=;
        b=EpuksaW9vGGhCio4nVj9eNW/AN5slljnYAEdaFMl4mZaelyf2qGQRZWjT2pGDjw6rV
         0LHNmTL3NEfdmqy+V8Wayf5ME96OpafWfymlXyWOW2WGEw7bPfB3dQbhPYs8etAMsB4g
         gW/O03FFZKxJpGhSc5bbOZJ16iMZCAIGDa098TskceMxVGtU2RYysAHWkZmnwFsephOw
         hCU+opOqn9Rn7ZErYEfXl3A2X8zpNcsFyOxH8YFSIu6LkWZwX68vTT5C5pt8tjEuuCZz
         wCK5BLnvbG762E2NugJ5gtsYP9oxsXN/1x2TPJFWLtR3IkjfK9nxRVvgRIkSdvOCoAQ+
         6SyQ==
X-Gm-Message-State: AOAM5313GCUrg/O3yo3dzEqLE/tmA0ykFH32fC59NNV/ZFzCztJFdrM3
        eALhRN/JDpBfou0OrFXLfnLbV/YOIEoYFmmGIWXSDxOWCiUaTr0r
X-Google-Smtp-Source: ABdhPJySGALxoxfe1c0PKH/BE3HG448iqXZfqzm4W3zQEc1OEoF6taRfIyCS5e5Zy6u6tlSLIohV3PLljO9l7JJrkfU=
X-Received: by 2002:a17:906:480a:: with SMTP id w10mr3772979ejq.18.1623756402663;
 Tue, 15 Jun 2021 04:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYurEcTfV7Z=co2Ki-TubF4d-Ext7ivZPaQT9SR5XazUtQ@mail.gmail.com>
In-Reply-To: <CA+G9fYurEcTfV7Z=co2Ki-TubF4d-Ext7ivZPaQT9SR5XazUtQ@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 15 Jun 2021 16:56:31 +0530
Message-ID: <CA+G9fYschBRxbugv19pZegUG6+Y10dJfJr7RHQE7M+Z_3RgqrQ@mail.gmail.com>
Subject: Re: [next] [arm64] Unable to handle kernel NULL pointer dereference
 at virtual address 0000000000000068
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>, lkft-triage@lists.linaro.org,
        regressions@lists.linux.dev
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 15 Jun 2021 at 16:49, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Following kernel crash reported while booting linux next 20210615 tag
> on qemu_arm64.

Similar crash reported while booting Linux next 20210615 tag kernel on
the qemu arm.

https://lkft.validation.linaro.org/scheduler/job/2901326#L441

>
> Crash log:
> -------------
> [    0.767379] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000068
> [    0.769815] Mem abort info:
> [    0.770735]   ESR = 0x96000004
> [    0.771598]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.773008]   SET = 0, FnV = 0
> [    0.773865]   EA = 0, S1PTW = 0
> [    0.774844]   FSC = 0x04: level 0 translation fault
> [    0.776195] Data abort info:
> [    0.776968]   ISV = 0, ISS = 0x00000004
> [    0.778010]   CM = 0, WnR = 0
> [    0.778961] [0000000000000068] user address but active_mm is swapper
> [    0.780643] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    0.782189] Modules linked in:
> [    0.783098] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
> 5.13.0-rc6-next-20210615 #1
> [    0.785239] Hardware name: linux,dummy-virt (DT)
> [    0.786626] pstate: 00000005 (nzcv daif -PAN -UAO -TCO BTYPE=--)
> [    0.788352] pc : blk_finish_plug+0x88/0x270
> [    0.789598] lr : blk_queue_write_cache+0x34/0x80
d.com/1tyksDCCPiTvc0x6psxC3JvSWqJ/config

- Naresh
