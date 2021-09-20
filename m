Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B0D410FAF
	for <lists+linux-next@lfdr.de>; Mon, 20 Sep 2021 08:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhITG5c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 02:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhITG5c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Sep 2021 02:57:32 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DE1C061574;
        Sun, 19 Sep 2021 23:56:05 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id m4so17502394ilj.9;
        Sun, 19 Sep 2021 23:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=izw6L99FizrdgPwr1IzT8U5HxF1mXHWHNm6b2HR3A8s=;
        b=qOjBJLGif2a7YzwQq1dMe5aRyy5djPYdu8/aJeKnDoPWGDUzAsvyo0GkkV2x0KOUZv
         Lq9iaVg5hkeJ2m+eYkYYaPtON5eBHQJpKaovewnloGDQHFNn6nwoMeyed6MGW3HmRwh+
         j3gNr5IY32NeM7qxopu/b9Gdtn2D81/7VYfWlbr3roleL0y6TBrOPkyQfgYzgenouN5I
         PsaZWwMi43DPttO9DErFGwt+oSuS9W5Xh0bindLi7dCUJVHQdgBIBuRCAUKPYiHcZu48
         ysj1KN0IvGGTC5l3XNqxGdu6JZRrKooki71RKW3Rpi/EYbRanw1s3LRUND2v27KoWsdC
         l9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=izw6L99FizrdgPwr1IzT8U5HxF1mXHWHNm6b2HR3A8s=;
        b=uXlrt547p3Y22DjIr3gYaEjdTYXq7DY4jqDxhAuMnqT/bQa8jj5zOCPxu9pfGmVWns
         tRKfyH0n+Jf3cyvnPMjkP9AQZeU6AapuRWpj/tpOjCHSrJ/lpFKL34Phwv2f1Sw86sxC
         guzEk3sqOvRR/4QilILsP5gKsdo2sIRDp1SsJ10jrqLBGVbeiHXA/jQy+w2vTreNW5/N
         5W0uENKzEj7yUk3o2vUi/cA9B26Y21lgeeJM9dYI/pN5JA2WydFUrnSCOQPia4aOPXdb
         WJDpQ/sMTjQnejxy/cJ13R+URHDqjQAVHpGjwV/r2aIpesiC83hrV/cNOH53jHc1uNmN
         6gHA==
X-Gm-Message-State: AOAM533fxROTv/xYyxyG+6bwquSPVJVgxIOWXkuOhQZ3ZAuE2Nl3fEhd
        cRHhHV1A2F3BtyYLpewoo08O3QTCi8i8emEnRZdrms0SK08=
X-Google-Smtp-Source: ABdhPJwDhOjPBiPVsrlxtgSZHUTfLwlgt3HBjiXZ1pGAheIaZfE3sE7ZTMEwMtBocZI7y82A+c/o2ZhZZPNbPT+H9IM=
X-Received: by 2002:a05:6e02:13e3:: with SMTP id w3mr16783279ilj.25.1632120965042;
 Sun, 19 Sep 2021 23:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210920113330.29f12b99@canb.auug.org.au>
In-Reply-To: <20210920113330.29f12b99@canb.auug.org.au>
From:   Yafang Shao <laoar.shao@gmail.com>
Date:   Mon, 20 Sep 2021 14:55:29 +0800
Message-ID: <CALOAHbDYExn1uRaHX1jNZrST80if7QjA-MuL0at1C7fHzQgV8g@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 20, 2021 at 9:33 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the tip tree, today's linux-next build (powerpc_ppc64
> defconfig) produced this warning:
>
> kernel/sched/debug.c: In function 'print_cfs_group_stats':
> kernel/sched/debug.c:460:41: warning: unused variable 'stats' [-Wunused-variable]
>   460 |                struct sched_statistics *stats =  __schedstats_from_se(se);
>       |                                         ^~~~~
>
> Caused by commit
>
>   cb3e971c435d ("sched: Make struct sched_statistics independent of fair sched class")
>
> # CONFIG_SCHEDSTATS is not set
>

Hi Stephen,

Thanks for the report.

We have discussed this issue before[1].
This warning happens when CONFIG_SCHEDSTATS is not set and
schedstat_enabled() is 0, so the whole scope should be not compiled.
It seems that we don't need to fix this warning.

[1]. https://lore.kernel.org/lkml/20210911082505.115758-1-laoar.shao@gmail.com/

-- 
Thanks
Yafang
