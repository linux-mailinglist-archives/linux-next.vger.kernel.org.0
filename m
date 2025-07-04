Return-Path: <linux-next+bounces-7367-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0003AF9ABB
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 20:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD47C1887013
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 18:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DB87263A;
	Fri,  4 Jul 2025 18:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSK5omIH"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBC72D836B;
	Fri,  4 Jul 2025 18:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653581; cv=none; b=BtU5jB2Jyy2aGL4eirfiNpEgDcP3OrubVje6RkhsKRi9Z+INZPxd65iPA1IwjZ8in6f/obWFmyK3hmmiFJtxcZBKIVgv+fQ9tnLxjtOml4ZEHiXlz/J9i+JzkWWy9mjqygqBc1jujEAw0Ja/cHPS6UNBiDCMBpgppb25EZb1xeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653581; c=relaxed/simple;
	bh=ipbT/QnTBUeVAy6M/JFK1jDQZRfz8BWcFfq/b7kFN+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPqaNAooeEpNPPrCmowbo95egFzE/wdoCCC4Kc9O8kkws96kO44Q8Z8IRjN5J+H+1mJIsgBOO74qLOCcp4hmzd75aBlH0/Mvg9WBR8zfeb1zcI1VOwjIoBDH9lYDGa+pI3+PcEjgZ6jO2RX5UvzfPolMCes00ByE/1Uk0LwLNk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSK5omIH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751653580; x=1783189580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ipbT/QnTBUeVAy6M/JFK1jDQZRfz8BWcFfq/b7kFN+E=;
  b=CSK5omIHyKmAfukwrDCXCNwXAMg50bh8JsV97qcS1S//HJ4PdK0xNUSr
   8EKfMwYplOxHd7+hA7qc9XJ1vExpulsxC4MdFvRo+/hEeoSbuBV6N6O8/
   pfAo4aU7rzqnZ83eZbXz0kWcWCoUjhU+jQbrQfmQUBgLWTgTU3IUrmDTv
   Nzn4VjGmp1NXPd4TF9xx1CcaBv9fVwi0/muWx6b65h2ewYNTMp5NfL+nj
   Wq3gcs87AMcr2TKQGpxqSAnva9ueY9K8EBSnidiafnRIuY8OEBAhCMfJJ
   BNQ/2YVcVuLvyxMK2NCa/hq4ZrviAgDcSPM18EahNpcUkaVrRW4a095eX
   g==;
X-CSE-ConnectionGUID: lyCX2bnoR/up3AXsCa2rbQ==
X-CSE-MsgGUID: m/0DRPT9SS+VWIu/JCjKiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="76536505"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="76536505"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:26:20 -0700
X-CSE-ConnectionGUID: nkFlUfNPSamRutD/MNS/mg==
X-CSE-MsgGUID: +pw7iWkBSmuuwv5dBLym0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="154780787"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:26:17 -0700
Date: Fri, 4 Jul 2025 21:26:14 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: simona@ffwll.ch, Krzysztof Karas <krzysztof.karas@intel.com>,
	airlied@gmail.com,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>, kernel-dev@igalia.com
Subject: Re: [PATCH v3 1/3] drm/doc: Fix title underline for "Task
 information"
Message-ID: <aGgcxuT7YQx4YC2Q@black.fi.intel.com>
References: <20250627171715.438304-1-andrealmeid@igalia.com>
 <52c32d1b-e5c4-4f6d-82a3-cf02c0cf4681@igalia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52c32d1b-e5c4-4f6d-82a3-cf02c0cf4681@igalia.com>

On Fri, Jul 04, 2025 at 01:46:07PM -0300, André Almeida wrote:
> Raag, gently ping for reviewing this series.

Somehow this didn't land in my inbox and I have no idea why.

Raag

> Em 27/06/2025 14:17, André Almeida escreveu:
> > Fix the following warning:
> > 
> > Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> > 
> > Task information
> > --------------- [docutils]
> > 
> > Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > ---
> > v2: Add Reported-by tag
> > ---
> >   Documentation/gpu/drm-uapi.rst | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > index 263e5a97c080..10dea6a1f097 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
> >   complete wedging.
> >   Task information
> > ----------------
> > +----------------
> >   The information about which application (if any) was involved in the device
> >   wedging is useful for userspace if they want to notify the user about what
> > @@ -728,4 +728,4 @@ Stable uAPI events
> >   From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
> >   .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > -   :doc: uAPI trace events
> > \ No newline at end of file
> > +   :doc: uAPI trace events
> 

