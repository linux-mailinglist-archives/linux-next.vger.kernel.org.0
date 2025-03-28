Return-Path: <linux-next+bounces-6077-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF60A75213
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 22:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E2F81894C64
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 21:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3771F09BB;
	Fri, 28 Mar 2025 21:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LY3PP5Jw"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20841F09A3;
	Fri, 28 Mar 2025 21:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743196948; cv=none; b=fw0q5y/qRaM8MKTORhhk/Y0/xe2CMEoDv0ihrXceJtlLKsGdPPB3gTy7HbucMNJIIc7kPWmt1sMy4qQhgSAv6QVwYu+1I8Ajm4UXY5uOpHYfKCimrDpYjPMTndVXhbFql3WPcLWk3mzIqhoAkqEmoLSXpLjjRziv9S0i0x3N43k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743196948; c=relaxed/simple;
	bh=iPVNZrosWilyB+mH4hBlRAtdEDDdZj+MPuPZjiWFiAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZWurMHMIBdEjlGTrmK5XTadl7h97+hRDened+1lZRXbz2WDkwo+WQKgN5OaDTI23sOELxxMAEgQCnqKcrA97QRXycp/gUYflOEvwo7gA1DExruhUnVs7XoxJuYTerkw8m1m+BtVoYS6/tvEhmm2Af+6RppJfrVHMd5YzBNpjAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LY3PP5Jw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743196946; x=1774732946;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iPVNZrosWilyB+mH4hBlRAtdEDDdZj+MPuPZjiWFiAY=;
  b=LY3PP5JwUN2AOKGow4m35/ZpvPD/+CUjrJmUxYXJgvfPPJHPis7K00ha
   +qKbZvK6WJuOeu1HnIG3W3CAPilvSAnJzvAL1NfffDAVDQRS5Xl3pmeMC
   QTkPmQbHgyynJKVDAaD9XE3XMI5+8HVpywcLLUUltXW+q+ZFYTAtHwP+t
   d+76YWdm0uZHPvwyJDYe4ctaN9aQxz5tDmTWplZNt+/9AkkLFitodlez8
   ONan5ZCz6HZ4dSkZtHSjiW2SClZiiaqZsOxRMoIbndMkAlEHSlqJ4ZzVW
   lUXtlkEpaxkNfhbyuhr/vA7pQsMmQUXcFKyVsWJzBmiiBS1gJZDH+D+LB
   w==;
X-CSE-ConnectionGUID: Kq8UO8+NT6O0wwYDKFbvhA==
X-CSE-MsgGUID: 5qPRqMCNRb+5gy/sYQ3SVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="61965760"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="61965760"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 14:22:25 -0700
X-CSE-ConnectionGUID: Rly5uu6cRAS34j5ZxW7JiQ==
X-CSE-MsgGUID: EpBvDbyfTHaoX3d2DvXGrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="162791723"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.108.185]) ([10.125.108.185])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 14:22:24 -0700
Message-ID: <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
Date: Fri, 28 Mar 2025 14:22:21 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
To: paulmck@kernel.org
Cc: linux-cxl@vger.kernel.org, dave@stgolabs.net,
 jonathan.cameron@huawei.com, alison.schofield@intel.com,
 vishal.l.verma@intel.com, ira.weiny@intel.com, dan.j.williams@intel.com,
 gourry@gourry.net, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 sfr@canb.auug.org.au
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/28/25 1:45 PM, Paul E. McKenney wrote:
> On Fri, Mar 28, 2025 at 01:03:19PM -0700, Dave Jiang wrote:
>>
>>
>> On 3/28/25 10:39 AM, Paul E. McKenney wrote:
>>> Hello!
>>>
>>> In next-20250328 and next-20250327, allmodconfig builds get me:
>>>
>>> ./usr/include/cxl/features.h:11:10: fatal error: uuid/uuid.h: No such file or directory
>>>
>>> This file is apparently auto-generated, because when I change the #include
>>> to the more likely linux/uuid.h, my changes are overwritten by the build.
>>>
>>> Gregory Price noted that something similar has happened recently and been fixed:
>>>
>>> https://lore.kernel.org/all/70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com/
>>>
>>> Perhaps someone unfixed it?
>>>
>>> 								Thanx, Paul
>>
>>
>> I can't get the powerpc cross build to build to reproduce the issue from next-20250328. Does the change below address the issue for you?
>>
>> ---
>> diff --git a/include/uapi/cxl/features.h b/include/uapi/cxl/features.h
>> index d6db8984889f..691eeda9c892 100644
>> --- a/include/uapi/cxl/features.h
>> +++ b/include/uapi/cxl/features.h
>> @@ -8,11 +8,7 @@
>>  #define _UAPI_CXL_FEATURES_H_
>>  
>>  #include <linux/types.h>
>> -#ifndef __KERNEL__
>> -#include <uuid/uuid.h>
>> -#else
>>  #include <linux/uuid.h>
>> -#endif
>>  
>>  /*
>>   * struct cxl_mbox_get_sup_feats_in - Get Supported Features input
> 
> Thank you, Dave!
> 
> Please note that I am reproducing this not on powerpc, but instead on
> x86 with a simple allmodconfig build.
> 
> Making the above change got me this:
> 
> usr/include/cxl/features.h:59:9: error: unknown type name ‘uuid_t’

I wasn't able to hit that with allmodconfig on x86 with a Fedora 41 build setup. What is the specific command lines you are using?



> 
> 							Thanx, Paul
> 


