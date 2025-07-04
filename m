Return-Path: <linux-next+bounces-7368-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 474C2AF9AD8
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 20:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4E104A6BF9
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 18:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250941F91F6;
	Fri,  4 Jul 2025 18:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ytl8s+Qu"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2728227B8E;
	Fri,  4 Jul 2025 18:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751654471; cv=none; b=kZK8s8+phYFoBcuvqRJRdSH+fzCXDQwEaQcZBvLJ2qO9+jJsjvZ5UDPqw6ZFd1JXwOPyFZcPbG0o9THqnXF1EwoMiuATmL8MFwDgX0me1MMFzlD0gXi931i5sfd5LNqLD/mK59z+Xma/HXRUuIopTs0291Iei2rUzgh+IAwBiRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751654471; c=relaxed/simple;
	bh=4PtD/ILRXBEoCudtPmkF3ybvtqaqQYmADOya+tz7Ku4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bATRT4MZ7DToBwwyR4PWszy/AMIdriOYjTl14wz8rIW2pJ3gq77OWTT/MRAkr1UqkU03rsllGTFBGZv1sMxRcecJ0UAH8X2GIehAtqUaAz+bNwLLYDOy4DtQ0HjBenbhB78Yxdeoyv50j86t21j64mEC6jla09mjAnQ7nqA/vqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ytl8s+Qu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751654469; x=1783190469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4PtD/ILRXBEoCudtPmkF3ybvtqaqQYmADOya+tz7Ku4=;
  b=Ytl8s+Qut0RrorSBt1nE0OzTgUKiKBwfiqo3gkQmxZqCe94Sm99iMHM8
   ZOhrBJCqvQ4DMwJPIK56pVfsotCBsqHOWTyWmb9KaxgY6qPbFrvX2VoYg
   xQaKYot83mHIupSaAkc8DjmctE1ERh3VB0B5V9s1vqytH545DNcjjOx0s
   erL/9AQi/Z6EhivAPKVbluK7LYyFBkbkcpIJ36YVksTm40+qaA9KwaXsp
   K7QFU8pAYUwTvT/w/tu+13vEMjQ0Q6eCuHLcompBQpUKUyxlCiVfRHIZk
   aZDo54HmxTJ+lR55DVq0Y4Q/GKQ5GBrE4SiIIDqoMpQCwYr997xkSoW/E
   w==;
X-CSE-ConnectionGUID: r5UZ1XSLRhG7x/+bLCS8xg==
X-CSE-MsgGUID: 44Q2BhBPQq6vfhsY+Hrg3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="57795001"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="57795001"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:41:08 -0700
X-CSE-ConnectionGUID: hBpJeHbcTj6a1GMhCal+Fg==
X-CSE-MsgGUID: E1sBxAdPR7mZ3/yVwRFkOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="160221048"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:41:05 -0700
Date: Fri, 4 Jul 2025 21:41:02 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	airlied@gmail.com, simona@ffwll.ch,
	Krzysztof Karas <krzysztof.karas@intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH v3 1/3] drm/doc: Fix title underline for "Task
 information"
Message-ID: <aGggPuSCEK_opydS@black.fi.intel.com>
References: <20250627171715.438304-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627171715.438304-1-andrealmeid@igalia.com>

On Fri, Jun 27, 2025 at 02:17:13PM -0300, André Almeida wrote:
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
>  
>  The information about which application (if any) was involved in the device
>  wedging is useful for userspace if they want to notify the user about what
> @@ -728,4 +728,4 @@ Stable uAPI events
>  From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>  
>  .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> -   :doc: uAPI trace events
> \ No newline at end of file
> +   :doc: uAPI trace events

Unrelated change. Someone with a different editor added this and now
your editor disagrees with it.

Switching to binary mode usually fixes the issue.

Raag

