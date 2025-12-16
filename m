Return-Path: <linux-next+bounces-9426-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C0CC0B24
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 04:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B17E8301276E
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 03:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E76259C84;
	Tue, 16 Dec 2025 03:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="snIEyrGC"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EB2224B0E;
	Tue, 16 Dec 2025 03:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765854896; cv=none; b=IJ3I4w3g49YxquCMCB3Y2wwO9f2TXF5jlP7N1eQHZ/5ooMXJDoVtWNmWTYkC51YyELQq+lwoCoDUfv3w+Jx88X1ZE2Bejl/GJzVW6Fnsmj9E/YD1L3fnFlAb4yplHA3UN0lTbKAsFrEys0Z+n7NrandtjO67iF0D6ZebJQoGcYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765854896; c=relaxed/simple;
	bh=+WLGnw5Xu94aB++qQmyjb1jYwvHPL0rECRTOi4r6j9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7MTN4QPUwYoTnVZ8PQJE8fK6FPZEpjoq88v/h+qIqq6kAvz0Vt1745ROjCt+EiXyHH5SExwquQKxG9zqmYRz+TOKEjxwLeRq9rkaOf8lBkgTkyaQTeZ9vALkQrNxWAC48L5kaD7EPvDCaPEQQKzvZX35OJ/vbdy7XtdCfTGMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=snIEyrGC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=QQxRGy2EG5UfSE1/IWBqXUzedvZ/x2Sqz3NKsP6Mrtg=; b=snIEyrGC3H3jNpZO492WVrGPXP
	V4DC8CLKxGEeD5PBflA9EDKwMxTkUq/Fw4/vdHOdUDsV+Crx0YwFFo4rYPk+tf8oJfm3TdsB98ErY
	pF6nD6qP/Y99en0+qlQtsjGA1RbAwx2fCeAFBBqUfHX8obgyVDeu9T15NZSzepk+rAs+vV3pe3/5T
	l7FwIpq7PwjG75jt19sFKv0bnVgFMgbK1e7JZiF+EnYo+sZdR1cMswrzpcAHHNo9APjWGOfaRuBIB
	bQmP/TeXMISvFGGbZRN+pSmifQ1o7nuG+FDv3akmRd4uDcE0VX5nB83MxsdBnSKHVhxSeenslNc9i
	uR2CAi0A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVLWV-00000004cBe-0Sdd;
	Tue, 16 Dec 2025 03:14:51 +0000
Message-ID: <52b2239b-aab6-4b15-b92c-809f129bcfd3@infradead.org>
Date: Mon, 15 Dec 2025 19:14:50 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings in Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Matthew Auld <matthew.auld@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251106151606.0b5487ca@canb.auug.org.au>
 <20251216120528.35df8abf@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251216120528.35df8abf@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/15/25 5:05 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 6 Nov 2025 15:16:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next build (htmldocs) produced these warnings:
>>
>> WARNING: drivers/gpu/drm/drm_gpusvm.c:1229 expecting prototype for drm_gpusvm_range_pages_valid_unlocked(). Prototype was for drm_gpusvm_pages_valid_unlocked() instead
>> WARNING: drivers/gpu/drm/drm_gpusvm.c:1229 function parameter 'svm_pages' not described in 'drm_gpusvm_pages_valid_unlocked'
>>
>> Introduced by commit
>>
>>   6364afd532bc ("drm/gpusvm: refactor core API to use pages struct")
>>
>> "make htmldocs" was not reporting all warnings for some time.  This has
>> now been fixed and these appeared today.
> 
> I am still seeing this warning.
> 

patch:
https://lore.kernel.org/dri-devel/20251115224510.3829644-1-rdunlap@infradead.org/


-- 
~Randy


