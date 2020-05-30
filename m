Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53EBE1E9085
	for <lists+linux-next@lfdr.de>; Sat, 30 May 2020 12:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgE3K0L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 30 May 2020 06:26:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:50172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727964AbgE3K0L (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 30 May 2020 06:26:11 -0400
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 420BA206C3;
        Sat, 30 May 2020 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590834370;
        bh=qpIhrjxX7fpt7ny6L7uoRjwGWm1NUkhdO2sJBF8w/K0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GD+cm5TH628DEzzAdY5Pq+KZasXbd1bTCZSWvsaUJ1iS3YSRPPciXRzSlV1rg0K/n
         8QXrExBdg78BqXwXUH1zoWAtaCmU6fiMbQWCfCaeM0sQY6uHLJEY2YSDU76u0sW+Wh
         QsUoaRd4VAnaM7p0UPUcWXXc3+Py/KyC20Yvsrk8=
Received: by mail-il1-f174.google.com with SMTP id a14so4977278ilk.2;
        Sat, 30 May 2020 03:26:10 -0700 (PDT)
X-Gm-Message-State: AOAM533x3tuV55XyZVW6uWVH1imwlNcj9lm1BeDTknm7cJVrl1KaRptX
        GWXqvr6k8Nv1XCj6dVD1uYhRii9mGTCtolYYUQc=
X-Google-Smtp-Source: ABdhPJy1rDAkgWmyKponk5hrEz7ly1AmIqZFZGWluE0vDPci+LPVy4I9eifrarrvk7exhHc9Xw8Se5xtYpKsrmblndQ=
X-Received: by 2002:a92:bb55:: with SMTP id w82mr11824336ili.211.1590834369711;
 Sat, 30 May 2020 03:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200528090941.341ad93a@canb.auug.org.au> <20200527232257.GS1551@shell.armlinux.org.uk>
 <CAMj1kXHRi3zUq-j30ptqUifOs+sn_h8i4ic+8xT9q1SrC+rjsw@mail.gmail.com>
 <20200530084103.GC1551@shell.armlinux.org.uk> <CAMj1kXEBcH4eW9dL95mfwTTUArxZxmWdjcqmzVeXjUPzat0YeA@mail.gmail.com>
 <20200530091747.GD1551@shell.armlinux.org.uk>
In-Reply-To: <20200530091747.GD1551@shell.armlinux.org.uk>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Sat, 30 May 2020 12:25:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHmv9pkRB-UJ43rJkRz_r8v48Ufbt-FRmsyjCbR9DjZVg@mail.gmail.com>
Message-ID: <CAMj1kXHmv9pkRB-UJ43rJkRz_r8v48Ufbt-FRmsyjCbR9DjZVg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the arm tree with Linus' tree
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, 30 May 2020 at 11:17, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Sat, May 30, 2020 at 10:51:32AM +0200, Ard Biesheuvel wrote:
> > On Sat, 30 May 2020 at 10:41, Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Thu, May 28, 2020 at 09:01:55AM +0200, Ard Biesheuvel wrote:
> > > > On Thu, 28 May 2020 at 01:23, Russell King - ARM Linux admin
> > > > <linux@armlinux.org.uk> wrote:
> > > > >
> > > > > Ard,
> > > > >
> > > > > Please take a look.  Obviously, whatever the resolution is going to be
> > > > > needed when Linus opens the merge window.
> > > > >
> > > >
> > > > Sorry for that.
> > > >
> > > > I have pushed the signed tag below to resolve it. Those changes were
> > > > already in v5.7-rc2, so I wouldn't expect this to cause more trouble.
> > > > If you prefer, you could merge v5.7-rc2 into your tree directly
> > > > instead.
> > >
> > > In light of Stephen's report of a different conflict on the 29th, I
> > > haven't pulled this.  I don't know if that's a side effect of this
> > > change having been picked up by -next or not.
> > >
> >
> > Fair enough. Both conflicts are unambiguous and self explanatory so I
> > don't think it should be a problem, right?
>
> I don't know - I don't have a resolution for the first one, Stephen
> didn't provide a 3-way diff with his report, and I was expecting a
> 3-way diff from you for it rather than another pull request.
>

That was not clear to me.

> I now also don't know whether the conflict on the 28th still exists
> or not.
>

Yes it does. That conflict is with v5.7-rc2, which exists because your
tree is based on v5.7-rc1, and so a fix that arrived in the mean time
is touching some of the lines that are being removed in v5.8.

That is why I mentioned that you could preempt this by merging
v5.7-rc2 into your tree as well.

> I'm completely confused, and I'm considering dropping the original
> EFI pull request on the grounds that the merge window opens tomorrow,
> and there isn't going to be another -next before that happens, so we
> don't know what's going to happen whatever action we take.
>

The other conflict is with the EFI changes queued up for v5.8 in the
-tip tree. The pr_efi_err() function was renamed to efi_err(), which
was used in a lot of places. This is slightly annoying, but rather
straightforward to resolve.

In any case, I am happy to go along with whatever you feel is best.
