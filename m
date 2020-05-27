Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6201E3866
	for <lists+linux-next@lfdr.de>; Wed, 27 May 2020 07:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725265AbgE0Fla (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 May 2020 01:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0Fl3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2020 01:41:29 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C3CC03E96E
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 22:41:28 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id dh1so10621480qvb.13
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 22:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M2aTT5Nv3FXEPFh2JJe44aTAOxSMdCv80afdguaqIkY=;
        b=qaCZhtsZNlXPQG00DYSrt6n++VDFnN3EVSVymSzI82aPVz2l9biXUXQurA9qpUqBjR
         VEOfTaG+/ZGDLBEtMGU9WoNuI5ki+TLaOa+Wdy6xgHhp+OmvUwMu0p4KFz0uJ52Brxk5
         sq1A66ns/Hdq4mQDWzKYsPakSkZzr6gYXQyktCjBeItfs48XW5uMgjcOIT/03wFM1JLq
         7RL2U4+r7J2X1L0zZwGqnZLyLQaH0hkTDfcosMmA5/462rpPP2YZ89w+KCXs2aiqQuqJ
         KGjPQyLkKjU7vlk96VydliV/lncYpK28fCKJOevIgFOVCV0iT4qV1qSZDp4o1zQgswiz
         3eaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2aTT5Nv3FXEPFh2JJe44aTAOxSMdCv80afdguaqIkY=;
        b=FvXkV8h+D6So1QYbvmpwD5Ds9UDXYI5j+o1D1t5NAT3/GKpv92FtkHFxC9Sun5zody
         9WR87qY5TNhUt/XeP764c2q66t8gIDEhsQQMGBheIdAZmurUy+sCDN3Bl459p1NZ3KR6
         PMBsZiJQpemoPl0yJmO+J9hvF+2wchLLLczpJMYDtrFjx9EUxGVxuD5Fsak1lNioLvjy
         5MUqucMlcUcWT/6y5E78LyhYEd/T55UckZp7m5f+r5ygoasQ9egr4RiFNSabdduq+Ovt
         algCERibWG+MnPekrE5j+LFKiYY04g0l2FS8AAy8bWp8zBjEdOY7gQ0/LdW9a9hotFbd
         OIWA==
X-Gm-Message-State: AOAM530jpZ4Opze4QAnUPXaUIUTpBp/TfXeu1GCQqv16HwQmWpLE3SpO
        cGqQPRD/bY7VTs+w8ZJnyE6NPyOD6KbkT4yE+gLNTjwzguk=
X-Google-Smtp-Source: ABdhPJyCEcEPeu3HP9nplLc1370wyVcPvqhhlVs66nEWfSNz3q8Xf1g4QCnVgutaFM/FSiBWYPco1wNV9K4mdH6hZwA=
X-Received: by 2002:a05:6214:15ce:: with SMTP id p14mr23802697qvz.159.1590558087273;
 Tue, 26 May 2020 22:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ae2ab305a123f146@google.com> <3e1a0d59-4959-6250-9f81-3d6f75687c73@I-love.SAKURA.ne.jp>
 <CACT4Y+ap21MXTjR3wF+3NhxEtgnKSm09tMsUnbKy2_EKEgh0kg@mail.gmail.com> <20200527093302.16539593@canb.auug.org.au>
In-Reply-To: <20200527093302.16539593@canb.auug.org.au>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 27 May 2020 07:41:15 +0200
Message-ID: <CACT4Y+ZFsQq65jZDRKA1rQs-GM9cyFu9Cn6y=kbx21mCryBqqA@mail.gmail.com>
Subject: Re: linux-next build error (8)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs <linux-xfs@vger.kernel.org>,
        syzbot <syzbot+792dec47d693ccdc05a0@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 27, 2020 at 1:33 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Dmitry,
>
> On Tue, 26 May 2020 14:09:28 +0200 Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > On Fri, May 22, 2020 at 6:29 AM Tetsuo Handa
> > <penguin-kernel@i-love.sakura.ne.jp> wrote:
> > >
> > > Hello.
> > >
> > > This report is already reporting next problem. Since the location seems to be
> > > different, this might be caused by OOM due to too much parallel compilation.
> > > Maybe syzbot can detect "gcc: fatal error: Killed signal terminated program cc1"
> > > sequence and retry with reduced "make -j$NUM" settings.
> > >
> > >   gcc: fatal error: Killed signal terminated program cc1
> > >   compilation terminated.
> > >   scripts/Makefile.build:272: recipe for target 'fs/xfs/libxfs/xfs_btree.o' failed
> > >   make[2]: *** [fs/xfs/libxfs/xfs_btree.o] Error 1
> > >   make[2]: *** Waiting for unfinished jobs....
> >
> > +linux-next and XFS maintainers
>
> What version of linux-next is this?  There was a problem last week with
> some changes in the tip tree that caused large memory usage.

Hi Stephen,

Detailed info about each syzbot crash is always available over the
dashboard link:

https://syzkaller.appspot.com/bug?extid=792dec47d693ccdc05a0
Crashes (4):
Manager Time Kernel Commit Syzkaller Config Log Report Syz repro C repro
ci-upstream-linux-next-kasan-gce-root 2020/05/22 01:23 linux-next
e8f32747 5afa2ddd .config log report
ci-upstream-linux-next-kasan-gce-root 2020/05/21 15:01 linux-next
e8f32747 1f30020f .config log report
ci-upstream-linux-next-kasan-gce-root 2020/05/19 18:24 linux-next
fb57b1fa 6d882fd2 .config log report
ci-upstream-linux-next-kasan-gce-root 2020/03/18 16:19 linux-next
47780d78 0a96a13c .config log report
