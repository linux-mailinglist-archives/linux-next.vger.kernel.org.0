Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385F21A93B4
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 08:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393645AbgDOGyw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 02:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728702AbgDOGyu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2020 02:54:50 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7723C061A0C
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 23:54:50 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id f52so2365733otf.8
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 23:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=rWdc9gaGPCk9QCXukH9E1qM52p5x9nsGOzCdcUvsmcc=;
        b=coOtS2xku/PjBRcqrWFIPqUAAN3n17jaQLKkjcuRVTcvGQviZHLMO3Rnhl/bBUApwb
         N43SP7JbKMxJro1YvzhvTqMsUlu14Vvn8+0w1xp9wBXrRGYGdVi1oRSQBjZ8OHYHvKt3
         Q3MhX9wsJFgCuxehXmo2xHDaSkQmizpd3nMHJFCk8pZcwGy0JBPjXNfy7r3g2MKSuFkk
         PbbUa39aPIduU2SbTIYBn03Iv89f9cIO6B6B8/j+ycwKAEBE6sVjzxOL7NkrjSUXBNhA
         /mpQ0b1S5nn9noHcXKuvgBDMv2beUESWyWjLk1DUHfrzhtqHPcBn/Ev2MD1n/M7gcZUJ
         e8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=rWdc9gaGPCk9QCXukH9E1qM52p5x9nsGOzCdcUvsmcc=;
        b=DQFWzzV79RKGkl+H5AQSrEDZnDcajB+/mAimhJ5D6eHh/SK644J9oapeYS9Ty+y9Ev
         SR7Vk901IxiLwOEfztxmlwp+ITv6xk42tq3Xal5azUvmbjht93LIhh/k6ufp64y76Qlm
         Hvas5fxgwD1wBEDwxOEaoa4Bxdq6XkMkbb3Fg9HUGMugCKAIGwhaJO1mBfXNxVWSw32h
         OrQjqLp4fcYoUgcrAAr5RQDLff1h888LBnhjvLRL2X1xAqNcO40pCDmA+vzaLNiocm24
         wGDKJlGbbmHT2Aexi92qarpcyMeU0c8HCD8l7aw+c4BqsRWlVyDgNn53gO//IeTxcCTM
         V9/Q==
X-Gm-Message-State: AGi0PuYyL9RIqyXY+N8IWtrop5nQzS8niJjVmHuPjYyAqXcf+S8Q5dEH
        4Cxa5jweSsB6fsrCeSP9toEfEg==
X-Google-Smtp-Source: APiQypKmxH3z9EyIWxa4J53d/b4K7nH1J03FHQY4dRsSkgsUsRGL15eV4bMbPRWzrZaOZwWQKZ/9kA==
X-Received: by 2002:a4a:848e:: with SMTP id n14mr18764636oog.44.1586933689752;
        Tue, 14 Apr 2020 23:54:49 -0700 (PDT)
Received: from eggly.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 10sm6056280oin.42.2020.04.14.23.54.48
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 14 Apr 2020 23:54:49 -0700 (PDT)
Date:   Tue, 14 Apr 2020 23:54:29 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To:     Andrew Morton <akpm@linux-foundation.org>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>, Hugh Dickins <hughd@google.com>
Subject: Re: linux-next: Tree for Apr 14 (mm/shmem.c)
In-Reply-To: <20200414182430.c5af29ddb1735f5fd0083983@linux-foundation.org>
Message-ID: <alpine.LSU.2.11.2004142339170.10035@eggly.anvils>
References: <20200414123900.4f97a83f@canb.auug.org.au> <200c608a-8159-18ce-b44e-cad2022e23e2@infradead.org> <20200414182430.c5af29ddb1735f5fd0083983@linux-foundation.org>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-6116103-1586933689=:10035"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-6116103-1586933689=:10035
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 14 Apr 2020, Andrew Morton wrote:
> On Tue, 14 Apr 2020 07:18:01 -0700 Randy Dunlap <rdunlap@infradead.org> w=
rote:
> > On 4/13/20 7:39 PM, Stephen Rothwell wrote:
> > > Hi all,
> > >=20
> > > Changes since 20200413:
> > >=20
> > > New tree: mhi
> > >=20
> > > My fixes tree contains:
> > >=20
> > >   6b038bdcd3d1 sh: mm: Fix build error
> > >=20
> > > Non-merge commits (relative to Linus' tree): 1154
> > >  1160 files changed, 31764 insertions(+), 13498 deletions(-)
> > >=20
> > > ---------------------------------------------------------------------=
-------
> >=20
> > on x86_64:
> > # CONFIG_TRANSPARENT_HUGEPAGE is not set
>=20
> Thanks.  hm, this took a long time to be discovered.
>=20
> > In file included from ../include/linux/export.h:43:0,
> >                  from ../include/linux/linkage.h:7,
> >                  from ../include/linux/fs.h:5,
> >                  from ../mm/shmem.c:24:
> > ../mm/shmem.c: In function =E2=80=98shmem_undo_range=E2=80=99:
=2E..
> > ../mm/shmem.c:961:26: note: in expansion of macro =E2=80=98HPAGE_PMD_NR=
=E2=80=99
> >           round_up(start, HPAGE_PMD_NR))
> >                           ^~~~~~~~~~~~
>=20
> That's
> =09=09=09=09=09if (index <
> =09=09=09=09=09    round_up(start, HPAGE_PMD_NR))
> =09=09=09=09=09=09start =3D index + 1;
>=20
> from Hugh's 71725ed10c40696 ("mm: huge tmpfs: try to split_huge_page()
> when punching hole").

Sorry about that.  Yes, odd that it should only hit now: the false
PageTransCompound in shmem_punch_compound() has always been good
enough to handle it for me, but maybe Randy is trying a less able
compiler, or maybe unrelated changes in linux-next have just made
it harder for the compiler to see the optimization.

I hope the patch below fixes it?

[PATCH] mm/shmem: fix build without THP

Some optimizers don't notice that shmem_punch_compound() is always true
(PageTransCompound() being false) without CONFIG_TRANSPARENT_HUGEPAGE=3Dy:
use IS_ENABLED to help them to avoid the BUILD_BUG inside HPAGE_PMD_NR.

Fixes: 71725ed10c40 ("mm: huge tmpfs: try to split_huge_page() when punchin=
g hole")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Hugh Dickins <hughd@google.com>
---

 mm/shmem.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 5.7-rc1/mm/shmem.c=092020-04-11 12:58:26.415524805 -0700
+++ linux/mm/shmem.c=092020-04-14 23:20:25.517656174 -0700
@@ -952,7 +952,7 @@ static void shmem_undo_range(struct inod
 =09=09=09=09VM_BUG_ON_PAGE(PageWriteback(page), page);
 =09=09=09=09if (shmem_punch_compound(page, start, end))
 =09=09=09=09=09truncate_inode_page(mapping, page);
-=09=09=09=09else {
+=09=09=09=09else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 =09=09=09=09=09/* Wipe the page and don't get stuck */
 =09=09=09=09=09clear_highpage(page);
 =09=09=09=09=09flush_dcache_page(page);
--0-6116103-1586933689=:10035--
