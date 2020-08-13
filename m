Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58881243C66
	for <lists+linux-next@lfdr.de>; Thu, 13 Aug 2020 17:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgHMPVk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Aug 2020 11:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMPVk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Aug 2020 11:21:40 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F185FC061757
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2020 08:21:39 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id r19so2774966qvw.11
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2020 08:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n/syx/SxqBMIN8ss9hWSXJCFp7S96a9yWlWgF3+Kl+k=;
        b=PrhS4mcu2hfVQsLaHZyu7reWP52+80bEpr3vIdaYtjzU2OjSOSD6QAQ7i3hJ3BPu4z
         cgOxlbXhAceN/NmLdD8AYiVjuLNCj1nqxHVQNh8Sz2dvUFfbuJPzBrGfRMlhPP0d5ghs
         pqd9OuaVSlDW8LHsvb17Da7dJ0l0jJNLwEx3wdMLPQwofhEgJbv/yFnFasqnhDaco0l7
         cFKBUdfylUQ9RYdzl6ol+edQL6e98nhj30oaBObAvGWBfsyTGtZnWcbf0tcvmtUSA/KG
         C5bNdu1R7pNNaaUVInN2NA4FASGvjDO8qqR1LdlyNgtmear5iJYDlxYpPxG2mSVnQO/m
         ZNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n/syx/SxqBMIN8ss9hWSXJCFp7S96a9yWlWgF3+Kl+k=;
        b=jiDjMWXdEAuWpJggsnTU5gkLY+5qbYi7bT04/GCaNKEAx5F74tye29BKhmlX7tRZns
         br0o1KitXcakcjgql6yYbmgLqp3XtZhs2opoZVdBa2T/LqEVT1JUowE421huaJTJu0ub
         nACEaUY6yfnwiQAGFuB29iBlzLs4faRFzeT+nbKIoeAUcKGpCcHO5BmOhlMmjTC/FhVU
         jtNyfiN7/VTjsEqSjQdahhXnOSifUecQl7eaxj+zihr8A3tZ83iAfOxmvCgIh9ir7+io
         HK7hwEysSRNs97GHdjarzSRklsEO7fJWykP73I80jvWpV9VuRpLf70rANWg27vaPAqyi
         kN/A==
X-Gm-Message-State: AOAM5336CdljSH/Xb7llQ9E4XQWSnTlsnrJVQVC5MFzWkmqqLe2G2VdY
        IvcZRruVVxVDz4/yvHUibx0rC0GXXQ0=
X-Google-Smtp-Source: ABdhPJxCU9Ovi/VEY5bhb4Sb/ACyGJnhVNPlFcm7mFJy+eh7NPXN/xx0ecvRLhxirwsDvaK0iacGUg==
X-Received: by 2002:ad4:4cc3:: with SMTP id i3mr5126808qvz.17.1597332099064;
        Thu, 13 Aug 2020 08:21:39 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:7cdc])
        by smtp.gmail.com with ESMTPSA id j16sm5459722qke.87.2020.08.13.08.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 08:21:38 -0700 (PDT)
Date:   Thu, 13 Aug 2020 11:20:33 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Roman Gushchin <guro@fb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: runtime warning in Linus' tree
Message-ID: <20200813152033.GA701678@cmpxchg.org>
References: <20200813164654.061dbbd3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813164654.061dbbd3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 13, 2020 at 04:46:54PM +1000, Stephen Rothwell wrote:
> [    0.055220][    T0] WARNING: CPU: 0 PID: 0 at mm/memcontrol.c:5220 mem_cgroup_css_alloc+0x350/0x904

> [The line numbers in the final linux next are 5226 and 5141 due to
> later patches.]
> 
> Introduced (or exposed) by commit
> 
>   3e38e0aaca9e ("mm: memcg: charge memcg percpu memory to the parent cgroup")
> 
> This commit actually adds the WARN_ON, so it either adds the bug that
> sets it off, or the bug already existed.
> 
> Unfotunately, the version of this patch in linux-next up tuntil today
> is different.  :-(

Sorry, I made a last-minute request to include these checks in that
patch to make the code a bit more robust, but they trigger a false
positive here. Let's remove them.

---

From de8ea7c96c056c3cbe7b93995029986a158fb9cd Mon Sep 17 00:00:00 2001
From: Johannes Weiner <hannes@cmpxchg.org>
Date: Thu, 13 Aug 2020 10:40:54 -0400
Subject: [PATCH] mm: memcontrol: fix warning when allocating the root cgroup

Commit 3e38e0aaca9e ("mm: memcg: charge memcg percpu memory to the
parent cgroup") adds memory tracking to the memcg kernel structures
themselves to make cgroups liable for the memory they are consuming
through the allocation of child groups (which can be significant).

This code is a bit awkward as it's spread out through several
functions: The outermost function does memalloc_use_memcg(parent) to
set up current->active_memcg, which designates which cgroup to charge,
and the inner functions pass GFP_ACCOUNT to request charging for
specific allocations. To make sure this dependency is satisfied at all
times - to make sure we don't randomly charge whoever is calling the
functions - the inner functions warn on !current->active_memcg.

However, this triggers a false warning when the root memcg itself is
allocated. No parent exists in this case, and so current->active_memcg
is rightfully NULL. It's a false positive, not indicative of a bug.

Delete the warnings for now, we can revisit this later.

Fixes: 3e38e0aaca9e ("mm: memcg: charge memcg percpu memory to the parent cgroup")
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/memcontrol.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index d59fd9af6e63..9d87082e64aa 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5137,9 +5137,6 @@ static int alloc_mem_cgroup_per_node_info(struct mem_cgroup *memcg, int node)
 	if (!pn)
 		return 1;
 
-	/* We charge the parent cgroup, never the current task */
-	WARN_ON_ONCE(!current->active_memcg);
-
 	pn->lruvec_stat_local = alloc_percpu_gfp(struct lruvec_stat,
 						 GFP_KERNEL_ACCOUNT);
 	if (!pn->lruvec_stat_local) {
@@ -5222,9 +5219,6 @@ static struct mem_cgroup *mem_cgroup_alloc(void)
 		goto fail;
 	}
 
-	/* We charge the parent cgroup, never the current task */
-	WARN_ON_ONCE(!current->active_memcg);
-
 	memcg->vmstats_local = alloc_percpu_gfp(struct memcg_vmstats_percpu,
 						GFP_KERNEL_ACCOUNT);
 	if (!memcg->vmstats_local)
-- 
2.28.0

