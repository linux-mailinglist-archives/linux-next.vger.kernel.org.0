Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09091E21D5
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 14:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731466AbgEZM2u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 08:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgEZM2u (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 08:28:50 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A6AC03E96E
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 05:28:50 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id i68so15912436qtb.5
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1kX/0h7k/dLe5VJKTh3GU8d/OkmFa8r3dT9cu3FJjGc=;
        b=mPT3FjLjm62VBWNljqWLDCHoPckeQ4ksZJtI9uhDW+MWFlBsItM87HrXLaTOHmD1Os
         8lvWLgU/YJZ+LcSDxnqxF7yhVVgFkkWkJYhX1sa3hF5wDCqLOhDYgVitjnc+f8wlfu3F
         BGhZftnjDNBvxui1hh5itHQ77YJZsuGj0dds5hQTzNchwn3owOTXzruvFwsbgMljCUkY
         8iZhKn24+iB3r9vYjctfK4o9f7exfOtn/Wgc6HGulpLRk4j/URFVXEb0CBcwTriz0cre
         HEvZVdG18YDDxsdbGJ6RHYaXYBywNuflMMwez8hZ6K1OnUmbEeYBdKjCByqfSq/FFbAX
         IQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1kX/0h7k/dLe5VJKTh3GU8d/OkmFa8r3dT9cu3FJjGc=;
        b=QaIeXLisar0+ZrFQpXmtnfgLcpgj6FQdeO1TX0+HuT5/YDdJ+M7HM9UrdS8VdyVAmc
         qEtrFs15gyuNwi3yYsS7fz+4LHaHxP8T8UsHUzyYAnPnhjdvrB3gRjv9XyVwgEdpJABI
         vpxwoJgLncwwLYBwNSxWcCOFmGdClndiV4I5/0YKTRvNE1dSEkX6X2k+Ea93/oupsx4A
         5yiIRRcDQoasCaLZgj3DtZCYVjt1yCkyMrwMw9ZiQm02y9671qL4nELD1eLxCDhX1GZN
         p3pfRdQdjVnkgiGXbNQgnJmI6Sixhkf9o4/qI5Vo+6kQ9F+xMXj7sm8lqAwnvHGmGZhP
         6zDg==
X-Gm-Message-State: AOAM532WUNylq8N7qysrF4a1lSBgi2mMGg+ZhyIXJhG7/7tyWhut4T/h
        D4QifpwxBMXfJ3wC1Gt1mNc7CT5asJCiEhe8vN2UKQ==
X-Google-Smtp-Source: ABdhPJzYmQaKATAOlbMfaUIFDS+5i7N6bvQY8eKswoVGpLACVzSZ7jP4lSy35/qZaQ6wPHwH3aDYuw8sUXBzyMev+8I=
X-Received: by 2002:aed:3668:: with SMTP id e95mr1006428qtb.50.1590496129116;
 Tue, 26 May 2020 05:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+ap21MXTjR3wF+3NhxEtgnKSm09tMsUnbKy2_EKEgh0kg@mail.gmail.com>
 <3979FAE7-0119-4F82-A933-FC175781865C@lca.pw>
In-Reply-To: <3979FAE7-0119-4F82-A933-FC175781865C@lca.pw>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 26 May 2020 14:28:37 +0200
Message-ID: <CACT4Y+azkizw6QA0VCr0wv93oSkgaYCPc4txy9M=ivgBot1+zg@mail.gmail.com>
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

On Tue, May 26, 2020 at 2:19 PM Qian Cai <cai@lca.pw> wrote:

> > On May 26, 2020, at 8:09 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > +linux-next and XFS maintainers
> >
> > Interesting. This seems to repeat reliably and this machine is not
> > known for any misbehavior and it always happens on all XFS files.
> > Did XFS get something that crashes gcc's?
>
> Are you still seeing this in today=E2=80=99s linux-next? There was an iss=
ue had already been sorted out.

syzbot seen this on these commits/dates:

https://syzkaller.appspot.com/bug?extid=3D792dec47d693ccdc05a0
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
