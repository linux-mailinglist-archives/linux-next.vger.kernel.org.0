Return-Path: <linux-next+bounces-9442-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FE9CC8092
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 15:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBE3030EA611
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 13:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB72E34D395;
	Wed, 17 Dec 2025 13:46:10 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D364E34AAFC
	for <linux-next@vger.kernel.org>; Wed, 17 Dec 2025 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979170; cv=none; b=ctivDOKXt5rpbLzWnyzeJmjUxNMwYQWC7JL2Djf3Hx/M7zrgoPP8tk16o1QD3/23YESDHKGMT7gRv4nkJT+eDAu22ctnN4qNIF0LAhIv7CXgnst9BcnE2EE8/pKjQTbBXEf+KEuVV08GE6h+v5hFWmVWTW645tZB24hfX7B0zow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979170; c=relaxed/simple;
	bh=rSMjf2i0D1lrZsW8wX7FDOvmoWP8YKHG2JavLHaMMTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0FE5h9IKTpMe/cs9Dst0YgdfsvmE0gR4TMpu83rlVLW6zkVQAf/6r+phZq5Lkdt8f1+qZXs7Nr0nwTbgWElq/obLrB4J1d594qpW33ygDcTrESSU3zIRB9sM6yQY/rjZpeFdA4r/DHgeG3HmPKLlVFYbqpqEAwkJs2GU5TxeGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B280E339
	for <linux-next@vger.kernel.org>; Wed, 17 Dec 2025 05:45:59 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C55C3F73F
	for <linux-next@vger.kernel.org>; Wed, 17 Dec 2025 05:46:06 -0800 (PST)
Date: Wed, 17 Dec 2025 13:45:18 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
	=?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Fix kerneldoc in uAPI header
Message-ID: <aUKz7t2FmrDhkmh8@e142607>
References: <20251217132403.3996014-1-boris.brezillon@collabora.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251217132403.3996014-1-boris.brezillon@collabora.com>

On Wed, Dec 17, 2025 at 02:24:03PM +0100, Boris Brezillon wrote:
> Fix a typo in a kerneldoc header.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/dri-devel/20251216120049.3ed7e06e@canb.auug.org.au/
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

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
> -- 
> 2.52.0
> 

