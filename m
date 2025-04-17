Return-Path: <linux-next+bounces-6293-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E574CA92212
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 17:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F868173D68
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 15:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35369253F33;
	Thu, 17 Apr 2025 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUkzKRA/"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B469253B4E;
	Thu, 17 Apr 2025 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744905397; cv=none; b=na44gu9tE5WX60vXgE0k8lxd1rpz2YaxmLXL51X17nvE/S1mA0fRdKNMKWjlDC9oIQ0vrI4THRrd0CUo/25d+8bycR5km38cgu9IEeZS7409ge69hs4w4+HgLQ82xdrtmG12iX3dwh55S5t73wNyHnyeKXid3C4EcMiD10rCS2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744905397; c=relaxed/simple;
	bh=uldIoo2ppczQb9y0R5Iyi2s+eQoDhHt8SZj5mwVhK+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sP3J3PLSsU8JIF0R0Zcrei8yi6H9WIVooMEfiYKMMOyU6yvXNtLkyA/h2S2rDMAuuA4Gf3yfCjfUt/7UbBSeEX6lUCySgAoNq98nPTJK/exztyvm6MDjH5wLhk3k0JaKPBxbolG6ovjRhcfJtlRMJbC7kP7qAK20LqpOdRXQDnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUkzKRA/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744905396; x=1776441396;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uldIoo2ppczQb9y0R5Iyi2s+eQoDhHt8SZj5mwVhK+4=;
  b=fUkzKRA/q9WdT2oj/zY8DDQKovLBUvgFTnQ71qQEWwGdpKVWhki0EHCu
   a/wbSZhG5DZBFWCkvSylfu3QsR+dkgpahxD9dg3uMMX8jOD5vkv0hEMYv
   3r+ij0iEEwwOdni5TNuj3NEFB52bOejrSFo7e5jQksWN+6aqNwrWu5AqB
   /M+X9iP4koCCmJDbCb65i7cPhlq3S8eg55aHjLmcKR/UU7g959liEA6zp
   Uwmv2NAJMevVJZPySVV6aW5ubOZirsb9VhVEH4Y3m2A3xDTZ4tYHaXDQb
   SWLsFQLfgbfJ0zGS8C5SpwuGwKzgnw7/rdEUzkjQAToVJqcdT8vSXhAoQ
   A==;
X-CSE-ConnectionGUID: A+9NiFhfQRqE6sffJ0rhvg==
X-CSE-MsgGUID: SC7l47ZRQqinInbNWTATBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57887199"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57887199"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 08:56:35 -0700
X-CSE-ConnectionGUID: WxsXR6KER5KP3y85PdRo+g==
X-CSE-MsgGUID: urzKjAbSRbW4BPr5G6qR5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130603333"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 08:56:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5RbL-0000000DFC7-1VZZ;
	Thu, 17 Apr 2025 18:56:31 +0300
Date: Thu, 17 Apr 2025 18:56:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the gpio-intel tree
Message-ID: <aAEkrx0P5LFj1r6a@smile.fi.intel.com>
References: <20250417154447.642f2ec4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417154447.642f2ec4@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 17, 2025 at 03:44:47PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the gpio-brgl tree as different commits
> (but the same patches):
> 
>   8f4543e980ff ("gpio: ich: use new line value setter callbacks")
>   b7a49fd57be3 ("gpio: graniterapids: use new line value setter callbacks")
> 
> These are commits
> 
>   69e230a0a288 ("gpio: ich: use new line value setter callbacks")
>   04eaa41eb8eb ("gpio: graniterapids: use new line value setter callbacks")
> 
> in the gpio-bgrl tree.

I expect that gpio-bgrl should drop these. Bart?

-- 
With Best Regards,
Andy Shevchenko



