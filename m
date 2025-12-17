Return-Path: <linux-next+bounces-9443-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69982CC81FB
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 15:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7E81309FA4D
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 14:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2537E38E169;
	Wed, 17 Dec 2025 14:04:50 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627BD38E156;
	Wed, 17 Dec 2025 14:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765980290; cv=none; b=tVfFLDKLGwO1WEUXtEZ/4wOEmCcSc+90AEXiTBpWT/NUT1QHKG89p1t0Bv1dLD0MNPouqv8jVfsGcJmATiOk3kBlIPhjw7pyxvWiYt+WdMbu0fEL7I+TXWXQbrCcnjZNGesu71zAApbslmP1NkFTb6Prk7KdLravVnykSmaxtWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765980290; c=relaxed/simple;
	bh=jp23SWpHEeLIbdkTtAQLMFAksW5ULZkl04cxtZw2d5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CrehuhqTcMhaVaglzJrIqGD9Goyt3RfARaJLYpxc7vo7O2N87yf9dvGjc0Tz5+lO36BzuRpCv+J2Jv0dRAxhJxkp0371Hxed4tTAJBUpofCx1DC9x8R/RduEbeudPneRydAok4GHZUNmOXkyoULvJJ97zAH5TB79q/i2G0Bu75c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02B37339;
	Wed, 17 Dec 2025 06:04:39 -0800 (PST)
Received: from [10.57.45.201] (unknown [10.57.45.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A54F3F73B;
	Wed, 17 Dec 2025 06:04:43 -0800 (PST)
Message-ID: <6c56ee08-b2f0-4c79-aff0-46723ddc06dc@arm.com>
Date: Wed, 17 Dec 2025 14:04:41 +0000
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

Reviewed-by: Steven Price <steven.price@arm.com>
Fixes: ea78ec982653 ("drm/panthor: Expose the selected coherency protocol to the UMD")

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


