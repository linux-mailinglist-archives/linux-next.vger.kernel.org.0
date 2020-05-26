Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDBB1E23A2
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 16:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731373AbgEZOFL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 10:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728164AbgEZOFL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 10:05:11 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73CEC03E96E
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 07:05:10 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id f18so3850178qkh.1
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 07:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yVjyi+Dl6Ib7TNyktRRMybIZ1GTiUc0tAA7MlMwFug8=;
        b=OJZd2Nb9wNyTqA+eszkT33KVjwhkGG25BdWGQKikwIXwP6/shvDSz0RyAh1KxF6xfm
         zSGJSwDd7lf+2oMEHbg9JO1cWC1MqtGTX1faZKt2PVUyRfpRYEDaUr/+P8H8SNdhZ2rF
         2vUPXMHWkvbLLxG63hezArK8qZfcJC+/pD68s8B/v8JVmCb/vjLq3Lp/tJsGxnCA4U7T
         1PpOdUyhJG7m0zAou8hod7lYXO2b2HpMPEVD31AtSu8qVg9hY7KLMSXDgjIfTJT9vOdf
         YUBdop2CEaGOw4krV3RYF92wIUPsTb54qJVtGLTPL4ldxnhj+4xM6kauhxYRtZgqaM7A
         7Xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yVjyi+Dl6Ib7TNyktRRMybIZ1GTiUc0tAA7MlMwFug8=;
        b=Jr/1TkWHguuUubUGW1NzQXR0KuTPEuBOLHan9rwIARY5EtAEGBQXD2Ty37GZ5Xd5su
         IzpBT0N3ErBqTr6cOHAaZJ41rqwuugt/B7XYyvCfOsmxV1+zGZHWZiWTbPwFeHqvFJs5
         Aw2D6jI5OF3s9NkCzB4E3M8uWoJfUFl8AzEMu6u+OThlyDserOTXNTLZBp4HUUc96Lb0
         SbvHXPWiUUEyB7fap69U+9SAtWuRFcrQEebr8HCpOlCG5ygBQYNpppX8pxJ9389wAb45
         BUxrahmDqvFGyr8szjUAEudqOiQJtmxTKabGLRSfGUAhRnGBzzp/eCBCu+/KUMezoRoh
         48tw==
X-Gm-Message-State: AOAM530FfI1dYskrc6dGpwmwgsI5JbUrzRr3e2xiA8rentq2Rbw6sHsQ
        WmyIDV/WG5YsK2hTcrZoOEBQ406DcGjTJeMSRCfrdw==
X-Google-Smtp-Source: ABdhPJyNOBghCAy1UQZ5SG1gDGZ/H3KJTiOy4I+BXdU7SoNyZY48bzYNsiGIkxIfk9vk+iR+vJ+oAIzwNNaittDaeJs=
X-Received: by 2002:a05:620a:c89:: with SMTP id q9mr1439769qki.256.1590501909751;
 Tue, 26 May 2020 07:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+azkizw6QA0VCr0wv93oSkgaYCPc4txy9M=ivgBot1+zg@mail.gmail.com>
 <37C9957E-40A6-4C29-95FC-D982BABD26F6@lca.pw> <CACT4Y+audgm3QWaVW5uPZF08VXhhNZvtXcW+1cTww53gmWCsKA@mail.gmail.com>
 <20200526134953.GA991@lca.pw>
In-Reply-To: <20200526134953.GA991@lca.pw>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 26 May 2020 16:04:57 +0200
Message-ID: <CACT4Y+aMQ5HABw85W3gO2wdPeT2pZEamN9t=0Mo0ONiA=kxn8A@mail.gmail.com>
Subject: Re: linux-next build error (8)
To:     Qian Cai <cai@lca.pw>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs <linux-xfs@vger.kernel.org>,
        syzbot <syzbot+792dec47d693ccdc05a0@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 26, 2020 at 3:50 PM Qian Cai <cai@lca.pw> wrote:
> > > > On May 26, 2020, at 8:28 AM, Dmitry Vyukov <dvyukov@google.com> wro=
te:
> > > >
> > > > Crashes (4):
> > > > Manager Time Kernel Commit Syzkaller Config Log Report Syz repro C =
repro
> > > > ci-upstream-linux-next-kasan-gce-root 2020/05/22 01:23 linux-next
> > > > e8f32747 5afa2ddd .config log report
> > > > ci-upstream-linux-next-kasan-gce-root 2020/05/21 15:01 linux-next
> > > > e8f32747 1f30020f .config log report
> > > > ci-upstream-linux-next-kasan-gce-root 2020/05/19 18:24 linux-next
> > > > fb57b1fa 6d882fd2 .config log report
> > > > ci-upstream-linux-next-kasan-gce-root 2020/03/18 16:19 linux-next
> > > > 47780d78 0a96a13c .config log report
> > >
> > > You=E2=80=99ll probably need to use an known good kernel version. For
> > > example, a stock kernel or any of a mainline -rc / GA kernel to
> > > compile next-20200526 and then test from there.
> >
> > People also argued for the opposite -- finding bugs only on rc's is
> > too late. I think Linus also did not want bugs from entering the
> > mainline tree.
> >
> > Ideally, all kernel patches tested on CI for simpler bugs before
> > entering any tree. And then fuzzing finds only harder to hit bugs.
> > syzbot is a really poor CI and it wasn't built to be a one.
>
> I had only suggested it as a way to workaround/confirm this bug which
> will cause abormal memory usage for compilation workloads. Once you get
> a working next-0526 kernel, you should be able to use that to compile
> future -next trees.
>
> I would also agree that our maintainers should make the quality bar
> higher for linux-next commits, so I could get some vacations.

:)
true
