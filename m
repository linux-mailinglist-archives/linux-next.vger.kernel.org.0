Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855C12C2F71
	for <lists+linux-next@lfdr.de>; Tue, 24 Nov 2020 19:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404030AbgKXSAF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Nov 2020 13:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732036AbgKXSAE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2020 13:00:04 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C7BC0613D6;
        Tue, 24 Nov 2020 10:00:04 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id gj5so29791144ejb.8;
        Tue, 24 Nov 2020 10:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=fYTyE7YpkG8eViy0lwW5bZitqUnf4fUSbez6ArVNXAw=;
        b=pbLj5BGU/dqkfXQIHy6HfoGjaX15oM1/061dheT47kPyNOsa0z5PtGYVJaEm0NxquS
         fI4NC6EKWB676TY01x9UU7ENbdnaHipM9oWNbaq32aCImBphnni+gPQgNCj/ryzdefUj
         3+75FDrayagP9EDPPp7HchzRZbbSwba5AyE6BsU1Nl50Koco8I9jz0jCOhMPKLx5PBZR
         9X3++ezXlxd4FQGCNjDTGoEWnR3Rkwy9cafScXHyWwyovhomyw6W/h2CvxEx4SCE37Hi
         xOA9DTFPh5keL/8puE6HUMWMX8l32XQllpINeF4SyRMWLalQM4p2BMph+e4v2c4XM30/
         6xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=fYTyE7YpkG8eViy0lwW5bZitqUnf4fUSbez6ArVNXAw=;
        b=e1e2/Jsuu6/JFZ0Z6ADIE5xBNyofv7cNWcBUroDPdm9DqU2eRE2/mh3ALDOawGGFUR
         7RA60/brCBO2HkOr+7WnAdn7nId6JKiiFMpeMqQ2UJHp2oQFZpv787cvqZTZFMrQ7+HR
         7+EEZsyZVfOT7mC5kWqGfhVglPiPzGVVJeNbby0H0bGgGfeQS336OqxNUN6CdApqLa+1
         Ym+gEIvW3w+SjNTkehY70cBpLKwj3OpRu0JNzH6jRJUEgM+yiZGXTTMWHqvnfio8CnwG
         w4iIwt7jNNntwbTsrwzYWmE8dzAy8BM03tYLgmaXpjS/okQEQtdpMUu7sk1xvCZu+dGU
         Q4Uw==
X-Gm-Message-State: AOAM530pp9Y43YO1GhQrIldOCYVsjznPNk9LG/0jzDWq1EDj42jVzrMl
        DXqVOjEIK9MsTzEPl60rmHVdnC+aWYZteNzgUOMKpUCyrzI=
X-Google-Smtp-Source: ABdhPJwQGfORuDlBQl+ZZrOy026YB7QsNi2Ci3nzxGJRF1RVqSyBu95jEul/If6B8z/862XgVAaaTRFzLZluul20QH4=
X-Received: by 2002:a17:906:17d0:: with SMTP id u16mr5097893eje.452.1606240803015;
 Tue, 24 Nov 2020 10:00:03 -0800 (PST)
MIME-Version: 1.0
References: <00000000000054aea005b4d59e71@google.com>
In-Reply-To: <00000000000054aea005b4d59e71@google.com>
From:   Lorenzo Stoakes <lstoakes@gmail.com>
Date:   Tue, 24 Nov 2020 17:59:52 +0000
Message-ID: <CAA5enKZ=6=AoknavW4RJ+T+aiPBFSf8uEjJ+ODcc+nMTD2k5kQ@mail.gmail.com>
Subject: Re: linux-next boot error: WARNING in prepare_kswapd_sleep
To:     syzbot <syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Alex Shi <alex.shi@linux.alibaba.com>, Hui Su <sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 24 Nov 2020 at 07:54, syzbot
<syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com> wrote:
> syzbot found the following issue on:
>
> HEAD commit:    d9137320 Add linux-next specific files for 20201124

This appears to be a product of 4b2904f3 ("mm/memcg: add missed
warning in mem_cgroup_lruvec") adding a VM_WARN_ON_ONCE() to
mem_cgroup_lruvec, which when invoked from a function other than
mem_cgroup_page_lruvec() can in fact be called with the condition
false.
If we move the check back into mem_cgroup_page_lruvec() it resolves
the issue. I enclose a simple version of this below, happy to submit
as a proper patch if this is the right approach:


diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 87ed56dc75f9..27cc40a490b2 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -618,7 +618,6 @@ static inline struct lruvec
*mem_cgroup_lruvec(struct mem_cgroup *memcg,
                goto out;
        }

-       VM_WARN_ON_ONCE(!memcg);
        if (!memcg)
                memcg = root_mem_cgroup;

@@ -645,6 +644,7 @@ static inline struct lruvec
*mem_cgroup_lruvec(struct mem_cgroup *memcg,
 static inline struct lruvec *mem_cgroup_page_lruvec(struct page *page,
                                                struct pglist_data *pgdat)
 {
+       VM_WARN_ON_ONCE_PAGE(!page_memcg(page), page);
        return mem_cgroup_lruvec(page_memcg(page), pgdat);
 }
