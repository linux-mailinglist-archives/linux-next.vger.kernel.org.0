Return-Path: <linux-next+bounces-7370-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B00AF9AE3
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 20:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C325654446B
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 18:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2751448E3;
	Fri,  4 Jul 2025 18:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaxU07/J"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A639F433B3;
	Fri,  4 Jul 2025 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751654958; cv=none; b=g7Zkk+BdcLa7U8WWmFx9AgzXmfpkHgey4CxbWjDwo8ny+mJda6uskD5yPgUv/8a2Y/f/EMUHgEAv1rip55IyJR0KuZWjJ0hzzFMHOOSbQl1UtVfYjDZ70p5BZ78FFZ/rDsTcY7sMQOBASyM07EXRl5fgTTXaIEDP95q+tvjHOgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751654958; c=relaxed/simple;
	bh=J9EQTPgtZAkbyKrP7A7mUG1ocGbnw/61oiNBNTbXCyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOZQPpGZabWtYGvNtwJkCNstNehtpkeiUjlnymrkmQDOKri9FiUg3z/GJaaCb+gzU+Bg9/HEg7V/KlH+muzza55ViFjsY5hELFAzOLhOYG/9+bdU4/UOB+GyT8WoHd/7AoPFx7ltUhtvN7CtZ7DvyfFWAFn4ZviNkAeFf3msp5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IaxU07/J; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751654956; x=1783190956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=J9EQTPgtZAkbyKrP7A7mUG1ocGbnw/61oiNBNTbXCyk=;
  b=IaxU07/JnRkQBb2f+geI7TpM4/hbaNzD38AELqTO1Aga34nSKkCylVc7
   B1ClviwdENFMAfblLfQxj8y7LKeKkJOZcCjE7NT319yrsG/xT2WPvDbMt
   qDp8Xi0tTRnYn0/AqulMhT7Rlf69ZzPhL8172/HZ7S9AiVKVvNnJpIK5+
   EXgieQgIe0I2bYNc2+vdIMryN+fNdbe/muWtiQobeKOlr4DXlEBA/oKKw
   v14l2k7l5IPrccShqdRIaY6ECnPDVJcwtQM8KOVNsRRnknIR0y4AoVjPl
   29Ar2KPbllPZUaj76SlDMpjH14kWed/KAr87ewKerQzbID7/vUtqbim31
   w==;
X-CSE-ConnectionGUID: BkTN8usdTEONRZJ2hkJhbQ==
X-CSE-MsgGUID: viZZwvWwRsuIISNkryAXjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53911559"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="53911559"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:49:16 -0700
X-CSE-ConnectionGUID: Z6mKSEV4SRKUf1qDC9tUWw==
X-CSE-MsgGUID: VCg8jltGQDeSFGNzkygrdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="178363162"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:49:13 -0700
Date: Fri, 4 Jul 2025 21:49:10 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	airlied@gmail.com, simona@ffwll.ch,
	Krzysztof Karas <krzysztof.karas@intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH v3 3/3] drm/doc: Fix grammar for "Task information"
Message-ID: <aGgiJgn2S4e93KU6@black.fi.intel.com>
References: <20250627171715.438304-1-andrealmeid@igalia.com>
 <20250627171715.438304-3-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627171715.438304-3-andrealmeid@igalia.com>

On Fri, Jun 27, 2025 at 02:17:15PM -0300, André Almeida wrote:
> Remove the repetitive wording at the end of "Task information" section.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

