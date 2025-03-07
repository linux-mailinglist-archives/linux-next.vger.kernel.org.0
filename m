Return-Path: <linux-next+bounces-5699-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 496C1A57310
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 21:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84337174385
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 20:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50CC1A3175;
	Fri,  7 Mar 2025 20:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqP+1SeZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37502561BD;
	Fri,  7 Mar 2025 20:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741380450; cv=none; b=FnSHfHJbbbGwu+ceng/R7VB+3lWK5fEgH8STiUvKtyg687DfRJHyhE7saBujiJqt+wE00GysEPcvJ/heKzV1uL9BzrNPr4RZ4BYvpUYS1E7/2gINNCgTotSQsYVk1x/rKK4BrSz1J4hE7ZYtDCjrB5D9J6USPG8zvXodmclpwCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741380450; c=relaxed/simple;
	bh=oyg18ERm8hhYuRc2Etmtl/t/eFF2DNnYB6dLr/zD1j0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJ6sB1QYETHDRSUWtcBOoeRvA06PlL8/dtxtK1OdZOKjt8ki3skW0GXN8vbAk8UVw9HExGcScbWMmtR1xVVd6n+K0hdAZSQpoqmv3/ovQphrvr7wS9o+FldljwbRPgBcnd7G6S+A4s9PvCwEdf4GvYBqT8j2pP7wgsZ0JHNQSeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqP+1SeZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741380449; x=1772916449;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oyg18ERm8hhYuRc2Etmtl/t/eFF2DNnYB6dLr/zD1j0=;
  b=IqP+1SeZgf1Snv3q6dHWkbUCNnwOLg1VcN03rujwmCtdf59SgmmRVNom
   k1jwNg0FECHuR+YUOnbDNGjufvajFZd6le+beaLxgMisnve8W7sXvIXjJ
   QlWZuQvEwJ0FnIjbCf7P05VxEG/9HczBJDtdPWsLhGQKjl81Ingb2VbSH
   yn41Sov13VpQJXTzP4t6Ain0ws+3l7nPBpzpkn8h4U8AJEhv96Rv3GwgA
   PlB/3hNUeM0MnSvrghyk24v/u46PzViAmNPEzO1C8guJwYHW+n06dN0Ju
   v9MTXkM7YBVdJO1uKNKiJBoUNP6fGJ1Lte2Tsg363GyqE5LnZ2VIc/R/y
   Q==;
X-CSE-ConnectionGUID: 9sqMvPKRR1+B4D4De4N6gg==
X-CSE-MsgGUID: v7awKuSrRDaITGT937G8gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42321670"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="42321670"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 12:47:28 -0800
X-CSE-ConnectionGUID: SmT0O1x8RaWcpwayQ2CsMw==
X-CSE-MsgGUID: qywI412YT2yL7XAiteqvBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150372792"
Received: from jdoman-mobl3.amr.corp.intel.com (HELO [10.125.110.142]) ([10.125.110.142])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 12:47:28 -0800
Message-ID: <1ec76ee6-87ef-45d2-bd60-41e2e1372e39@intel.com>
Date: Fri, 7 Mar 2025 13:47:27 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the hmm tree
To: Jason Gunthorpe <jgg@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250307195715.0b7abf0f@canb.auug.org.au>
 <20250307150434.GP354511@nvidia.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250307150434.GP354511@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/7/25 8:04 AM, Jason Gunthorpe wrote:
> On Fri, Mar 07, 2025 at 07:57:15PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the hmm tree, today's linux-next build (htmldocs) produced
>> this warning:
>>
>> Error: Cannot open file /home/sfr/next/next/drivers/cxl/features.c
>>
>> Introduced by commit
>>
>>   da0dd17604d4 ("fwctl/cxl: Add documentation to FWCTL CXL")
> 
> Thanks Stephen,
> 
> Dave can you fix all of thes kdoc bugs and post a new version?
>

After fixing up most of the issues, I cannot figure out what the issue is for this one:
./include/uapi/cxl/features.h:1: warning: no structured comments found

I'm not seeing any issues in the header via visual inspection. Running kernel_docs against the file yields no warning or error either. Deleting all the contents from that header file and I'm still seeing the warning. Makes no sense.... 

I'll repost the series on the mailing list with what I have fixed.

 
> Jason


