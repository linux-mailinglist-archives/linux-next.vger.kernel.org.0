Return-Path: <linux-next+bounces-7252-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 021FAAE94C1
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 05:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B60EF3B373C
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 03:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4407C1E9B22;
	Thu, 26 Jun 2025 03:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ONY/arsN"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662C443159;
	Thu, 26 Jun 2025 03:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750910269; cv=none; b=jpIVWvDAY2/sVDcaFV8aymmbxc8Jfcg/RX72YfQebpD8qLSKJCJmfURvRPxgC6NNqMtFukoiWRajj9idvr/vZr5foiKneAaSlyuYZ4WGJQDUZfs/G3j+sJKAQxrrHH8CprvyJotZHHu/a9uH0KLlQLmjQwaomYI9DghA9/fexOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750910269; c=relaxed/simple;
	bh=SlcXsvXW48zZL04UTuAILB5e5RHAL6SvSBvDeN9nWCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KVrlrDcWRsrthoh1VhtLYHRm3+1cSN7GMPHKr31Oj7tQsJHqpnopQDS5yPmPwFL2tA71xRkg2iaQKuZ5eK/Q8/53PzIFXlKzOwGqkLyBtF+/aR8aR/SnseKn4t+YUR7tRPWcymtY/PCu0w4d2a2z2vbC5HNoxtQ/McPL/adFZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ONY/arsN; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w/Yyw+ccEoMxrDSG6h1V3bV+6dI8LKFZgQRaaNFKTG8=; b=ONY/arsND3fW9q8HlHOr5pl5v5
	NGV/4L6+g0DYo35fjuh31SlKo/m7oxVvMrUFqZx9QlLRRKs8Tp3qtx822xs0u9Vw31ImgGlZdof7G
	vMn5uG71kyaa0t0MKWSm0x8heuli+n+QmwgDLN5sPrNJipLP5kB5p9kAYK3J0Hf1xnPTnJUCylVZL
	UvcGfMJAxWE2VGtK4iwiWYwWYD4QgTcUTUDp9ftYcsCJWRM/i21qT5SaxuWl7JFvL3m2+zWH6SLWs
	tV47Z7IQHYJY/zIIW4KCyptS9isYuS45KJPP57NDwgT0kzyMOnETdeyZjjKjRIa7SacY/WtaJDdp2
	iVClIP9A==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUdk6-000000061sE-1uGB;
	Thu, 26 Jun 2025 03:57:44 +0000
Message-ID: <3667a992-a24b-4e49-aab2-5ca73f2c0a56@infradead.org>
Date: Wed, 25 Jun 2025 20:57:40 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 25
 (drivers/gpu/drm/{i915,xe}/intel_pcode.o)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250625172220.2b6aeff8@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250625172220.2b6aeff8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/25/25 12:22 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250624:
> 

on i386, when both CONFIG_DRM_XE=y
and CONFIG_DRM_I915=y:

ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_read':
xe_pcode.c:(.text+0x7d0): multiple definition of `intel_pcode_read'; drivers/gpu/drm/i915/intel_pcode.o:intel_pcode.c:(.text+0x990): first defined here
ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_write_timeout':
xe_pcode.c:(.text+0x850): multiple definition of `intel_pcode_write_timeout'; drivers/gpu/drm/i915/intel_pcode.o:intel_pcode.c:(.text+0x9b0): first defined here
ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_request':
xe_pcode.c:(.text+0x8f0): multiple definition of `intel_pcode_request'; drivers/gpu/drm/i915/intel_pcode.o:intel_pcode.c:(.text+0x9d0): first defined here


-- 
~Randy


