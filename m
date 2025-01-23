Return-Path: <linux-next+bounces-5308-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7572A19FDA
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 09:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52ABB188F6FF
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 08:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C0520C471;
	Thu, 23 Jan 2025 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnGshaX3"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0AA20C03A;
	Thu, 23 Jan 2025 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737620659; cv=none; b=FlLwGpG+R2hCY4FXc2Vm3uu1AF7seCDOokgiRjiCXwSXmodHwNnHY4jMzVtAu+6BH8Amso7I8c7N1x8BdvYlvL3B8iN82u7txmOWhOhBKGGFpdHu/cqWnONPjA32IfGrlackfawLNJI4tEk2a5IJCfiz4U79LlUMC7dKUC090e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737620659; c=relaxed/simple;
	bh=GGP2ai4GYm2zNzeIOLLH+0ZN/Orn8SGA6+VFokn/B2c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FgybKFqBgswQn9LzrX2TOEEEK6+jhCQSxx3KSE0KhNwqlHmRzVdcfIo5B19+2++FXjBQxNi0tFh5eagd6h26rnYmxIU5ZeXRD9jOUU6yjp5j2VfOGBNeQBuRlMKf3+0/LgN+z4BMZDG61SvToFIszP5gP4ti8bQ2RpvnoFWmno4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnGshaX3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737620658; x=1769156658;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=GGP2ai4GYm2zNzeIOLLH+0ZN/Orn8SGA6+VFokn/B2c=;
  b=WnGshaX3HZZM1vXEfrMw5gVm/m4DkfxBY5NhGCPCli5gouJtMM19/itU
   G1bcM53z/kMcP2t/m3iRLtslP8wtfh/5Jx/Eex6bdQupBfsUX9bcw0kmy
   v9fqZFdC7y1JXghjtlWyD7TpI/dDHrt8x5A1Km2z4eY6f32FqlulafMP9
   dhqFmP/N/0BDFrIRJ4QIrO8HJtlKEaTHB0AAlqCxlbquv9j434a4komtE
   jgwbbTdMevg6Q/+Cm921jYu9xepogKkOBGGsAEI+zs1P7boYUVtZwVP6x
   Z1Iv2YmvLQPaPeOWQVZYMPnRoG88Mxo6+uRnmO8gjIGVpBhdtCJqUqRQa
   Q==;
X-CSE-ConnectionGUID: lEiYVcXhRCSIVg1RgFDOEw==
X-CSE-MsgGUID: PsXME9eVQTWnTP7hy9O6zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48605975"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="48605975"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 00:24:16 -0800
X-CSE-ConnectionGUID: XbGgefMOQ4m+sKxc946+Yw==
X-CSE-MsgGUID: fuiIE3ppQLWpHvLt7QwPbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="107389461"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.98])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 00:24:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Dave Airlie <airlied@redhat.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Yafang Shao
 <laoar.shao@gmail.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the mm tree
In-Reply-To: <20250123103553.32f41759@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250106130348.73a5fae6@canb.auug.org.au>
 <20250108121650.09a8e828@canb.auug.org.au>
 <20250123103553.32f41759@canb.auug.org.au>
Date: Thu, 23 Jan 2025 10:24:09 +0200
Message-ID: <877c6mndjq.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 23 Jan 2025, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Wed, 8 Jan 2025 12:16:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Mon, 6 Jan 2025 13:03:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > Today's linux-next merge of the drm-intel tree got a conflict in:
>> > 
>> >   drivers/gpu/drm/i915/display/intel_display_driver.c
>> > 
>> > between commit:
>> > 
>> >   4fc0cee83590 ("drivers: remove get_task_comm() and print task comm directly")
>> > 
>> > from the mm-nonmm-unstable branch of the mm tree and commit:
>> > 
>> >   f5d38d4fa884 ("drm/i915/display: convert intel_display_driver.[ch] to struct intel_display")
>> > 
>> > from the drm-intel tree.
>> > 
>> > I fixed it up (see below) and can carry the fix as necessary. This
>> > is now fixed as far as linux-next is concerned, but any non trivial
>> > conflicts should be mentioned to your upstream maintainer when your tree
>> > is submitted for merging.  You may also want to consider cooperating
>> > with the maintainer of the conflicting tree to minimise any particularly
>> > complex conflicts.
>> > 
>> > -- 
>> > Cheers,
>> > Stephen Rothwell
>> > 
>> > diff --cc drivers/gpu/drm/i915/display/intel_display_driver.c
>> > index 62596424a9aa,497b4a1f045f..000000000000
>> > --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
>> > @@@ -389,8 -397,9 +397,8 @@@ void intel_display_driver_resume_access
>> >    * Returns %true if the current thread has display HW access, %false
>> >    * otherwise.
>> >    */
>> > - bool intel_display_driver_check_access(struct drm_i915_private *i915)
>> > + bool intel_display_driver_check_access(struct intel_display *display)
>> >   {
>> >  -	char comm[TASK_COMM_LEN];
>> >   	char current_task[TASK_COMM_LEN + 16];
>> >   	char allowed_task[TASK_COMM_LEN + 16] = "none";
>> >   
>> > @@@ -399,14 -408,15 +407,14 @@@
>> >   		return true;
>> >   
>> >   	snprintf(current_task, sizeof(current_task), "%s[%d]",
>> >  -		 get_task_comm(comm, current),
>> >  -		 task_pid_vnr(current));
>> >  +		 current->comm, task_pid_vnr(current));
>> >   
>> > - 	if (i915->display.access.allowed_task)
>> > + 	if (display->access.allowed_task)
>> >   		snprintf(allowed_task, sizeof(allowed_task), "%s[%d]",
>> > - 			 i915->display.access.allowed_task->comm,
>> > - 			 task_pid_vnr(i915->display.access.allowed_task));
>> >  -			 get_task_comm(comm, display->access.allowed_task),
>> > ++			 display->access.allowed_task->comm,
>> > + 			 task_pid_vnr(display->access.allowed_task));
>> >   
>> > - 	drm_dbg_kms(&i915->drm,
>> > + 	drm_dbg_kms(display->drm,
>> >   		    "Reject display access from task %s (allowed to %s)\n",
>> >   		    current_task, allowed_task);
>> >     
>> 
>> This is now a conflict between the drm tree and the mm-nonmm-unstable
>> branch of the mm tree.
>
> And now a conflict between Linus' tree and the mm-nonmm-stable tree.

Will be taken care of with backmerges after -rc1.

BR,
Jani.

-- 
Jani Nikula, Intel

