Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251E1166AE0
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2020 00:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729234AbgBTXWS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 18:22:18 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:56103 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbgBTXWS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Feb 2020 18:22:18 -0500
Received: by mail-wm1-f68.google.com with SMTP id q9so311868wmj.5
        for <linux-next@vger.kernel.org>; Thu, 20 Feb 2020 15:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lAGe+i3LubNXS3mS7OrXMjcEN50SIJqaNo7uJEQXNWE=;
        b=h7MnYZvECmHl3d29/SfmjKEd2LO8J5IoeA+e1M3u9qBoVgt/hMmnLnnjXNhCldskHc
         N3OAUX5vmVPJwhJ7mWSTCmnQvav8xtNMCiGPHayj/pYGaIK+eTMZ6LM+f0YSJZcVR/Eh
         yhwPl/cjAtvlV3sa8TMz5OjHPoBeGFlsK78OPR7u4O2ooTwW2J+ceuyxZcJcF0Hvuiyt
         XRMlrhyYAWDgQUon2AWvtHTVHdEKp4CzcQtYmwIfQPMgpBgaJOuz0pejKhf8PPeoYcs8
         mz3Uvn1gCW3kOO43eH10vmM0Q/fGvZfp/1Q1DIQ60zTvSvUZJJbkRL5euHkz5TvS6TDo
         En1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lAGe+i3LubNXS3mS7OrXMjcEN50SIJqaNo7uJEQXNWE=;
        b=Q8JN9sPsmw7R5SCpbHvdXDuBQ5HdxwO4vceaSFtZkOP6vVSUnou9rO26qmr6l09WFb
         IpoAHRPDJbJSv7I/0ZZmq6py+uKcFc7AfqmY6zP7RvQ0BZ/He3mH8btyWF9u0+ZOLKdN
         53liT47488hxiHxbojuGVYwxTbl7x+gkb3rK9V0fNw55Isj3gLadMyDvwvcikl42c3YP
         ayMnlIVd9AEUFjOinaY9GFnRdA3SHImTcgOkSui+jIsUy6rHsP7lep655GmYF5+8sBTK
         VRM8DpCYPGhb4Oh2JAay6rQLLRbYgh1hkoZb9dk046tv/njDp3WKctLiFZNqMZMacyp0
         I7ag==
X-Gm-Message-State: APjAAAVyDFqzKP/RNofwwnz/6C54PRrfvfVHo6mZ3K7ECNcZlvQO+xMg
        6OLKHaallSHEpD7RASHEZu/NQvxEfVefD2jX+EnO8nDYx7s=
X-Google-Smtp-Source: APXvYqzD9Lsa2RnghfzDZKCPGUHchYplA9ZvVVBuCIjF1ONPxRB4HOMNohwpiCmhi3B6eXhmolZ9tM47vt7IZRDf7gs=
X-Received: by 2002:a1c:9ad6:: with SMTP id c205mr6672584wme.78.1582240935818;
 Thu, 20 Feb 2020 15:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20200217145711.4af495a3@canb.auug.org.au> <CAOFY-A1nfPjf3EcQB6KiEifbFR+aUtdSgK=CHGt_k3ziSG6T_Q@mail.gmail.com>
 <CAOFY-A3q_pmtHKAoOJdbB09wy=dxs9SdpXjCsU1wBxU5EDHVmw@mail.gmail.com> <20200221101845.21c0c8c5@canb.auug.org.au>
In-Reply-To: <20200221101845.21c0c8c5@canb.auug.org.au>
From:   Arjun Roy <arjunroy@google.com>
Date:   Thu, 20 Feb 2020 15:22:04 -0800
Message-ID: <CAOFY-A2ndGCSEDstOmXs-u1XjNsaj8wkLezYsMbzeZeVTJGC5g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 20, 2020 at 3:18 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Sun, 16 Feb 2020 22:45:35 -0800 Arjun Roy <arjunroy@google.com> wrote:
> >
> > On Sun, Feb 16, 2020 at 8:12 PM Arjun Roy <arjunroy@google.com> wrote:
> > >
> > > On Sun, Feb 16, 2020 at 7:57 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > After merging the akpm tree, today's linux-next build (sparc64 defconfig)
> > > > failed like this:
> > > >
> > > > mm/memory.c: In function 'insert_pages':
> > > > mm/memory.c:1523:56: error: macro "pte_index" requires 2 arguments, but only 1 given
> > > >    remaining_pages_total, PTRS_PER_PTE - pte_index(addr));
> > > >                                                         ^
> > > >
> > > > Caused by commit
> > > >
> > > >   366142f0b000 ("mm/memory.c: add vm_insert_pages()")
> > > >
> > > > This is the first use of pte_index() outside arch specific code and the
> > > > sparc64 version of pte_index() nas an extra argument.
> > >
> > > Looks like this happens for sparc, and also metag. Other platforms
> > > just take the addr parameter based on a quick search.
> >
> > And actually I guess there's no metag anyways now.
> > Looking further, then, it looks like in every non-sparc pte_index() is
> > an actual numerical index, while on sparc it goes a step further to
> > yield a pte_t *.
> > As far as I can tell, the sparc incarnation of this is only used by
> > the pte_offset_(kernel/map) macros.
> >
> > So I think a possibly sane way to fix this would be:
> > 1. Define pte_index() to be a numerical index, like the other architectures,
> > 2. Define something like pte_entry() that uses pte_index(), and
> > 3. Have pte_offset_(kernel/map) be defined as pte_entry() instead.
> >
> > Then pte_index would be operating on just an address for all
> > platforms, and the reverted patchset would work without any changes.
> >
> > If this sounds acceptable, I can send a patch.
> >
> > > > I have reverted these commits for today:
> > > >
> > > >   219ae14a9686 ("net-zerocopy-use-vm_insert_pages-for-tcp-rcv-zerocopy-fix")
> > > >   cb912fdf96bf ("net-zerocopy: use vm_insert_pages() for tcp rcv zerocopy")
> > > >   72c684430b94 ("add missing page_count() check to vm_insert_pages().")
> > > >   dbd9553775f3 ("mm-add-vm_insert_pages-fix")
> > > >   366142f0b000 ("mm/memory.c: add vm_insert_pages()")
> > > >
> > >
> > > In terms of fixing this; passing in an appropriate dir parameter is
> > > not really a problem, but what is concerning that it seems messy to
> > > have a per-platform ifdef to pass it either two arguments or one in
> > > this case. But it seems like either that would be one way to fix it,
> > > or having some arch method across all arches that takes two arguments
> > > (and ignores one of them for most arches).
> > >
> > > Is there a general preference for the right way forward, in this case?
>
> Has there been any progress with this?  I am still reverting the above
> commits, so they are not getting any linux-next testing ...
>

I have a possible solution in mind, but it would involve a slight
change in the SPARC macro (to be more inline with the semantics of the
other platforms).
If you're open to such a change, I can send it out.

Thanks,
-Arjun

> --
> Cheers,
> Stephen Rothwell
