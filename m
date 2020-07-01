Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08A4E2109C0
	for <lists+linux-next@lfdr.de>; Wed,  1 Jul 2020 12:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729908AbgGAKys (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Jul 2020 06:54:48 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33241 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729892AbgGAKyr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2020 06:54:47 -0400
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 061AsSZ4011733;
        Wed, 1 Jul 2020 19:54:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 061AsSZ4011733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593600869;
        bh=A6uk0LVabw4p6RBBaWE+21lAHhKMnw5ycMt+myfy300=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=10ODLjJribOWq7jnMmdg7a61KeFnyMcyXY6t8C4AQqMldAB+PKznauq6RK4LsG1FL
         ExOqOlWA2GvpiPWzW2A4OzbXfzoYCNPThTPG+oqYSXoqmnS/Cqgic4o2v67YisbuBu
         yZqUL74U0U5RyppWtfD2kffTG/guhR4/IHZw0zu3knI5lM9bCtbhf8EzAskdfOLnw1
         60gsALE4FVDM7iYRUFmKsnm+BrS/3PsDhfvxKXYTkAdkb28BL4A3foEic4vEzz2b+n
         P3LpoVQuxgoVH+u6TEo3BUn9Elqb1AouVMBbIu7vG2NdqikGN5zKc9krqzhImoalpF
         gfUvnpI3dpq0Q==
X-Nifty-SrcIP: [209.85.221.177]
Received: by mail-vk1-f177.google.com with SMTP id d64so5361534vke.4;
        Wed, 01 Jul 2020 03:54:28 -0700 (PDT)
X-Gm-Message-State: AOAM5327zwgIrDasXkkyJgSMko2UrpRJHo/h875kXtk6rqqe3JFDrPXz
        NwTWYW69mTGCjWrGx4UMLoKCopefZLTV/15iJu0=
X-Google-Smtp-Source: ABdhPJzEbQbvlLwPi5eSQ/ja5pxAvFFGm84VH74ihD+yI+MOGCFmZrnPrx5yRl/8Ih8eFU6t/Ku3k0hujk5aZQt+b3I=
X-Received: by 2002:ac5:c74b:: with SMTP id b11mr4735766vkn.73.1593600867304;
 Wed, 01 Jul 2020 03:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200701113448.3119f64f@canb.auug.org.au> <CANpmjNMz0rtC7AnXUnZKfg+egqqQ3BKPznsWUdEqJQDLTgAaAQ@mail.gmail.com>
In-Reply-To: <CANpmjNMz0rtC7AnXUnZKfg+egqqQ3BKPznsWUdEqJQDLTgAaAQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 1 Jul 2020 19:53:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_X2Kmgqc3B1m7g1K8Xnvo+ja3A11eZXRFAOqDC4Jxcw@mail.gmail.com>
Message-ID: <CAK7LNAQ_X2Kmgqc3B1m7g1K8Xnvo+ja3A11eZXRFAOqDC4Jxcw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rcu tree with the kbuild tree
To:     Marco Elver <elver@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 1, 2020 at 2:52 PM Marco Elver <elver@google.com> wrote:
>
> On Wed, 1 Jul 2020 at 03:34, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the rcu tree got a conflict in:
> >
> >   kernel/kcsan/Makefile
> >
> > between commit:
> >
> >   f7c28e224da6 ("kbuild: remove cc-option test of -fno-stack-protector")
>
> Is it possible that this patch drops the KCSAN portion?


Done.

Thanks.


> The patch
> "kcsan: Simplify compiler flags" does the same, but is part of a
> future pull request intended for 5.9.
>
> The KCSAN changes had been in -next for well over a week. Also, I'm
> sorry I hadn't seen your patch before, otherwise I would have noticed
> this.
>
> Please see: https://lkml.kernel.org/r/20200624190236.GA6603@paulmck-ThinkPad-P72
>
> > from the kbuild tree and commits:
> >
> >   2839a232071f ("kcsan: Simplify compiler flags")
> >   61d56d7aa5ec ("kcsan: Disable branch tracing in core runtime")
> >
> > from the rcu tree.
> >
> > I fixed it up (I just used the rcu tree version) and can carry the fix
> > as necessary. This is now fixed as far as linux-next is concerned, but
> > any non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
>
> Thank you!
>




-- 
Best Regards
Masahiro Yamada
