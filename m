Return-Path: <linux-next+bounces-9587-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 217CBD00490
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 23:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B2933014613
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 22:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA732C3260;
	Wed,  7 Jan 2026 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4MB5hjJn"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF3A27A477;
	Wed,  7 Jan 2026 22:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767823835; cv=none; b=sGVE55DojZ7Ac7PluZAWZ8xXNNpsUnkwLWGz+JFg4k1Gyi/s3uVshejFiN+dII4UomTk9jUUdBkBUKKOKMKuvqIddA6Nm+VGODdx8+w3MztBNP91HJwiQSpR0GEJQIQJMqDT6Nj+WvkfvW9bGQqCGLgDiPPhyfAKZcyXREsryLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767823835; c=relaxed/simple;
	bh=+CFxfV8vYHcn4NXCFfFR6qBb6GB2eymUx3vVnCUekkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2E0VVZbKdxKjVp7DiGp0iEoqumooH1mFHQSJED9BZWYNZ317R5zO+opu2DsaF53hQNRBf5fa5bGa6asPQkCkGKN8mDwduhkxDhHAUY7/VC3cg3Kj37dDrrfIZxNYgyljA5WeUGWFCpHcbzULEGOTve8epDDlOg9uFwEaZ1yAxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4MB5hjJn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=cCi7uak3kYMJLQXs8rRL1NOT2t0xbbpe3W8ytCyjib0=; b=4MB5hjJnExBxmb7PB4eR6jIEVz
	th6MnzPMmSRIcCZo1FqLYndkrdMDT+6fyWpASlZMLfkFespOG6BU4b0X1jqmEQbQ/MsHE09CXaEiu
	yv34fDrZh5vskL3oaquLJgBuvHKVjhYRPlKbQVm0Y8h8IGHBY0/krQ7FAg/yUsL5/bIqKjUN3IP3p
	hdmfOrcaas+CXz+2oUEeuOo9m2r2ryhrU3+vYmCOlvEBE6rMnO9DgDMR/COQdI4tMfZ7pom839XOh
	SYzRBSDpJGtuwcDsRbsrOLPGDuVAUGwYmhHc3kHqkxqNgmGTpZg6dZyOMVgPr5v9xOCmBmGY3rCm0
	FWptGq4g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdbjZ-0000000FhH8-0gT6;
	Wed, 07 Jan 2026 22:10:29 +0000
Message-ID: <803d1946-6935-452d-953a-90f6e73d53a2@infradead.org>
Date: Wed, 7 Jan 2026 14:10:28 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the tip tree
To: Peter Zijlstra <peterz@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Marco Elver <elver@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260107161548.45530e1c@canb.auug.org.au>
 <20260107215409.GB694817@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260107215409.GB694817@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/7/26 1:54 PM, Peter Zijlstra wrote:
> On Wed, Jan 07, 2026 at 04:15:48PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the tip tree, today's linux-next build (htmldocs) produced
>> this warning:
>>
>> Documentation/core-api/kref:328: include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
>>   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), str
>> uct mutex *mutex) __cond_acquires(true# mutex)
>>   ------------------------------------------------------------------------------------------------^
>> Documentation/core-api/kref:328: include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
>>   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
>>   --------------------------------------------------------------------------------------------^
>>
>> Introduced by commit
>>
>>   5e256db9325e ("kref: Add context-analysis annotations")
> 
> I really have no clue what that thing is on about. The code is fine and
> works as intended.
> 
> My go-to fix for anything kdoc is to change '/**' into '/*' until it
> goes away.

Yes, that works.

I think that kernel-doc is just confused by the trailing __cond_acquires(true# lock).

Mauro, would you take a look, please?


-- 
~Randy


