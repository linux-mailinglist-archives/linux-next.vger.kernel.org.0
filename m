Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D486118474E
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 13:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgCMM4e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 08:56:34 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28707 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726426AbgCMM4e (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 08:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584104193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oFffVLBSrzUJVd5vEtDabzgVlUp9IT+H+W/QmhOzo6U=;
        b=ekZ6qGKojEKQL9dYsAZ0HIkVitI6dml8zSPcLfInU55AJmlIWJjThdcV/OJ/PpKnpc0IcD
        kpSDpXIL2gEGLzB+5dOtLdMC4w74FT/mnEEHlfERel8b/ZKDp3wKIRpR/Xqnyo8nBSy8ki
        GPtK0mYMjEmqRMR26zOHlDzSM4Imy4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-02CmSrC5PQeF8AD9mm0GyQ-1; Fri, 13 Mar 2020 08:56:31 -0400
X-MC-Unique: 02CmSrC5PQeF8AD9mm0GyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A99A800D50;
        Fri, 13 Mar 2020 12:56:30 +0000 (UTC)
Received: from localhost (ovpn-12-51.pek2.redhat.com [10.72.12.51])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B7F921001902;
        Fri, 13 Mar 2020 12:56:29 +0000 (UTC)
Date:   Fri, 13 Mar 2020 20:56:27 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200313125627.GA8518@MiWiFi-R3L-srv>
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
> Hi all,
> 
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
> 
> Introduced by commits
> 
>   38eb09ac7c29 ("mm/sparse.c: introduce new function fill_subsection_map()")
>   334411156ba6 ("mm/sparse.c: introduce a new function clear_subsection_map()")

Hi Stephen,

I made below change, but I can't triger these warnings. Could you try
below patch, see if it's works?


From 9be668f1e30b6bb4ed5f4a07e7d3bb76d3f58f35 Mon Sep 17 00:00:00 2001
From: Baoquan He <bhe@redhat.com>
Date: Fri, 13 Mar 2020 20:25:54 +0800
Subject: [PATCH] mm/sparse.c: fix the building warning with !SPARSEMEM

Stephen reported below warnings are seen with allnoconfig on x86_64.
Fix it by making those dummy functions sub-section map handling visible
with CONFIG_SPARSEMEM enabled.

mm/sparse.c:311:12: warning: 'fill_subsection_map' defined but not used [-Wunused-function]
  311 | static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
      |            ^~~~~~~~~~~~~~~~~~~
mm/sparse.c:306:13: warning: 'is_subsection_map_empty' defined but not used [-Wunused-function]
  306 | static bool is_subsection_map_empty(struct mem_section *ms)
      |             ^~~~~~~~~~~~~~~~~~~~~~~
mm/sparse.c:301:12: warning: 'clear_subsection_map' defined but not used [-Wunused-function]
  301 | static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
      |            ^~~~~~~~~~~~~~~~~~~~

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/sparse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index 362018e82e22..9e08d118719f 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -293,7 +293,7 @@ static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
 
 	return rc;
 }
-#else
+#elif defined(CONFIG_SPARSEMEM)
 void __init subsection_map_init(unsigned long pfn, unsigned long nr_pages)
 {
 }
-- 
2.17.2

