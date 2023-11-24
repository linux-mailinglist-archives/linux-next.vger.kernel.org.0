Return-Path: <linux-next+bounces-62-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B149B7F74C6
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 14:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF060B214F0
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 13:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB3428DAF;
	Fri, 24 Nov 2023 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8hSdZpS"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E7610FF;
	Fri, 24 Nov 2023 05:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700832032; x=1732368032;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=LciWvmOYvFGY4hjtbLcffHjBc0KwIHKRiOEQ8zSD05c=;
  b=S8hSdZpSKecyP4TyhwWkc/VRx4iOw19cXJNV5svMAcxCyHObefd2Wnax
   vfrM0iswZ6W5YnSznedqdrcrIwaR028phPe1hI/Ks83rQsru7RDnL5pkU
   +xMuuhJN8vLbD41tIrC61yZDRc0RUMJ+1OCfZPHBj1c+5NC5c4If+gSJG
   k6ucLDQfmTLccz208EyapqibKUak5JtLcfveLfdicTkjvibLrU/dnmL5i
   Ss1nHApmrilMIX61LJeXj0ZKzwCHtC+su+bRks2T5+fngGlfuifqzfn/n
   J2sIJUHAz5RqPWlpfjnqXU3kkomw+Mt1NdVyDOi6irgdoWCzSZ2SKchSV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391296958"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="391296958"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 05:20:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="802171422"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="802171422"
Received: from dashah-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.41.230])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 05:20:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Maxime Ripard <mripard@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
In-Reply-To: <ed5f8aa6-c46b-414a-a10e-afcdd3535487@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
 <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
 <20231114134506.2ba0de1f@canb.auug.org.au>
 <530b6100-4f4e-4b3d-8fea-5b316e989633@gmail.com>
 <20231114140855.0b259b2d@canb.auug.org.au>
 <f1b21cbd-5bb6-4030-ae7d-a0ca2fbc76a9@gmail.com>
 <73cg637ax5cahqocscx5cjvtqkwlt4ves6cxgprbwqllasxq6v@gk6vzsqfc46j>
 <ZVXSjt_1uWHuYXsq@phenom.ffwll.local>
 <zuz7zpcjfqzeymfrn53tbhcsem5abqh2l4vcaqkxo5wbgoc742@bnxnkek3wv6t>
 <ed5f8aa6-c46b-414a-a10e-afcdd3535487@gmail.com>
Date: Fri, 24 Nov 2023 15:20:24 +0200
Message-ID: <878r6n9tk7.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 22 Nov 2023, Luben Tuikov <ltuikov89@gmail.com> wrote:
> On 2023-11-22 07:00, Maxime Ripard wrote:
>> Hi Luben,
>> 
>> On Thu, Nov 16, 2023 at 09:27:58AM +0100, Daniel Vetter wrote:
>>> On Thu, Nov 16, 2023 at 09:11:43AM +0100, Maxime Ripard wrote:
>>>> On Tue, Nov 14, 2023 at 06:46:21PM -0500, Luben Tuikov wrote:
>>>>> On 2023-11-13 22:08, Stephen Rothwell wrote:
>>>>>> BTW, cherry picking commits does not avoid conflicts - in fact it can
>>>>>> cause conflicts if there are further changes to the files affected by
>>>>>> the cherry picked commit in either the tree/branch the commit was
>>>>>> cheery picked from or the destination tree/branch (I have to deal with
>>>>>> these all the time when merging the drm trees in linux-next).  Much
>>>>>> better is to cross merge the branches so that the patch only appears
>>>>>> once or have a shared branches that are merged by any other branch that
>>>>>> needs the changes.
>>>>>>
>>>>>> I understand that things are not done like this in the drm trees :-(
>>>>>
>>>>> Hi Stephen,
>>>>>
>>>>> Thank you for the clarification--understood. I'll be more careful in the future.
>>>>> Thanks again! :-)
>>>>
>>>> In this case, the best thing to do would indeed have been to ask the
>>>> drm-misc maintainers to merge drm-misc-fixes into drm-misc-next.
>>>>
>>>> We're doing that all the time, but we're not ubiquitous so you need to
>>>> ask us :)
>>>>
>>>> Also, dim should have caught that when you pushed the branch. Did you
>>>> use it?
>>>
>>> Yeah dim must be used, exactly to avoid these issues. Both for applying
>>> patches (so not git am directly, or cherry-picking from your own
>>> development branch), and for pushing. The latter is even checked for by
>>> the server (dim sets a special push flag which is very long and contains a
>>> very clear warning if you bypass it).
>>>
>>> If dim was used, this would be a bug in the dim script that we need to
>>> fix.
>> 
>> It would be very useful for you to explain what happened here so we
>> improve the tooling or doc and can try to make sure it doesn't happen
>> again
>> 
>> Maxime
>
> There is no problem with the tooling--I just forced the commit in.

Wait what?

What do you mean by forcing the commit in? Bypass dim?

If yes, please *never* do that when you're dealing with dim managed
branches. That's part of the deal for getting commit access, along with
following all the other maintainer tools documentation.


BR,
Jani.


-- 
Jani Nikula, Intel

