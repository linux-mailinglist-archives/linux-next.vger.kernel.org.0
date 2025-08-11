Return-Path: <linux-next+bounces-7889-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EED6B20533
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 12:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B3A2178A61
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 10:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261441EF36B;
	Mon, 11 Aug 2025 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+27CZLV"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5F61BD035
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754907809; cv=none; b=Jyxckf1NvINQIg4owlDdVu0U1v0jyR4CIOtTgk8o6qj2zuB91MUs/jNx/0ySkuYOtTChyzIp56rcpDrjdDk+u2oNJfQ3rMysR0d6Lh5sA6S0dqYv3VHY9QSAOfGABtZOdCn1WoAToTEkUrpK1NRw3wDRvGt+4/aB1In3zq6GNsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754907809; c=relaxed/simple;
	bh=65eJZSSRt3cPTXm3JAK0M0pCUEwDjIvntc5u4VBmOjM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WV9iXrwTelHhHOEfA9K7VwKAS9tNeRy4USC1MoFqzZgzgo1zvz9aJB21mbO5gPPzRA7ar5n15EZcKITntB7g+r9vp6xehcrhhdjtF2qKVhK3ab5g52UmZzYZpQ07UcB7YwIE4mkR+kACvXc3m5btrvNCFN7dWHY9pIkrk5uUJEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+27CZLV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754907807; x=1786443807;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=65eJZSSRt3cPTXm3JAK0M0pCUEwDjIvntc5u4VBmOjM=;
  b=m+27CZLVxGIl9zivEkQ+9aPwYpg2hDehlr1he2xO6AkjgKKx0rJaHY6Z
   ZSSlu8impTejnfnQ8c7a4uGqdn24FCCnmNJwpe0jkNsZdWfdRMD3kiOh/
   Zsx/cTTjKnmQXGOuxZWnMWjvx0j6pk5SKZE9p35Rj7XshMtvXFObKHEuT
   cZ0dpGN1SJSvQJCik8/gsd1or4j6HoajD9jy3C8yaxIMU28ai7cwhEk4H
   p2N5F8XBcgRJ6sJfvYdU199aDU72OlrwFirFZSrtE+KgIK2n3kZ6qSI1g
   XT80DlMQ7s+oyky0FtiSASRHuBThm6kvLoDwuzXwOX3k4DZVVXOESLVtJ
   g==;
X-CSE-ConnectionGUID: KzuQD8FOTFihziNYhO3fTA==
X-CSE-MsgGUID: pZnuT5KrTW+nBAAxp5t+cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="74743355"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="74743355"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 03:23:26 -0700
X-CSE-ConnectionGUID: JnG1p0lnTE2t5fF6MXUH8g==
X-CSE-MsgGUID: LB9fGSCRRVSJd5nqNdgLDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169989246"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.226])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 03:23:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Brahmajit Das <listout@listout.xyz>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org
Cc: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, simona@ffwll.ch
Subject: Re: [RFC PATCH 0/2] use new debugfs device-centered functions
In-Reply-To: <20250808225226.30465-1-listout@listout.xyz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250808225226.30465-1-listout@listout.xyz>
Date: Mon, 11 Aug 2025 13:23:20 +0300
Message-ID: <32c55ab0b1452a1fd8ef49e8a1ca640ad5bd9d76@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, 09 Aug 2025, Brahmajit Das <listout@listout.xyz> wrote:
> Replace the use of drm_debugfs_create_files() with the new
> drm_debugfs_add_files() function, which centers the debugfs files
> management on the drm_device instead of drm_minor.

Please base your patches on top of drm-tip. They no longer apply.

BR,
Jani.

>
> Refer:
> https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support
>
> Brahmajit Das (2):
>   drm/i915/debugfs: use new debugfs device-centered functions
>   drm/i915: use new debugfs device-centered functions
>
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 5 ++---
>  drivers/gpu/drm/i915/i915_debugfs.c                  | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)

-- 
Jani Nikula, Intel

