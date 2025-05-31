Return-Path: <linux-next+bounces-7001-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ACDAC9959
	for <lists+linux-next@lfdr.de>; Sat, 31 May 2025 07:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9EFB4A4407
	for <lists+linux-next@lfdr.de>; Sat, 31 May 2025 05:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0CC28D85B;
	Sat, 31 May 2025 05:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdeU0Wq+"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C0328CF4C;
	Sat, 31 May 2025 05:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748668504; cv=none; b=XwAozSl9u7rSf/We1G3CbqDwmUY+4ncyszpcTAY9aIsy7MmAb1bL6puwBUKV7dJdOjVlej+14f0m6JYnOhCGqZJ5W0UKH+R6Vl5i8LPA6qBffHIELlRmhKsVydXoTHb3pjx8Mc/LhpGFqg/hWGhT4JwD2mC33gK0WL/Jq9bZSGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748668504; c=relaxed/simple;
	bh=ov2RyoyGWZ9CUaKx1R+A9gSrh0GTb1Lv9Uc4r1MDsHc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fEJZnQKBl3vl1trOogM7n6eN7dyR7+fwwMuWwNkx5bVh12MCn2fGDnOcGdlFb4zvSYL1FT7elFLbe7VtkVeD75Asf71kr2FcGycui9FUtiN8+4NK/BuXYkcZbVp6fxUUKMmECYMCRqlcr2/c2LV91UEx+XQLGZlLrD6Y0uzMVVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdeU0Wq+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748668502; x=1780204502;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ov2RyoyGWZ9CUaKx1R+A9gSrh0GTb1Lv9Uc4r1MDsHc=;
  b=FdeU0Wq+AW8+2kWbWy/EyNcdgLwi9O/ZOGbs1e5q9UrTUn9JBB/vTtt+
   Y79OuWDRB5Lyx8r3eD7aTMBfBLVXbDUVEdz99s1vVMYHGaL+WxoDrPqFd
   v70bKJuXfOxfuB+i8IglqZ4gEz7TMrat42Cf9hVgvEwNipoVa6qLmuKVv
   the3BgcqTLDe02C07zK5J+AGr2oaKoeu1qamoyjXQbumagRfe6JvKxrO/
   lpKXn7US8pAjqQEj7FgzzQXwlYvNbVu1Kk4PMwiuNXOfZGFMamWohdqQN
   VCJT5Mk+vK7fDF/QApgNwESie58YQZz0DvklJ2oUsMrg5Ta++Ol6xuE17
   w==;
X-CSE-ConnectionGUID: Ag6r+IQ1QnCGaClWWBZhAg==
X-CSE-MsgGUID: zqX30EUFSd2dx6Hpl4QvfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="38388614"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="38388614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:15:02 -0700
X-CSE-ConnectionGUID: cMrtS6uQRyCXosT/QY4O4g==
X-CSE-MsgGUID: o0rFZUSPQ7ymTJug2gUg7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144083942"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:14:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 31 May 2025 08:14:53 +0300 (EEST)
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
cc: rdunlap@infradead.org, Hans de Goede <hdegoede@redhat.com>, 
    sfr@canb.auug.org.au, linux-next@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com, 
    king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH 1/3] i2c: designware: Initialize adapter name only when
 not set
In-Reply-To: <20250530200234.1539571-2-pratap.nirujogi@amd.com>
Message-ID: <e75a0e17-8a1b-14f0-a33d-e59c0f692651@linux.intel.com>
References: <20250530200234.1539571-1-pratap.nirujogi@amd.com> <20250530200234.1539571-2-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Pratap Nirujogi wrote:

> Check if the adapter name is already set in the driver prior
> to initializing with generic name in i2c_dw_probe_master().
> 
> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index c5394229b77f..ab03943d6aaf 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -1042,8 +1042,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  	if (ret)
>  		return ret;
>  
> -	snprintf(adap->name, sizeof(adap->name),
> -		 "Synopsys DesignWare I2C adapter");
> +	if (!adap->name[0])
> +		snprintf(adap->name, sizeof(adap->name),
> +			 "Synopsys DesignWare I2C adapter");

I'd convert this to scnprintf() here as well and add to the changelog:

While at it, convert to scnprintf() that is preferred over snprintf().

As with the other patch, this too is missing receipients (as indicated 
by the get_maintainers script).

-- 
 i.


