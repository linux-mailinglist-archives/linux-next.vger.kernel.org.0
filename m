Return-Path: <linux-next+bounces-7608-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C366CB092F7
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 19:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 047315A37F7
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 17:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001012F94BC;
	Thu, 17 Jul 2025 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIPR8KZM"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC891F872D;
	Thu, 17 Jul 2025 17:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752772381; cv=none; b=FmS1CP1hqxM7l8HwVVWyz51TtHl6CuHwDWyu+xQUqfwrjCd2F/1sAkdPcbKYDCh4zDof/8gA4GoG5JKYk8kvoREfrHeg+AfZXmhVEeg5/2RfKCoimQDSGtXb5EhfpFzApyRrnRSC/5OTSHIudnIeXyIjULeB87RWjWO3my1gMko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752772381; c=relaxed/simple;
	bh=OxG2YOuNYMP3MxSu26iUtrRXoqkBJp+pMg5zixby/ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghJb/3S5K6ar0hsrcfabOV/nq3BKPcJuTmUM4PoI4vKAM6fgLWHZweHCDBZ60o71W2a/n2AJyzfG2ny+RP+StdaDhyaLcTtnFHvj2jUQlOcM6KdnvlOFGOh2DzUjC0wByKE3/0OzsSQf5PsitBZFZ2nKMf45OoLRpPJNdUsyLXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIPR8KZM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752772380; x=1784308380;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OxG2YOuNYMP3MxSu26iUtrRXoqkBJp+pMg5zixby/ro=;
  b=XIPR8KZMt0R52cYnxmwyK6L8csUCe2h8dMsPNhaxbYzrwWxOmFuIAHiX
   n2LMuRYjvbaBxOAhPQTmNIwQq81SipqOpL88nEu99NXGUMH9P0ueMbrlp
   mjmJR22su+L9sW36qw666+uusTdxW+0krrlzpEW/FdTKXGW4bQEksoLyG
   4Q771xKWQsn5OwUuUoGus/lUuD3dG5FH+xY5Sq+j60a9Oz006N8YHhmPu
   uB3q/OHKVtrkvfFrnhLhTYcdfv8XfTpKWILWaOQQH5qOabKj2inde2jM+
   I8kj0vU2g9GrVeC+FhkA+kJeJYFzaJ/nU5bX7jrcCxTFCVmlBO+AI2GRH
   A==;
X-CSE-ConnectionGUID: 4vXR2QuOQpaAxTsSeFPqMg==
X-CSE-MsgGUID: sgRmGW00RBemWN8+ysi+kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="58728945"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="58728945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 10:12:59 -0700
X-CSE-ConnectionGUID: xQUytA59TzGeeWVwchZ3Zw==
X-CSE-MsgGUID: sy17FTAsQsSWpJSCU1GSQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="163488653"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.111.249]) ([10.125.111.249])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 10:12:59 -0700
Message-ID: <f288f2b5-78ac-4852-8919-bad7d8e9f6c8@intel.com>
Date: Thu, 17 Jul 2025 10:12:58 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cleanup: Fix documentation build error for ACQUIRE
 updates
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org,
 linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>
References: <20250717173354.34375751@canb.auug.org.au>
 <20250717163036.1275791-1-dan.j.williams@intel.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
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

Applied to cxl/next
d07b0029a1734062a14466100165994bef2839cf

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


