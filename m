Return-Path: <linux-next+bounces-3590-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8D96B78E
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 11:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BE6F281CDA
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 09:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CF51CEE89;
	Wed,  4 Sep 2024 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ek1/+Prc"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C537F1CCEE4;
	Wed,  4 Sep 2024 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443895; cv=none; b=hQmg0yrbOuagFAIby77JXf4of/H1SfJPglSfVrR6kHuvmG8gPdD/5QcKIl+AXW4QJqOeJ8L4uEHRGpLFr0lX1HLAZA5W51ydWq8kbY3tKz0xPtX+2g8wWwPx2Xy1jPLaI84sekK1Su/P6+uSM+XDT+nZYOGHTPd2q8M7SFSB874=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443895; c=relaxed/simple;
	bh=R3f8XqqhzUhpawC1aXctJCl08zl8Q7PA+O00jmQMEOQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JpGSLh5u4Y3jQ08nGpUcXrUvNxDjHA7nVTCW6C44je/aCE6rnZdYxxT9WZ+nMpdxQ4n5qkSOC9U+uKyU+3JKmWLgp7rqcESOGvRY+GshhVwHr002LQo2bqjqwvqfYuWPA6cB1t+LdGG/P1w1o85ft0AXOADFXyHn4v7cuRhd2dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ek1/+Prc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725443893; x=1756979893;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=R3f8XqqhzUhpawC1aXctJCl08zl8Q7PA+O00jmQMEOQ=;
  b=Ek1/+Prcx1wIcIuMRTRUE7bbfX9+dbKIqJcsJicVJG1Hk+6nxlPb3tua
   HTZx6fLFhfIy2kMgmMBgO+FInHvKkBW0crIFUhp3e6qDro26YRhVn6ZfY
   cW/I6rU45FsHjPPgnaeYl1wlYQblWvCAagicHeZ9EIoj1HlnONdXdx2yF
   /+jE5jxG1+Gb+R/EFo5IpgKxQnCPx1xa3uVd0DuL976nzRhrJVg53Es41
   YK3dqf9yuCuabmk7mY/fYRG6RCLsbw1JUFUofeuuJtWlWBDKBxVdstnDo
   pku7/PYgfc4LyWqnnTzax154hNkfyRdHdebQlqBkDrnXgAmlONSSsEShB
   A==;
X-CSE-ConnectionGUID: HgSW+JTFRuCTT1vO6G8t8Q==
X-CSE-MsgGUID: vk11CzoUS5WjvVzIv9DDQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24248096"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="24248096"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 02:58:13 -0700
X-CSE-ConnectionGUID: oiYwld9UQAiVnRI/DkEpYg==
X-CSE-MsgGUID: zHWxKB9sT2+xBNmaZkZy4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="102626489"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.18])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 02:58:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Robert Foss <rfoss@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20240904125206.6708daff@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240904125206.6708daff@canb.auug.org.au>
Date: Wed, 04 Sep 2024 12:57:52 +0300
Message-ID: <87ikvbspun.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 04 Sep 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/bridge/ti-tdp158.c: In function 'tdp158_enable':
> drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration of function 'gpiod_set_value_cansleep' [-Wimplicit-function-declaration]
>    31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/bridge/ti-tdp158.c: In function 'tdp158_probe':
> drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Wimplicit-function-declaration]
>    80 |         tdp158->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~
>       |                          devm_regulator_get_optional
> drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: 'GPIOD_OUT_LOW' undeclared (first use in this function)
>    80 |         tdp158->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
>       |                                                                 ^~~~~~~~~~~~~
> drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared identifier is reported only once for each function it appears in
>
> Caused by commit
>
>   a15710027afb ("drm/bridge: add support for TI TDP158")
>
> I have used the drm-misc tree from next-20240903 for today.

Fixed by commit 532f0d109658 ("drm/bridge/tdp158: fix build failure") in
drm-misc-next.

BR,
Jani.

-- 
Jani Nikula, Intel

