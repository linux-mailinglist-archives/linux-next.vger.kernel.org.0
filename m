Return-Path: <linux-next+bounces-4462-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC91C9B21A6
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 02:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 989481F211E5
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 01:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E22CBA3F;
	Mon, 28 Oct 2024 01:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FBzq9iJR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4419163C;
	Mon, 28 Oct 2024 01:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730077219; cv=none; b=UZ/G5ulE2vku7ovQqt+p/YyAUigMZKpIu1ibrFs5NIBUQg9AXgkTb6vNU2L3JOwTLVio/ivKon6inDSX0FcGmAt/+Yen8VbpdMzXsivjMD+ehizrgK0VBT3Raf89RVSSZN+hOZaxs8zqvgodIo9MZmeh0ZH3GwcVtCLDjJCAgmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730077219; c=relaxed/simple;
	bh=uFzXuzXfdMaYcAO5ePePiNBixf/U3pxPBRF2yP3FxFk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LRTEv4NideE+Zh3iCYT1H5uff4YG9qvwV3ObluYlj6lsvDK5U/rUmjp9zo/3ZcRpMy6rtKk26OPHkUWRQoC2ok/vyKi/wNQeWR6U6JbcIj9fmRWPdWLK8pg24pxKPsUPoFop/0g8f94kv+oP+mzhzZlQHY7mdccpebC8A0jd0tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FBzq9iJR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951D2C4CEC3;
	Mon, 28 Oct 2024 01:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1730077216;
	bh=uFzXuzXfdMaYcAO5ePePiNBixf/U3pxPBRF2yP3FxFk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FBzq9iJRuqbg5O9i+P2GS1lSBTcPJ4fS3CCaSanPbMewlpz8mOxMbzyBh2XluZBX2
	 SsztLprjjcuC2lKQ+RwE8tiLhjtIk98dL53t+1XQiOIdwQvUI3BhAiVjtJUjM6ZD/T
	 Btzsx798IbdyP4SzXTvo4lUpW7MWro0LiIk3/b+k=
Date: Sun, 27 Oct 2024 18:00:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20241027180015.0a995500a00719a9ec7b228b@linux-foundation.org>
In-Reply-To: <20241028103638.70996727@canb.auug.org.au>
References: <20241028103638.70996727@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Oct 2024 10:36:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> mm/workingset.c: In function 'workingset_activation':
> mm/workingset.c:598:38: error: implicit declaration of function 'folio_memcg_charged'; did you mean 'folio_memcg_check'? [-Wimplicit-function-declaration]
>   598 |         if (mem_cgroup_disabled() || folio_memcg_charged(folio))
>       |                                      ^~~~~~~~~~~~~~~~~~~
>       |                                      folio_memcg_check
> 
> Caused by commit
> 
>   b4fa93fbd1dc ("memcg: workingset: remove folio_memcg_rcu usage")
> 
> from the mm-unstable branch of the mm tree.
> 
> this build has
> 
> # CONFIG_MEMCG is not set
> 

Thanks.  This?

--- a/include/linux/memcontrol.h~memcg-workingset-remove-folio_memcg_rcu-usage-fix
+++ a/include/linux/memcontrol.h
@@ -1055,6 +1055,11 @@ static inline struct mem_cgroup *folio_m
 	return NULL;
 }
 
+static inline bool folio_memcg_charged(struct folio *folio)
+{
+	return false;
+}
+
 static inline struct mem_cgroup *folio_memcg_check(struct folio *folio)
 {
 	return NULL;
_


