Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31198183DDD
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 01:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgCMAbu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 20:31:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:56970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbgCMAbu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 20:31:50 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F9E6205F4;
        Fri, 13 Mar 2020 00:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584059509;
        bh=U6yu3h1JK3KYJor/2fq9U7mcNdls4bBnMQ63AohUn3s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k0hfjg76kLJmC1o/ed6y+DKXm+1hSq9XjHy56gkrPxIn1xmxjuNe6vjBVy5dF6Jzy
         3JWhHOXmBXxL+uAHm+kAtb0I8xUJgj7kFd1q4VpC8sgTYXdjA55Xf56X+iT+3/lHU5
         On1nYG8MSqt41J1nrnU4vHCSkaCmrROEUWrISTdo=
Date:   Thu, 12 Mar 2020 17:31:48 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-Id: <20200312173148.6647751b1ad538687563f652@linux-foundation.org>
In-Reply-To: <20200312182725.618ca518@canb.auug.org.au>
References: <20200312182725.618ca518@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 12 Mar 2020 18:27:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> mm/gup.c:119:13: warning: 'put_compound_head' defined but not used [-Wunused-function]
>   119 | static void put_compound_head(struct page *page, int refs, unsigned int flags)
>       |             ^~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   6379e529ebe4 ("mm/gup: fixup for 9947ea2c1e608e32 "mm/gup: track FOLL_PIN pages"")
> 

Thanks.

I think this is right.  And I don't think it'll apply to most recent
-next.

--- a/mm/gup.c~mm-gup-track-foll_pin-pages-fix-2-fix
+++ a/mm/gup.c
@@ -78,21 +78,6 @@ static __maybe_unused struct page *try_g
 	return NULL;
 }
 
-static void put_compound_head(struct page *page, int refs, unsigned int flags)
-{
-	if (flags & FOLL_PIN)
-		refs *= GUP_PIN_COUNTING_BIAS;
-
-	VM_BUG_ON_PAGE(page_ref_count(page) < refs, page);
-	/*
-	 * Calling put_page() for each ref is unnecessarily slow. Only the last
-	 * ref needs a put_page().
-	 */
-	if (refs > 1)
-		page_ref_sub(page, refs - 1);
-	put_page(page);
-}
-
 /**
  * try_grab_page() - elevate a page's refcount by a flag-dependent amount
  *
@@ -1967,7 +1952,24 @@ EXPORT_SYMBOL(get_user_pages_unlocked);
  * This code is based heavily on the PowerPC implementation by Nick Piggin.
  */
 #ifdef CONFIG_HAVE_FAST_GUP
+
+static void put_compound_head(struct page *page, int refs, unsigned int flags)
+{
+	if (flags & FOLL_PIN)
+		refs *= GUP_PIN_COUNTING_BIAS;
+
+	VM_BUG_ON_PAGE(page_ref_count(page) < refs, page);
+	/*
+	 * Calling put_page() for each ref is unnecessarily slow. Only the last
+	 * ref needs a put_page().
+	 */
+	if (refs > 1)
+		page_ref_sub(page, refs - 1);
+	put_page(page);
+}
+
 #ifdef CONFIG_GUP_GET_PTE_LOW_HIGH
+
 /*
  * WARNING: only to be used in the get_user_pages_fast() implementation.
  *
_

