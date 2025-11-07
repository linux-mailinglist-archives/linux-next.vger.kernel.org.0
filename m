Return-Path: <linux-next+bounces-8894-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E507DC3EA68
	for <lists+linux-next@lfdr.de>; Fri, 07 Nov 2025 07:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3B503ABAD1
	for <lists+linux-next@lfdr.de>; Fri,  7 Nov 2025 06:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628C9303A3C;
	Fri,  7 Nov 2025 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CyVgF5Ss"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD262283686;
	Fri,  7 Nov 2025 06:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762498301; cv=none; b=iZx7s11F8iSoi+gpxhDyzQljEj4PBIye8Ymdu1krxCTlqsDmmC9pIyPJtdCy+FiLnKuij2MdJAz6FOdQ2M5fdu5BLJMxomstYxtlJBoBvDd1e2jbgMh7twX5gzPbY7y+TzhlCzAAiTaW0p16JULTrRZgg5Ut80lC4shLtHq7WU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762498301; c=relaxed/simple;
	bh=peeCq82ZZOgggqXjKFkUgbRvju9wjKbRazAhdQdQL3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omqgOP+2dcDFNNDWSKbukLxcza50hSvlM5EcicKxxIjNDX+RUngPH8ZnqPGNvbEm6WicPcYK7AmCJ2bf4vicjJQUSEMPKzmeFk2NvL83I6qiUvJxzWn1A/OsmRFs/oY3oyLYW+mGQ6qqjLswW5bl7S2KWsTxQcl5Em6ml9MzAtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CyVgF5Ss; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=SbDfDbqK6zgTHEGdyNX95eBlH9aDlj9Cf/4iy8CArMI=; b=CyVgF5Ssr9u63591TI1j2xdJqh
	zWWGW/QykS1mDWJPwJFPE+jenQWg28gvVmdXWu42wOgvoVykETX36WjTw3e059uZmYb2wB2K3kNrg
	VRY7yzTlvi+4t6lGPzN4gf27CPOyD0bhRrztWH9RzTebzlNLBHK3SIbXeLMFiBc5TKaUxry6LJHCB
	cW2eKcXg0l4wV9ItcwslMWlvXQgrxVGuCqOFTz7nxQyp7wwakHBeDU9Ej0NqhO0phtwh+XjPm6HzG
	mdutuyvHybe5ph8UQvfYF0vlRyZOYRvVAifb6/6WIQ5MgluWW3ag54eV3b31/T+12rdDF2HaStw7z
	H+4qqZNg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHGJt-0000000Gkk4-2OHy;
	Fri, 07 Nov 2025 06:51:37 +0000
Message-ID: <cc5fa7f1-1f3a-4dfc-81c0-fe69b5f4cd4b@infradead.org>
Date: Thu, 6 Nov 2025 22:51:37 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251107143908.48e3e29e@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251107143908.48e3e29e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/25 7:39 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm-unstable tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> WARNING: include/linux/mm_types.h:302 cannot understand function prototype: 'typedef swp_entry_t leaf_entry_t;'
> 
> Introduced by commit
> 
>   1b8c333c0d1c ("mm-introduce-leaf-entry-type-and-use-to-simplify-leaf-entry-logic-fix")
> 

Change the kernel-doc comment beginning to:

/**
 * typedef leaf_entry_t - Describes a page table 'leaf entry'.

-- 
~Randy


