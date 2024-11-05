Return-Path: <linux-next+bounces-4618-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 529519BC4DD
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 06:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17339282FDB
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 05:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97781B0F34;
	Tue,  5 Nov 2024 05:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivQu1a5d"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCB83C38;
	Tue,  5 Nov 2024 05:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730785674; cv=none; b=Vwzehn665rCcb5fptUjxpy3nKzb9LlyRlWBb6ctZQjgShJNgKH9lijQnQDa/pCf91EU3Z92KfnxB2IDV3xcg9Wbx0+Re5tktf8yoybATAempZzXleFvOeA/dHi7dageTRbMUSAXquWwpzW7mbXD9g0FtkCnsUq+g60h+23Lv6fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730785674; c=relaxed/simple;
	bh=saOb0LiiRQC8rwlm/4KpZ/40NSYsjlgBgeihQIDMbPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHmKAGevhn0bvArxQ88hhtIJbNhUPFqHn09EgNioBMN2GPr7VDf5sJ63UXZIiwPsBkOQnE8OXgW96qsZJTjmnP8yr9sCcqN/h/3YrcxWPaiViYYV+bDUGpHacSYfnN6thRGHTtThJZHDf2kASq9d/h82/VlNocNJiJaUDCEIiS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivQu1a5d; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730785674; x=1762321674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=saOb0LiiRQC8rwlm/4KpZ/40NSYsjlgBgeihQIDMbPU=;
  b=ivQu1a5dUJTUxqCQ6mcT9SBR7M53MCNnSxFisI3hTB9nwcoR2vxL9y+t
   skda7qvKaxhzjexY7tLSUKCpK+frBm2oIxr6bWuz63bR6+2ZwTcnAXzzQ
   hncIBTTo4Kyo3Kj4gb5oDCQkK2MFSC41RDuMs8LQdTv28aIA431EYLINj
   ZgP7o7ulIit15gglWiQWQt1MezPbKF01mQV8CpROBoyePuUfBt1iKGUJz
   jAt9t5iW4XtosrJPhR83/C6jC9POE4deSFaooYFvAtILK370CafpseWdM
   bXnSxYsJiX49xS8HPLItnJKeiYeiiqR9TAjBi1wpr2ZvdyfAYFvHSLt5j
   A==;
X-CSE-ConnectionGUID: UY/RA+yhTQ2gJjmJWT+AOQ==
X-CSE-MsgGUID: nmo/UcOpQtiR1uiUIiduEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30628976"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="30628976"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 21:47:53 -0800
X-CSE-ConnectionGUID: oigiAMzpRDuJfLOHm5k6Bw==
X-CSE-MsgGUID: OmbOSK3SSRSXw/+tDC6o1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83544454"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2024 21:47:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 822181E0; Tue, 05 Nov 2024 07:47:50 +0200 (EET)
Date: Tue, 5 Nov 2024 07:47:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 pinctrl-intel tree
Message-ID: <20241105054750.GC275077@black.fi.intel.com>
References: <20241105081154.54f66e15@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105081154.54f66e15@canb.auug.org.au>

Hi Stephen,

On Tue, Nov 05, 2024 at 08:11:54AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   1bedd6dc7f44 ("pinctrl: elkhartlake: Add support for DSW community")
>   5d6f65a5cbbc ("pinctrl: intel: Add a human readable decoder for pull bias values")
> 
> are missing a Signed-off-by from their committers.
> 
> It looks like they were rebased back onto v6.12-rc1 (from -rc4) for some
> reason, but the new commiter's SOB was missed.

Thanks for letting me know! Yes we moved them back to -rc1 as this was
requested by the GPIO maintainer. I will fix this now.

