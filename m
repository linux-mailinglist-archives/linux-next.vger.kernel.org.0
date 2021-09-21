Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCD7412E74
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 08:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhIUGDw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Sep 2021 02:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbhIUGDv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Sep 2021 02:03:51 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BD8C061574
        for <linux-next@vger.kernel.org>; Mon, 20 Sep 2021 23:02:23 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id d10so7567854vke.10
        for <linux-next@vger.kernel.org>; Mon, 20 Sep 2021 23:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tx7fb1MOs9zUtWn1zJhDIN5dk3mAQEYxorYZ8+X+vIU=;
        b=f/KD+OHdENjDvBAOVRy8kQ8IM5QtlCkiEXFqLijjtfX1qg78PhN3iXherpxHsmmbMn
         uv7HJgekiXWADoKlpxPohoZaHOCjhY1agcQpJBMlJ8oh4EzdUHix8ykG9mSyqhZAgYUj
         NFTuJSBmC+4Qw/B4bU0k24r4EhcVGnJ347qAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tx7fb1MOs9zUtWn1zJhDIN5dk3mAQEYxorYZ8+X+vIU=;
        b=tY5mSpfl2dIzX+32xXENkonFPcds6FVTLHCQqXAhuEk2vMhDY+nORINHJBdjVO9QMf
         gFnnmCGsiZkfX8x3bu6QzWtmyQXFt7VclyH5E48T+s2/nWijPTgGsIoimoYPT3jfwXSy
         wl++KRmi1/tfbNA2uQqL5Z3EssVOoKsS7ePtPrsbDVzBKIAaOitpqm5TnudOSD9uesre
         n/BZVRc2PxxUaWmgRSewE+pouYUEF0a5yQFqBvN8MuTY0E9Q+ZbsLT+HsIOsmrp8vHNx
         YbLqB5WbDSTobzz/qKhO0yroRQiMuQzGqvTx9De+Tb5cU3CCW34YI15FbGASi67nrfuj
         Vpfg==
X-Gm-Message-State: AOAM532X3j38K+bDsRZR2Lje48AidVjHimgejIjGxYt54enWc7Dp9vv3
        vcSMoYg37xYYdtYxr2nCsdPxcxVQiyS6HHAzuXt+yQ==
X-Google-Smtp-Source: ABdhPJyAsob4XSRNrpewDShQPtYhTxxn2Yiir5NhAr7KXJ4vVHfMqKapvRgMUFpy42/yzx3yP5UhlzExXVAMpS9A0gs=
X-Received: by 2002:a1f:2209:: with SMTP id i9mr5128679vki.14.1632204142949;
 Mon, 20 Sep 2021 23:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000bc92ac05cb4ead3e@google.com> <CAJfpeguqH3ukKeC9Rg66pUp_jWArn3rSBxkZozTVPmTnCf+d6g@mail.gmail.com>
 <CANpmjNM4pxRk0=B+RZzpbtvViV8zSJiamQeN_7mPn-NMxnYX=g@mail.gmail.com>
 <CAJfpegvzgVwN_4a-ghtHSf-SCV5SEwv4aeURvK_qDzMmU2nA4Q@mail.gmail.com> <CACT4Y+ZmFyDOg0=gXv5G8mdqhz5gwcwA9jOVuWgLi2CiYQBzYQ@mail.gmail.com>
In-Reply-To: <CACT4Y+ZmFyDOg0=gXv5G8mdqhz5gwcwA9jOVuWgLi2CiYQBzYQ@mail.gmail.com>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Tue, 21 Sep 2021 08:02:12 +0200
Message-ID: <CAJfpegtgfAL=8Z76JKwJpT10cYu8zd+_vtokk2CDbFw51Q4-dg@mail.gmail.com>
Subject: Re: [syzbot] linux-next test error: KASAN: null-ptr-deref Read in fuse_conn_put
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Marco Elver <elver@google.com>,
        syzbot <syzbot+b304e8cb713be5f9d4e1@syzkaller.appspotmail.com>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 17 Sept 2021 at 10:05, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, 6 Sept 2021 at 19:35, Miklos Szeredi <miklos@szeredi.hu> wrote:
> > > On Mon, 6 Sept 2021 at 13:56, Miklos Szeredi <miklos@szeredi.hu> wrote:
> > > > Thanks,
> > > >
> > > > Force pushed fixed commit 660585b56e63 ("fuse: wait for writepages in
> > > > syncfs") to fuse.git#for-next.
> > > >
> > > > This is fixed as far as I'm concerned, not sure how to tell that to syzbot.
> > >
> > > Thanks -- we can let syzbot know:
> > >
> > > #syz fix: fuse: wait for writepages in syncfs
> > >
> > > (The syntax is just "#syz fix: <commit title>".)
> >
> > Yeah, but that patch has several versions, one of which is broken.
> > Syzbot can't tell the difference just based on the title.
>
> Hi Miklos,
>
> For such cases it's useful to include Tested-by: tag into the commit
> version that fixes the bug:
> http://bit.do/syzbot#amend

Okay, will do that next time.

Thanks,
Miklos
