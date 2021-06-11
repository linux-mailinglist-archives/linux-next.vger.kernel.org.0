Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5C13A3C63
	for <lists+linux-next@lfdr.de>; Fri, 11 Jun 2021 08:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbhFKG5t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Jun 2021 02:57:49 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:45036 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhFKG5s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Jun 2021 02:57:48 -0400
Received: by mail-ua1-f48.google.com with SMTP id 68so2212408uao.11;
        Thu, 10 Jun 2021 23:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uDY2dim4aXXjh83+9TfmRnq4rAnvdm1kS4I6xxJDBSY=;
        b=V8wkSTGaotw6yDaMI8aW6zeuqP/9qpv6sNZL7MFNPEDxPfllq+EdlOM9Njgg2l7YN4
         RlcYRVDGe3tq4GGFcM/PXS0vZjEOI6FcWPeEBBfGnTLGKvXKwpCv8+IvTnNrSJjnuya5
         s4QBw+/4fOzC2ihXRJhoE5MbpAOB960hQ215vegLP+cdgFmfUNjNy9YIA/7XH4ZmNJKs
         6V2GqdQcrhUEGZP8viIgExf8sr4WRHXrdO77IMJ4HIYYveFdEgr9tfcv0k6aFYA/8sBu
         IWdSg2MDoOnLVEnV2tQBVQFeM9t3kwkyH/FaPi/yvC5aG6/KxoHGZvXpvnkNFDE6Kc54
         qsfg==
X-Gm-Message-State: AOAM533Yb+mOuqMOevMSRMZYEEiQ/AJ+VOMXl8CcQ2re1+/gMq+cZq/+
        uNFP5S5VNfNh9bGg6PK+kq/mwIdxAQ1s1Mpq1RLDbpjB2Byyeg==
X-Google-Smtp-Source: ABdhPJzhZ+LeTQ29TGU1dlV4GczrEvE6sFGwLOsBiAcVefRdC1tiB9fStBtgAe4vXGARVmr3VV85cQxTnQjYHt/4Rsk=
X-Received: by 2002:ab0:71d9:: with SMTP id n25mr1728908uao.2.1623394535969;
 Thu, 10 Jun 2021 23:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210610110001.2805317-1-geert@linux-m68k.org> <20210610220155.GQ664593@dread.disaster.area>
In-Reply-To: <20210610220155.GQ664593@dread.disaster.area>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Jun 2021 08:55:24 +0200
Message-ID: <CAMuHMdWp3E3QDnbGDcTZsCiQNP3pLV2nXVmtOD7OEQO8P-9egQ@mail.gmail.com>
Subject: Re: [PATCH] xfs: Fix 64-bit division on 32-bit in xlog_state_switch_iclogs()
To:     Dave Chinner <david@fromorbit.com>
Cc:     Dave Chinner <dchinner@redhat.com>,
        Chandan Babu R <chandanrlinux@gmail.com>,
        "Darrick J . Wong" <djwong@kernel.org>,
        Allison Henderson <allison.henderson@oracle.com>,
        Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org,
        Linux-Next <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        noreply@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Dave,

On Fri, Jun 11, 2021 at 12:02 AM Dave Chinner <david@fromorbit.com> wrote:
> On Thu, Jun 10, 2021 at 01:00:01PM +0200, Geert Uytterhoeven wrote:
> > On 32-bit (e.g. m68k):
> >
> >     ERROR: modpost: "__udivdi3" [fs/xfs/xfs.ko] undefined!
> >
> > Fix this by using a uint32_t intermediate, like before.
> >
> > Reported-by: noreply@ellerman.id.au
> > Fixes: 7660a5b48fbef958 ("xfs: log stripe roundoff is a property of the log")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Compile-tested only.
> > ---
> >  fs/xfs/xfs_log.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> <sigh>
>
> 64 bit division on 32 bit platforms is still a problem in this day
> and age?

They're not a problem.  But you should use the right operations from
<linux/math64.h>, iff you really need these expensive operations.

> Reviewed-by: Dave Chinner <dchinner@redhat.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
