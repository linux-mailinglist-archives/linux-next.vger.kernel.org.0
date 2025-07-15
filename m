Return-Path: <linux-next+bounces-7558-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2BCB0623D
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 17:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4FAA165820
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 14:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A5E1FDE09;
	Tue, 15 Jul 2025 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkSYEBaS"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40FE1531E8;
	Tue, 15 Jul 2025 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752591217; cv=none; b=ildHkqMLjpaHynuv1qboFHfMjopgCE6tQYV5cmT3YFbNSgoCPICKMITXSBvmSj5e3RpIcxNC3GsyDdBzq23qXTM2hOH0u2mvCedFnI23XRvhAe8EqShGCHfaXWkO7g+FPsNze8NEeeO3mUQ2s0J4HzdE7/FLCBlhW03smBISdFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752591217; c=relaxed/simple;
	bh=mE3IoGz9LFfAs+5NM9TmbutbKbh+D7xl3TbT78ZqpTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5wi3fvcNeSPAQ/mSP5j6U1TQDo5rQ1C5RR0z5+cBQWFjiIAzNuI3TUQHXelaZQ27bnUaUtk4EQMXMTBD22esG8bm7syqJ1z/TNVRbeVfKQ3OIHRrMHfmdP0BAPTR+oH3lfub8rUH1LoxxHztTzbPmzMa+EY+nMU/oUAe5JCv+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkSYEBaS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752591216; x=1784127216;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mE3IoGz9LFfAs+5NM9TmbutbKbh+D7xl3TbT78ZqpTw=;
  b=gkSYEBaSSbGaHh05me04AkmD3PLQoVpKDQwzoWl9ojtTHBiluHlfgEOK
   IZ+jZUsFYvePos/aOJItwzkxIxIRw2QuyinW8fp+Nq4/KAQFe8qwm+12y
   efC/rGptDkvn7+Xj9bedzV1eUI0UuVOz368mMSXP/KiOpj2jbsKkJHeJk
   JgEoIYlvlS3A3odtq7k1hpfUduZiKYfCKLdm7dhrrCK8UhGWVOJr/Cysd
   OqqDgvvQ5Wb2pnn+vreJ7GIYGNyciJSsR7d5wiKOsMJxdT4Hn0I6a231G
   NJ3vyVyjM/D6RY2q88HQIJaWAvKYPqYNKCxBNwBGi8KNX8mMhZVHjNhN7
   Q==;
X-CSE-ConnectionGUID: jAXfPZSOQYK4tDgE9px5Aw==
X-CSE-MsgGUID: da39kSbzSauCzBQNgG6eAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65384625"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="65384625"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 07:53:35 -0700
X-CSE-ConnectionGUID: XJHboS+fRgeZEmB2fgQXtg==
X-CSE-MsgGUID: 6eqLhlGSSAWHcZdNSfqBOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="161801187"
Received: from tcingleb-desk1.amr.corp.intel.com (HELO [10.125.111.148]) ([10.125.111.148])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 07:53:35 -0700
Message-ID: <19a4ee38-9777-4efc-bffe-13d5a2c2f003@intel.com>
Date: Tue, 15 Jul 2025 07:53:33 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the cxl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Dan Williams <dan.j.williams@intel.com>
Cc: Robert Richter <rrichter@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250715184935.7e7c75c0@canb.auug.org.au>
 <20250715185737.5d9c75e4@canb.auug.org.au>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250715185737.5d9c75e4@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/15/25 1:57 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 15 Jul 2025 18:49:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the cxl tree, today's linux-next build (htmldocs) failed
>> like this:
>>
>> drivers/cxl/cxl.h:443: warning: Function parameter or struct member 'cache_size' not described in 'cxl_root_decoder'
>>
>> Caused by commit
>>
>>   8d41af0d378d ("cxl: Remove core/acpi.c and cxl core dependency on ACPI")
> 
> This is only a warning (I ran the wrong helper script :-) ).
> 
No worries. Should be fixed in the next linux-next pull. 

