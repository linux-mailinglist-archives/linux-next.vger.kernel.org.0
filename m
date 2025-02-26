Return-Path: <linux-next+bounces-5577-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8AFA46679
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 17:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAABE17848B
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 16:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F3E21CC67;
	Wed, 26 Feb 2025 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2qJdy7O"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636C521D59E;
	Wed, 26 Feb 2025 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740585672; cv=none; b=GSURSeTuNRgWSk9dx3j59WFpfwXxJLDVp2m8yvo/cMkOKPMmtYbpq9Khn36By8Orz4j5f/lsTxusXToBPI/9BdOUMKRVQZj+RphGFVbTJSXCnwbDsIRWuOFPMcWKJOXXE46GSyIAcGztZmTQRLneENvy351Vmp/RutfFP4gDGe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740585672; c=relaxed/simple;
	bh=CLpCeg61zbVIJylPqCIGZj0xsBtsuyYIWSkaXCsyGLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HdK5mRV9pBx4OqLxW4Mu6rM18YRftSL6i0RX+Wb36MZ8YOWYLr4SJtp7BVxtZhKd6TkASK3pCSKQedTZxl2IMs1zivmR5gELgYj7tisjw0KFboO7QgD83DnLePqvLQWHLSdKIBbesSMzSJ13+bccBcmu/Sg4XID5E2xchHfLIRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2qJdy7O; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740585667; x=1772121667;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CLpCeg61zbVIJylPqCIGZj0xsBtsuyYIWSkaXCsyGLM=;
  b=G2qJdy7O/wQwqvPQ1WfagX2QOq5Eptp/C8LV9E7iOzRwEU+2KLrc4dKY
   dE90D6vq7RXyTmUrebiqO2SCFMNYcunpmfRlGlD67Zj4QbBAlpLezG6MT
   RBpP3KlZG4t0nIbdQaNCrCqG66CBKI1MHtUQ/Tq6aMJZSa0MUR2LlzTEo
   ZgNZV11hj+CjzKzAtOeY5GJpRLJMzVr9D6edfJox9KEuo6/1wU6WUw719
   DevcBmPZHciOiVkOrSdYJoT8bLtuyr9FIpdMzYBsvFMJf2uGNYGuCWt0m
   89aCVlEaZdoJUqGy5iUyppsNgwinpoQrO8+6ArWa0K0JSEBXAjpMUFc7v
   Q==;
X-CSE-ConnectionGUID: rvxXFLUsTCi0Jdkv4WD5rQ==
X-CSE-MsgGUID: uoarDMeAS/iEEuXrTZDEUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="63906686"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="63906686"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:01:06 -0800
X-CSE-ConnectionGUID: i/5wr+VVRvKp1lTMafclqw==
X-CSE-MsgGUID: HKW3kMehT76b62dS3QXOgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="116750742"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [10.125.108.7]) ([10.125.108.7])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:01:05 -0800
Message-ID: <2405a58e-77a0-49a3-a2d9-1f0d12685428@intel.com>
Date: Wed, 26 Feb 2025 09:01:04 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the cxl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Dan Williams <dan.j.williams@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250226154924.6446eec8@canb.auug.org.au>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250226154924.6446eec8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/25/25 9:49 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the cxl tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> drivers/cxl/cxlmem.h:439: warning: Function parameter or struct member 'cxlfs' not described in 'cxl_dev_state'
> drivers/cxl/cxlmem.h:439: warning: Excess struct member 'cxl_features' description in 'cxl_dev_state'
> 
> Introduced by commit
> 
>   7d2bffbd7fb6 ("cxl: Add Get Supported Features command for kernel usage")
> 

Thanks Stephen. Should be fixed now. 

