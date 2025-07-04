Return-Path: <linux-next+bounces-7366-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3A7AF9936
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 18:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56D0A7B65C4
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 16:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F9B2D8387;
	Fri,  4 Jul 2025 16:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="bQz2odiz"
X-Original-To: linux-next@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8172F2E370E;
	Fri,  4 Jul 2025 16:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647583; cv=none; b=f/HFlecQIwWCLN434XR5LnliioT+VHSZ32JCVNJY0QLF1iixzP9o9988Ox4xRcLXCfl8r8eUhsL//CI9DbXMKKJFu+ccZxzMqVaN3oNj3JK8Qq4qjpuNgTh8Bqp1nw0Y5yMoC2gQlRKR9zn8kbt/lofSzLrWMMD7SQ4sI+KfATU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647583; c=relaxed/simple;
	bh=K0H715q09w9Hc/4OmPalri+Mu4yXEtGmsTcusxPqNOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YM9kBm/Q/ZZSSmDscY6hqQ16LuNPDLTW+rE5RIUF3DLvyqzCjekhGmiX4D316m/S0XVoQzSP7bkfZx1AmPxz9VTSq17HEoLY7ZMKlTN73jC4D2t2488vZpGAllkjL2PbSKi2ZcZuF9dkMtGEKHFrwi0fb+atRv68tYEO/k1en1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=bQz2odiz; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DfTt13KaBgjZBz5elPAVafFy1ImSQAAQr44AcA6+pGE=; b=bQz2odizhpvQfOzSKFLFj2ENEq
	D12u144AvHHnRFwIx8nQTribkpiQ8FB3lrZUE5Xq5Tx2g5ZnRdeyUicw2Cng12Tgt+Qfy6N2ads+T
	Iw2yYsyN9sOO2c0KqsiuQe9WLbLodu8fKfyoEEpJip1X2BS1+mdcbPjQt8gcPCJfy5lcwb4nxP1eL
	fZLdAhw7tycHAQBg0OxFmC4aST70U1UiUBRajOwV6Dd1c7fXvR2SMNBIZX6pC+3yRzS8BZ4a8Uaqd
	nrPEGNE635mZhzQ2Bu96hsiLBWhywYNg0Y2PAjiUg+7uGfwr58DMBTn0/y7GydFIl3H0L0Bun1fOP
	QirPS3dA==;
Received: from [179.100.5.63] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uXjYC-00CVSU-HD; Fri, 04 Jul 2025 18:46:12 +0200
Message-ID: <52c32d1b-e5c4-4f6d-82a3-cf02c0cf4681@igalia.com>
Date: Fri, 4 Jul 2025 13:46:07 -0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/doc: Fix title underline for "Task
 information"
To: Raag Jadav <raag.jadav@intel.com>
Cc: simona@ffwll.ch, Krzysztof Karas <krzysztof.karas@intel.com>,
 airlied@gmail.com, Linux Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, kernel-dev@igalia.com
References: <20250627171715.438304-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250627171715.438304-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Raag, gently ping for reviewing this series.

Em 27/06/2025 14:17, André Almeida escreveu:
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


