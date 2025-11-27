Return-Path: <linux-next+bounces-9249-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B62C8FEEF
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 19:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2CCA634F166
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 18:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5B02DA760;
	Thu, 27 Nov 2025 18:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DgbqvldB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B966526F28A;
	Thu, 27 Nov 2025 18:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764268979; cv=none; b=rCkEAE0+ij4elbUKy3mnno23vUIivmI3d6dV8pu3fZWL0wmhwLK4YZZ67U4M5hexHtgo8NPMMmg+VT4rYE0pHkBNKpr6tBeeUgQPWIVTuFt8UpUPGEKHVUyIQh2Eo7aSNVI28kQ6mjiX56wHPiPaurrVOpzbSv9w0BmaEH/Kbzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764268979; c=relaxed/simple;
	bh=PN7PsC+le/dZX+AtQd/40qjvqHFYRMdS7xfSyK3iUN4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KBDt34BCz7ciiJn+WLk+sgS6j+CCPnG/da2BUwlk0p98sG7HgsGM9Q71LSTthruuU5AJUNpaq7hpiIYND7NK+wdHRGUs9x5N0tbBBvGiQbnNjv51W1Dn0UlkaZdQs7gljXBGYuP2Nrv1MzgJA8rN7Z4yQGFPsPJz9GxmirkUcgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DgbqvldB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245D5C4CEF8;
	Thu, 27 Nov 2025 18:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764268978;
	bh=PN7PsC+le/dZX+AtQd/40qjvqHFYRMdS7xfSyK3iUN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DgbqvldBxMM0b5q5kAvl+z+AwYV70BeNeSC08lnGSR9iq22B4+hgoZLnmcM5IwQlX
	 wQed0v3V8GYyRrKbvGyZ8kQUVCUjdSwz0RgUapXJ4R9W0GFsZeGBQiDYDemYkiK4qB
	 pDvnt3Isl3ICPWiGqvOn7XvakXXFWaaI2VI4NPuE=
Date: Thu, 27 Nov 2025 10:42:57 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexey Skidanov
 <alexey.skidanov@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning in Linus' tree
Message-Id: <20251127104257.862f0bb753226111ff09acbc@linux-foundation.org>
In-Reply-To: <20251127130624.563597e3@canb.auug.org.au>
References: <20251127130624.563597e3@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Nov 2025 13:06:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In Linus' tree, today's linux-next build (htmldocs) produced this
> warning:
> 
> WARNING: /home/sfr/kernels/next/next/include/linux/genalloc.h:52 function parameter 'start_addr' not described in 'genpool_algo_t'
> 
> Introduced by commit
> 
>   52fbf1134d47 ("lib/genalloc.c: fix allocation of aligned buffer from non-aligned chunk")
> 
> This has been exposed recently after a bug was fixed that caused some
> warnings to not be reported.

Thanks.  I think I can handle this one.  Just.


--- a/include/linux/genalloc.h~genalloch-fix-htmldocs-warning
+++ a/include/linux/genalloc.h
@@ -44,6 +44,7 @@ struct gen_pool;
  * @nr: The number of zeroed bits we're looking for
  * @data: optional additional data used by the callback
  * @pool: the pool being allocated from
+ * @start_addr: start address of memory chunk
  */
 typedef unsigned long (*genpool_algo_t)(unsigned long *map,
 			unsigned long size,
_


