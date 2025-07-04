Return-Path: <linux-next+bounces-7369-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC40AF9AE0
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 20:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66507189277F
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 18:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE0D433B3;
	Fri,  4 Jul 2025 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJir+V19"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EEB2E3712;
	Fri,  4 Jul 2025 18:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751654878; cv=none; b=dHwmZdC0uADdwdb8B0XBTSJ3KLDMUUbM+pUZEfmu6e7DhSVMNRDBinet+J1YW2RfHxHxJMYcoD6gwjA1OZNxW5kkEvF+F7uzCcaCGNFV+UfZ0jlcyTlFiJwc1caAjbeicgo/pu90QoeI/7Q8pDJxqs0LZaUSxuVoCnzbqe9oP5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751654878; c=relaxed/simple;
	bh=NSaO2apjXwtcWw4syJtVpN33arr+z2MJifsHr5e1p1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnSCNG+j8LWtN0sqdglmHPA8Zio/l9zpGRFmp68DfKueLc3mlVf1L2SStkGkg2IUrPCdwMrVwGmprL6EjGllVtb/igTUaiduAGVjXELQNdtBrOXpr4mlB073GWknjroInV2bSHe1N2ykYsAbPOwM0PLcMYFebEuaQB47gYTdcIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJir+V19; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751654877; x=1783190877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NSaO2apjXwtcWw4syJtVpN33arr+z2MJifsHr5e1p1E=;
  b=nJir+V19vO7+Uw1mh1ursLrqA/x6eC3mtewDNBZAqqDwU2/1Rs0WztOJ
   BhOouitY39ZGlQRacFmT1HaiYB5f+4bYS9bCyo4AArl+Y97MNsDJrT41L
   wYdOhvrVuujvipHVCfV9Tu2ApngtDblCNm7SBa9eWRhxwrVDzPCMojBod
   8xo/wTc0MuhSO0ik0Ge6WasS/c/lq0D0VZotGJ2IjpU9CTlDP/fSETnK4
   4803MmKmUddjn7Ic4QRK8ijdB6uDp4tI3PUIeu44wEuD77tWZrHkfKaFB
   +I6UmwY0NsrLUkQQjbBF/Ng/7BRYFIUUWqW8Kdwz8UCsBbgI2eNzNMzyO
   Q==;
X-CSE-ConnectionGUID: hSKTSbYRT36JneTb17+DmA==
X-CSE-MsgGUID: fOC/YOObRDS74YpAsQd7dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="71423403"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="71423403"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:47:57 -0700
X-CSE-ConnectionGUID: jx51j8d2SZSdVmpIUssKlA==
X-CSE-MsgGUID: HdnMEGU0QyCjqXfPWl18qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="160370322"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:47:54 -0700
Date: Fri, 4 Jul 2025 21:47:50 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	airlied@gmail.com, simona@ffwll.ch,
	Krzysztof Karas <krzysztof.karas@intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH v3 2/3] drm: Add missing struct drm_wedge_task_info
 kernel doc
Message-ID: <aGgh1vYPsAmexvOn@black.fi.intel.com>
References: <20250627171715.438304-1-andrealmeid@igalia.com>
 <20250627171715.438304-2-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627171715.438304-2-andrealmeid@igalia.com>

On Fri, Jun 27, 2025 at 02:17:14PM -0300, André Almeida wrote:
> Fix the following kernel doc warning:
> 
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'pid' not described in 'drm_wedge_task_info'
> include/drm/drm_device.h:40: warning: Function parameter or struct member 'comm' not described in 'drm_wedge_task_info'
> 
> Fixes: 183bccafa176 ("drm: Create a task info option for wedge events")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v3: Make it consistent with drm_device member description
> v2: Add Reported-by tag
> ---
>  include/drm/drm_device.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 08b3b2467c4c..73dd3c5470a4 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -35,7 +35,9 @@ struct pci_controller;
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>   */
>  struct drm_wedge_task_info {
> + 	/** @pid: the pid of the task */

Nit: Can be simply "pid of the task" without initial "the".

>  	pid_t pid;
> + 	/** @comm: the command name of the task */

Ditto.

>  	char comm[TASK_COMM_LEN];

But in any case,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

