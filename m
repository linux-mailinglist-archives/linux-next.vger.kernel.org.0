Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED04186447
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 05:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbgCPE6M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 00:58:12 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55773 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729577AbgCPE6M (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 00:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584334690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Fy0D8AUSwcLsZ1v2uAgLtAtgWWk3Sx0of05pmYFUkok=;
        b=icCFgOEhlQB9dzHlC7/ujEKOAEo/EowCU1oXV3PO0fmh4575iRrf4Eag92L1pqoZCRDFdx
        lURNFao/gmkSIVxUU3AkSXo60W80/0h+vTE8xeEug+1DhExE+EmNiRc7A/rzZQ7c27wf3S
        KttZXwYtBapp8sCwkC03F4PJmRlVe84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-glMUCeaqOK-JRc1Q9RMfZQ-1; Mon, 16 Mar 2020 00:58:09 -0400
X-MC-Unique: glMUCeaqOK-JRc1Q9RMfZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A680118A5502;
        Mon, 16 Mar 2020 04:58:07 +0000 (UTC)
Received: from localhost (ovpn-12-129.pek2.redhat.com [10.72.12.129])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B35F81001DC0;
        Mon, 16 Mar 2020 04:58:06 +0000 (UTC)
Date:   Mon, 16 Mar 2020 12:58:04 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200316045804.GC3486@MiWiFi-R3L-srv>
References: <20200313214214.4d2e2af6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313214214.4d2e2af6@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 03/13/20 at 09:42pm, Stephen Rothwell wrote:
> After merging the akpm-current tree, today's linux-next build (x86_64
> allnoconfig) produced this warning:
> 
> mm/sparse.c:311:12: warning: 'fill_subsection_map' defined but not used [-Wunused-function]
>   311 | static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
>       |            ^~~~~~~~~~~~~~~~~~~
> mm/sparse.c:306:13: warning: 'is_subsection_map_empty' defined but not used [-Wunused-function]
>   306 | static bool is_subsection_map_empty(struct mem_section *ms)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~
> mm/sparse.c:301:12: warning: 'clear_subsection_map' defined but not used [-Wunused-function]
>   301 | static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
>       |            ^~~~~~~~~~~~~~~~~~~~

Hi Stephen, Andrew,

I made a patch to fix these warnings, the reason has been told in the
log. Or just drop below patch. Both is fine to me.

mm-sparsec-move-subsection_map-related-functions-together.patch

From 273196eeb7bbc4af93bef18f594af91541e3ce8a Mon Sep 17 00:00:00 2001
From: Baoquan He <bhe@redhat.com>
Date: Sat, 14 Mar 2020 17:01:01 +0800
Subject: [PATCH] mm/sparse.c: move functions into CONFIG_MEMORY_HOTPLUG
 ifdeffery scope

Stephen reported warnings are seen with allnoconfig on x86_64:

mm/sparse.c:311:12: warning: 'fill_subsection_map' defined but not used [-Wunused-function]
  311 | static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
      |            ^~~~~~~~~~~~~~~~~~~
mm/sparse.c:306:13: warning: 'is_subsection_map_empty' defined but not used [-Wunused-function]
  306 | static bool is_subsection_map_empty(struct mem_section *ms)
      |             ^~~~~~~~~~~~~~~~~~~~~~~
mm/sparse.c:301:12: warning: 'clear_subsection_map' defined but not used [-Wunused-function]
  301 | static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
      |            ^~~~~~~~~~~~~~~~~~~~

This is because allnoconfig on x86_64 sets  CONFIG_SPARSEMEM=y and
CONFIG_MEMORY_HOTPLUG=n. Functions clear_subsection_map(),
is_subsection_map_empty() and fill_subsection_map() are all defined
outside CONFIG_MEMORY_HOTPLUG ifdeffery scope. However, their callers,
section_activate() and section_deactivate() are inside CONFIG_MEMORY_HOTPLUG
ifdeffery scope.

So let's move them into the CONFIG_MEMORY_HOTPLUG iddeffery scope which
includes their callers.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/sparse.c | 128 ++++++++++++++++++++++++++--------------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index bb99633575b5..9b845621b854 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -244,74 +244,10 @@ void __init subsection_map_init(unsigned long pfn, unsigned long nr_pages)
 		nr_pages -= pfns;
 	}
 }
