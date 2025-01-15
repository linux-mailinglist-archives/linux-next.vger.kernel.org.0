Return-Path: <linux-next+bounces-5217-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 931CAA1266A
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 15:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F2823A8BE9
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 14:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D88386351;
	Wed, 15 Jan 2025 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlzgOU3o"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C6C134B0;
	Wed, 15 Jan 2025 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736952341; cv=none; b=sajOzyGh766JCUwaMfbFbInu/0VXnzArxWwC7JKmzzuKS1Sia0CfepVV7J4P+DRfuacr2Vd4lxfuhsQqcUsKXra39H2MtcZa3wAvILX4bas/yPYm1p3i5M2TEMIb88cctNQE9heVnhxkbfBHhVPTCYaT+bBhbuXTgYsYCnmxpuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736952341; c=relaxed/simple;
	bh=hPlTnCzW9A1lPeUAg16lZDP22uxa3kvoJMsVMkY2wgQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=k0SElLpkR0NYHXUo8zr2lvvmRN9/w0tEBpPAF0is7owfBYO9+6JA3+8A30Xv8YfTzi9JiRxZ2XuzcAZnS3PsK+OveneIJuGMedepFH0iGCQtU3hanpHQy6TnzLbwSQk9DqQWrXzt6iahnLZgq1s6+wjSdoetyJy9bY3U2PD95+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlzgOU3o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736952339; x=1768488339;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hPlTnCzW9A1lPeUAg16lZDP22uxa3kvoJMsVMkY2wgQ=;
  b=BlzgOU3o4le9lq44UXg2Zu4jH19LTz6kVRIp1gITJT9pmy8VEvlXioYN
   eMz0SUXV3zECVsUh1N1ZRV2hLYTXqGO5YxwzdD9srRe0As8t7ke87JTvr
   15zrkrKB9gHgUlUbFh/+xxCFEM3bmHVaQJoAiI9wQMwDkvozT1nvRwC+1
   J3HB519sDNt4SxefryB4kHO3/vBjJfJ+4jwgW7bOGRMwG4y9jzFjniHdO
   WYkDd9uUnCdM+0ijxZXGDA1O45J5t3xm37HelrBmTbhAwAAoA7AhUnat5
   Hnx9beJDqvTrPhewuDeFuI8JZWiy39hIIbh+yWfhAmL08sF8ieTB+G7lg
   A==;
X-CSE-ConnectionGUID: vwBbElhCQL2b6FFiZnQZvQ==
X-CSE-MsgGUID: U4pHm1kHSxeshhYg8l8jeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="62662459"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="62662459"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:45:38 -0800
X-CSE-ConnectionGUID: htISjbhWQPKfnadD7N9F3Q==
X-CSE-MsgGUID: Hab/4JGdRtCEFdx0QhAdjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128434214"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:45:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 15 Jan 2025 16:45:31 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: platform-driver-x86@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
    Armin Wolf <W_Armin@gmx.de>, Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] platform/x86: alienware-wmi: Fix zone attribute
 declaration
In-Reply-To: <20250114174004.143859-2-kuurtb@gmail.com>
Message-ID: <488547a0-3560-4350-38ec-649c36f2861d@linux.intel.com>
References: <20250114174004.143859-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Jan 2025, Kurt Borja wrote:

> Statically declare `zone*` attributes.
> 
> Fixes: 7c605f6460e8 ("platform/x86: alienware-wmi: Improve rgb-zones group creation")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501142200.ezULWY9P-lkp@intel.com/
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/dell/alienware-wmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index b4b43f3e3fd9..d7f577e0d146 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -518,7 +518,7 @@ static ssize_t zone00_store(struct device *dev, struct device_attribute *attr,
>  	return zone_store(dev, attr, buf, count, 0);
>  }
>  
> -DEVICE_ATTR_RW(zone00);
> +static DEVICE_ATTR_RW(zone00);
>  
>  static ssize_t zone01_show(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
> @@ -532,7 +532,7 @@ static ssize_t zone01_store(struct device *dev, struct device_attribute *attr,
>  	return zone_store(dev, attr, buf, count, 1);
>  }
>  
> -DEVICE_ATTR_RW(zone01);
> +static DEVICE_ATTR_RW(zone01);
>  
>  static ssize_t zone02_show(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
> @@ -546,7 +546,7 @@ static ssize_t zone02_store(struct device *dev, struct device_attribute *attr,
>  	return zone_store(dev, attr, buf, count, 2);
>  }
>  
> -DEVICE_ATTR_RW(zone02);
> +static DEVICE_ATTR_RW(zone02);
>  
>  static ssize_t zone03_show(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
> @@ -560,7 +560,7 @@ static ssize_t zone03_store(struct device *dev, struct device_attribute *attr,
>  	return zone_store(dev, attr, buf, count, 3);
>  }
>  
> -DEVICE_ATTR_RW(zone03);
> +static DEVICE_ATTR_RW(zone03);
>  
>  /*
>   * Lighting control state device attribute (Global)
> 
> base-commit: 58126788aa7726c0e91de6b25e6e332fa06089ab
> 

Thanks. I've folded this into the original commit in the review-ilpo-next 
branch.

-- 
 i.


