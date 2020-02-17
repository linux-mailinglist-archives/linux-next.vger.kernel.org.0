Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E84160AFB
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 07:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgBQGpx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Feb 2020 01:45:53 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32874 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgBQGpt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Feb 2020 01:45:49 -0500
Received: by mail-wr1-f65.google.com with SMTP id u6so18251673wrt.0
        for <linux-next@vger.kernel.org>; Sun, 16 Feb 2020 22:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cGnUjGVLO1r9iWfqXt0qpMvnwv69UZFpNplwLZdkJAQ=;
        b=GLphA8HypKtuvC/GByFZF501hohmwqarTrNf9E6ChrWae7+uHIiU8jyLw4FwxpcXBX
         5LcpNQp8zr57B7Usw/T1/xOJoF/YMdkDnY7ngvj5S6dIQGY6emRGalo19ofKrYvmsXlq
         AK423hCUtqu7rWaAlwdU45y8MqvDp/PkZ02VT8b5MbyOiyMOwo3OTlb/qWgDMIIy/2pM
         k5URnymlAPDDajjuU8U+2ieS6Er3iGEzM/fvxbo6srk8Za+vWvrVasDTHTcbjCS/2upU
         UX0XAzmmn/mfgfvLF6y7v/QXPRbxi/0Eg7en3tC+7ARqwpB6enPIfv4RAiwBPNKgkeVc
         JYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cGnUjGVLO1r9iWfqXt0qpMvnwv69UZFpNplwLZdkJAQ=;
        b=AszYr1ZHFTD4AItTe/YYFRoI2c7qqBHaPz3CPb0NEQrq2U2+0kEsGevc1RCEPWLV0I
         jj4VrzxoWVDMTyDb/hWx0cFnFUDIK1h2Z0KiHzF6O20S7nB5+0cJmQn8B2YVEn0ApXdr
         HqvhyafevlolOedLqepKKh/iTzrCYF+AsT8IizPtni3dlkTx//++1Q/DHyk+F5g/BpfL
         yxtCiXS5ZtPvmg+whI21uqV1g5NSnG4/zCDMEACD8PpyCMn7QGckrt7qfeJKXVdVsbWU
         bd5BKNyelSeAWhBOZrBj+JL8EyB+mqqGy2wyVKLTm7x6o3D8SmF1UCPeP8Bzqz5mJRdn
         TrWQ==
X-Gm-Message-State: APjAAAVtM+sqo4KvCY0wbLnI7rakASOTYr/zcicbyuu7owCzkTSEBCAO
        ZNBmtpO0BISTBI4OEFCXgBTw/GVtLOzV9ZZevzlx5u7n
X-Google-Smtp-Source: APXvYqzbCi4Ksj39/SDAJziZE5nN7/gkHIfOflaSzE4I9bTml3VB+ii025a3tLvE5avSH9K0vL0tuDOv5ApcTnQwEMA=
X-Received: by 2002:a5d:5188:: with SMTP id k8mr20044605wrv.151.1581921947030;
 Sun, 16 Feb 2020 22:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20200217145711.4af495a3@canb.auug.org.au> <CAOFY-A1nfPjf3EcQB6KiEifbFR+aUtdSgK=CHGt_k3ziSG6T_Q@mail.gmail.com>
In-Reply-To: <CAOFY-A1nfPjf3EcQB6KiEifbFR+aUtdSgK=CHGt_k3ziSG6T_Q@mail.gmail.com>
From:   Arjun Roy <arjunroy@google.com>
Date:   Sun, 16 Feb 2020 22:45:35 -0800
Message-ID: <CAOFY-A3q_pmtHKAoOJdbB09wy=dxs9SdpXjCsU1wBxU5EDHVmw@mail.gmail.com>
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

On Sun, Feb 16, 2020 at 8:12 PM Arjun Roy <arjunroy@google.com> wrote:
>
> On Sun, Feb 16, 2020 at 7:57 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the akpm tree, today's linux-next build (sparc64 defconfig)
> > failed like this:
> >
> > mm/memory.c: In function 'insert_pages':
> > mm/memory.c:1523:56: error: macro "pte_index" requires 2 arguments, but only 1 given
> >    remaining_pages_total, PTRS_PER_PTE - pte_index(addr));
> >                                                         ^
> >
> > Caused by commit
> >
> >   366142f0b000 ("mm/memory.c: add vm_insert_pages()")
> >
> > This is the first use of pte_index() outside arch specific code and the
> > sparc64 version of pte_index() nas an extra argument.
> >
>
> Looks like this happens for sparc, and also metag. Other platforms
> just take the addr parameter based on a quick search.
>

And actually I guess there's no metag anyways now.
Looking further, then, it looks like in every non-sparc pte_index() is
an actual numerical index, while on sparc it goes a step further to
yield a pte_t *.
As far as I can tell, the sparc incarnation of this is only used by
the pte_offset_(kernel/map) macros.

So I think a possibly sane way to fix this would be:
1. Define pte_index() to be a numerical index, like the other architectures,
2. Define something like pte_entry() that uses pte_index(), and
3. Have pte_offset_(kernel/map) be defined as pte_entry() instead.

Then pte_index would be operating on just an address for all
platforms, and the reverted patchset would work without any changes.

If this sounds acceptable, I can send a patch.

Thanks!



> > I have reverted these commits for today:
> >
> >   219ae14a9686 ("net-zerocopy-use-vm_insert_pages-for-tcp-rcv-zerocopy-fix")
> >   cb912fdf96bf ("net-zerocopy: use vm_insert_pages() for tcp rcv zerocopy")
> >   72c684430b94 ("add missing page_count() check to vm_insert_pages().")
> >   dbd9553775f3 ("mm-add-vm_insert_pages-fix")
> >   366142f0b000 ("mm/memory.c: add vm_insert_pages()")
> >
>
> In terms of fixing this; passing in an appropriate dir parameter is
> not really a problem, but what is concerning that it seems messy to
> have a per-platform ifdef to pass it either two arguments or one in
> this case. But it seems like either that would be one way to fix it,
> or having some arch method across all arches that takes two arguments
> (and ignores one of them for most arches).
>
> Is there a general preference for the right way forward, in this case?
>
> Thanks,
> -Arjun
>
> > --
> > Cheers,
> > Stephen Rothwell
