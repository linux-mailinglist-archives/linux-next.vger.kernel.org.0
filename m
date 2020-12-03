Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE2B2CD574
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 13:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730366AbgLCMYo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 07:24:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:41446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730367AbgLCMYn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Dec 2020 07:24:43 -0500
Date:   Thu, 3 Dec 2020 14:23:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606998242;
        bh=8PfaNyzlXErk0Sdz7tJupSx2Z12MU7j+3qVRGGvHsEk=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=tdvTfdzav8GcY1bgFKYdql8UU+pbBvpBuk7TO/SMUviH9cpZoJbWxQPQs5cfop7cg
         exzH/9lTGypSJCg+VcYsgERYc/+mR5FNBYjUgR2lDk8JYrK0g+4gxAdusJrjO053kL
         VHm/9uRAgjOKCkAbc1n+o8LwWnBqWMS2SZYh9BM53dZJVOPmtObbDaKkfDGIMaXUOB
         8c0TUX36luhsfzMsrXr9jktlQ/Rz0CFTfo2YqUgICzjEkFgc6rQlZ9d72BIj+CnhUa
         9K0aCQj2aFNMpCN/S01Bf8p7lMwYHE/DAOvMq/8toXVzd7IBnKoQw5HyHjC8qFKcSy
         FSEaqLQUDz3Pg==
From:   Mike Rapoport <rppt@kernel.org>
To:     syzbot <syzbot+86800a8349c0f3f9466e@syzkaller.appspotmail.com>
Cc:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Subject: Re: linux-next boot error: kernel BUG at
 include/linux/page-flags.h:LINE!
Message-ID: <20201203122354.GI751215@kernel.org>
References: <00000000000056f29e05b58d448f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000056f29e05b58d448f@google.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 03, 2020 at 03:00:25AM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    bfd521e1 Add linux-next specific files for 20201203
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=14d5d403500000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=76090eb4ba939f87
> dashboard link: https://syzkaller.appspot.com/bug?extid=86800a8349c0f3f9466e
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+86800a8349c0f3f9466e@syzkaller.appspotmail.com

...

> page:ffffea0000000000 is uninitialized and poisoned
> raw: ffffffffffffffff ffffea0000000008 ffffea0000000008 ffffffffffffffff
> raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
> page dumped because: VM_BUG_ON_PAGE(1 && PageCompound(page))
> ------------[ cut here ]------------
> kernel BUG at include/linux/page-flags.h:356!

Yeah, the change to initialization of "unavailable" memory missed pfn 0 :(
This should fix it:

From 84a1c2531374706f3592a638523278aa29aaa448 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Thu, 3 Dec 2020 11:40:17 +0200
Subject: [PATCH] fixup for "mm: refactor initialization of stuct page for holes"

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 mm/page_alloc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ce2bdaabdf96..86fde4424e87 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6227,7 +6227,8 @@ void __init __weak memmap_init(unsigned long size, int nid,
 			       unsigned long zone,
 			       unsigned long range_start_pfn)
 {
-	unsigned long start_pfn, end_pfn, next_pfn = 0;
+	static unsigned long hole_start_pfn;
+	unsigned long start_pfn, end_pfn;
 	unsigned long range_end_pfn = range_start_pfn + size;
 	u64 pgcnt = 0;
 	int i;
@@ -6235,7 +6236,6 @@ void __init __weak memmap_init(unsigned long size, int nid,
 	for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
 		start_pfn = clamp(start_pfn, range_start_pfn, range_end_pfn);
 		end_pfn = clamp(end_pfn, range_start_pfn, range_end_pfn);
-		next_pfn = clamp(next_pfn, range_start_pfn, range_end_pfn);
 
 		if (end_pfn > start_pfn) {
 			size = end_pfn - start_pfn;
@@ -6243,10 +6243,10 @@ void __init __weak memmap_init(unsigned long size, int nid,
 					 MEMINIT_EARLY, NULL, MIGRATE_MOVABLE);
 		}
 
-		if (next_pfn < start_pfn)
-			pgcnt += init_unavailable_range(next_pfn, start_pfn,
-							zone, nid);
-		next_pfn = end_pfn;
+		if (hole_start_pfn < start_pfn)
+			pgcnt += init_unavailable_range(hole_start_pfn,
+							start_pfn, zone, nid);
+		hole_start_pfn = end_pfn;
 	}
 
 	/*
@@ -6256,8 +6256,8 @@ void __init __weak memmap_init(unsigned long size, int nid,
 	 * considered initialized. Make sure that memmap has a well defined
 	 * state.
 	 */
-	if (next_pfn < range_end_pfn)
-		pgcnt += init_unavailable_range(next_pfn, range_end_pfn,
+	if (hole_start_pfn < range_end_pfn)
+		pgcnt += init_unavailable_range(hole_start_pfn, range_end_pfn,
 						zone, nid);
 
 	if (pgcnt)
-- 
2.28.0

