Return-Path: <linux-next+bounces-6137-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD8AA78586
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 02:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C9D1188C49F
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 00:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DA7A41;
	Wed,  2 Apr 2025 00:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8zxsW+E"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56CF195;
	Wed,  2 Apr 2025 00:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743553114; cv=none; b=GEWlDNhWqLADI8Fzq5hud5Y2wQim7gZrgAydvt1kjLHd1x4MHKYNCqwJUK42rxw4aSJJXQ0c67xIf8b0nnJmgPcyabkRBOoh0PrFiwBiFjsYnn9qCCwb52YHgpjOgFD4Q4Eg7DqpA/DZ0R+bLo3eA4VFOENiyvJI4TFTFKPEBFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743553114; c=relaxed/simple;
	bh=ccAKzxQuNmt3LvtlfbAmImG+73lCyCnoUNwZHy6EtfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYyjvLY5poQn6t7eV1oo/xZGZQO5X8Asim3WCgrA+4ErSgeNeDvWrpL4+iYAsAtETcQU+sZoLfWQd6GHkLiptL2Ar824JL1TCSZwIYSR2dHTGarcDKEcA4B+V1XlhvoT36MSmVvHKc0Pv6/iUeN15PFFzslDn14thEf2ZvvXA1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8zxsW+E; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743553112; x=1775089112;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ccAKzxQuNmt3LvtlfbAmImG+73lCyCnoUNwZHy6EtfY=;
  b=P8zxsW+EQRSxR3sUhR37kKPvVZ9U640/e4M1LTgPTv3uzJ39JsKpUaZl
   +gtEnP6AAp1RiJw35PRgqLCFZV7lFOPMXMt07EKvwaPDtzac/fwamhl2u
   n36L6fIKBh3FsLv6iiuWvCGHs3mZ7eWlWwGfKxaMJcm6jFGK8KS66VTXg
   Sy8hWDNsKXRJOnL8eE7+aHxpUxchHRmG1b3vqEUldh+X04pJt/FmHQVIG
   LhYlSd5NP/J8IbGF6wq2cr8fznzoKIWcugp25KvfcVRf9X9e7JPzVbCiA
   7E+oT6nZZcb8OHvqDEOz+krkclCtiTgbrUG1UEstlhvIC4jH67bgZHFAq
   Q==;
X-CSE-ConnectionGUID: 7nySN8GWQ8S4h/ZRs3MB0A==
X-CSE-MsgGUID: WF2UhJgqS5qstNKbi5TGtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="47615682"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="47615682"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 17:18:27 -0700
X-CSE-ConnectionGUID: DEVPRNE5SK2bYAvpFkiRmA==
X-CSE-MsgGUID: NXvLi6JZRyiNnxBUUHAEJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="149715513"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [10.125.109.176]) ([10.125.109.176])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 17:18:26 -0700
Message-ID: <e9c57344-43f3-4f90-9894-eb4f5a1b22f2@intel.com>
Date: Tue, 1 Apr 2025 17:18:23 -0700
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
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-cxl@vger.kernel.org, dave@stgolabs.net, jonathan.cameron@huawei.com,
 alison.schofield@intel.com, vishal.l.verma@intel.com, ira.weiny@intel.com,
 gourry@gourry.net, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 sfr@canb.auug.org.au, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
 <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
 <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
 <20250331132439.GD10839@nvidia.com>
 <67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch>
 <20250331171755.GC289482@nvidia.com>
 <67eaf14b7c611_201f0294ba@dwillia2-xfh.jf.intel.com.notmuch>
 <4641ce2f-74eb-45ea-a2f8-c7d0db905b7a@linux.ibm.com>
 <79a032b5-b13d-43fd-b56e-01098122e104@intel.com>
 <66ae49a8-d7f9-4fd9-b94e-9be26fd9aea4@paulmck-laptop>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <66ae49a8-d7f9-4fd9-b94e-9be26fd9aea4@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/1/25 5:07 PM, Paul E. McKenney wrote:
