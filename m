Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D471A30CD63
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 21:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbhBBUzT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 15:55:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:43736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230002AbhBBUzS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Feb 2021 15:55:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F95B64F63;
        Tue,  2 Feb 2021 20:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612299277;
        bh=4HHsrCDo74ryI8ywcLVfheEXpm0QPZd039GzHqovadg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o2CuThgmdJFUGTAjxaFriCN6iNWFSMrbntITjGOEvGiD8roHzC0NHXiepULGopi5W
         qAjYHgOmN14J6eangARlUqJZS3uSl3hAmYA3rqjv5PYiYbR/pIUxzeJ0nfAtbjc52X
         BMqbI7Iq67GMk6CtdneOmmwwU9xd0mnjpb4mLbiEB998uO++K4Pn0Ntqo++vsx5LGC
         ocW7J+fwdAFllSlRWzY7UOFuInrU3E7FpeS1wy1qaUFuKUMOAQjBIGE7f0+h1p4mhk
         nf5+iWwtoTFJlVj6Yfj/f8nrkGe83qs73f9XxnBLf7xhDUzKBmMdgNDzaMkBAx2F92
         dyTwuSxepIhjA==
Received: by mail-oo1-f49.google.com with SMTP id 123so2210813ooi.13;
        Tue, 02 Feb 2021 12:54:37 -0800 (PST)
X-Gm-Message-State: AOAM533hNxwXpTkToW1TBPJvjBeLUJ9CjErjlNRigcnax8893pFW025X
        57/DGCaku9CTGoQ/6qf2Q8LqbBZZpBb2r6lHam0=
X-Google-Smtp-Source: ABdhPJzHPK/eo9vIiYQHrcTsH3CajEML7BO0+2TKKvaIHgZp9CT926/PY36AW00VTwf6VO/SKOsTCACocNyeByH3H1A=
X-Received: by 2002:a4a:870c:: with SMTP id z12mr9997174ooh.15.1612299276343;
 Tue, 02 Feb 2021 12:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20210203065754.6b351c79@canb.auug.org.au> <20210203070455.6e9a9a52@canb.auug.org.au>
In-Reply-To: <20210203070455.6e9a9a52@canb.auug.org.au>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 2 Feb 2021 21:54:20 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1577heE9=XzyaxXa-qMBPmvtNLafDWj-suvuS1cdtW_Q@mail.gmail.com>
Message-ID: <CAK8P3a1577heE9=XzyaxXa-qMBPmvtNLafDWj-suvuS1cdtW_Q@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 2, 2021 at 9:04 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Wed, 3 Feb 2021 06:57:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Commit
> >
> >   4e238bfd83f3 ("ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode")
> >
> > is missing a Signed-off-by from its committer.
>
> This is actually in the arm-soc-fixes tree, sorry.

Ok, thanks for letting me know. I've removed it from the arm-soc-fixes tree
now (it's still in for-next for the moment, but I won't send that to Linus).

Maxime, can you resend the bugfix as a patch or pull request with your
signoff added?

        Arnd
