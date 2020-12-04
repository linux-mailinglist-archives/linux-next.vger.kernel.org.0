Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00572CF4A6
	for <lists+linux-next@lfdr.de>; Fri,  4 Dec 2020 20:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730270AbgLDTVO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Dec 2020 14:21:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:55324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726392AbgLDTVO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Dec 2020 14:21:14 -0500
Date:   Fri, 4 Dec 2020 11:20:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607109632;
        bh=/XhZcYZ5JIA1PupN+XZqIdVnLydGrcJFS1sKBQ5lWX0=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=IXhPDkfkpAdhrnOXCRz73rGo8liOLaITMhwtX7K6IMUGF7NL+tyVPogXQwt7yOuD7
         pFLLv20r4JMRSs2tuSZlwyphpez5o3YHfI1zZH1B1m0qZjlKoidX0BSypb6JfQ+ALZ
         d1/EgKFsXpN6Y55HbypNP/nO+lniIlTtc0mh+EWYMZKuncBK+AOTH3nbIm+26utiRZ
         oc6j1yqysz5cAXWBje0B2b+0pAUoVt5nT/vXcIpvGMZBFPt7PB613S5eOorKRBuNb3
         VKVIKH6GVNWlsmuzG5EFuKdBzuAbooorr+nY1Jc7jXCeHo9DO1On4kPgpZ0JwPKDRn
         VSr0GMKeyLUlg==
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20201204192032.GA1437@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201204192526.0b38fb02@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204192526.0b38fb02@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Dec 04, 2020 at 07:25:26PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (sparc defconfig)
> failed like this:
> 
> mm/slab_common.o: In function `kmem_last_alloc':
> slab_common.c:(.text+0xc4): undefined reference to `kmem_cache_last_alloc'
> 
> Caused by commit
> 
>   f7c3fb4fc476 ("mm: Add kmem_last_alloc() to return last allocation for memory block")
> 
> in mm/slab.c, kmem_cache_last_alloc() is only defined when CONFIG_NUMA
> is set - which is not for this build.
> 
> I applied the following hack fix patch for today.
> 
> From ac5dcf78be1e6da530302966369a3bd63007cf81 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 4 Dec 2020 19:11:01 +1100
> Subject: [PATCH] fixup for "mm: Add kmem_last_alloc() to return last
>  allocation for memory block"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Apologies for the hassle and thank you for the very helpful "hack
fix patch".  The kbuild test robot also found this, but I hadn't
quite gotten it through my head that the only slab definition of the
kmem_cache_last_alloc() was under CONFIG_NUMA.

Does the following patch fix things?  (Sigh.  It won't apply on the
rcu/next that you used.  Or even on this moment's dev branch.  I will
fold it in with attribution and update.  But just to show you what my
thought is.)

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/mm/slab.c b/mm/slab.c
index 87aa2c0..ae1a74c 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -3602,27 +3602,6 @@ void *kmem_cache_alloc_node_trace(struct kmem_cache *cachep,
 EXPORT_SYMBOL(kmem_cache_alloc_node_trace);
 #endif
 
-void *kmem_cache_last_alloc(struct kmem_cache *cachep, void *object, void **stackp, int nstackp)
-{
-#ifdef DEBUG
-	unsigned int objnr;
-	void *objp;
-	struct page *page;
-
-	if (!(cachep->flags & SLAB_STORE_USER))
-		return ERR_PTR(-KMEM_LA_NO_DEBUG);
-	objp = object - obj_offset(cachep);
-	page = virt_to_head_page(objp);
-	objnr = obj_to_index(cachep, page, objp);
-	objp = index_to_obj(cachep, page, objnr);
-	if (stackp && nstackp)
-		stackp[0] = NULL;
-	return *dbg_userword(cachep, objp);
-#else
-	return NULL;
-#endif
-}
-
 static __always_inline void *
 __do_kmalloc_node(size_t size, gfp_t flags, int node, unsigned long caller)
 {
@@ -3654,6 +3633,27 @@ void *__kmalloc_node_track_caller(size_t size, gfp_t flags,
 EXPORT_SYMBOL(__kmalloc_node_track_caller);
 #endif /* CONFIG_NUMA */
 
+void *kmem_cache_last_alloc(struct kmem_cache *cachep, void *object, void **stackp, int nstackp)
+{
+#ifdef DEBUG
+	unsigned int objnr;
+	void *objp;
+	struct page *page;
+
+	if (!(cachep->flags & SLAB_STORE_USER))
+		return ERR_PTR(-KMEM_LA_NO_DEBUG);
+	objp = object - obj_offset(cachep);
+	page = virt_to_head_page(objp);
+	objnr = obj_to_index(cachep, page, objp);
+	objp = index_to_obj(cachep, page, objnr);
+	if (stackp && nstackp)
+		stackp[0] = NULL;
+	return *dbg_userword(cachep, objp);
+#else
+	return NULL;
+#endif
+}
+
 /**
  * __do_kmalloc - allocate memory
  * @size: how many bytes of memory are required.
