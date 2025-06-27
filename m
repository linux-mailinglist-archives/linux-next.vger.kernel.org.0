Return-Path: <linux-next+bounces-7270-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF78AEBCCB
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 18:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 726247AAB28
	for <lists+linux-next@lfdr.de>; Fri, 27 Jun 2025 16:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6382E8888;
	Fri, 27 Jun 2025 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIO5pQKJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0B51A316E;
	Fri, 27 Jun 2025 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040288; cv=none; b=swTPjFvSPoLCBLN0x7DLiII8+3SIwP5Oa6UUEuyphQcZK0WCxWtrOOJFA1uvhPxJBupoXAGOHWVddAwa0jucyHqM4Co7BQ2A4vTH5CVuqaOkotaFGlaIdjDdRxl4ZYSqryfuhzOxieNor4/r79ODY+qT5l9bFhZ3W8oHx8rHn34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040288; c=relaxed/simple;
	bh=xPYDyj7xWN369t4x7isU437SGu5GsibK1/RBPBB/oSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQeHDtINtE2B0DZi01SN+fTKvFnOHiecQkONBSjODH+DKbgeiiIiY7QsXgZSbZ2jhSOO4ID1D7OuRC7mwL0kIsRslpx98RFrmfTDJimz40BGcLfiJ1cTxD5vJsH44u5CZnfunx+AWMfM3kvwnHL20Y8XAIOaS/FhATBpZx/SqQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIO5pQKJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751040288; x=1782576288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xPYDyj7xWN369t4x7isU437SGu5GsibK1/RBPBB/oSc=;
  b=iIO5pQKJRQrX3FloKTSuZJiyoYY7Dsvd5Pts08h9uDgoPpj7nm/1SgbD
   Xx5B/+nIn6ds8PEhc32fEBOvaOZrQzGcWpMGezTw4u+jeL4Kb5OrQIC4p
   XmaSu0eggfGjkjkCCfIl1umavHa23bftHdXraAoeApXE8gAAA0xl67o0n
   Sosl6tA28a36+28AfUWTR2OpVYL62oxA4OMdFrcc/AB9q958thE6mkEyv
   EESyjj4Z4RZE4mEcG7AQ+JUQUn3lLXn1aLCV0ocekC0rbsB/l8XiPJ1WJ
   s+daj+IKsOQwI9sd1WgCvJxe6CvokOciLB8FLXJqVLv/xdGWHyMQpzmbP
   w==;
X-CSE-ConnectionGUID: sjn1V6xSRt6OpWABIeNQUQ==
X-CSE-MsgGUID: lD7H4ElYQ1SxuIcduJZ+xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="63613804"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="63613804"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:04:47 -0700
X-CSE-ConnectionGUID: OvnJtt+2TcmmCTIMjRCc5w==
X-CSE-MsgGUID: 828QG1DbQBOaYEi75Y8M+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157380268"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:04:44 -0700
Date: Fri, 27 Jun 2025 19:04:40 +0300
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
Message-ID: <aF7BGBE1Gf7vBHDC@black.fi.intel.com>
References: <20250619140655.2468014-1-andrealmeid@igalia.com>
 <20250619140655.2468014-2-andrealmeid@igalia.com>
 <aF6WpMe9Ar8jmXOX@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aF6WpMe9Ar8jmXOX@black.fi.intel.com>

On Fri, Jun 27, 2025 at 04:03:32PM +0300, Raag Jadav wrote:
> On Thu, Jun 19, 2025 at 11:06:55AM -0300, André Almeida wrote:
> > Fix the following kernel doc warning:
> > 
> > include/drm/drm_device.h:40: warning: Function parameter or struct member 'pid' not described in 'drm_wedge_task_info'
> > include/drm/drm_device.h:40: warning: Function parameter or struct member 'comm' not described in 'drm_wedge_task_info'
> > 
> > Fixes: 183bccafa176 ("drm: Create a task info option for wedge events")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > ---
> > v2: Add Reported-by tag
> > ---
> >  include/drm/drm_device.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index 08b3b2467c4c..aae0800ccef1 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -33,6 +33,8 @@ struct pci_controller;
> >  
> >  /**
> >   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> > + * @pid:	the pid of the task
> > + * @comm:	the command name of the task
> 
> Redundant tabs. A whitespace is ususally good enough for docs.

Also, let's be consistent with struct drm_device for member description.

Raag

> >   */
> >  struct drm_wedge_task_info {
> >  	pid_t pid;
> > -- 
> > 2.49.0
> > 

