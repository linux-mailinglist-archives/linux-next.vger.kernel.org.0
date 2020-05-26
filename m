Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05741E2350
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 15:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbgEZNuB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 09:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729418AbgEZNuB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 09:50:01 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9D3C03E96E
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 06:50:00 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id v15so9432799qvr.8
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8fJRiPAc3HDtyhiCAoUiDnY6LS5y4g0laHXS3FIiskU=;
        b=YExECrTnk+mF5c2HK2Lh1qB2UDnoe4QyXjbydDneUnPHu428wtPSwlrQZXFentZV44
         f6BnSjWlZNwvvj0iiNxZMhEW+ds1BnaKZrFsjzdARdhUaNqWlNjd8cby9xzAquqHjPx6
         XD7BtvY71j1jntRg37nWc1jymJZmjWfWo4soLs1tHzhS80rHNBORT9HRKDwTHty72Y30
         d0tSEjBeTuHp23rXTosBG/3t7fP6/91i8ld2tplnkzQHF2uD5sDeZlAXkBV4x/lhC7B+
         P0TTecnYDN6FZfAZ8jtAewragrQlbRs5JmrmeCnUaDuQWXnjQHoOiG+aF0nUKmftDNtM
         9kCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8fJRiPAc3HDtyhiCAoUiDnY6LS5y4g0laHXS3FIiskU=;
        b=KAXR45ap19a6LzCC5wUY8lB6yASqWJ+pNjqF+Gu9JpkFP4pjiTbKYnFIKiyjC5Ony/
         lSvNo3YP4BGbmre5KTi1Io0f8j3SkJuuU7+SaIfZ5XyAXo+bmMBsj9k0bVqTy0Ds5xE7
         zmnV6fKrtUrXxyzXIuRxhktkKGVj8KFRL9WU4GwrvhwLWiYFCqH6NlAmtNTxboLgXSHC
         Qd5R/kWgzha7n/dSbeYPox30pVCV1YDKLR3LM9DPFehpEpUtrQowT0VbcOK4tYgrCHPK
         9J2Vp4IsH5l85tdB5euiC+/thka9FWWVHL8ARmGrUA9ohaPK/k5TQrD5DXvarngBOwrZ
         SLLw==
X-Gm-Message-State: AOAM530qSNRcJhFbl6ALxezqH6EEDOv8EwubKoMasVd1g7FWcKyoCui/
        hf4LI99bK0kFWasWBPKQAl+kPA==
X-Google-Smtp-Source: ABdhPJyV+NcXxBYWZhnPXkt80xxfhiAFWQOiezvus6kmRl+IjrZMtqBf6RcPX5KSurs0dI/iRysHyg==
X-Received: by 2002:a0c:e4d4:: with SMTP id g20mr18913293qvm.228.1590500999975;
        Tue, 26 May 2020 06:49:59 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id z10sm17786315qtu.22.2020.05.26.06.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 06:49:59 -0700 (PDT)
Date:   Tue, 26 May 2020 09:49:53 -0400
From:   Qian Cai <cai@lca.pw>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs <linux-xfs@vger.kernel.org>,
        syzbot <syzbot+792dec47d693ccdc05a0@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: linux-next build error (8)
Message-ID: <20200526134953.GA991@lca.pw>
References: <CACT4Y+azkizw6QA0VCr0wv93oSkgaYCPc4txy9M=ivgBot1+zg@mail.gmail.com>
 <37C9957E-40A6-4C29-95FC-D982BABD26F6@lca.pw>
 <CACT4Y+audgm3QWaVW5uPZF08VXhhNZvtXcW+1cTww53gmWCsKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACT4Y+audgm3QWaVW5uPZF08VXhhNZvtXcW+1cTww53gmWCsKA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 26, 2020 at 03:26:40PM +0200, Dmitry Vyukov wrote:
> On Tue, May 26, 2020 at 2:41 PM Qian Cai <cai@lca.pw> wrote:
> >
> >
> >
> > > On May 26, 2020, at 8:28 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
> > >
> > > Crashes (4):
> > > Manager Time Kernel Commit Syzkaller Config Log Report Syz repro C repro
> > > ci-upstream-linux-next-kasan-gce-root 2020/05/22 01:23 linux-next
> > > e8f32747 5afa2ddd .config log report
> > > ci-upstream-linux-next-kasan-gce-root 2020/05/21 15:01 linux-next
> > > e8f32747 1f30020f .config log report
> > > ci-upstream-linux-next-kasan-gce-root 2020/05/19 18:24 linux-next
> > > fb57b1fa 6d882fd2 .config log report
> > > ci-upstream-linux-next-kasan-gce-root 2020/03/18 16:19 linux-next
> > > 47780d78 0a96a13c .config log report
> >
> > You’ll probably need to use an known good kernel version. For
> > example, a stock kernel or any of a mainline -rc / GA kernel to
> > compile next-20200526 and then test from there.
> 
> People also argued for the opposite -- finding bugs only on rc's is
> too late. I think Linus also did not want bugs from entering the
> mainline tree.
> 
> Ideally, all kernel patches tested on CI for simpler bugs before
> entering any tree. And then fuzzing finds only harder to hit bugs.
> syzbot is a really poor CI and it wasn't built to be a one.

I had only suggested it as a way to workaround/confirm this bug which
will cause abormal memory usage for compilation workloads. Once you get
a working next-0526 kernel, you should be able to use that to compile
future -next trees.

I would also agree that our maintainers should make the quality bar
higher for linux-next commits, so I could get some vacations.
