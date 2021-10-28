Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593FD43F1AC
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 23:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhJ1Vc1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 17:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhJ1Vc1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 17:32:27 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0DAC061570
        for <linux-next@vger.kernel.org>; Thu, 28 Oct 2021 14:29:59 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id oa4so5687573pjb.2
        for <linux-next@vger.kernel.org>; Thu, 28 Oct 2021 14:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/lI7dGfxNdfHtUhR3u3dXK1xJCX1P/hNo/ulx2YmiY0=;
        b=Kb6aAKc3DeW4d1csCsIYnL7/SMjsmrZ9mbkFA6rDXkZk0VH0zQQmjE+Ax7IVjCJNqM
         BtyMSJsJ4AJJZpKdlThb2Vpwvpbh4wB+9UI1nA4+6wTjSdvYWLybZ9MNEcvUmd2p0904
         hozxk+hKZ8iV/Y76SVm3CxxB066sbo2r9TgsB+pGNLQejT54MLTcGXzqCb56IVBIROh8
         Tn/+tQcBrF+Y3Czx12EbwkjmFSC+EEoTF8iCOdaZdL4YwQNe/jYbxVt28/K3MPWCul9u
         IEcgWqMpYV+YL14hVDAdR7Hj+TrchTrugDBIEHKNem/iCbzBiRuk40/a3lL5dRC28aXl
         Gmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lI7dGfxNdfHtUhR3u3dXK1xJCX1P/hNo/ulx2YmiY0=;
        b=JJB4Rc1hzZtkE9W8w/lEkZ5g+gh0cvuB3VUp2h+CFQdhDkdrQFwe/CFLwuh/G0U8BL
         BXm1BJyGrnnlTCRsK6MSRShldhTyiW58qJdBOmgRHW8vhRaOppOYx0A9vVQMLsox2IP3
         fDhmNcrD6ybSRkjiujgSFMP4JiFJeSuhQwbA21WsXJsHbC7UsxlfD/64pt2b0uK9b3oD
         wMNF1dNHNvZR9P8bJi7XK9o21Jo7aWhXxBoQoWiM5CkUzWaKsGFoDGmahgbWhlbtqmxX
         X8w/1tQcIx7k31J3lPZvTNcAC1XPVy/B3d31EqyFzOZm4AEEos2Fy09HYLASFMW0J7WK
         Oiog==
X-Gm-Message-State: AOAM530+InJhC1hjz9zcDtewEi4pZD6sTvHNAAROlh4kHFUpq1LCnksw
        e+js+OSL+vXsreSxDyQyIUWT5Ipow+19EABSvP9dTg==
X-Google-Smtp-Source: ABdhPJwMUqFd02KrmdqW470+itKjh/UlDpbY2lEHbZoZcpFM52xUQLiolhnWGvB421lSa2jZttMTjqXDWrcyc7IFMjE=
X-Received: by 2002:a17:90b:1c0c:: with SMTP id oc12mr7162794pjb.124.1635456598625;
 Thu, 28 Oct 2021 14:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211028232345.5ffa43bc@canb.auug.org.au> <20211028091646.15f6e6de@gandalf.local.home>
 <20211029081009.0fd1a83a@canb.auug.org.au>
In-Reply-To: <20211029081009.0fd1a83a@canb.auug.org.au>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Thu, 28 Oct 2021 14:29:47 -0700
Message-ID: <CAC_TJvd+RT0dwAHC8wM-CU4P15=7yQObWmJ+DZMCh26Lf-im2Q@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the ftrace tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 28, 2021 at 2:10 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Steven,
>
> On Thu, 28 Oct 2021 09:16:46 -0400 Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Thu, 28 Oct 2021 23:23:45 +1100
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > > After merging the ftrace tree, today's linux-next build (htmldocs)
> > > produced this warning:
> > >
> > > Documentation/trace/histogram.rst:1766: WARNING: Inline emphasis start-string without end-string.
> >
> > I have no idea what that means.
>
> I assume you need to quote (with '\') the '*' on line 1767 (?).

Hi Stephen,

I also found the problem to be '*' character. I posted a fix at:
https://lore.kernel.org/r/20211028170548.2597449-1-kaleshsingh@google.com/

Thanks,
Kalesh

>
> --
> Cheers,
> Stephen Rothwell
