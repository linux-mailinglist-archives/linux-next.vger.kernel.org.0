Return-Path: <linux-next+bounces-3751-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBDB974CEF
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 10:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C86901F28B8E
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 08:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6190B1547FB;
	Wed, 11 Sep 2024 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lp/Lu+uf"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6188C13C9D3;
	Wed, 11 Sep 2024 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044205; cv=none; b=aTtuOmu6A7rh0RjdvnrSUwVtmjxj0hplu6tI2cAHTzzESyIRGOk9Q1lmzMrwbMz2wVYLH9kFJE5FWnzofq0RlIJIthwuEhuP6YN4wdhXKhZakqLwqctMVMnZ8gnEWH2LxVYgf2DXws3DsIeG31DGOnNrnAVHSOvRbZEXsxDCL6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044205; c=relaxed/simple;
	bh=pSQDs7KMoH7HaIy4NIvWWkshPAjMFbu930zgWis30To=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FIqD91GcSk0R0TKYA6LfwP6E/eWIzoaaI1lE7RR+ppW9o3w+bAqgK3TJxzCrat/S485vFpqoQYDIz2PucfuT4cgHHGzg5hgjCu0/lNWWbgEZw1acuQc2oW+7poUlfNf4hYvOqnr+TcMxu0qweDn/hPUgkxDyk0Dr/sylq3c1Y6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lp/Lu+uf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726044203; x=1757580203;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=pSQDs7KMoH7HaIy4NIvWWkshPAjMFbu930zgWis30To=;
  b=lp/Lu+ufTVJ2fMnvi6D/6A1TTjEYOZxgOdkWAs1tLf0OUfi/wBeWFSQ4
   ql3qPkKn105smUzLk6YUje4B8H41/GyF1uulkMyvcPQrcS7iKG4kZ4z4V
   LWuzUL2ZS1KFL6vgh0rBThiURdmztCp9lYkzNM93oiKxtlF47MkW3R6px
   T8DSTo0hSOTkuf1+6MJNQGAkC2qyee26xqAkQmMeHUGuHYYXftldDgG21
   xhT6hOMFNNprmoXb7LDbS6msEQ5ng5sIUC0myrRNYmZ8z/lvM84utiHHL
   XZPBxgsaXMkmGy7/UkTtjczUM84MPuk0tGMczmiF0djqT9SGdcnejyI3q
   g==;
X-CSE-ConnectionGUID: FxdYNn3iRnyDo3J9ALKePw==
X-CSE-MsgGUID: Mcpz0y4jT3e9Msj+8HAgEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24700046"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24700046"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 01:43:23 -0700
X-CSE-ConnectionGUID: ssBJW64jSTeZXEl5I3m4lg==
X-CSE-MsgGUID: ZAxfyomMSEOqQal2KBgxSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="66929497"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.149])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 01:43:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Simona Vetter
 <simona.vetter@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 DRM XE List <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with the drm-intel
 tree
In-Reply-To: <20240911135249.543da06a@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240906131502.7a7d1962@canb.auug.org.au>
 <20240911135249.543da06a@canb.auug.org.au>
Date: Wed, 11 Sep 2024 11:43:15 +0300
Message-ID: <87ed5qk2cc.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 11 Sep 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Fri, 6 Sep 2024 13:15:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the drm-xe tree got a conflict in:
>> 
>>   drivers/gpu/drm/xe/display/xe_display.c
>> 
>> between commit:
>> 
>>   11d0613af7c5 ("drm/i915/display: include drm/drm_probe_helper.h where needed")
>> 
>> from the drm-intel tree and commit:
>> 
>>   87d8ecf01544 ("drm/xe: replace #include <drm/xe_drm.h> with <uapi/drm/xe_drm.h>")
>> 
>> from the drm-xe tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>> 
>> -- 
>> Cheers,
>> Stephen Rothwell
>> 
>> diff --cc drivers/gpu/drm/xe/display/xe_display.c
>> index 303d00b99a68,75736faf2a80..000000000000
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@@ -10,8 -10,7 +10,8 @@@
>>   
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_managed.h>
>>  +#include <drm/drm_probe_helper.h>
>> - #include <drm/xe_drm.h>
>> + #include <uapi/drm/xe_drm.h>
>>   
>>   #include "soc/intel_dram.h"
>>   #include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */
>
> This is now a conflict between the drm-intel and drm trees.

I backmerged drm-next to drm-intel-next, resolving the conflict.

Thanks,
Jani.

-- 
Jani Nikula, Intel

