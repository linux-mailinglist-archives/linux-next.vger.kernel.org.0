Return-Path: <linux-next+bounces-7440-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BF2AFF1FB
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 21:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 694CA7A38E7
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 19:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A912B23B63F;
	Wed,  9 Jul 2025 19:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ETebFBcz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269F78479;
	Wed,  9 Jul 2025 19:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752090217; cv=none; b=VcIuX9GuhuHfzQe+1xd7ObDG0lo6Dq+gflPaotR/WrdSjD7Quv1FsxGrQSk2YV+uafnUkhpZ0/MfcoLhtajbmsAoJQIBOPu2D1NB5eRVZEAAK5JBOWkHOHdss3urjLPjNvAZDZSPlsVKPVzt7LdztgVQ40SAvhZPS1TdmTCZGYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752090217; c=relaxed/simple;
	bh=9FdHIzmQOhgEBuP+679MDUnwv+s9R3D29PH+ku7jcqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivJRfsMSmyu51CZQnKvWWYvuH43Eeq3vPQLoB/BXLj44D7HU4/cwauaQjd4arEArC5oQp69HADeP3skxooYnO9/q0gXbLI1pQRElzfRzrIyMwYiinXUyac2HZ8JNR0l0ANUA5LEULVoX4C6hfZSqNPB7i2Mv4X8zVGJUN3lRDFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ETebFBcz; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0C3E040E0215;
	Wed,  9 Jul 2025 19:43:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fWbZKreNMUv3; Wed,  9 Jul 2025 19:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1752090209; bh=9lov93nQ3Bm7COc4aN0CE+lco3dcqFGG+1042ffeQHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETebFBczAOGDOhMAVY0BQN44cRINYsG6exdq1ZOo6NA6AypfWj8Zdi7x9Wcsb2Oht
	 v9zwH+D778Q/DD7m3ZwOBd2TFeHxnQ/c7fE+PQmogJXf0UotvTIVqtRSv+nkqKozs9
	 2gI0fQ9JOOar9uUOL4T8qtuvVBuJ7G/FiPzkPXLHpew2KL2xvLCncRuFHiKgsTlrgr
	 HeJaRKyFtX8x2j2ubfJGp/hB3hbLlr2w0YDmKQMrHNjBmFaIcPjZSSE0EAVCVJgxSK
	 aZjzpFlU1tLI+8SeEY6+AJ/C0UVPICTYi2j1nZeTTcNtClW3I/Q0bSe9iS28uDvhWO
	 oeevAu9E69y14we5VGAa6jLMcSrUBZgmj+0rfllFAA7tSpP/T6uEeHlDstLt/GXPAB
	 ex+1XcRZL0gzRaMKKMOlGOxnrHesvA/mG7Qp4ImFcLOkwzGutH6fUeO4SaL/5uxF3G
	 no5O9pIrvr0a0eQ6rThMy7Ouy7SZ6zHQaYZa7AgJxWpasSKNO8oY92200aK76JUPkG
	 VDhwQSylvzRvFZY2/rgsHX9PqEQvNVdXwVfmla+MrqFLzXgxHWtgrDOF2l5lfs9Tnr
	 g70YVoybOr1WoRUl7tRbP5PEHgAG82NmbjPqUXYXoi7x5E5ikQ8kgnrf508bxkdPls
	 KVS/sqdHWiJNx88ApMRwGoWk=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B842740E01FD;
	Wed,  9 Jul 2025 19:43:21 +0000 (UTC)
Date: Wed, 9 Jul 2025 21:43:14 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
Message-ID: <20250709194314.GEaG7GUpefEArfshxW@fat_crate.local>
References: <20250708160037.2ac0b55e@canb.auug.org.au>
 <20250707234817.d09fc28a3510b23c31c461b4@linux-foundation.org>
 <20250709091702.GAaG4zjs-otcGsMyY2@fat_crate.local>
 <20250709121203.d8edc8d05253bdf04ce580c6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709121203.d8edc8d05253bdf04ce580c6@linux-foundation.org>

On Wed, Jul 09, 2025 at 12:12:03PM -0700, Andrew Morton wrote:
> > So can you pls send it to Linus so that we can drop it from tip?
> 
> Yup.  Tomorrow seems likely.

Cool. I'll drop it once it lands in his tree and we should be good.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

