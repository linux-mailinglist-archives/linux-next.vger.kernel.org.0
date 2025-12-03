Return-Path: <linux-next+bounces-9316-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B629C9E48B
	for <lists+linux-next@lfdr.de>; Wed, 03 Dec 2025 09:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BCE26348AAE
	for <lists+linux-next@lfdr.de>; Wed,  3 Dec 2025 08:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3332C21EB;
	Wed,  3 Dec 2025 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLFpOaxh"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8603D2D4B71;
	Wed,  3 Dec 2025 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764751368; cv=none; b=AMcVjBO52+p0zMAcSPIX5n/XlX1SjWtnL5ppo/YCF3LCPNPtUI3J58XYyU6IQ/DJhZZ8DY3CFQLHnqmi9BD02S/4V0HhnJLZd33XVprjmzofJLuTpg8cZIA6xEbHjGxzjFjC+iOjg2U6L3RTJoLoh3j1kk1akPBGT+bOQAPuYxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764751368; c=relaxed/simple;
	bh=VNQIhEq4N0+yfdW/wFWoSoqWWqE4ZMwf1psjP+mWg84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dq12aKN/p0KMYnK/zsqZHwEt8pLtCVP+fnnccr2tbx/kAMzZ8JqGqlH2JmTC3Hp62lu9q38oxMdnv5w85/Dro23cL4vRXtRA5M5v7XhoWkeZMzYKpSUgPRvo6ANL9oMjFdkhHbG+iyovMXil62/S60LJE6V6UL1AbFsRDE6nSzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLFpOaxh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764751366; x=1796287366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VNQIhEq4N0+yfdW/wFWoSoqWWqE4ZMwf1psjP+mWg84=;
  b=kLFpOaxhRGCezld3Yf2onDyUO3V8T/p0UBn7XlDPiRRtFT4DS1BwAAaV
   oHgtnvXdMe0IyH/nljTNnvr57speAs/0+MKcNwoqwqSaVqEbG8bYMkLAw
   H/D3DdYxjV90kIY+V48MVb4MyVtJwQZnZdgZya3MlaIatPAfgOErl1Qkj
   LqGJrBVKnmlUQR9DqPpoAvfEz0PR4A3TT/HfJ96VKSFzO22ZcNrvNDYy2
   6RB97JqEDFSNQLbC4yIHkvarcuBijEGPEfxNOC+GLBk/PaGDLKXLqud4h
   Xu4YV4l3V7dXeIGvDzdSCoZlmnstRcuVDQ3GyICBm017fhl0wSmMQgOsY
   g==;
X-CSE-ConnectionGUID: Qcjjw5MnRpietdqwWuo9kA==
X-CSE-MsgGUID: H+BFAlp6Tc2VvlHuFrhdIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78202998"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="78202998"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 00:42:46 -0800
X-CSE-ConnectionGUID: AVYRfivNQrGhDI3SywiiEQ==
X-CSE-MsgGUID: 7i5Vgt3vQZS70jXLIIuOnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="198782188"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 00:42:44 -0800
Date: Wed, 3 Dec 2025 10:42:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the regmap tree with the i3c tree
Message-ID: <aS_4AfirzRqoxnhB@smile.fi.intel.com>
References: <20251203133217.5b99010a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203133217.5b99010a@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Dec 03, 2025 at 01:32:17PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the regmap tree got a conflict in:
> 
>   drivers/base/regmap/regmap-i3c.c
> 
> between commit:
> 
>   79c3ae7ada05 ("regmap: i3c: switch to use i3c_xfer from i3c_priv_xfer")
> 
> from the i3c tree and commit:
> 
>   af9c8092d842 ("regmap: i3c: Use ARRAY_SIZE()")
> 
> from the regmap tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

LGTM, thanks!

-- 
With Best Regards,
Andy Shevchenko



