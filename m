Return-Path: <linux-next+bounces-5116-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAB4A073C7
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 11:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 382371678E1
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 10:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9174215F4C;
	Thu,  9 Jan 2025 10:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHbvINMZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF9B21579C;
	Thu,  9 Jan 2025 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736419966; cv=none; b=Jth7wvrCjdjB3ByogvfrMoU/EFejSLQ8lzAuMY4tcrYSaRAIEa22ZUpMcKayF3dZVV8eMzEMQfh0H1z5WIUgjd+lXZVHewm0lLlVK95Ig1h1HDYUiPFTsImSFgc8/HT8umxMTdpdnAxdgg7g7QIES/fY7HrZXMkckdowCfmOYDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736419966; c=relaxed/simple;
	bh=QBzI2Wbpho1NEfTzBYXTsUD5MhRmFj/3E7Z72jZHa5E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=coCkC29zcRW0qd0CuX4Xdv5D5qsm5vzobtMcwrRAR3c3UGleJ+BSUu/DGrDT31QyZyjeWyrSN0A+HtyuBNvrO05DcYEpbqzLnOubGD3WP22D7GAn1BowjZ1ZBe+fh3DueooSq5b3Oc9jQTNNrAFnF9qrGc/u5q5y2iWbrVjCDGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHbvINMZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736419964; x=1767955964;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=QBzI2Wbpho1NEfTzBYXTsUD5MhRmFj/3E7Z72jZHa5E=;
  b=UHbvINMZYLvZIlyOEk2CPxPAqkzObVO/Nr6JqnPxNML3aBYG/0c5+zTA
   2OAYYrg97xly0jxYXQxeXSwzpmJ0u7IlPe67dohecLsJxFfhdTmn4z7sb
   7U1YixCiEBUX3C3a3+XkiVXqGap6WiUCIuMSzZC+WqafkkkIKZ+CCCfXI
   qeGx0gdp4aaCC1hue+fwvj/RNeP6smPT6yvsrvkSsithUgfCYKw+cQlwz
   SrXctFjEi78gABEVakJHSUV2kaFMUZ10MtKxb55Rpjw/syY9PNVxYo8g2
   QVObOohk3JkC7Wh4lEubFS+nvhg18E3+zhpsZ+dphaIV5KWKpixks0l3C
   g==;
X-CSE-ConnectionGUID: OoXUXOZ+TO6wywnXBOfQfg==
X-CSE-MsgGUID: zF3RT0IBQjScIYeOC3bYIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36561810"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36561810"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 02:52:44 -0800
X-CSE-ConnectionGUID: ngM6lUsGRSOvJdEPOlrkCA==
X-CSE-MsgGUID: +rldYdQ4ReyMomNA6lK6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108481385"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.206])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 02:52:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Matt Atwood
 <matthew.s.atwood@intel.com>, Matt Roper <matthew.d.roper@intel.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with Linus' tree
In-Reply-To: <20250109164142.07cd8023@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241125120921.1bbc1930@canb.auug.org.au>
 <20241216183801.0d5c9a5f@canb.auug.org.au>
 <20250109164142.07cd8023@canb.auug.org.au>
Date: Thu, 09 Jan 2025 12:52:37 +0200
Message-ID: <87sepsjm2y.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 09 Jan 2025, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Mon, 16 Dec 2024 18:38:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Mon, 25 Nov 2024 12:09:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > Today's linux-next merge of the drm-xe tree got a conflict in:
>> > 
>> >   include/drm/intel/xe_pciids.h
>> > 
>> > between commit:
>> > 
>> >   493454445c95 ("drm/xe: switch to common PCI ID macros")
>> > 
>> > from Linus' tree and commit:
>> > 
>> >   ae78ec0a52c4 ("drm/xe/ptl: Add another PTL PCI ID")
>> > 
>> > from the drm-xe tree.
>> > 
>> > I fixed it up (I deleted the file and added the following merge fix patch)
>> > and can carry the fix as necessary. This is now fixed as far as linux-next
>> > is concerned, but any non trivial conflicts should be mentioned to your
>> > upstream maintainer when your tree is submitted for merging.  You may
>> > also want to consider cooperating with the maintainer of the conflicting
>> > tree to minimise any particularly complex conflicts.
>> > 
>> > From: Stephen Rothwell <sfr@canb.auug.org.au>
>> > Date: Mon, 25 Nov 2024 12:05:38 +1100
>> > Subject: [PATCH] fix up for "drm/xe/ptl: Add another PTL PCI ID"
>> > 
>> > interacting with "drm/xe: switch to common PCI ID macros" from Linus'
>> > tree.
>> > ---
>> >  include/drm/intel/pciids.h | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> > 
>> > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
>> > index 32480b5563db..7883384acd5e 100644
>> > --- a/include/drm/intel/pciids.h
>> > +++ b/include/drm/intel/pciids.h
>> > @@ -829,6 +829,7 @@
>> >  	MACRO__(0xB092, ## __VA_ARGS__), \
>> >  	MACRO__(0xB0A0, ## __VA_ARGS__), \
>> >  	MACRO__(0xB0A1, ## __VA_ARGS__), \
>> > -	MACRO__(0xB0A2, ## __VA_ARGS__)
>> > +	MACRO__(0xB0A2, ## __VA_ARGS__), \
>> > +	MACRO__(0xB0B0, ## __VA_ARGS__)
>> >  
>> >  #endif /* __PCIIDS_H__ */
>> > -- 
>> > 2.45.2  
>> 
>> OK, so commits ae78ec0a52c4 and 493454445c95 were merged in commit
>> 
>>   8f109f287fdc ("Merge drm/drm-next into drm-xe-next")
>> 
>> but include/drm/intel/xe_pciids.h was not deleted (it is not longer
>> referenced anywhere in the tree) and the above patch was not applied :-(
>> 
>> Since then that part of the drm-xe tree has been merged into the drm
>> tree in commit
>> 
>>   bdecb30d579e ("Merge tag 'drm-xe-next-2024-12-11' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next")
>> 
>> So, include/drm/intel/xe_pciids.h needs to be removed from the drm tree
>> and the above patch applied there.
>
> Ping?

Thanks for the ping. See [1].

BR,
Jani.


[1] https://lore.kernel.org/r/20250109105032.2585416-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel

