Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB9C30E5FB
	for <lists+linux-next@lfdr.de>; Wed,  3 Feb 2021 23:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbhBCWX0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 17:23:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:50338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229897AbhBCWXZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Feb 2021 17:23:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE2B164E0F;
        Wed,  3 Feb 2021 22:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612390964;
        bh=XO0wdCHXzxV6yvtYSxeRPREOhVI5fEsJpEPXjNUjYz4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mXhpRgmw8sd6tacSJXYOtsjOihpE5xYXVX5wkmSqHCDR2zDAdoG8JPXf3wddFF3OA
         k88AdWwXwdHazjkzNLbpA/Ln9iruTkA8zIWF2cBx6UKdemsYPprQZziT5rNgujRWMA
         B/wbxnpP9oSSNk9++r7T4317RPXcgNBTvd6H8iNJvgZUCSiX4TVAz7+VknsV1k+w3t
         TOoSzRiaRFp9wjAH5qZk8JcemCNKiFdxh2vgLAt1PEsJqHf4Z0qRnP3i40lujCLP+T
         KLdI/SvC6rieVod4s5tHbZBGyDo//pmkJpECsr9mURLCETcik3JwJMMPpCFb1J1dAW
         97387svYuIU5Q==
Received: by mail-ot1-f52.google.com with SMTP id y11so1486885otq.1;
        Wed, 03 Feb 2021 14:22:44 -0800 (PST)
X-Gm-Message-State: AOAM5314L4fwEiHh4HyHuWqwy+W3kABDo/aJnWDiAzI9VPVOSrZVaNeE
        0TkGatRi7A4uAkV1C/NnikC5E+4dgFpnRio8eWI=
X-Google-Smtp-Source: ABdhPJx+NqOG+T1UufYFjVVMgCtbdBrBIgwZVWaW6FgxuBo4KydU72UQfKaeMCwYKnIjLiX6Rg/RN0tkwfLJWNabFNo=
X-Received: by 2002:a05:6830:1256:: with SMTP id s22mr3622137otp.251.1612390964128;
 Wed, 03 Feb 2021 14:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20210202200324.5179db33@canb.auug.org.au> <CAK8P3a3uJfyt6vsgTdSjnE23V4E_Mw=N89nrMPLJ6bhA363nqw@mail.gmail.com>
 <5504da4f-7eec-ecb0-c47d-7821d06dc880@infradead.org>
In-Reply-To: <5504da4f-7eec-ecb0-c47d-7821d06dc880@infradead.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 3 Feb 2021 23:22:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Y9-5dhk1MaZhhnKQkbOtqOSqfqZA0c4ncBXgD8tJTZg@mail.gmail.com>
Message-ID: <CAK8P3a2Y9-5dhk1MaZhhnKQkbOtqOSqfqZA0c4ncBXgD8tJTZg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 3, 2021 at 6:34 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 2/3/21 9:09 AM, Arnd Bergmann wrote:
> > On Tue, Feb 2, 2021 at 10:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> >>
> >>   983cb10d3f90 ("mm/gup: do not migrate zero page")
> >>
> >> I have applied the following patch for today:
> >>
> >> From: Stephen Rothwell <sfr@canb.auug.org.au>
> >> Date: Tue, 2 Feb 2021 19:49:00 +1100
> >> Subject: [PATCH] make is_pinnable_page a macro
> >>
> >> As it is currently defined before page_to_section() which it needs.
> >>
> >> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >
> > I still see the same problem in next-20210203, and your patch below
> > fixes it for me.
> > Did you drop it from the latest build?
> >
>
> After the most recent build errors, I tried to apply Pavel's patch
>   https://lore.kernel.org/linux-mm/CA+CK2bBjC8=cRsL5VhWkcevPsqSXWhsANVjsFNMERLT8vWtiQw@mail.gmail.com/
> but patch said that it was already applied (by Andrew I think),
> so I bailed out (gave up).

As far as I can tell, there are two different bugs that got mixed up, and
we need both Pavel's patch (which is now in -next) and Stephen's
(which got dropped again).

        Arnd
