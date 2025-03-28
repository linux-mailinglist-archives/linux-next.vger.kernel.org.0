Return-Path: <linux-next+bounces-6074-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C29A5A75132
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 21:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 081333B0F3C
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 20:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB7A1D90DD;
	Fri, 28 Mar 2025 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVIUN62/"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F296D1E4B2;
	Fri, 28 Mar 2025 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192210; cv=none; b=NkVZTHHSfX+In0NvXCuyGFMj6D0m5RtUp7jngRNUYThlOVwT8iNJFW88DkwI9ie/qnyfpEQ5uk+nvu2DMCi/+/g6W1MdYqlRn0v+kPx/8aoqGppbkAk1mEXnb0faVVtH/V9z4RqePtsBgKcomE3sQJBo3wQBu38h6AbOalG5HWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192210; c=relaxed/simple;
	bh=oXvEdptZ4699fzer6hFygk1UxVBd4LiQGME//n0kV8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpWnru0lOZ7hUaYpRtqzxUUbCmoTvUlfOJlbs+z8HatVSsAjkzf3JTPkDmAimBM8CDqyPS6Yn4hixIAzz31YgNp+IR0ssCRRgdePDqYSphOP6MdoZCZt32OTGsdzSgfqCnUvqQZ88IdR0lnDf2e3hMooIL/zFFdlGLyY3uTQPhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVIUN62/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743192209; x=1774728209;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oXvEdptZ4699fzer6hFygk1UxVBd4LiQGME//n0kV8A=;
  b=QVIUN62/VWRiiMVDxwK2F3phHaDHpbn6lBpexnz3giwuSo+7j8sYBugV
   CTLFiqeT7U2LCGUoc1jVyZtwXihE2QbmumKXj9b2JdI9N/8Xe27947pMJ
   sbRKOztagnDTzgrGAgA5+lr9cGJ94jRtWZDuKQm4lUdEWhNUCzRPk0mFG
   MjjMVGYCUyrflwbd6vwqXr6x4qVr/3XQ4dSErK0VeNR+B5ohQUqv0X1QX
   nY08jM0YzsVrGMUYZagkwa8rVFb+jT3DTXQdn9GJCgy7G0sF3QSTYO4ou
   wY+1wgZOj3p0jfjAS37DrDA6ZHrcn9XL8skBcxCKKHY232pTXm0wIkqi9
   g==;
X-CSE-ConnectionGUID: bXc0tTpyRcqo4LNFm5nXmw==
X-CSE-MsgGUID: eeiBfQ7rQ/m1qCF2shreIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48223367"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="48223367"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 13:03:24 -0700
X-CSE-ConnectionGUID: 0nv0FfAHR0uFwkookyPZ1g==
X-CSE-MsgGUID: r0S/NuprRKiZ9NfzAR3Ntg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="156528100"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.108.185]) ([10.125.108.185])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 13:03:22 -0700
Message-ID: <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
Date: Fri, 28 Mar 2025 13:03:19 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
To: paulmck@kernel.org, linux-cxl@vger.kernel.org
Cc: dave@stgolabs.net, jonathan.cameron@huawei.com,
 alison.schofield@intel.com, vishal.l.verma@intel.com, ira.weiny@intel.com,
 dan.j.williams@intel.com, gourry@gourry.net, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, sfr@canb.auug.org.au
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/28/25 10:39 AM, Paul E. McKenney wrote:
> Hello!
> 
> In next-20250328 and next-20250327, allmodconfig builds get me:
> 
> ./usr/include/cxl/features.h:11:10: fatal error: uuid/uuid.h: No such file or directory
> 
> This file is apparently auto-generated, because when I change the #include
> to the more likely linux/uuid.h, my changes are overwritten by the build.
> 
> Gregory Price noted that something similar has happened recently and been fixed:
> 
> https://lore.kernel.org/all/70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com/
> 
> Perhaps someone unfixed it?
> 
> 								Thanx, Paul


I can't get the powerpc cross build to build to reproduce the issue from next-20250328. Does the change below address the issue for you?

---
diff --git a/include/uapi/cxl/features.h b/include/uapi/cxl/features.h
index d6db8984889f..691eeda9c892 100644
--- a/include/uapi/cxl/features.h
+++ b/include/uapi/cxl/features.h
@@ -8,11 +8,7 @@
 #define _UAPI_CXL_FEATURES_H_
 
 #include <linux/types.h>
-#ifndef __KERNEL__
-#include <uuid/uuid.h>
-#else
 #include <linux/uuid.h>
-#endif
 
 /*
  * struct cxl_mbox_get_sup_feats_in - Get Supported Features input

