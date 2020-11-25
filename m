Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A17572C3E64
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 11:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729090AbgKYKrB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 05:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbgKYKrB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2020 05:47:01 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D816FC0613D4
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2020 02:47:00 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id mc24so2342165ejb.6
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2020 02:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/Dda3TrMKEh7mM1NZG1uzUobwUSnHHig1HhvVYDq8U=;
        b=DyIqeQ5L0Z0W/MMEDCh24Pnn/PTz1MbqZUOgZTiZU8ADygSMrudEQFaAd1iwyFj166
         1Mr6svWeJ8QRYyJ50npzy8jyoJPZNH2ljPaXYv5cNrAwRu9gAgROpD6INJfQqLTbXDJq
         SB34GcsyBzI1hOIOSC5vLn0bM81JyfugHKG8qil3/hMwZiOwkCxZsaaN9JlroCK7AgYf
         pA35nzY5hCZNMKCCmBPfD5KfolEvfyBZyJ6RCZBB0xT5FlNi2SfPG0ncfrkUzLxEQG5B
         Vl4+YftnhQqDBCEzKImePx5A+wLAdlBZ8elcpbvnhHxC/iyR7596RSoSPpwp+wrjhEUw
         9LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/Dda3TrMKEh7mM1NZG1uzUobwUSnHHig1HhvVYDq8U=;
        b=FpNt+4omWROueKBOFnQ6Nlna1dDmjUhkQ6cFiReZgOtyADgy5Wz3uadhdNUt/EUwH+
         x8HyXe5FxxyFWRUTvTwJbcj58NZtDx34u69xIkIpOFJ8sq6z2kpoMUeS9oFE9CA7YdfE
         n+719wecErj7xUmXyALuvxaOsxFBUVIJ47+AX8VHxavpDYP1tnH7ysfLX7fCvgsJR0NW
         CBFFT/HNFiJvAJn6C9Vbf/jIb0OqUV2AGDuaGGsW9opyaTBvW5d0dG79NR7MNPN+bnzB
         /354B19Lhyid6R4ofE7qbQcPIVtxlXw5ubrKByTPZ8seC8YlSsQ15QLeAn1tYHIPE8ZX
         nG4w==
X-Gm-Message-State: AOAM533OL7R8x4/PEJiTM1recTsDTat4FClUDCy02uEu2Tshi+mTWaBg
        wIjJJhoW8JPbe2GAErjEWBzLQZZxjT6EggkeAku6+w==
X-Google-Smtp-Source: ABdhPJzAcgJVFbuDO5LNnao/kQNEW1iI4KhOcKIrr/S4M2HKWm9d60VUyamw/dXs7ig9EvlOTHwigcfk1fkF9PP5pPA=
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr2584819eju.375.1606301219451;
 Wed, 25 Nov 2020 02:46:59 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYuKZGaHVvAv=ZwOL_p6UM3YhOHy0DcJRRM_DOLGYXg1Dw@mail.gmail.com>
 <20201124171628.dk6tle5lh3sx2jxg@linutronix.de> <20201125004632.GG4327@casper.infradead.org>
In-Reply-To: <20201125004632.GG4327@casper.infradead.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 25 Nov 2020 16:16:47 +0530
Message-ID: <CA+G9fYt+P1=efG+Ciq6Pak-NvPARx_GoqOw8FLnw4eb-LjRKrw@mail.gmail.com>
Subject: Re: kernel BUG at mm/highmem.c:417! invalid opcode: 0000 EIP: zero_user_segments
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        LTP List <ltp@lists.linux.it>,
        Andrew Morton <akpm@linux-foundation.org>,
        torvalds@linuxfoundation.org, Yang Shi <shy828301@gmail.com>,
        Jan Kara <jack@suse.cz>, Michal Hocko <mhocko@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mel Gorman <mgorman@suse.de>, Song Liu <songliubraving@fb.com>,
        Zi Yan <ziy@nvidia.com>, vtolkm@googlemail.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 25 Nov 2020 at 06:16, Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Nov 24, 2020 at 06:16:28PM +0100, Sebastian Andrzej Siewior wrote:
> > On 2020-11-24 18:52:44 [+0530], Naresh Kamboju wrote:
> > > While running LTP test case access01 the following kernel BUG
> > > noticed on linux next 20201124 tag kernel on i386.
> > >
> > > git short log:
> > > ----------------
> > > git log --oneline next-20201120..next-20201124 -- mm/highmem.c
> > > d9927d46febf Merge branch 'akpm-current/current'
> > > 72d22a0d0e86 mm: support THPs in zero_user_segments
> > > 2a656cad337e mm/highmem: Take kmap_high_get() properly into account
> > >
> > > Please find these easy steps to reproduce the kernel build and boot.
> >
> > This BUG_ON() is in zero_user_segments() which ash been added in commit
> >    72d22a0d0e86 mm: support THPs in zero_user_segments
> >
> > > [   50.852189] kernel BUG at mm/highmem.c:417!
> >
> > I managed to capture one invocation with:
> > zero_user_segments(0xd4367a90,
> >                  0x1000, 0x1000,
> >                  0x0, 0x50)
> > page_compound() -> 1
> > page_size() -> 4096
>
> Thanks for debugging this!  I didn't realise start1 was allowed to be
> less than start2.  Try this ... (systemd is sabotaging my efforts to
> test an i386 kernel)

This patch tested on i386, x86_64 and arm and the reported problem got fixed.
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh
