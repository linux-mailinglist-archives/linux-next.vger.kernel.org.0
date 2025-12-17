Return-Path: <linux-next+bounces-9444-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF5FCC8ED9
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 18:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDAE4317C42B
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 16:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C48E3358C7;
	Wed, 17 Dec 2025 15:58:52 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF19029BDBF;
	Wed, 17 Dec 2025 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987132; cv=none; b=YDM3ibFnAbrMeILuIDOptBvliQw8DEWjXO6SdKgYp0tjXY8x1NczLvPwP5t0pfXKUxYhGsCTGDaupW7PJkhfL8svk1v3TrIDeUhTqyh45u0UtC6r+RSjGlC9qIzZVqTFQg0aoFM45N9JNUmXjOI7/VQMoHlKg7zIJjNnEkl7VjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987132; c=relaxed/simple;
	bh=c9p7nKa7wUIsxbqGewMslBjAHRiRonXQ1idP1aHRLGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blurCcZn2/lRBGPjM5p/R3XqrwyUl3KVnb4F2XV9o02PvduoXIlUE0fkv60+HFIdlDwcT2VBSODXPmbQsvKzXr/DRcLRyP7MhkSrLFw5VnByhFgdVtjPnvtNgtec+87x0WzDyIH/b1/fptyT2Cp3P9dqa6XmhqhWRotDNoEDWMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BDD4FEC;
	Wed, 17 Dec 2025 07:58:41 -0800 (PST)
Received: from [10.57.45.201] (unknown [10.57.45.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9751F3F5CA;
	Wed, 17 Dec 2025 07:58:46 -0800 (PST)
Message-ID: <60dab726-b29b-471f-9590-98772c0a72b5@arm.com>
Date: Wed, 17 Dec 2025 15:58:43 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix kerneldoc in uAPI header
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com
References: <20251217132403.3996014-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251217132403.3996014-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2025 13:24, Boris Brezillon wrote:
> Fix a typo in a kerneldoc header.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/dri-devel/20251216120049.3ed7e06e@canb.auug.org.au/
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Pushed to drm-misc-next.

> ---
>  include/uapi/drm/panthor_drm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index e238c6264fa1..b401ac585d6a 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -350,7 +350,7 @@ struct drm_panthor_gpu_info {
>  	__u32 as_present;
>  
>  	/**
> -	 * @select_coherency: Coherency selected for this device.
> +	 * @selected_coherency: Coherency selected for this device.
>  	 *
>  	 * One of drm_panthor_gpu_coherency.
>  	 */