> On Tue, Apr 01, 2025 at 08:15:55AM -0700, Dave Jiang wrote:
>>
>>
>> On 4/1/25 12:01 AM, Venkat Rao Bagalkote wrote:
>>>
>>> On 01/04/25 1:17 am, Dan Williams wrote:
>>>> Jason Gunthorpe wrote:
>>>>> On Mon, Mar 31, 2025 at 09:54:55AM -0700, Dan Williams wrote:
>>>>>> Jason Gunthorpe wrote:
>>>>>>> On Fri, Mar 28, 2025 at 05:26:42PM -0700, Dave Jiang wrote:
>>>>>>>>> For now the following builds for me, but it is a quite a mess to undo
>>>>>>>>> the assumption that that the hardware object definitions can not use
>>>>>>>>> uuid_t:
>>>>>>>> +Jason.
>>>>>>> Seems invasive?
>>>>>> Yeah, it left a bad taste for me as well.
>>>>>>
>>>>>>> Maybe just like below?
>>>>>> I like that this avoids converting to the kernel's uuid API, however,
>>>>>> not quite happy that it forces userspace to contend with the
>>>>>> type-conflict with uuid/uuid.h.
>>>>> Oh I see
>>>>>  
>>>>>> So how about one more riff on your idea?
>>>>> Sure, works for me, please post it..
>>>> b4 am supports scissors lines, so:
>>>>
>>>> b4 am -P _  67eac8df3e217_201f02948d@dwillia2-xfh.jf.intel.com.notmuch
>>>>
>>>> ...works for me. Do you still need a separate posting?
>>>>
>>>
>>> This issue got introduced in next-20250307 and got fixed in next-20250311(not sure what fixed).
>>>
>>> But again got re-introduced in  next-20250318. I tried bisection, below are the logs.
>>>
>>> One of the things I tried is to install the UUID packages on my set up and after installing those packages, issue is not seen.
>>>
>>> rpm -qa | grep uuid
>>>
>>> libuuid-2.37.4-20.el9.ppc64le
>>> uuid-1.6.2-55.el9.ppc64le
>>> uuid-c++-1.6.2-55.el9.ppc64le
>>> uuid-dce-1.6.2-55.el9.ppc64le
>>> uuid-devel-1.6.2-55.el9.ppc64le
>>> uuidd-2.37.4-20.el9.ppc64le
>>> libuuid-devel-2.37.4-20.el9.ppc64le
>>>
>>> So wondering is this not a setup issue?  Please advice.
>>
>> uuid/uuid.h only exists if the libuuid-devel package gets installed. And it seems that's where it resides in userspace.
> 
> Just to double-check...
> 
> As of some fairly recent time, it is now necessary to install the above
> seven userspace packages if one wants to do an allmodconfig build of
> the kernel?  Or will there be a change similar to the ones put forward
> earlier in this thread that will allow such builds to be carried out
> without additional userspace packages needing to be installed?
> 
> I of course do have some concerns about the number of userspace packages
> that might be required if CXL is adding seven of them...  ;-)

Technically it's only 1 package. libuuid-devel. Do the other 6 come with the installation of libuuid-devel?

