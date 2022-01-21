Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B71495CF0
	for <lists+linux-next@lfdr.de>; Fri, 21 Jan 2022 10:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344915AbiAUJio (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Jan 2022 04:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234243AbiAUJin (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jan 2022 04:38:43 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADDEEC061574
        for <linux-next@vger.kernel.org>; Fri, 21 Jan 2022 01:38:43 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id p5so25787530ybd.13
        for <linux-next@vger.kernel.org>; Fri, 21 Jan 2022 01:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JekWhR8CMAxMCtnFBApW6vamUlJTaekkAKvbq4p6qw8=;
        b=Mu93tn/1YAjVBeQULNJalS9X6HhXvdWuyJXmfAqYbyxtxM0dtvMRc+raEPKdaKvd1j
         W8jW7wwFnUYqcxvwlY4G9B0sR9xprDxdAKdd0JyJVIAgSzP1Vg36C/ZZqPTTMQVeQKlk
         SB/QuNjdCsYqzTCpkkZ76PVrvOBoNAiR5+qeeYz+B++Ax0BLwt7s6J+GZE4wEO1Ju2aR
         Dr1e04+a6xS3r5LKxcnKAgOstzSLyEfXClE/U0xMM/BWLLZ8pSHvYlj3Y/C3mUpkO+gS
         Ap3JYFS/dUwYBdBnGvyFqeEfUmllZvIoJyVvlsiHvrpEwZY5WOtx/o5APydHInZdx/kX
         IW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JekWhR8CMAxMCtnFBApW6vamUlJTaekkAKvbq4p6qw8=;
        b=6OeVb0ZtjHXkEQDPL4/rD3ge3dGifv1CRtRM2dwaTEfDYjSA8Tc6mVNZemhP4Umo/X
         IKL/UzemHtOV2wjD9Jjv+JfK1MLMVh3SaIT57ApdYk0htEiV5+zgg4V9JvYOiED8XHq3
         K79Rd3+DXa22HWGYCKYGH02oTMdxFzhWgfBc7XN0YG9v9nWtzQQig84o+9as26Z/ylBp
         svwpy4hMre0ILI3hh0+tiHUd2pQlavqv/raW+xmhWh/10iKdRAsKeY60jYK6E95Ky5V0
         TY67JdwLIqC51r0nzxpHv1jy7CKKbk0POzZ4bH/ZZg7XStcuRqdSmLlr34dwKhgJ/Oip
         zH2Q==
X-Gm-Message-State: AOAM532mqrm5W/E0Odxb1uP9F4UoUNWxzNLSzHVWgtoHRfPKwAMSs+n7
        qoTztHQjalEd/DFwIZatclqLa6gKjQcCSu1Vx5m6uw==
X-Google-Smtp-Source: ABdhPJxwPwDcVZlwqlEbNURijL+6MLGocOVUhJTkp4UaAqzb1wi8hvxpYQGzCNUitvJcHn3KXKIEEW0s6ye7Cf9nlng=
X-Received: by 2002:a25:c04c:: with SMTP id c73mr4847013ybf.553.1642757922889;
 Fri, 21 Jan 2022 01:38:42 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtq0wzSeG8YG-a+=KrbdWqHJMXk1hvq0FKeAvj9sZAK2g@mail.gmail.com>
 <6249735f-e6b7-1331-eb2b-361bb17d6115@opensource.wdc.com> <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
 <350720e8-9b78-bd24-5c60-602076610bf4@opensource.wdc.com>
In-Reply-To: <350720e8-9b78-bd24-5c60-602076610bf4@opensource.wdc.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 21 Jan 2022 15:08:31 +0530
Message-ID: <CA+G9fYuMc9qjQE+XoKUzwhMP4O5QE5FbCEhJEmrd_Q8LaC4nFw@mail.gmail.com>
Subject: Re: [next] mips: cavium_octeon_defconfig: pata_octeon_cf.c:598:23:
 error: passing argument 1 of 'trace_ata_bmdma_stop' from incompatible pointer type
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Zeal Robot <zealci@zte.com.cn>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        CGEL ZTE <cgel.zte@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 21 Jan 2022 at 14:47, Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
>
> On 2022/01/21 17:58, Naresh Kamboju wrote:
> >> I just posted a fix. As I do not have the environment to compile test
> >> mips, could someone test please ? I will send the fix to Linus asap
> >> after confirmation that it is OK.
> >
> > Please share your patch / patch link. I will test it with tuxmake.
>
> I posted on linux-ide and CC-ed linux-mips:
>
> https://marc.info/?l=linux-ide&m=164275458614058&w=2

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

- Naresh
