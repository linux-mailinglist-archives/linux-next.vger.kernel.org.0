Return-Path: <linux-next+bounces-4082-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38BA98ECAE
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 12:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77F5D2847EE
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 10:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46A41494A6;
	Thu,  3 Oct 2024 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7tGgS1v"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C993D128369;
	Thu,  3 Oct 2024 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727950070; cv=none; b=Hu/H+xAbt7xoXNVd4VmVFd/m0HzepdVbQ0oZ4fxT2kAZWO52qcYCxR9h+kGduQZ8i8c4wUrt9e1dNiQV7ApR8Jmn52JsDgWcTKYkQ7vDcmyBptU3091SaE4bw8mIqb+jCPK/y3K/l1RoSSjKrxq9QvgqrSTwkzszEOdu5t4O8lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727950070; c=relaxed/simple;
	bh=/NF4xFE7Olwzdb6AyqKqfP4aQQ8mNZr0x6Y2QYMelM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t69RwpomSHtFfeKdapcPJz2/aFsb0eOAuSwrer768JvZKQsV9iNK/8iDRTfK1ifiU/XgxFTz8xUqMHYraZfghObdKJUC3BAIidkDAf9fhm9RCvzUaUL9PVfND/ZivMuXXx+mYrYib9ljR0QsGGYV8LWxGvtQ8Gv4+71WdGO8uFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7tGgS1v; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727950069; x=1759486069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/NF4xFE7Olwzdb6AyqKqfP4aQQ8mNZr0x6Y2QYMelM4=;
  b=K7tGgS1v4dujIzD+3GOgFOfNVgQovb67YIUWZsVALEfY2uoI1u1GX4Wp
   j4OFFdp7i5/W5rAmij+/jf5Ueg7sJ4wui8uoJQVfbD5WsvJypp0h0iVDb
   nz0mTN73Tc+oLXTNoBXyaXZmyBULhl++psqyDGK8H5VGRtI1r5I6ziLwk
   NxFxhSDDGDulRS7nhC6g2/U+6LXWgK24329MLqgYsJp14u4KqOTUb3jQ2
   RM98Jja4H17ZVz1aKDzZGjXhZzFwXisDxe3HmaxLRRWw3qlBbRoXU1KWT
   e1k7XHgGX4X4Owe+xkZcXCGEEhcGIa33ri70N4R8j/uOXffraxtHyvP6l
   Q==;
X-CSE-ConnectionGUID: lPGnPMgZQnC4zJJEmoUxNA==
X-CSE-MsgGUID: c4FGPecWRqKniH9dAuvTZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30844182"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="30844182"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:07:48 -0700
X-CSE-ConnectionGUID: /fd4EMRVS9ytR3rM/SkL3Q==
X-CSE-MsgGUID: i2do0EC7T9eJ01Bw0KTVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="75103190"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:07:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1swIkK-0000000G4zp-38va;
	Thu, 03 Oct 2024 13:07:44 +0300
Date: Thu, 3 Oct 2024 13:07:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the auxdisplay tree
Message-ID: <Zv5s8BbsBKV9lE4L@smile.fi.intel.com>
References: <20241003124608.7eb3f1fb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003124608.7eb3f1fb@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 03, 2024 at 12:46:08PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the auxdisplay tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/auxdisplay/ht16k33.c: No such file or directory
> 
> Caused by commit
> 
>   7f11dc1a9ca9 ("auxdisplay: ht16k33: Make use of i2c_get_match_data()")
> 
> I have used the auxdisplay tree from next-20241002 for today.

Thank you for catching this! It seems the malformed change was pushed into
repository. For an unknown reason I have got the driver renamed. Fixed now.

-- 
With Best Regards,
Andy Shevchenko



