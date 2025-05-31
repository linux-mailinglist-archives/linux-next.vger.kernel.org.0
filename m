Return-Path: <linux-next+bounces-6999-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 010B3AC994B
	for <lists+linux-next@lfdr.de>; Sat, 31 May 2025 07:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDF5A1BA3A0D
	for <lists+linux-next@lfdr.de>; Sat, 31 May 2025 05:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04891DE88C;
	Sat, 31 May 2025 05:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEYqfL1u"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA69528F3;
	Sat, 31 May 2025 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748668028; cv=none; b=fnAnMyi9lHLXC6iPDwVknNdoMCMnNZJzWkZ8OgY9Lz+Czk6IwNuWgB2ltXTfbb7o7CUB8kCucOZxOcnTudUq3pdnv4Y+BBt2mFhxNf+JQA3aIqKVoo0e0n1ALpb4D9IGxm1hUrWrl1CCG5Xc2G2edS7RHdCpoGGvFwA2dp+mqiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748668028; c=relaxed/simple;
	bh=YZ4ML5dpAImMlPisgbvtvk3ijEN6nlptoNCtSdJvkHo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tKx7oRLNnx3y3/zYwMQMOIkBcVLRY8DUzPWPM6fGK93KHoCys77CB4D2wEaBQ40dyKsVvVHpzbW4t92UVO8qtCgk0YUOz34QV5PmJUHUhY/ZnT0kQA5eskY1Hg4n1AnasiyiauyRdl7g5+BQff9FuS5lFsvnDgteVnMJytMbo0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEYqfL1u; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748668027; x=1780204027;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YZ4ML5dpAImMlPisgbvtvk3ijEN6nlptoNCtSdJvkHo=;
  b=FEYqfL1uoUPxXNCxOed+dzDP4jTslKLP00wqaOPTQOqugJWo+h6lTuz+
   hxdjCLQiRZMxD+baDbBLbEc3+yaqhUj9bXrh2Q1a81RK9V5uhO7M+rYbT
   pQeleThfvOaMSI3m5Jo+ZKMM282Hwz+HT4cdAjdrDznC+P3UBUOZsqIKB
   gy9lDtYIzjukkjuDhrQZud9i1L6C0wAwFj6moadoCqHmOXwhEwWyTBeMn
   E2qqLUn8/6dbJs5KMtEPBYAgGLBiJUW5INICw08VNS+Q2PX4c3cQ6hHDZ
   5PWg0YWVgUewcDR5BR21YSv5l6a7yBQgJaEiIFsSA/yReCMeTjeHRIE0z
   Q==;
X-CSE-ConnectionGUID: 4SzFpBmvT9yJDBhBRKEmJg==
X-CSE-MsgGUID: 2BPMkLD0RI+mAgpdg2vThg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50630679"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50630679"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:07:06 -0700
X-CSE-ConnectionGUID: dlpNWuiMScSMGuHnvpv8LA==
X-CSE-MsgGUID: WQiGyPnJRWG08nLsqGv4bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144030782"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:07:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 31 May 2025 08:06:58 +0300 (EEST)
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
cc: rdunlap@infradead.org, Hans de Goede <hdegoede@redhat.com>, 
    sfr@canb.auug.org.au, linux-next@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com, 
    king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH 2/3] i2c: amd-isp: Initialize unique adpater name
In-Reply-To: <20250530200234.1539571-3-pratap.nirujogi@amd.com>
Message-ID: <8670fa5f-5bf6-7dfe-1ec7-5cd1ec4472aa@linux.intel.com>
References: <20250530200234.1539571-1-pratap.nirujogi@amd.com> <20250530200234.1539571-3-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Pratap,

Please send the next version(s) to all relevant people as indicated by 
scripts/get_maintainer.pl.

On Fri, 30 May 2025, Pratap Nirujogi wrote:

> Initialize unique name for amdisp i2c adapter, which is used
> in the platform driver to detect the matching adapter for
> i2c_client creation.
> 
> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
>  drivers/i2c/busses/i2c-designware-amdisp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
> index ad6f08338124..e8cb3785c740 100644
> --- a/drivers/i2c/busses/i2c-designware-amdisp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
> @@ -62,6 +62,8 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>  
>  	adap = &isp_i2c_dev->adapter;
>  	adap->owner = THIS_MODULE;
> +	snprintf(adap->name, sizeof(adap->name),
> +		 "AMDISP DesignWare I2C adapter");

scnprintf() is preferrable over snprintf(). Even if you don't use the 
return value here, eventually somebody will want to get rid of snprintf() 
entirely so lets try not add new ones.

>  	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>  	adap->dev.of_node = pdev->dev.of_node;
>  	/* use dynamically allocated adapter id */
> 

-- 
 i.


