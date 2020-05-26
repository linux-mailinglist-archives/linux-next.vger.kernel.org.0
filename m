Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0038B1E22E7
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 15:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgEZN0y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 09:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgEZN0x (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 09:26:53 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCBFC03E96D
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 06:26:53 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id l3so9387965qvo.7
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Hmk6B8RUrIkz34C6PI8M98ThJVUuA5TDqt8agn6fqa4=;
        b=iDC+dqwtGL081U3BfohJc37CT4UlL3Od68C7HeX4CSkaSvXZhXO2RXuPnOUac824BD
         RZ8GI1L0xz3zOknKy+MHzsb343uIeuqR/0Z4vRkMp32hv1a9WeyHihfOCscx2AvC3XwR
         StBYwd2tLzmOvbSdVUySPtnMAXI9w12nYNOduf3pSynRu6GVPRBciOqkq8QWKZDp7sQz
         ebHR3Fg2UoNprP0RD1D4k76WGaTew49awzPUsIOQKrERakzv+VyrCNnZ6JmjwAVupkq2
         bFAzNDyAtfe2nVNFCeV58IfnfmOKXXvyFzrlzfF3HsyaFMLgPqOtUg6OsKSDiXXKAAf2
         zFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hmk6B8RUrIkz34C6PI8M98ThJVUuA5TDqt8agn6fqa4=;
        b=OWgI6kYixQdPJXLQ7/01FOz1PRHCTn+LFAO/6DIUQH8PgfYKpz4YnGfF++RlYNYkNL
         EtfAaV5MngifvwEj1eHd1RA8wy5Z7/hmWVtJ8HOWBRkFXrQdXT5h33uQdBFAE1em3S2S
         /QeDmU45h9f+PtBpbf67EGkFZ2shGgcW9tZtiTPirIsmIEcDIKDvAO7EcY1CANTcJXLF
         DNuITv9+rz2ue3oguGpXQWhpJTUmATEOjhvT6NEZjpwjsxgawQgdg6v9zzw/5nUOiGC1
         59InTh2NYN5WMVh9+hVp5cQcUdXC5Qn+pbcm0WYUnI9laZtGX2517O85JHiY+unjhq4S
         iMrA==
X-Gm-Message-State: AOAM533EVME40Lr4gD4bO71gMHGBKSsfKCnPxIPXLd8j8Y4b92C2EVcE
        +jnF41W+D4HlsHVBEXZi2HP7Wimn8rHh9ELzK5G4BmoV
X-Google-Smtp-Source: ABdhPJy751+Ne/bm3PZICNFcj8aaxPdDg8GNmyBdEnMd2N34wGYIghfUSy6g0fy+hIgVlLYMhikhJYrzzCVVefl4gxk=
X-Received: by 2002:a0c:f153:: with SMTP id y19mr19321642qvl.22.1590499612050;
 Tue, 26 May 2020 06:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+azkizw6QA0VCr0wv93oSkgaYCPc4txy9M=ivgBot1+zg@mail.gmail.com>
 <37C9957E-40A6-4C29-95FC-D982BABD26F6@lca.pw>
In-Reply-To: <37C9957E-40A6-4C29-95FC-D982BABD26F6@lca.pw>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 26 May 2020 15:26:40 +0200
Message-ID: <CACT4Y+audgm3QWaVW5uPZF08VXhhNZvtXcW+1cTww53gmWCsKA@mail.gmail.com>
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

On Tue, May 26, 2020 at 2:41 PM Qian Cai <cai@lca.pw> wrote:
>
>
>
> > On May 26, 2020, at 8:28 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > Crashes (4):
> > Manager Time Kernel Commit Syzkaller Config Log Report Syz repro C repr=
o
> > ci-upstream-linux-next-kasan-gce-root 2020/05/22 01:23 linux-next
> > e8f32747 5afa2ddd .config log report
> > ci-upstream-linux-next-kasan-gce-root 2020/05/21 15:01 linux-next
> > e8f32747 1f30020f .config log report
> > ci-upstream-linux-next-kasan-gce-root 2020/05/19 18:24 linux-next
> > fb57b1fa 6d882fd2 .config log report
> > ci-upstream-linux-next-kasan-gce-root 2020/03/18 16:19 linux-next
> > 47780d78 0a96a13c .config log report
>
> You=E2=80=99ll probably need to use an known good kernel version. For exa=
mple, a stock kernel or any of a mainline -rc / GA kernel to compile next-2=
0200526 and then test from there.

People also argued for the opposite -- finding bugs only on rc's is
too late. I think Linus also did not want bugs from entering the
mainline tree.

Ideally, all kernel patches tested on CI for simpler bugs before
entering any tree. And then fuzzing finds only harder to hit bugs.
syzbot is a really poor CI and it wasn't built to be a one.
