Return-Path: <linux-next+bounces-6070-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB87A74D6D
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 16:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC2777A619A
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 15:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B87A1A9B5D;
	Fri, 28 Mar 2025 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bKYDBp7c"
X-Original-To: linux-next@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE2A79E1
	for <linux-next@vger.kernel.org>; Fri, 28 Mar 2025 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174547; cv=none; b=M85majBuj8blIxfZRuPnx8jbqJlGOKD6CDwq51rXLkTU/jF+ZRdC+GZZZnRMUYaLgrVFXj4QJU2ixogmjxjkgHuLR30/9oU6RpUnsdUpQ1vig6JJIxI36+iKEYe1lyoQMj5bBwu8CfEcbAIpqeJVQdnY5zkCnPSKQNJ6lbJHL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174547; c=relaxed/simple;
	bh=StGCXn6Q8hmtPiPLtbd9V7qnrY5CuWKQW0TMy5z7sY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ub1A7C2lZ8Zrn/6iB7oOL89dTJMsPJK7kRq+4f5fufxuoC38ugtvIaTM39SZD217Vwuz7ZEdtRGKTU5WXm046VpdwSWmXclMIKsbQ3nctjKTTo3h534lqfLTP95ELB/OMec9x2x0a/9YETCHelSoTk91NH9v/wvbRYrEdAdMzQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bKYDBp7c; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 28 Mar 2025 11:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743174531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d+JcTDIF1D1whwm3m0rSlf3wwI+qx1BQ2PLx1jlmj+k=;
	b=bKYDBp7cyQEciWY53PTMe3INOfwvqwg/oL/DsxxJpzcoldXcHAwPAqlwEWR/YqtSjkYwLP
	YqYScPAngrFF0xMcKHEj76QVSQm0joZPfG/bp9jdnKTm5qtBEjYoTnf8zGXuaE0zMuo96B
	f/G4EONCmxl0MtOLS/gwCT5Av6XOwbs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm tree
Message-ID: <cgsr5a447pxqomc4gvznsp5yroqmif4omd7o5lsr2swifjhoic@yzjjrx2bvrq7>
References: <20250328174654.06495cf9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328174654.06495cf9@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Fri, Mar 28, 2025 at 05:46:54PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> lib/sort.c:222: warning: expecting prototype for sort_r(). Prototype was for __sort_r() instead
> lib/sort.c:1: warning: no structured comments found
> 
> Introduced by commit
> 
>   f79965d13aa1 ("lib/sort.c: add _nonatomic() variants with cond_resched()")
> 
> -- 
> Cheers,
> Stephen Rothwell


Andrew - here's a fixup:

From d72340d676cbe7aa605db09a5d6b6213733a0120 Mon Sep 17 00:00:00 2001
From: Kent Overstreet <kent.overstreet@linux.dev>
Date: Fri, 28 Mar 2025 11:07:39 -0400
Subject: [PATCH] fixup! lib/sort.c: Add _nonatomic() variants with
 cond_resched()


diff --git a/lib/sort.c b/lib/sort.c
index 60b51dac00ec..52363995ccc5 100644
--- a/lib/sort.c
+++ b/lib/sort.c
@@ -188,32 +188,6 @@ static size_t parent(size_t i, unsigned int lsbit, size_t size)
 
 #include <linux/sched.h>
 
-/**
- * sort_r - sort an array of elements
- * @base: pointer to data to sort
- * @num: number of elements
- * @size: size of each element
- * @cmp_func: pointer to comparison function
- * @swap_func: pointer to swap function or NULL
- * @priv: third argument passed to comparison function
- *
- * This function does a heapsort on the given array.  You may provide
- * a swap_func function if you need to do something more than a memory
- * copy (e.g. fix up pointers or auxiliary data), but the built-in swap
- * avoids a slow retpoline and so is significantly faster.
- *
- * The comparison function must adhere to specific mathematical
- * properties to ensure correct and stable sorting:
- * - Antisymmetry: cmp_func(a, b) must return the opposite sign of
- * cmp_func(b, a).
- * - Transitivity: if cmp_func(a, b) <= 0 and cmp_func(b, c) <= 0, then
- * cmp_func(a, c) <= 0.
- *
- * Sorting time is O(n log n) both on average and worst-case. While
- * quicksort is slightly faster on average, it suffers from exploitable
- * O(n*n) worst-case behavior and extra memory requirements that make
- * it less suitable for kernel use.
- */
 static void __sort_r(void *base, size_t num, size_t size,
 		     cmp_r_func_t cmp_func,
 		     swap_r_func_t swap_func,
@@ -300,6 +274,32 @@ static void __sort_r(void *base, size_t num, size_t size,
 		do_swap(base, base + size, size, swap_func, priv);
 }
 
+/**
+ * sort_r - sort an array of elements
+ * @base: pointer to data to sort
+ * @num: number of elements
+ * @size: size of each element
+ * @cmp_func: pointer to comparison function
+ * @swap_func: pointer to swap function or NULL
+ * @priv: third argument passed to comparison function
+ *
+ * This function does a heapsort on the given array.  You may provide
+ * a swap_func function if you need to do something more than a memory
+ * copy (e.g. fix up pointers or auxiliary data), but the built-in swap
+ * avoids a slow retpoline and so is significantly faster.
+ *
+ * The comparison function must adhere to specific mathematical
+ * properties to ensure correct and stable sorting:
+ * - Antisymmetry: cmp_func(a, b) must return the opposite sign of
+ * cmp_func(b, a).
+ * - Transitivity: if cmp_func(a, b) <= 0 and cmp_func(b, c) <= 0, then
+ * cmp_func(a, c) <= 0.
+ *
+ * Sorting time is O(n log n) both on average and worst-case. While
+ * quicksort is slightly faster on average, it suffers from exploitable
+ * O(n*n) worst-case behavior and extra memory requirements that make
+ * it less suitable for kernel use.
+ */
 void sort_r(void *base, size_t num, size_t size,
 	    cmp_r_func_t cmp_func,
 	    swap_r_func_t swap_func,
@@ -309,6 +309,18 @@ void sort_r(void *base, size_t num, size_t size,
 }
 EXPORT_SYMBOL(sort_r);
 
+/**
+ * sort_r_nonatomic - sort an array of elements, with cond_resched
+ * @base: pointer to data to sort
+ * @num: number of elements
+ * @size: size of each element
+ * @cmp_func: pointer to comparison function
+ * @swap_func: pointer to swap function or NULL
+ * @priv: third argument passed to comparison function
+ *
+ * Same as sort_r, but preferred for larger arrays as it does a periodic
+ * cond_resched().
+ */
 void sort_r_nonatomic(void *base, size_t num, size_t size,
 		      cmp_r_func_t cmp_func,
 		      swap_r_func_t swap_func,

