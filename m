Return-Path: <linux-next+bounces-7372-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A6DAF9AEC
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 20:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 293883ABAE6
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 18:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A2E1DE4D2;
	Fri,  4 Jul 2025 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYj/SEZC"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B7B2E36EB;
	Fri,  4 Jul 2025 18:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751655256; cv=none; b=Sd7kjKaPtjGgwweeuFxxiak6qESL/6OmtCoiDVXAGtRYg+5QULNdhXvVwXpHbGSZBE9iHTyGOB6QuJ77xjzRAUo3iw3NzO4X93s9UbiCVuY6SaaTGKStoKJbeoNFLGHPUpF6eHJ0u99NxKbcUsfV4CM618tmYsLqsAOuXTvTPqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751655256; c=relaxed/simple;
	bh=9us3u8dMglkUh2itXDDjCeO2cuGHG/qkSgoIX/es3Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGPIytm+eN8t4mpliWgErLPML4PfF813sl46YluVK5aVXB0DzYAAoB3UFgH65hUUvgqmXUTRcz768DggtSNmOoxswVdwaxYQuXUalo7RH/Q22eEd7QuQIP/qSi2DIpRM9aKp/nlKLNwzzcpqrpAwC4l87KcEgTD1QGNg/Q73f90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYj/SEZC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751655255; x=1783191255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9us3u8dMglkUh2itXDDjCeO2cuGHG/qkSgoIX/es3Yw=;
  b=BYj/SEZCP8Clzhv7ZF3VAfNLCGkjJWZys/RO4NZQ2pIKl//38WT/VMf8
   8qfUJQkuMa1CQ+S5tZxDYpo6cT5spUdHpO0XN2B+X1R+kGhT7bU+5AIzS
   4jNRbEDoS1QI/RkLJ+ImFhW6rseB5D/HOfaHlnyXva4ZnVQeeyIu11SsY
   +mRl/HbTSof1Rer4vJO/8L31HCzTDEyF+bYerUGfHwzyRjfPf5sTjwdKY
   W+0WudgTfMn9Fg0wanHv8xQ9v5kU758iUQK0ngS2vNdopFDErYsJaBsl+
   A1yfluzYDFF6lc7ReBAcv3jcx7I+XhDuadJRY856kiYIRR/tFLDEzyGFo
   Q==;
X-CSE-ConnectionGUID: zkKrqtI1RuWvk6ubjcjr4g==
X-CSE-MsgGUID: XqQ6RvYyRUeTl4a5mVH/dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65440163"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="65440163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:54:14 -0700
X-CSE-ConnectionGUID: Pz+262ZJQ9q3wNK5hbYlww==
X-CSE-MsgGUID: EQicEOqNQP6fv0ph3elCjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="158962062"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:54:11 -0700
Date: Fri, 4 Jul 2025 21:54:08 +0300
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
Message-ID: <aGgjUCGr-NKeJ5pz@black.fi.intel.com>
References: <20250627171715.438304-1-andrealmeid@igalia.com>
 <aGggPuSCEK_opydS@black.fi.intel.com>
 <73a84621-400e-41f8-b3a3-96499fc3320b@igalia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73a84621-400e-41f8-b3a3-96499fc3320b@igalia.com>

On Fri, Jul 04, 2025 at 03:49:36PM -0300, André Almeida wrote:
> Em 04/07/2025 15:41, Raag Jadav escreveu:
> > On Fri, Jun 27, 2025 at 02:17:13PM -0300, André Almeida wrote:
> > > Fix the following warning:
> > > 
> > > Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> > > 
> > > Task information
> > > --------------- [docutils]
> > > 
> > > Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > > ---
> > > v2: Add Reported-by tag
> > > ---
> > >   Documentation/gpu/drm-uapi.rst | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > > index 263e5a97c080..10dea6a1f097 100644
> > > --- a/Documentation/gpu/drm-uapi.rst
> > > +++ b/Documentation/gpu/drm-uapi.rst
> > > @@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
> > >   complete wedging.
> > >   Task information
> > > ----------------
> > > +----------------
> > >   The information about which application (if any) was involved in the device
> > >   wedging is useful for userspace if they want to notify the user about what
> > > @@ -728,4 +728,4 @@ Stable uAPI events
> > >   From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
> > >   .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > > -   :doc: uAPI trace events
> > > \ No newline at end of file
> > > +   :doc: uAPI trace events
> > 
> > Unrelated change. Someone with a different editor added this and now
> > your editor disagrees with it.
> > 
> > Switching to binary mode usually fixes the issue.
> > 
> > Raag
> 
> After fixing that, can I add your Reviewed-by:?

Sure. Feel free to add,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

