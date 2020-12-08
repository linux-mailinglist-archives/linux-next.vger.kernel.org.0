Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11EE2D2A45
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 13:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbgLHMGb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 07:06:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:48400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727650AbgLHMGb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Dec 2020 07:06:31 -0500
X-Gm-Message-State: AOAM530MM9bJ3p17rIxT8cd7MOBUxujphPzSSRUWLsO6KYbd1G6dAdkt
        4PL18k+OBTY5KWUSBPB9IVF7G2iBZN5jOGK4rbY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607429150;
        bh=BZSDtgv8uiyX+1Mw0OiobF0lbqT+jcZtpIrLrkHPrXo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N5ZgCFtRK8jeBnI9mDIZK2KuFSzLNe6P3QJbIjJZQoBBzy/7via7yqRYhUtdvU2xe
         EdZ1ap95nIN3d2uJPKRcjqkQa/YCDgqFjt1xXhOUl1HuIFVvm5tJt2ek9zXgol5xUt
         sSj9Zs6V9n5A7zB4iGUc3J4hBEipZd1Ok7cjPfOZ7qgk3z42nCCnN6KVdNqlw0a2IW
         QEC/ir1lkb3C9rW07zTBjln+St8L/4Myaiu/u3ULZilXzirCL557fLiene2z2DQpL6
         4ql4wIghrZilObwpKRAENVKN/8LXsmajXbUPyDVP3QjrR1xqJkyhuaG5LxqOwBkTbL
         JwSEEQy7f/38A==
X-Google-Smtp-Source: ABdhPJzY+vJd5ufIYfMkw25ddvyeTgQrcFf17mvSFGIj6UNsAHqD5rL1LzADyAUwYg6xvvKoyipcnGGKeBmOcDh+poE=
X-Received: by 2002:a05:6820:41:: with SMTP id v1mr2815402oob.41.1607429149947;
 Tue, 08 Dec 2020 04:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20201208223919.18a80092@canb.auug.org.au> <CAMj1kXHmQV+CCMS7HAnZP-4U=j3jSq83tvX+2O9ke8biJUcCvg@mail.gmail.com>
 <20201208120355.GQ1551@shell.armlinux.org.uk>
In-Reply-To: <20201208120355.GQ1551@shell.armlinux.org.uk>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 8 Dec 2020 13:05:39 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHkvwr9=+AwNnxfMy8EosUgj1Hsp=g2YqqhwqQRsyauGA@mail.gmail.com>
Message-ID: <CAMj1kXHkvwr9=+AwNnxfMy8EosUgj1Hsp=g2YqqhwqQRsyauGA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the arm tree
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 8 Dec 2020 at 13:04, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Tue, Dec 08, 2020 at 01:02:05PM +0100, Ard Biesheuvel wrote:
> > On Tue, 8 Dec 2020 at 12:39, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > In commit
> > >
> > >   4812d516af55 ("ARM: 9027/1: head.S: explicitly map DT even if it lives in the first physical section")
> > >
> > > Fixes tag
> > >
> > >   Fixes: 149a3ffe62b9dbc3 ("9012/1: move device tree mapping out of linear region")
> > >
> > > has these problem(s):
> > >
> > >   - Target SHA1 does not exist
> > >
> > > Maybe you meant
> > >
> > > Fixes: 7a1be318f579 ("ARM: 9012/1: move device tree mapping out of linear region")
> > >
> >
> > Oops, my bad.
> >
> > I think we can drop the Fixes tag entirely - I added it to the patch
> > when I sent it to the mailing list because it fixes a patch that had
> > already been queued up by Russell at that point. However, I don't
> > think it is that important to capture this relation in the future,
> > given that they will all end up in the same mainline -rc
>
> I've already dropped it and fixed the SHA1 reference in the commit
> message.
>

OK, thanks.
