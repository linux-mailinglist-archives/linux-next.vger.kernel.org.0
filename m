Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276E8202FE7
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 08:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgFVGm0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Jun 2020 02:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgFVGm0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2020 02:42:26 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E094DC061796
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 23:42:25 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id g13so1499093qtv.8
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 23:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UhciZLVdGKEJk7KHTw+RU8JWs5dQKAECyz5UjSzBrP0=;
        b=EyF5FuUsWQitHjx7BN4lfK2XcWY7vlK1Elm2C5+czbIrJnmhqFTAkpW5dNchOjMYQa
         m2TLVe5resLpBBx6d16MAKG8YbkEM7gSyEr0VRWn6GoH7+uEoEW090OfViix7wAoT/6E
         vP8jz4YaO+TAiSfGRcxcZLnf94KukhpdZugyRYd9Cr/xOsWN93pQOg4ZrSpwwQPypW3y
         Xc/FL4aARuZ3E6Aoh8B/DXUBsDQxJ6n0Ey9MzbMssaMalGxbbiW+y4MMWDiQ8/y80Mhj
         SOLke1Gc4AIHcB/xAxa07KjuW2Gin3VRjJaRkMucEqOZeq60mtVn2HfRwq97kVDrfsgb
         jZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UhciZLVdGKEJk7KHTw+RU8JWs5dQKAECyz5UjSzBrP0=;
        b=D0iebjPyvMiGoMcQwmNodwQL1x1mHm2LaMMOz/fWcrnbMmlCGAbw7e0NCDXtj1VgBX
         5TuXFjb66Cl+Lz2dIS/kRg+O8FsOYfCRwd4xIRlGazAG34qUiKsyffWNGywVelbXz+qS
         UFEcYuMV77uqfXhzkun/OmzBalKFR/BFDqyTSxxHLkO/du6DgXKKXpv6HokwRqSs4lp4
         BCfCesvzser/2Wo/nInFZHBfcsBiRsT8cGaQJy6QQbqmoLD+OK83fxaGAviGrCozF6yx
         oZKkNsN7JjUYUznwSb0CV+w+l9vwRAXQUvqTHznFFGW1J3ZYbzfLBqiK4HOa0VnDTymn
         c0rA==
X-Gm-Message-State: AOAM533ovW+Gh8KHGxKwaa/FmT0xwkx4aMmAO+N5sek2G9wCogWwKtKe
        gouODfp8TWpq9/rnE6cgGWr+v9OuTm1De5/cU33Siw==
X-Google-Smtp-Source: ABdhPJxrXaR2MRdiPAJU6NZZSqPOj09boIx0YXa64M3CfHeEi2VvHVT8MYtt4nmImQOknEhCv3I16YGiBoKqk30+teY=
X-Received: by 2002:ac8:36c2:: with SMTP id b2mr15006149qtc.257.1592808144668;
 Sun, 21 Jun 2020 23:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000617f9d05a8a5a2c4@google.com> <4A35E92B-9DEF-4833-81DD-0C6FA50EB174@lca.pw>
In-Reply-To: <4A35E92B-9DEF-4833-81DD-0C6FA50EB174@lca.pw>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 22 Jun 2020 08:42:13 +0200
Message-ID: <CACT4Y+ZcbA=9L2XPC_rRG-FdwOoH6XteOoGHg7jfvd+1CH2M+w@mail.gmail.com>
Subject: Re: linux-next boot error: WARNING in kmem_cache_free
To:     Qian Cai <cai@lca.pw>
Cc:     syzbot <syzbot+95bccd805a4aa06a4b0d@syzkaller.appspotmail.com>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 22, 2020 at 8:29 AM Qian Cai <cai@lca.pw> wrote:
> > On Jun 22, 2020, at 1:37 AM, syzbot <syzbot+95bccd805a4aa06a4b0d@syzkal=
ler.appspotmail.com> wrote:
> >
> > WARNING: CPU: 0 PID: 0 at mm/slab.h:232 kmem_cache_free+0x0/0x200 mm/sl=
ab.c:2262
>
> Is there any particular reason to use CONFIG_SLAB rather than CONFIG_SLUB=
?

There is a reason, it's still important for us.
But also it's not our strategy to deal with bugs by not testing
configurations and closing eyes on bugs, right? If it's an official
config in the kernel, it needs to be tested. If SLAB is in the state
that we don't care about any bugs in it, then we need to drop it. It
will automatically remove it from all testing systems out there. Or at
least make it "depends on BROKEN" to slowly phase it out during
several releases.


> You are really asking for trouble to test something that almost nobody is=
 exercising that code path very well nowadays.
>
> Anyway, there is a patchset in -mm that might well introduce this regress=
ion that we could go to confirm it, but I kind of don=E2=80=99t want to spe=
nd too much time on SLAB that suppose to be obsolete eventually.
