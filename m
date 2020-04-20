Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2648D1B12DF
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 19:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgDTRYt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 13:24:49 -0400
Received: from verein.lst.de ([213.95.11.211]:42035 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgDTRYt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 13:24:49 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4854D68C4E; Mon, 20 Apr 2020 19:24:46 +0200 (CEST)
Date:   Mon, 20 Apr 2020 19:24:45 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200420172445.GA1372@lst.de>
References: <20200420200009.54554500@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420200009.54554500@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Andrew,

can you fold in these two fixes into the original patches?


diff --git a/mm/nommu.c b/mm/nommu.c
index d32ab47b58a9..371697bf372d 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -155,13 +155,13 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
 		pgprot_t prot, unsigned long vm_flags, int node,
 		const void *caller)
 {
-	return __vmalloc(size, gfp);
+	return __vmalloc(size, gfp_mask);
 }
 
 void *__vmalloc_node(unsigned long size, unsigned long align, gfp_t gfp_mask,
 		int node, const void *caller)
 {
-	return __vmalloc(size, gfp);
+	return __vmalloc(size, gfp_mask);
 }
 
 static void *__vmalloc_user_flags(unsigned long size, gfp_t flags)
