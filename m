Return-Path: <linux-next+bounces-7239-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C39AE6B21
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 17:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D52707AA7FC
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 15:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E757326CE05;
	Tue, 24 Jun 2025 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ndXNStgD"
X-Original-To: linux-next@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F097626CE0A;
	Tue, 24 Jun 2025 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778738; cv=none; b=Ttuo3tyfVlAvmine5hZy8V4YFpHsWLyEESd/0z4rCC6UDb0NA9ehw2W40CJTnJEKT5xOYYL4oQ8XaAT2uqj3QdZNvuybcd0Qybdzww6Ywvc0HFrlyIXV2Dw1XOENwIdSUepiNtBsM6Iks03bqjgIdCV8AzXlNBRv/JmCQ6YiPU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778738; c=relaxed/simple;
	bh=RDB7BOcVNFQsZ9nLHPunY0bdsoxOYRyXg2fUAwYtw3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hbGvm1gd9nnHxzms0JDQiYheNn4Uhia//VLp1RywZ/JLuc4/6GMPlhihHXNuoi7WTY2HQucM5WuHmZI83xIfWZv/FzlVjtg2LuBCoJp2gVn3yq9ua4O1HS7iCJzf4CZls4fDtmvQItnLh9JUzgCU2EqNy+XdbETc2VVF+vgbZNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ndXNStgD; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PvstoqgJKuCADr83IQZCoqGkucmt2FvbOXeCdhd4Z9Q=; b=ndXNStgDLmtQnTCXauCqgZ2jqw
	LxxxouE10Aq0jU3bPb1rlFmyMXbpuP/XCx5iOzJUTrCPc79M6LxZaCVJtyBKnvd5X83J7OQGWKZRi
	4RHbxRwYZJ1G33KZLRxUEmJNWI1yU2aUJS12siq0D6dmbe5YPL3Q2tpDYHk0pkSC7aeUMJeBfMc/8
	qPDE007gkv0MFu+7FL6hZ33a3OQcNvI0xOggZwwC41qNsb8KGCuX3XR2V3wmNjWW7aPWMDD+UP7as
	YfpiaovGBDPvP5kG0TPOzbqZn5n/xPwKySmePlPuAEhFDdKJxINobxZlKno8OVQKEltUOem3lUg8V
	EUfMXzPw==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uU5WX-0083ru-DC; Tue, 24 Jun 2025 17:25:25 +0200
Message-ID: <a85c8fb3-7bb9-4933-a6de-d3fad20dbcdf@igalia.com>
Date: Tue, 24 Jun 2025 12:25:19 -0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/doc: Fix title underline for "Task
 information"
To: Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250619140655.2468014-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250619140655.2468014-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Raag,

Can you give me a Reviewed-by/Acked-by for this series before I push to 
drm-misc-next?

Em 19/06/2025 11:06, André Almeida escreveu:
> Fix the following warning:
> 
> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> 
> Task information
> --------------- [docutils]
> 
> Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Add Reported-by tag
> ---
>   Documentation/gpu/drm-uapi.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 263e5a97c080..10dea6a1f097 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
>   complete wedging.
>   
>   Task information
> ----------------
> +----------------
>   
>   The information about which application (if any) was involved in the device
>   wedging is useful for userspace if they want to notify the user about what
> @@ -728,4 +728,4 @@ Stable uAPI events
>   From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>   
>   .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> -   :doc: uAPI trace events
> \ No newline at end of file
> +   :doc: uAPI trace events


