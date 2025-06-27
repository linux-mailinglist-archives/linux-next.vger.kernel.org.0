Return-Path: <linux-next+bounces-7268-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39489AEB864
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 15:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B3DB17C241
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 13:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92172C325C;
	Fri, 27 Jun 2025 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0WKGi9W"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CB7264FBB;
	Fri, 27 Jun 2025 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029421; cv=none; b=M7Cd2klvk+1soMSmyX5rWiIk2/zOBlpuyUd54WFL9NJnGbmiwoPwA33HVNUOVey93U0m6YEK0keUhOJiE1sXpwhrC6wVgJrlzSaKy+WM9nQG3M1Z44TMPud5Ap4tfORRmyfCSMQvAZs3GXTjk1lDTa43XzcruMDBFNfimMzParU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029421; c=relaxed/simple;
	bh=yLjtgMRMU2cpI0DE9ZxiLsKQBe07OjkZ3ktOz8r7re4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxA7Mm3AgQVHy3bCfH0p7CHRdVOLw60SAv+F4HYWMY5IaDcdKWD2YGNzIk9iCwelAR+5CdWwfAmlwC/DPI3niDUYz1R0UrkxvfppO6Rjm4bWjeKDgx59JxcFNxJRROZEZJhi/34WwoSP0jWOAlT68dwbcn4FHR9NnXVeBMnfsFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0WKGi9W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751029420; x=1782565420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yLjtgMRMU2cpI0DE9ZxiLsKQBe07OjkZ3ktOz8r7re4=;
  b=h0WKGi9WD5976q986C2Fzf96ZR3KIA3jlZGLyCZ9TdDrbhrsDjRgHPXQ
   Li3fiapwS1rIcseCwybiaxTduQI78kofS6fbLmO4SHQccHrZCNlLTcbBA
   nL4OaaDvBPyzVR87goBA7uOfwzJbtpnnM99QzO0QqLjZMLHVf+tM9jfY5
   rNRmzyQPw9CDMXL/7j+fhZRq4kgbpJETIW60UkRoKmbAmp7OONqoHj8xX
   ZJrGWZvXBc9jyYDfZL92a+msu+/k0JvpUqJA4QfQTDEM+HDXrgMee201F
   zCfFGTD+E3EPshT/tPAmeAn9XD++8tFPi6pC7FCp/CAaAcXZ01M2uSDoF
   g==;
X-CSE-ConnectionGUID: /R176IQoQ+aJ+e5z8Bd/7w==
X-CSE-MsgGUID: BaumWjpmQJGYqJQp0N3PCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57123509"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57123509"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:03:38 -0700
X-CSE-ConnectionGUID: 7qcoc1HiRV29Zltj/dwo+g==
X-CSE-MsgGUID: wVDW1LARQJOSzRebyi347w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153516197"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:03:36 -0700
Date: Fri, 27 Jun 2025 16:03:32 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	airlied@gmail.com, simona@ffwll.ch,
	Krzysztof Karas <krzysztof.karas@intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH v2 2/2] drm: Add missing struct drm_wedge_task_info
 kernel doc
Message-ID: <aF6WpMe9Ar8jmXOX@black.fi.intel.com>
References: <20250619140655.2468014-1-andrealmeid@igalia.com>
 <20250619140655.2468014-2-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619140655.2468014-2-andrealmeid@igalia.com>

On Thu, Jun 19, 2025 at 11:06:55AM -0300, André Almeida wrote:
> Fix the following kernel doc warning:
> 
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'pid' not described in 'drm_wedge_task_info'
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'comm' not described in 'drm_wedge_task_info'
> 
> Fixes: 183bccafa176 ("drm: Create a task info option for wedge events")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Add Reported-by tag
> ---
>  include/drm/drm_device.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 08b3b2467c4c..aae0800ccef1 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -33,6 +33,8 @@ struct pci_controller;
>  
>  /**
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> + * @pid:	the pid of the task
> + * @comm:	the command name of the task

Redundant tabs. A whitespace is ususally good enough for docs.

Raag

>   */
>  struct drm_wedge_task_info {
>  	pid_t pid;
> -- 
> 2.49.0
> 

