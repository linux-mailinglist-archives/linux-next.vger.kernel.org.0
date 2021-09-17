Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7B440F3E1
	for <lists+linux-next@lfdr.de>; Fri, 17 Sep 2021 10:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235692AbhIQIQ7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Sep 2021 04:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhIQIQ6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Sep 2021 04:16:58 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B41C061574
        for <linux-next@vger.kernel.org>; Fri, 17 Sep 2021 01:05:25 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso11858254ots.5
        for <linux-next@vger.kernel.org>; Fri, 17 Sep 2021 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8TBdJtHgKKNE0SJ6m4JjwZ+pUMov7Rq43ETBcZVGRp4=;
        b=SXdOrMZuybo5tmTQJ6vMeJs0E3/IBzBd3s8LbNHU0uWm8DAUzESNIt02JhBawSbshz
         b3ExW2rwiP2GXtBSuvDFapw8PZjxa6zK2Dlx0eHj66jInxK7OwKYS6ttAugTMZBdM/EU
         IduAGBBTCSW7cLKK9USzNf7C5uRQB021XyqpIFyeM7Y8kApjrP900HdshXP/vtUQgUw8
         Q543DjGh0T4dLlq7THwcE8SLTM2svqnJZojNMQ8+PkmhwZBq6zPpCZJUj0srJnDBgVwE
         O9PRdmQOygimaTg7zPBBfzoMV1VIjeEx1DYA/uyifwWLBZDIW89gqe8xZyk66DJu3/t/
         4Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8TBdJtHgKKNE0SJ6m4JjwZ+pUMov7Rq43ETBcZVGRp4=;
        b=O6tTRcVaQv7q/s6evX7AsQoyFtw5tGrRRuYrl7omo7f6xRgcTLDOtXUV6q9AW+JBId
         asNlK/rwELeduYFMciUdQvXBBNp2FRA76iEnexc4FFEWrf6bKfyIIykCjZy/cL1LisBd
         /8QPWW6+YzRdJrt4eyrvocXehMBQyVyFy8Pa59CfyAQdY74KsSkOX4lx0qGJBvm1Mcjy
         h8IlMb9lMCp7CuligxT87hbWJaS9nv03+KY/zee/ua9lmvvZS6742TxhGy368W/7rpMC
         YRuXkEtSJ+jzLoIiqYac5PlYp22cbVD01ZDAkIAWOtpYSJOjvA8k349K0tfJYJ/1hV7Q
         N9DQ==
X-Gm-Message-State: AOAM533DbrSlWSx+aFV/+H76DMbAbX5HusUU/8Gnxd351m0Z/xMeHF2/
        t4WS3mnWOfmzJWo1p0G8IcHdtfGMeLlBATLJesGIbA==
X-Google-Smtp-Source: ABdhPJw1du8pLRNG9d/Pnd2etZxFKqQkvXIwKB7O57pzXOPeA/cidvYKOM9WxAuabEMh4jcAH3bVKbbTbq8juNdpvyw=
X-Received: by 2002:a9d:7244:: with SMTP id a4mr8609563otk.137.1631865924892;
 Fri, 17 Sep 2021 01:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000bc92ac05cb4ead3e@google.com> <CAJfpeguqH3ukKeC9Rg66pUp_jWArn3rSBxkZozTVPmTnCf+d6g@mail.gmail.com>
 <CANpmjNM4pxRk0=B+RZzpbtvViV8zSJiamQeN_7mPn-NMxnYX=g@mail.gmail.com> <CAJfpegvzgVwN_4a-ghtHSf-SCV5SEwv4aeURvK_qDzMmU2nA4Q@mail.gmail.com>
In-Reply-To: <CAJfpegvzgVwN_4a-ghtHSf-SCV5SEwv4aeURvK_qDzMmU2nA4Q@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 17 Sep 2021 10:05:13 +0200
Message-ID: <CACT4Y+ZmFyDOg0=gXv5G8mdqhz5gwcwA9jOVuWgLi2CiYQBzYQ@mail.gmail.com>
Subject: Re: [syzbot] linux-next test error: KASAN: null-ptr-deref Read in fuse_conn_put
To:     Miklos Szeredi <miklos@szeredi.hu>
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

On Mon, 6 Sept 2021 at 19:35, Miklos Szeredi <miklos@szeredi.hu> wrote:
> > On Mon, 6 Sept 2021 at 13:56, Miklos Szeredi <miklos@szeredi.hu> wrote:
> > > Thanks,
> > >
> > > Force pushed fixed commit 660585b56e63 ("fuse: wait for writepages in
> > > syncfs") to fuse.git#for-next.
> > >
> > > This is fixed as far as I'm concerned, not sure how to tell that to syzbot.
> >
> > Thanks -- we can let syzbot know:
> >
> > #syz fix: fuse: wait for writepages in syncfs
> >
> > (The syntax is just "#syz fix: <commit title>".)
>
> Yeah, but that patch has several versions, one of which is broken.
> Syzbot can't tell the difference just based on the title.

Hi Miklos,

For such cases it's useful to include Tested-by: tag into the commit
version that fixes the bug:
http://bit.do/syzbot#amend