> 
> 							Thanx, Paul
> 
>> DJ
>>
>>>
>>>
>>> Bisect Log:
>>>
>>> git bisect log
>>> git bisect start
>>> # status: waiting for both good and bad commits
>>> # bad: [c4d4884b67802c41fd67399747165d65c770621a] Add linux-next specific files for 20250318
>>> git bisect bad c4d4884b67802c41fd67399747165d65c770621a
>>> # status: waiting for good commit(s), bad commit known
>>> # good: [4701f33a10702d5fc577c32434eb62adde0a1ae1] Linux 6.14-rc7
>>> git bisect good 4701f33a10702d5fc577c32434eb62adde0a1ae1
>>> # good: [cda4d1b29991d4500e9f65c6936b5d3ccd99ecbb] Merge branch 'spi-nor/next' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
>>> git bisect good cda4d1b29991d4500e9f65c6936b5d3ccd99ecbb
>>> # good: [9b22611592aa21d10f7d1b89352a618436dea7ac] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
>>> git bisect good 9b22611592aa21d10f7d1b89352a618436dea7ac
>>> # good: [264791f7669a8246d129cbb935c861debba2f116] Merge branch 'driver-core-next' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
>>> git bisect good 264791f7669a8246d129cbb935c861debba2f116
>>> # good: [3c51cb2d6ec7cecf724cd5d78a0633f61f31e726] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
>>> git bisect good 3c51cb2d6ec7cecf724cd5d78a0633f61f31e726
>>> # good: [612481dbc16505cf5e940809ebf36d8460d174cf] Merge branch 'main' of git://git.infradead.org/users/willy/xarray.git
>>> git bisect good 612481dbc16505cf5e940809ebf36d8460d174cf
>>> # bad: [892715be4379deb333376e573113fd75672eca6c] Merge branch 'rust-next' of https://github.com/Rust-for-Linux/linux.git
>>> git bisect bad 892715be4379deb333376e573113fd75672eca6c
>>> # bad: [b33f4167a8a2b9b9cc6b3e06f79b030db82cf530] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
>>> git bisect bad b33f4167a8a2b9b9cc6b3e06f79b030db82cf530
>>> # good: [3b5d43245f0a56390baaa670e1b6d898772266b3] Merge branch 'for-6.15/features' into cxl-for-next
>>> git bisect good 3b5d43245f0a56390baaa670e1b6d898772266b3
>>> # good: [d11af4ae2169672b690a4d07a9dfdfd76c082683] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-auxdisplay.git
>>> git bisect good d11af4ae2169672b690a4d07a9dfdfd76c082683
>>> # bad: [5908f3ed6dc209e5c824e63afda7545805f75a7e] cxl: Add support to handle user feature commands for get feature
>>> git bisect bad 5908f3ed6dc209e5c824e63afda7545805f75a7e
>>> # good: [18285acc2c047cda2449f426c09fc8969b04b8b1] fwctl: Add documentation
>>> git bisect good 18285acc2c047cda2449f426c09fc8969b04b8b1
>>> # good: [15a26c223fff58d9fa4ada12a8c35697f8ecdf6c] Merge branch 'for-6.15/features' into fwctl
>>> git bisect good 15a26c223fff58d9fa4ada12a8c35697f8ecdf6c
>>> # bad: [9b8e73cdb1418f7c251c43b2082218ed9c0d0fee] cxl: Move cxl feature command structs to user header
>>> git bisect bad 9b8e73cdb1418f7c251c43b2082218ed9c0d0fee
>>> # good: [858ce2f56b5253063f61f6b1c58a6dbf5d71da0b] cxl: Add FWCTL support to CXL
>>> git bisect good 858ce2f56b5253063f61f6b1c58a6dbf5d71da0b
>>> # first bad commit: [9b8e73cdb1418f7c251c43b2082218ed9c0d0fee] cxl: Move cxl feature command structs to user header
>>>
>>> 9b8e73cdb1418f7c251c43b2082218ed9c0d0fee is the first bad commit
>>> commit 9b8e73cdb1418f7c251c43b2082218ed9c0d0fee
>>> Author: Dave Jiang <dave.jiang@intel.com>
>>> Date:  Fri Mar 7 13:55:32 2025 -0700
>>>
>>>   cxl: Move cxl feature command structs to user header
>>>
>>>   In preparation for cxl fwctl enabling, move data structures related to
>>>   cxl feature commands to a user header file.
>>>
>>>   Reviewed-by; Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>
>>>   Link: https://patch.msgid.link/r/20250307205648.1021626-3-dave.jiang@intel.com
>>>   Reviewed-by: Dan Williams <dan.j.williams@intel.com>
>>>   Reviewed-by: Li Ming <ming.li@zohomail.com>
>>>   Signed-off-by: Dave Jiang <dave.jiang@intel.com>
>>>   Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>>>
>>>  include/cxl/features.h   | 112 +----------------------------
>>>  include/uapi/cxl/features.h | 169 ++++++++++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 170 insertions(+), 111 deletions(-)
>>>  create mode 100644 include/uapi/cxl/features.h
>>>
>>>
>>> Regards,
>>>
>>> Venkat.
>>>
>>


