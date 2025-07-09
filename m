Return-Path: <linux-next+bounces-7422-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 900A7AFDF78
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 07:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2D98584A1B
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 05:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA9726B752;
	Wed,  9 Jul 2025 05:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EMZROY+c"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C833C1F;
	Wed,  9 Jul 2025 05:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752039932; cv=none; b=VOBAPbgOnp9Rr+oomBAgDU62CoKnJIc2ivM+soKcaTsK1CizWrNLdgVRIIq3h8rKdvLKft0g8k4Mp3BD5MTfFcYTTjNgN+8sDDTP0fPzNTDgh7t45RzUZd4rnXgM2pqIjkkYecqkXfE5932L0clQQZ0foLx8/88RokEXeewrc30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752039932; c=relaxed/simple;
	bh=f2Z1GFXFa+5adit/CK1It0cP9CeCIaTidgcNffYtDK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cws/mjSovkGykVBi9zZ47DWfx2LbH4pG33uttMDeU2Uld0v3h4H+VsgPg8U+p+csLpOzadGHG/rAR2ORdTt9QxWByh1HdoPVEWLNDI+hQ7gxnNIDSsfq5eMKF1Jk6pc23PxApmUZrpFWXSCjJqd0TMGbYPMjkNmmJz7qlkAiy5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EMZROY+c; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=PZ3unkvyTag4Y/CBcyqciL29HjyiOpFmVRrBE+OVi2c=; b=EMZROY+cQcSkvwgS3GGu1cKiW/
	mB5oRbodBPk9JQPsnaOAh+BR9erFE4k4SgRElIq3t3Z/lMZiiXWghUwbX+H+GTSEZEFuyb5j+R8jm
	4KPbM/cHm1WTO+UX9KHH2lHCG/lDAjFca4voaRu0i6fGTleMMXG91x5pELIXyInLs2zVH8RS53DzN
	ar55Vsys7r6aHE+O7PtIB+PxEofe8b3a3HF2dZtWtfC7kLCo08tKa+L1xUlMhDUdrjAKwOXovQhIQ
	MQWB+3+69oHMte8p7jiEzO8D/MrCQvf1/46YfOLquBGcLtF92xLrCusfabvmQm26RqYxdB/hJ/x5h
	0g6a4QWg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNcW-00000002f2t-2eWn;
	Wed, 09 Jul 2025 05:45:28 +0000
Message-ID: <42685583-4374-49be-9ed1-709afe2e5fd6@infradead.org>
Date: Tue, 8 Jul 2025 22:45:25 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/doc: Fix title underline for "Task
 information"
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250704190724.1159416-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/4/25 12:07 PM, André Almeida wrote:
> Fix the following warning:
> 
> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> 
> Task information
> --------------- [docutils]
> 
> Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/lkml/20250618150333.5ded99a0@canb.auug.org.au/
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v4: Drop new line at the end of file
> v2: Add Reported-by tag
> ---
> ---


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

