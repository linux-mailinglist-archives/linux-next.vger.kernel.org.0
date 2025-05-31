Return-Path: <linux-next+bounces-7000-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92149AC9956
	for <lists+linux-next@lfdr.de>; Sat, 31 May 2025 07:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC0283B1919
	for <lists+linux-next@lfdr.de>; Sat, 31 May 2025 05:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4279E1DFE26;
	Sat, 31 May 2025 05:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvYXatAU"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE951096F;
	Sat, 31 May 2025 05:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748668319; cv=none; b=NkXZlAKHUbzGmHepJxwWQojbg8wuADcZZbvvQGPvG+Cvf5FcSxa8DiJoIhA8dzr8YzVN/sxt6J/V30CallD1LJ7fDG0ywBMz9dnRAgKepz7xeQBGlMNihyZPgHHKXSeFZghBVDoBQ5cVkO93GdKpZGQTKVubIEEcQZwbPi+Udyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748668319; c=relaxed/simple;
	bh=JVbcaufnfIc/KhfpdmMAmhDvMF0gYQQiWfMmevxHT6M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=J6ivo1MLk0hrZshrI2lSA5aXIEYqw6A4YNmU+PTdbuTS7tT71R0wMMKmTUsYHqZKK6+pERrEMqdAABXQsvb97sVlCAMK5PWoUbzdqnMoSLJuLQ7p99I+U4zREh5lR76UQnqiNzEOFrlYeHTZv70ZpHD1MTx8MmkUfCi/GiNwJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvYXatAU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748668317; x=1780204317;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JVbcaufnfIc/KhfpdmMAmhDvMF0gYQQiWfMmevxHT6M=;
  b=SvYXatAUQXPq+btIO4JKYammVCDSoAk3kp6id1tIwqaTzR2cY/X0IeVC
   p6MFTSZOw8EV03cubu7ozhbTSBp/C4RW9k7j//wOexgTtsiMXFgkbsYje
   2vWxrRTJ77EOXzY6dPHpq2epK6OwUYsTf2aSK9a5RJ1XG5KRPW0SDt/0L
   YYvWo4RJlbKtUZJT8bjSDO69xcM6nV/qO3qgrYcCVAgZrK8ScXUL7dq/K
   /Gq5vGTcMwz5thZY9C5uvjU/MARfUhflCQFrJ+uVA5Br4bzm/1d7U9obp
   m/D+nMiZKQqcx4ibo5MTbd/hYqOGQb6RZzzOXg508zAseHdqr7USfig5a
   w==;
X-CSE-ConnectionGUID: 2AJoLjXhT4OLd52fYbViKQ==
X-CSE-MsgGUID: Dn8obadFTl2W0bWGt3DsSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="62106249"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="62106249"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:11:56 -0700
X-CSE-ConnectionGUID: 1u2d66MLRn+1RZgNdveFhw==
X-CSE-MsgGUID: HNFbF5wSRhiqp9+Q6rBOsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="149095334"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:11:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 31 May 2025 08:11:48 +0300 (EEST)
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
cc: rdunlap@infradead.org, Hans de Goede <hdegoede@redhat.com>, 
    sfr@canb.auug.org.au, linux-next@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com, 
    king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH 3/3] platform/x86: Use i2c adapter name to fix build
 errors
In-Reply-To: <20250530200234.1539571-4-pratap.nirujogi@amd.com>
Message-ID: <ea615c2e-d306-06b2-10b0-2423ab59a8e9@linux.intel.com>
References: <20250530200234.1539571-1-pratap.nirujogi@amd.com> <20250530200234.1539571-4-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Pratap Nirujogi wrote:

> Use 'adapater->name' inplace of 'adapter->owner->name' to fix build issues
> when CONFIG_MODULES is not defined.
> 
> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")

This is the which should have this Fixes tag, the other commits should not 
have it as they're not really the fix (but this change just depends on 
them, but since stable is not in picture yet for this driver we don't 
need to indicate even those deps).

> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
>  drivers/platform/x86/amd/amd_isp4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
> index 0cc01441bcbb..80b57b58621a 100644
> --- a/drivers/platform/x86/amd/amd_isp4.c
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -151,7 +151,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>  
>  static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>  {
> -	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
> +	return !strcmp(adap->name, "AMDISP DesignWare I2C adapter");

Since both are in-kernel code, share that name through a define in some 
header.

-- 
 i.