-
-static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
-{
-	DECLARE_BITMAP(map, SUBSECTIONS_PER_SECTION) = { 0 };
-	DECLARE_BITMAP(tmp, SUBSECTIONS_PER_SECTION) = { 0 };
-	struct mem_section *ms = __pfn_to_section(pfn);
-	unsigned long *subsection_map = ms->usage
-		? &ms->usage->subsection_map[0] : NULL;
-
-	subsection_mask_set(map, pfn, nr_pages);
-	if (subsection_map)
-		bitmap_and(tmp, map, subsection_map, SUBSECTIONS_PER_SECTION);
-
-	if (WARN(!subsection_map || !bitmap_equal(tmp, map, SUBSECTIONS_PER_SECTION),
-				"section already deactivated (%#lx + %ld)\n",
-				pfn, nr_pages))
-		return -EINVAL;
-
-	bitmap_xor(subsection_map, map, subsection_map, SUBSECTIONS_PER_SECTION);
-	return 0;
-}
-
-static bool is_subsection_map_empty(struct mem_section *ms)
-{
-	return bitmap_empty(&ms->usage->subsection_map[0],
-			    SUBSECTIONS_PER_SECTION);
-}
-
-static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
-{
-	struct mem_section *ms = __pfn_to_section(pfn);
-	DECLARE_BITMAP(map, SUBSECTIONS_PER_SECTION) = { 0 };
-	unsigned long *subsection_map;
-	int rc = 0;
-
-	subsection_mask_set(map, pfn, nr_pages);
-
-	subsection_map = &ms->usage->subsection_map[0];
-
-	if (bitmap_empty(map, SUBSECTIONS_PER_SECTION))
-		rc = -EINVAL;
-	else if (bitmap_intersects(map, subsection_map, SUBSECTIONS_PER_SECTION))
-		rc = -EEXIST;
-	else
-		bitmap_or(subsection_map, map, subsection_map,
-				SUBSECTIONS_PER_SECTION);
-
-	return rc;
-}
 #else
 void __init subsection_map_init(unsigned long pfn, unsigned long nr_pages)
 {
 }
-
-static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
-{
-	return 0;
-}
-
-static bool is_subsection_map_empty(struct mem_section *ms)
-{
-	return true;
-}
-
-static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
-{
-	return 0;
-}
 #endif
 
 /* Record a memory area against a node. */
@@ -730,6 +666,55 @@ static void free_map_bootmem(struct page *memmap)
 
 	vmemmap_free(start, end, NULL);
 }
+
+static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
+{
+	DECLARE_BITMAP(map, SUBSECTIONS_PER_SECTION) = { 0 };
+	DECLARE_BITMAP(tmp, SUBSECTIONS_PER_SECTION) = { 0 };
+	struct mem_section *ms = __pfn_to_section(pfn);
+	unsigned long *subsection_map = ms->usage
+		? &ms->usage->subsection_map[0] : NULL;
+
+	subsection_mask_set(map, pfn, nr_pages);
+	if (subsection_map)
+		bitmap_and(tmp, map, subsection_map, SUBSECTIONS_PER_SECTION);
+
+	if (WARN(!subsection_map || !bitmap_equal(tmp, map, SUBSECTIONS_PER_SECTION),
+				"section already deactivated (%#lx + %ld)\n",
+				pfn, nr_pages))
+		return -EINVAL;
+
+	bitmap_xor(subsection_map, map, subsection_map, SUBSECTIONS_PER_SECTION);
+	return 0;
+}
+
+static bool is_subsection_map_empty(struct mem_section *ms)
+{
+	return bitmap_empty(&ms->usage->subsection_map[0],
+			    SUBSECTIONS_PER_SECTION);
+}
+
+static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
+{
+	struct mem_section *ms = __pfn_to_section(pfn);
+	DECLARE_BITMAP(map, SUBSECTIONS_PER_SECTION) = { 0 };
+	unsigned long *subsection_map;
+	int rc = 0;
+
+	subsection_mask_set(map, pfn, nr_pages);
+
+	subsection_map = &ms->usage->subsection_map[0];
+
+	if (bitmap_empty(map, SUBSECTIONS_PER_SECTION))
+		rc = -EINVAL;
+	else if (bitmap_intersects(map, subsection_map, SUBSECTIONS_PER_SECTION))
+		rc = -EEXIST;
+	else
+		bitmap_or(subsection_map, map, subsection_map,
+				SUBSECTIONS_PER_SECTION);
+
+	return rc;
+}
 #else
 struct page * __meminit populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap)
@@ -773,6 +758,21 @@ static void free_map_bootmem(struct page *memmap)
 			put_page_bootmem(page);
 	}
 }
+
+static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
+{
+	return 0;
+}
+
+static bool is_subsection_map_empty(struct mem_section *ms)
+{
+	return true;
+}
+
+static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
+{
+	return 0;
+}
 #endif /* CONFIG_SPARSEMEM_VMEMMAP */
 
 /*
-- 
2.17.2

