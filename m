Return-Path: <linux-next+bounces-9447-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D41CC93D9
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 19:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EA083071F9B
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 18:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585862580E1;
	Wed, 17 Dec 2025 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2j96BQod"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B98D21638D;
	Wed, 17 Dec 2025 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765994968; cv=none; b=KOG5JE4BZ5S+/rAz+6dDf5lWs6ErJ6iUjO9Ro/jGJOzw1G8FM08zkEikAB1LLSr8q5bnWCr/5obLeiB1dZTdpwWiCml9UhEh1RC2qTV8h4+m/yTOXgftylwEOQ9QTSAiXjVRym14egNKk9ch5NrA5OM8kwtMmxuPBpdzMkePus4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765994968; c=relaxed/simple;
	bh=YEg4Xs+v1Avj4AoWRzxpKKT5Ip6ro80LMwkwanyuxs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecyJOUy855GSLrfUzrlH6pwuSvOR2anlch/RY3JuVE+i+2a5avLuNNhntucCWCr3cdPL4XHiQNvTs4hMH4ABPGRfwQY4FZcKxLSFGTbQWkBH0HqDbOOvAs7nSpnVkXJFw+kQcv5XycT3ki8n78ABK0bzcSEYeij+KMjPdKT8ZKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2j96BQod; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pJ995Z+yFdhxVC5mXYbnSOTU8w1AXddwEeOENWW3ugU=; b=2j96BQod15lY0JqikEVSiVJkwU
	m5U3EB+jmBed2XTIMLRsNlNzS871TZ4w2JV/lXFTn/k+/MxU4FrPLYWmOkIqmbNBUpDSBl059HKgP
	KaEtHQwcbQQ9PjuuNSt5FRjG1FULz/f2TwYucqhOxNUvG03NGYZHRN+KFUjZ8TjAukuhdlzHIkVBb
	yH0LcgVsZm2ALF41I18PcQ3wQOIsldLg+38nTycNRW271RXWuHRfg+8d0ldBfn6AiRTClQNa2pe+U
	cZrxpbyrQRyjNs/eJ0o5XWEiWf0mxKfnwLgNWk81Uc0VqJZZNTy9PdTWcm4w/ahyMeAx6YA710oF4
	NNOs0+dw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVvxe-00000007FIq-0zPb;
	Wed, 17 Dec 2025 18:09:18 +0000
Message-ID: <5773feac-a80e-4a59-a0f2-dc787faa9f61@infradead.org>
Date: Wed, 17 Dec 2025 10:09:16 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Fix kerneldoc warnings
To: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Devel Mailing List <dri-devel@lists.freedesktop.org>,
 Intel Graphics Mailing List <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Collabora Kernel Mailing List <kernel@collabora.com>
References: <20251217172404.31216-1-loic.molinari@collabora.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251217172404.31216-1-loic.molinari@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/17/25 9:24 AM, Loïc Molinari wrote:
> Fix incorrect parameters in drm_gem_shmem_init() and missing " *" on
> empty lines in drm_gem_get_huge_mnt().
> 
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 7 +++++--
>  include/drm/drm_gem.h                  | 4 ++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 29174ab58ff3..fbd1164174b0 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -94,9 +94,12 @@ static int __drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_obj
>  }
>  
>  /**
> - * drm_gem_shmem_init - Initialize an allocated object.
> + * drm_gem_shmem_init - Initialize an allocated object of the given size
>   * @dev: DRM device
> - * @obj: The allocated shmem GEM object.
> + * @shmem: shmem GEM object to initialize
> + * @size: Size of the object to initialize
> + *
> + * This function initializes an allocated shmem GEM object.
>   *
>   * Returns:
>   * 0 on success, or a negative error code on failure.
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index f4da8ed0d630..86f5846154f7 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -508,11 +508,11 @@ static inline int drm_gem_huge_mnt_create(struct drm_device *dev,
>  /**
>   * drm_gem_get_huge_mnt - Get the huge tmpfs mountpoint used by a DRM device
>   * @dev: DRM device
> -
> + *
>   * This function gets the huge tmpfs mountpoint used by DRM device @dev. A huge
>   * tmpfs mountpoint is used instead of `shm_mnt` after a successful call to
>   * drm_gem_huge_mnt_create() when CONFIG_TRANSPARENT_HUGEPAGE is enabled.
> -
> + *
>   * Returns:
>   * The huge tmpfs mountpoint in use, NULL otherwise.
>   */

-- 
~Randy

