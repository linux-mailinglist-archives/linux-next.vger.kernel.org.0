Return-Path: <linux-next+bounces-6703-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD05AB3DE6
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 18:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62D96189E2FF
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 16:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1DD25332B;
	Mon, 12 May 2025 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmbxAO+0"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB7A2528E1;
	Mon, 12 May 2025 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068192; cv=none; b=DnTFek0MuimCVFmsZRPnT8qWLp8c6QBheY4W2fcbn9DsBjJJkl1LH5OGIA6nt68D3bceRhy9saLJVPWtWcqk5CODXAio+c5eGmRGTvwZHlwccZ4BIw+oHkkHGZNymuUn3rOKq3R/2OBXAWO8B1tJ7VPtjh56oMdakI7sUMkamn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068192; c=relaxed/simple;
	bh=RMZOeyUVTjxxGHD0RJ/ZxUZ9usVBuMihkAwtMWbtGxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l4WoGqPDyWsqAd9jisNlJqiNdNs5WExBpe3w72RBI0722H3qxB0+kVBPfN82AgJwSCS6C7c4Vc4z53fzH3qXtGFy/AyWE0xSOpE8ZxRK8ycshfxqh7XDsmotsmQUxJ7Y27m48jUIvS4ZiaZEtOVsj9y1eAF4okRnooPuRYORJ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmbxAO+0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747068190; x=1778604190;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=RMZOeyUVTjxxGHD0RJ/ZxUZ9usVBuMihkAwtMWbtGxU=;
  b=RmbxAO+0IPMCUs3GHe1HcXyVclHmmHKcfirOoO/9PYUHKTE1iLTiVOJ8
   cf5RB3nU4bvGGDob34OteX24mRuHbqwSygZce+XPhp4tUqpxGSu+ZlRxO
   8AcenlVaygWjQF+WcuCtMujGvYONYsJWQVnXqAkh/9tSHNX0vyWFxuWc5
   8V7QS8KJYE4uSmwWKhouD2CUTR2oEsQdWIAC0PEng9LU46hpIchfZC8Vw
   yz4CseqkwOXSQiF+elhXpYi2UPJ0BfoikE0kd7tXx2Q1DSZjcIf7lY2Oh
   ykRJpn4/WCeMiuI35aTe2RhsYW6P1O+onN6Q8W9nOvCahuCz+rW39e9r6
   Q==;
X-CSE-ConnectionGUID: ZdndPj1BTLyvaCmqPl+o4A==
X-CSE-MsgGUID: W0kl+FPyT/WR1oBy39aaRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52685888"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="52685888"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 09:43:10 -0700
X-CSE-ConnectionGUID: 0Fb2bjWHQdGFPbajTKF8/g==
X-CSE-MsgGUID: p7Hl3aCwSIyAE322x/DxFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="141483167"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 09:43:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: rdunlap@infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, 
 W_Armin@gmx.de, Hans de Goede <hdegoede@redhat.com>, 
 Werner Sembach <wse@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250512125450.31072-1-wse@tuxedocomputers.com>
References: <20250512125450.31072-1-wse@tuxedocomputers.com>
Subject: Re: [PATCH v2] platform/x86/tuxedo: Prevent invalid Kconfig state
Message-Id: <174706818085.7789.4403463979505230195.b4-ty@linux.intel.com>
Date: Mon, 12 May 2025 19:43:00 +0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 12 May 2025 14:54:32 +0200, Werner Sembach wrote:

> It was possible to create a uncompileable config, because of missing
> "Depends on" statements in the new Kconfig of the TUXEDO platform driver.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/tuxedo: Prevent invalid Kconfig state
      commit: 4bba84f62a90a23d780cdad2c320f77d854a6e64

--
 i.


