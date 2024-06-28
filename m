Return-Path: <linux-next+bounces-2708-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066E91C545
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 19:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0626284D83
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 17:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335464CB37;
	Fri, 28 Jun 2024 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SExNMaAk"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC31C232C;
	Fri, 28 Jun 2024 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719597511; cv=none; b=UQ/l3UWc8qXjp25THjrHxxX73NNYg7P3AVkRimMPhBCssdFxeVcvbqaAGO9ddmBdErt49A48vcWYkOeZKYi2/C3/WNEX4L7rks4zjJrbTEYJ9IPWewbvtjkWI6vTggnjE2GBbWOhwz3+DLoiJoDH99LEHKvL218Q0RJVAYfmbww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719597511; c=relaxed/simple;
	bh=SLMLIlIwPxeoqGSeXB0AmCzYU+PGutTsVn/dsTy+csY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olAIFHbJWtKpSKaiG61xGYfSTwWFcSU3qNKm/WrARPq/+A/Z4wf+iIi9e8jpp1YzdVY8ImhaGiFOPiR34Z+LGj9LPduhT4cFjXyZ3PCeZ/end3VccNg9o0zoD1D8Jz5vPHcb2cbxkri2SXk6/4P0PhSC5+YKVmYI486q5fSqrEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SExNMaAk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719597510; x=1751133510;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SLMLIlIwPxeoqGSeXB0AmCzYU+PGutTsVn/dsTy+csY=;
  b=SExNMaAkVd5Re05lmFkoNh2J6lGSKZ5z9dbAj4AAHqV52weMmNP33hYq
   qSNHFm8J7WaUHMs/6pOGRiT4kb13kt6sTDFy9aPEmXp8oxMZCA7c/jVYZ
   Iy0+Z/Xm2rDraTZqobKgc52r+tL3OqzW/Rr3HMbooI81F0v40uKaXFRUr
   NGnT/4LvM0gvOAtsIdq31IDxw2p8MH53Cz79iKLcHvHgchfaIk1xFleQO
   ktVmERZX6gzCrnzOZcSEurBXD73706OcgmQXEuxvBoPP+9bUF3Pn7yl9L
   rA7EBx1LRjYYcR4Ou+3dkuMqCPx5V0eTMinquVf0VGt10eeBdA/Ge2LMF
   w==;
X-CSE-ConnectionGUID: gYMeI+YHTm22tRvS7niOyg==
X-CSE-MsgGUID: 296V7a9vRbq1c54aasXNfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16528358"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="16528358"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 10:58:29 -0700
X-CSE-ConnectionGUID: MuGJDCC9RO6Mghn9BdfYvg==
X-CSE-MsgGUID: agBB+jtoQv2UHY75WX5/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="49281196"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jun 2024 10:58:26 -0700
Received: from [10.245.96.165] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.165])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id BB2542877F;
	Fri, 28 Jun 2024 18:58:24 +0100 (IST)
Message-ID: <712046ed-2481-4644-80d7-707bbe8b5c20@intel.com>
Date: Fri, 28 Jun 2024 19:58:23 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm
To: Mark Brown <broonie@kernel.org>, Dave Airlie <airlied@redhat.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: buildfailureaftermergeofthedrmtree@sirena.org.uk,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <Zn7s611xnutUFxR0@sirena.org.uk>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Zn7s611xnutUFxR0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28.06.2024 19:03, Mark Brown wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c: In function 'pf_get_threshold':
> /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1788:27: error: unused variable 'xe' [-Werror=unused-variable]
>  1788 |         struct xe_device *xe = gt_to_xe(gt);
>       |                           ^~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   629df234bfe73d ("drm/xe/pf: Introduce functions to configure VF thresholds")

it must have been something else wrong, as this commit [1] does not
contain this line, it was not part of patch itself [2] and I can't find
any other commit related to this function on drm-tip

but it was noticed today and some fixup was already applied [3]

[1]
https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/629df234bfe73dacb4bb0daa4bc2c14824dba159
[2] https://patchwork.freedesktop.org/patch/594015/?series=133236&rev=2
[3]
https://patchwork.freedesktop.org/patch/601248/?series=135512&rev=1#comment_1094525

> 
> I have used the tree from 20240627 instead.

