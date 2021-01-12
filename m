Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B6D2F3DFA
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 01:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbhALWAf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 17:00:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729106AbhALWAd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2021 17:00:33 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844C9C061795
        for <linux-next@vger.kernel.org>; Tue, 12 Jan 2021 13:59:52 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id y22so221620ljn.9
        for <linux-next@vger.kernel.org>; Tue, 12 Jan 2021 13:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cRHFA4C63ztEV2JIf4LFaqF2zxgUQvb3Q0QPA2iOSY0=;
        b=RyKM/ND3OaSVjkewh9Fz3AQZXonM2KCrQo2i2xQPD3+dds2gbnnFqCY3dlrSwf5xx+
         iiF4spDbAWiHN22NB2K/mxe+kjS4Amic4Fnmk0LtF/HoEWwxbzj364eAnihFkBCdIqs2
         QbpinVaXb3uaeQIhBuYjhQGRbMfXWaOZr0dSIM37n7VUUxN0xM7F1QStS1HKvxD6EuWV
         AmFsPkboTVYPH/QKW/NesXcOyXBIoOqbZwjarRsExLdJHcOXnA2X1j0g62f45OoFrV8D
         KqMkIPesv5wGRUEfRf1zL1Pz66VdVS9MtdS7enJ/0GzAt7jz1vF/efcwuJlMJz5Dvexi
         JNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cRHFA4C63ztEV2JIf4LFaqF2zxgUQvb3Q0QPA2iOSY0=;
        b=NUnLzX9oPtGMUaGDfqxAEFiEDI2ZL1W+dJp+eWdhGPUAYXqeq2ZSFO6NK73cl0eY/E
         kSOekDGoD/qPhMqoraV2u8mx+Ma9YluwvfkXWAmdHvPT+NoxXOo8b8j8m0u4uDVo99Ff
         TQH1y1K1X63M8dlnC73vFqrb7Ix/JLfqFHZ7tSA4R/hYOVSL6tqph85Lbz1yuoMaIEOc
         pVdJWkuJd3FJo0Zp4l37N5s4LFLp77JRx8UmMEOYhjJvj5hFuKjPjrzwNOi/IHJQsO21
         TdaVxhiFI7eHes7hjWE6BmU/V9OMdW7lFaHyIKAaV38fcHUkRxvAGVgviDzu6GHCYdNU
         8Yzw==
X-Gm-Message-State: AOAM531hUDAgQkg619sC/sF7avaA1W35DhTZAYgVu1YBMni/Ss3qu83T
        UEKCX9JKvWg2NCZgV4g9fhbRNJd6oyUrDnMG2TB0aQ==
X-Google-Smtp-Source: ABdhPJwOQRbnQmQmzaxrSeMY48DkVgG5W+y31u0lUb8/BEz9jaOr8hrUDoAPmHzOrVaamjPz3wtPO3lg/9hV1mJp9ww=
X-Received: by 2002:a2e:b0d3:: with SMTP id g19mr557003ljl.279.1610488790674;
 Tue, 12 Jan 2021 13:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20210112095806.I2Z6as5al%akpm@linux-foundation.org>
 <ac517aa0-2396-321c-3396-13aafba46116@infradead.org> <20210112135010.267508efa85fe98f670ed9e9@linux-foundation.org>
In-Reply-To: <20210112135010.267508efa85fe98f670ed9e9@linux-foundation.org>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 12 Jan 2021 13:59:39 -0800
Message-ID: <CALvZod4qca8SQk-+8iczUjFWZ45=FCA21ZJ4yJmXJQ-MKucRQw@mail.gmail.com>
Subject: Re: mmotm 2021-01-12-01-57 uploaded (NR_SWAPCACHE in mm/)
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, broonie@kernel.org,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Michal Hocko <mhocko@suse.cz>, mm-commits@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 12, 2021 at 1:50 PM Andrew Morton <akpm@linux-foundation.org> w=
rote:
>
> On Tue, 12 Jan 2021 12:38:18 -0800 Randy Dunlap <rdunlap@infradead.org> w=
rote:
>
> > On 1/12/21 1:58 AM, akpm@linux-foundation.org wrote:
> > > The mm-of-the-moment snapshot 2021-01-12-01-57 has been uploaded to
> > >
> > >    https://www.ozlabs.org/~akpm/mmotm/
> > >
> > > mmotm-readme.txt says
> > >
> > > README for mm-of-the-moment:
> > >
> > > https://www.ozlabs.org/~akpm/mmotm/
> > >
> > > This is a snapshot of my -mm patch queue.  Uploaded at random hopeful=
ly
> > > more than once a week.
> > >
> >
> > on i386 and x86_64:
> >
> > when CONFIG_SWAP is not set/enabled:
> >
> > ../mm/migrate.c: In function =E2=80=98migrate_page_move_mapping=E2=80=
=99:
> > ../mm/migrate.c:504:35: error: =E2=80=98NR_SWAPCACHE=E2=80=99 undeclare=
d (first use in this function); did you mean =E2=80=98QC_SPACE=E2=80=99?
> >     __mod_lruvec_state(old_lruvec, NR_SWAPCACHE, -nr);
> >                                    ^~~~~~~~~~~~
> >
> > ../mm/memcontrol.c:1529:20: error: =E2=80=98NR_SWAPCACHE=E2=80=99 undec=
lared here (not in a function); did you mean =E2=80=98SGP_CACHE=E2=80=99?
> >   { "swapcached",   NR_SWAPCACHE   },
> >                     ^~~~~~~~~~~~
>
> Thanks.  I did the below.
>
> But we're still emitting "Node %d SwapCached: 0 kB" in sysfs when
> CONFIG_SWAP=3Dn, which is probably wrong.  Shakeel, can you please have a
> think?
>

Thanks Andrew for fixing. Independent of this patch, we already print
""SwapCached:" in /proc/meminfo for CONFIG_SWAP=3Dn, so I think doing
the same for per-node meminfo should be fine too.
