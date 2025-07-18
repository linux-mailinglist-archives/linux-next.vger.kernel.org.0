Return-Path: <linux-next+bounces-7613-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD20B099F1
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 04:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9745B588068
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 02:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F431A23A0;
	Fri, 18 Jul 2025 02:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Dt2z+WPG"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E851624E9;
	Fri, 18 Jul 2025 02:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752806861; cv=none; b=mGqig+WSVT9pK+r4fkJhi3VgF+nvnwW1J40oA/+Fx37IWOm2gsk90L8BY0XeAgQpS7fmSefQkW4gHdM1aOaMlsSlx4tOigQcB1It18+u+u2KQM1SkAQUonNy4W/X3COIfXtBjKuiHLXyuBGTzequxdAhcJY2pyTmTw06yYOuEUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752806861; c=relaxed/simple;
	bh=+ZIPuIVWERMMIbt9faPU/ftVC8NhccyG1uiTnRBmWAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJ6Ej3D+N96EPPbrr+qu0X67vICz8ZkrgboF7PfulXeWAiIPn18SCGHfCQX3lrXE6ao4oX8DguCkfNNKm2wXStVwCDhWvtKJ7cCjKnF2+FiLogJVgiFC/wTEWDrV2dg2WvT+sW5elIA9VhgtjoB0lR52LmIooOmoSNLQSZ4qj3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Dt2z+WPG; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pfZwVa2e7UfuhqUN30vyyRTLr8+UwpV2ju413mc37x8=; b=Dt2z+WPGwrQW0UXgseLDi/rX7E
	M1Y8g2NCXC1iD2Q+FNUnbH6FI0nOn8sK0VlEQ46KXcRrYWZxU8P029deBnAWZDsuuL047ktNS2d2t
	NmXCsNJZmQc0GXma71DP2dk6Vgp6GefPYF1lSJqTODnBUaC5IeSpBuOM7f8I1tvv6ITCcSznbuys8
	Mb6pCgY6otjw+akEdGFX/hPa4ORr/pKpXuDwvcm5TsRD8GAd0XZMbkzd296HyPur2YosR+32WgC4T
	Swtf/pY3jEQLkDVNrUm8OZDTeB+O00UuwpqT1EoqB7//XEqdzFtC/GwEgnN+It7uiHvYLAyuXZmMP
	aasjA4Og==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucb8L-0000000BYrd-0TuG;
	Fri, 18 Jul 2025 02:47:37 +0000
Message-ID: <d39116ce-164c-4bf6-80af-ba63ccfb96d4@infradead.org>
Date: Thu, 17 Jul 2025 19:47:35 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cleanup: Fix documentation build error for ACQUIRE
 updates
To: Dan Williams <dan.j.williams@intel.com>, dave.jiang@intel.com
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org,
 linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250717173354.34375751@canb.auug.org.au>
 <20250717163036.1275791-1-dan.j.williams@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250717163036.1275791-1-dan.j.williams@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/17/25 9:30 AM, Dan Williams wrote:
> Stephen reports:
> 
> Documentation/core-api/cleanup:7: include/linux/cleanup.h:73: ERROR: Unexpected indentation. [docutils]
> Documentation/core-api/cleanup:7: include/linux/cleanup.h:74: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> 
> Which points out that the ACQUIRE() example in cleanup.h missed the "::"
> suffix to mark the following text as a code-block.
> 
> Fixes: 857d18f23ab1 ("cleanup: Introduce ACQUIRE() and ACQUIRE_ERR() for conditional locks")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: http://lore.kernel.org/20250717173354.34375751@canb.auug.org.au
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  include/linux/cleanup.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
> index 4eb83dd71cfe..0fb796db4811 100644
> --- a/include/linux/cleanup.h
> +++ b/include/linux/cleanup.h
> @@ -64,8 +64,7 @@
>   * the remainder of "func()".
>   *
>   * The ACQUIRE() macro can be used in all places that guard() can be
> - * used and additionally support conditional locks
> - *
> + * used and additionally support conditional locks::
>   *
>   *	DEFINE_GUARD_COND(pci_dev, _try, pci_dev_trylock(_T))
>   *	...
> 
> base-commit: 857d18f23ab17284d1b6de6f61f4e74958596376

-- 
~Randy

