Return-Path: <linux-next+bounces-4936-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD9C9EBADA
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 21:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D836282D80
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 20:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABF022689F;
	Tue, 10 Dec 2024 20:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIQVNf9e"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550E321504C;
	Tue, 10 Dec 2024 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733862464; cv=none; b=ehozZ49fLGsCD7IzA0uFt5v0xVtyCz+pqdmif/gh00s6+CvSMJbhj42xOo18QU4NLoqsjO2/xtqXT0/s9mSaaAR9lpwWrUyJ0X45jOv8CZcR/HP4W8yTjj5IjZ2eGbEdOiyQuv/SqPD0mrwf7/OSgT9ddMaBbFMhgFXTfXPS7QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733862464; c=relaxed/simple;
	bh=goZardWMquXxzpOl9Tq+pH1tOzOCyV2LTao3+db3xfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBhXdAb/Xdb/Dx723Ew9UwG2GPsNJpGJHcO7of8AtTkHodA3JkcAUDgq9EsLCAgt5iNreZyRuOiOTDVCPtlHcOq2IpHZ+nmzygfOgDSIWUerUWuytaQuVDVk+16tyZVJhFWjaqUX+G+qWBixR9FTng4H1yGUo1zaT2LUI5HJVAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIQVNf9e; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733862463; x=1765398463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=goZardWMquXxzpOl9Tq+pH1tOzOCyV2LTao3+db3xfM=;
  b=EIQVNf9e7pPor5W6Lw+58jNj5ZZKptNgvytktYJRx8gD98QNwC0UiL7r
   jV4NwivpkilO8S5xvkEfVggZRixDcORyubeDn+Y5JlnC4UfgFQyBySajQ
   yAZytVCPdeQJCj2DnYdXasXrhKEXv3j+u7JRzuUsp6c1IaOHvAUFKUPJR
   BZ3bdFQBPoJn++EgTUmy49h5qaRrFvyWJkEBy+83yZUWrKNNZgroJuqRx
   B6nWW4VF3rYXb1esrPn3YG+9qI71FzwUhQKfEiEWxYo+0wp5Ox/QNZH5H
   yuTIBCKuSXRW2P+TF400DXo6qcGtlwxBg3HHlpj5nrddsLgD7HtBc00bs
   w==;
X-CSE-ConnectionGUID: 0mPdF05VQMS3s6MEz9Od6w==
X-CSE-MsgGUID: av2GIo5VT8S4NJp1l3H0XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45626398"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="45626398"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 12:27:43 -0800
X-CSE-ConnectionGUID: QvhTK9y5SeS1fwWB3EjvZQ==
X-CSE-MsgGUID: KnLnPeyWRymjVYrk7hB6rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="95355142"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 12:27:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tL6pX-00000006HiC-2ah8;
	Tue, 10 Dec 2024 22:27:39 +0200
Date: Tue, 10 Dec 2024 22:27:39 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the auxdisplay
 tree
Message-ID: <Z1ikO7HzRx3NyZSn@smile.fi.intel.com>
References: <20241210095145.43be58b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210095145.43be58b0@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 10, 2024 at 09:51:45AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   fcfadc7fef8c ("auxdisplay: img-ascii-lcd: Constify struct img_ascii_lcd_config")
>   3b362560d9a3 ("auxdisplay: img-ascii-lcd: Remove an unused field in struct img_ascii_lcd_ctx")
> 
> are missing a Signed-off-by from their committer.

Fixed now, thanks for notifying!

-- 
With Best Regards,
Andy Shevchenko



