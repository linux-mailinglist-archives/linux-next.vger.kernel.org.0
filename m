Return-Path: <linux-next+bounces-7269-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9972AEB88C
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 15:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CA161C2141E
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 13:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A1D2D8DC5;
	Fri, 27 Jun 2025 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4iB+fR3"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04672D97A3;
	Fri, 27 Jun 2025 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029870; cv=none; b=KKjeWhY82AGpouh7XZ+zjLQq4AKutA7fM26+5C5EiQbybG90A8yXLlpwqUEjU0AcqTvcXdtXYonco6rCTH2nH4CGEsw214DI9LH7obiYg0S1pmVAyRLBmzdVKLAPuY1NQXiYTzzcRmlOdKO+RNaLZBG2DGq7fc5Cq7vc04/usOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029870; c=relaxed/simple;
	bh=lcJWZqeVwjpFnSWJSZOtJO5vAGFfa9DHinhZvGR946A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Amy+7JSpMQngncZEItf0t+Pp5GYjEWi6BUwlIGYqwEu3K3HuSpIDhjW0doCJGPoU1bqFwuVMuAK4aky78+n6ep41cvw/uZm75ffNZOmCUaGJY+3ADUZsPpgqwrALEFnrnqJYSrpQKUI4PkdyP7ID17yWvNbJT55C7xN+KjCLcBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4iB+fR3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751029869; x=1782565869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lcJWZqeVwjpFnSWJSZOtJO5vAGFfa9DHinhZvGR946A=;
  b=e4iB+fR3iDwIXppqIKgqivWlYbJyt1jXKCv52QaBoOtM9GxSHpZ2i2Or
   /fMFgN67GgHNNkSXAQQrSQ5maLYZkrgQ4FvadFiCAiNM4mHA/beKG81sP
   S7d5ajUmlpGhdGYDESu++H+QcKxgBhDk2lstCFfnJHK1CkUorotskOyy4
   gELazbk1pcbqoRQG1juvgbQ4NTMbAonGNiw3l3WFIPNYo3s2kTqvb/1+t
   n+0r6HwHfwRJFpRIg4xY6v5PxBG5jSDG0fyi+ScHT3+Qpxe50I4L57a2s
   sLda+6U5XJEUG8oblR15tpcDH3kqxMpVngF9ztinAj8KPZbQupqVtkL5q
   w==;
X-CSE-ConnectionGUID: Hq0d3edhQXayFY74uidzGQ==
X-CSE-MsgGUID: xYI0mVHxSfyhm7l2wypxYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53216376"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53216376"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:11:08 -0700
X-CSE-ConnectionGUID: X9qCysVXTMOOGGnxCeuv7w==
X-CSE-MsgGUID: f2/YQqXwSAKxqaMjoJ71Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157348817"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:11:05 -0700
Date: Fri, 27 Jun 2025 16:11:02 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	airlied@gmail.com, simona@ffwll.ch,
	Krzysztof Karas <krzysztof.karas@intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH v2 1/2] drm/doc: Fix title underline for "Task
 information"
Message-ID: <aF6YZmRiPcIGt6F5@black.fi.intel.com>
References: <20250619140655.2468014-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619140655.2468014-1-andrealmeid@igalia.com>

On Thu, Jun 19, 2025 at 11:06:54AM -0300, André Almeida wrote:
> Fix the following warning:
> 
> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> 
> Task information
> --------------- [docutils]
> 
> Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Add Reported-by tag
> ---
>  Documentation/gpu/drm-uapi.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 263e5a97c080..10dea6a1f097 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
>  complete wedging.
>  
>  Task information
> ----------------
> +----------------

Since we're here, can you please also fix the grammar in last sentence
of this section? I presume you meant to use either "provides" or "should
have" and not both? ;)

Raag

>  The information about which application (if any) was involved in the device
>  wedging is useful for userspace if they want to notify the user about what
> @@ -728,4 +728,4 @@ Stable uAPI events
>  From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>  
>  .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> -   :doc: uAPI trace events
> \ No newline at end of file
> +   :doc: uAPI trace events
> -- 
> 2.49.0
> 

