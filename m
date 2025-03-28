Return-Path: <linux-next+bounces-6059-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A53A7455C
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 09:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CA3B18938CC
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 08:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC3B18DB2B;
	Fri, 28 Mar 2025 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXLKnBg6"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340932F30;
	Fri, 28 Mar 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150505; cv=none; b=slf5nHqIh+XnL5AO4t5xAFkTa4Ktzq3Tbhn5M0exr1cMSqZIzrUrb4fgtB6ECqa2mIkl+BupuxahoggWK1Q5juEqujn6/Uyv8yWg9h+pLYDP4Ys6cYuC46kAUxhRpQLWWBHY4v2duTyzxGXMjuARHNrO2nJEVFR7608kY8rUxfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150505; c=relaxed/simple;
	bh=JitqRG1z7M7azSM989SFOhNL1lni7Z9hKtFv2RxHV0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyKtXw/+x4fGfpm02C6IphPF4eXY3NEGcZVaVg2h52syTwLc9t35vLwwAsxsLsxJg2QmZeqFYuEB8j4cqMALyBYqO3RByuu1EXCX5fklV9pa9XLOA+zQCZlJyz+8jZ6+yeXpmkmGNSXj1yF7lU8C5caSr52VgcHBr3CJYqDS+nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXLKnBg6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743150505; x=1774686505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JitqRG1z7M7azSM989SFOhNL1lni7Z9hKtFv2RxHV0o=;
  b=BXLKnBg6r3AWNEz8qQ2PQ0B8p/3cbvF/oy9hi1x/XIL5bljnxWdAaVfv
   07mSCFmrXVM0NkSd+w8+du5T5hcWxNDLex0PSoKcgtsgILQyeLCihF0Wr
   YANkzk19gn4NDVU7lRSXRyC3F7dts11nMAXp5R8HQTdoNRMRwo9tgFImg
   rlntFuav76UfSnvCoLW2+n63TQXGgmKuDzz/9jJ/FAnue+9s5Yt29iAk/
   f5wjjdVSE/oDOHOa4Sxi13I+eJUsYdjlf+UvL/YbkQlDXD9XooTnzmciI
   MoGVjfGEViBN4+LsIW77WjafHpSXhUyomrOrHXGdz4ndt2OmbvHN+I8eT
   Q==;
X-CSE-ConnectionGUID: zjAt7vv/QvW9hN++WuIIog==
X-CSE-MsgGUID: gbZ9jAgwRTS3VIWGA1guug==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44667953"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="44667953"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 01:28:24 -0700
X-CSE-ConnectionGUID: Ot5s3BV2QhWEomPRkL8UfQ==
X-CSE-MsgGUID: 7hvcnsceQGmYnwZxHEB8nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="125188253"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 28 Mar 2025 01:28:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 10B421CA; Fri, 28 Mar 2025 10:28:19 +0200 (EET)
Date: Fri, 28 Mar 2025 10:28:19 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, 
	"Aithal, Srikanth" <sraithal@amd.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jason Baron <jbaron@akamai.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, "Roth, Michael" <Michael.Roth@amd.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
Message-ID: <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3>
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>
 <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
 <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
 <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
 <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>
 <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
 <20250327110224.68c69c78@gandalf.local.home>
 <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>

On Thu, Mar 27, 2025 at 07:39:22PM +0200, Kirill A. Shutemov wrote:
> On Thu, Mar 27, 2025 at 11:02:24AM -0400, Steven Rostedt wrote:
> > On Thu, 27 Mar 2025 16:43:43 +0200
> > "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
> > 
> > > > > The only option I see so far is to drop static branch from this path.
> > > > > 
> > > > > But I am not sure if it the only case were we use static branch from CPU
> > > > > hotplug callbacks.
> > > > > 
> > > > > Any other ideas?  
> > > > 
> > > > 
> > > > Hmmm, didn't take too close a look here, but there is the
> > > > static_key_slow_dec_cpuslocked() variant, would that work here? Is the issue
> > > > the caller may or may not have the cpu_hotplug lock?  
> > > 
> > > Yes. This is generic page alloc path and it can be called with and without
> > > the lock.
> > 
> > Note, it's not the static_branch that is an issue, it's enabling/disabling
> > the static branch that is. Changing a static branch takes a bit of work as
> > it does modify the kernel text.
> > 
> > Is it possible to delay the update via a workqueue?
> 
> Ah. Good point. Should work. I'll give it try.

The patch below fixes problem for me.

It is silly to add work_struct to zone for one-time cleanup, but I guess
not a big deal.

Tom, Srikanth, could you please test it?

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 9540b41894da..ea5f7e0b675d 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -964,6 +964,9 @@ struct zone {
 #ifdef CONFIG_UNACCEPTED_MEMORY
 	/* Pages to be accepted. All pages on the list are MAX_PAGE_ORDER */
 	struct list_head	unaccepted_pages;
+
+	/* To be called once last page in the zone is accepted */
+	struct work_struct	unaccepted_cleanup;
 #endif
 
 	/* zone flags, see below */
diff --git a/mm/internal.h b/mm/internal.h
index 109ef30fee11..f2e6d42af6eb 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1516,6 +1516,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
 
 #ifdef CONFIG_UNACCEPTED_MEMORY
 void accept_page(struct page *page);
+void unaccepted_cleanup_work(struct work_struct *work);
 #else /* CONFIG_UNACCEPTED_MEMORY */
 static inline void accept_page(struct page *page)
 {
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2630cc30147e..d5a51f65dc4d 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1404,6 +1404,7 @@ static void __meminit zone_init_free_lists(struct zone *zone)
 
 #ifdef CONFIG_UNACCEPTED_MEMORY
 	INIT_LIST_HEAD(&zone->unaccepted_pages);
+	INIT_WORK(&zone->unaccepted_cleanup, unaccepted_cleanup_work);
 #endif
 }
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4fe93029bcb6..e5f16fdb7eeb 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6921,6 +6921,11 @@ static DEFINE_STATIC_KEY_FALSE(zones_with_unaccepted_pages);
 
 static bool lazy_accept = true;
 
+void unaccepted_cleanup_work(struct work_struct *work)
+{
+	static_branch_dec(&zones_with_unaccepted_pages);
+}
+
 static int __init accept_memory_parse(char *p)
 {
 	if (!strcmp(p, "lazy")) {
@@ -6960,7 +6965,7 @@ static void __accept_page(struct zone *zone, unsigned long *flags,
 	__free_pages_ok(page, MAX_PAGE_ORDER, FPI_TO_TAIL);
 
 	if (last)
-		static_branch_dec(&zones_with_unaccepted_pages);
+		schedule_work(&zone->unaccepted_cleanup);
 }
 
 void accept_page(struct page *page)
-- 
  Kiryl Shutsemau / Kirill A. Shutemov

