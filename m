Return-Path: <linux-next+bounces-9754-lists+linux-next=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-next@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCmEMX6qb2lUEwAAu9opvQ
	(envelope-from <linux-next+bounces-9754-lists+linux-next=lfdr.de@vger.kernel.org>)
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 17:17:02 +0100
X-Original-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF01E473F0
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 17:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 93CCD5CC766
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 14:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C2942DFEC;
	Tue, 20 Jan 2026 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwoIkDxF"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C242883E;
	Tue, 20 Jan 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919859; cv=none; b=pQZDEpfwT+fwGCt5Q4gjZCbRDkrJJujquOkCnB54Ik8kFV0vXpEFQBEyCZJ7G6jb8o5fMSTXj70Wb1hJYp7QW6iyqMzh67DwG/MZculwIvdqIfSfoELINzB/M6np5Hnp1enWCTbrNgXlPSqPabHIH9qpdSvfO9vQncSEjuy7IuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919859; c=relaxed/simple;
	bh=ktoZiPD4sV0Sr90jexrbsSh8x19kSh4JwxlNAbAw0X0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rx1SxYioG8w78xsT2fXpODEIoRhVKNKzUTu53heddkyAO242rQk+Pr8r2NhFeiQoaeWNUA2oXOjv4OCzD+ybvGfLvIi+iGdKwT0UHre6t7LF6Ztab0XZ2/dkRxG17yX9wRtINHCI2BFAdDx2ZqS0v5DcjAMxXSxrQ3co66T4VJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwoIkDxF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768919857; x=1800455857;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ktoZiPD4sV0Sr90jexrbsSh8x19kSh4JwxlNAbAw0X0=;
  b=kwoIkDxFaQhQJPJYQ+f6nyy/nChfJCTjQk3XuPIyKR1vpQk52TVrL86a
   hS/9iuUtyFDWbSSTqVXJHKZ0Rtjm6qk/tvcgEw+c7GxMtZPtcG25mcPGP
   B0fcbkcvonUW3hUciT+nMkrObkoBKZpIfvrjyk3WHZCTcOdhobyJrJg6H
   1Ee6R2rM9SX5zDr7inc8SpS1R+Zz3wI5Cn6bkXyM3CkXWNvrFBFaAuCLH
   gLc3BhCO0X5NUa6RExN/x40lddNp/WgczJSivjHGwNks5ov9MEgkZYMVc
   ARGqrIWlhSiCapSPVqrelkbdsylQrHZ9m3mBiHfFaOahJJlzGX7Vs22PZ
   w==;
X-CSE-ConnectionGUID: 5gST6TCUTICo6LQMsT7ihA==
X-CSE-MsgGUID: B/xTp+AeS7ebtnkraB9fTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70183688"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70183688"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:37:37 -0800
X-CSE-ConnectionGUID: oXGGcwwpQ5G9D5u07jm8ig==
X-CSE-MsgGUID: dXJREl33Thy5ul3EYR2z9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="229074750"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:37:34 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Jan 2026 16:37:31 +0200 (EET)
To: Mark Brown <broonie@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the drivers-x86-fixes tree
In-Reply-To: <aW-LCX4W9qIWNSdx@sirena.org.uk>
Message-ID: <ee1f1510-2935-587c-d459-af9c1680c25c@linux.intel.com>
References: <aW-LCX4W9qIWNSdx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-9754-lists,linux-next=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-next@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-next];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,linux.intel.com:mid]
X-Rspamd-Queue-Id: AF01E473F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026, Mark Brown wrote:

> Commit
> 
>   bb820f17b68f6 ("platform/x86: hp-bioscfg: Fix kernel panic in GET_INSTANCE_ID macro")
> 
> is missing a Signed-off-by from its author

Thanks for the heads up.

The patch was submitted with Signed-off-by but git interpret-trailers --in-place
seems to mess the tag up for some reason.

-- 
 i.


