Return-Path: <linux-next+bounces-7664-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D770B0CA59
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 20:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E6C1189EDD5
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 18:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DEA29A9ED;
	Mon, 21 Jul 2025 18:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yJc04kwr"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC33A155CB3;
	Mon, 21 Jul 2025 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753121598; cv=none; b=pU70840kiMiSmbDcSZvEEJ5u+d68tJCmOXjg9Sj50AKay1yaEyawJuZA79JwfVL8+IFVmWvooP3OkJ7+e5RZHOmMGyhxsVlY84hfODA0cm3C3mOu4gMwqRHal/AIFbDSNawbTaWW/oaANJWd3VevvW2pEmAC+W8doJ1lmUx6tu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753121598; c=relaxed/simple;
	bh=3PgcKhpIaXlMlRNGMqdPnU7Ne37vkZj31f11YeqXC84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hGmPR8oDwA2XT4eG6mrBGda4YjAvxnj1CJbv2jXyI2lYgHQAlQi8VDs9CiyBi8rF0tfb8XxIOGWeJoPw9vDYe3EsdD0wVvO4taSEC/algKRp7AOXpRM/iB4V3DCCpTA3//8L7zMp3yIp0t2KPk6g6JH8qFZVyENMUqYchLmHwGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yJc04kwr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=YIa0kKk/C8c2jce3V3xpos3VNuh0qirWQs9kAO9t8uA=; b=yJc04kwrwI98p907tw5o2Eoh4T
	PCpcXrFfWNSLl+AkJp2u1hKiiv2WKibHBk5+Cunxj1qd0qHCfY4qLn98HA8WSEfcEW9EES3Qjmde4
	6Zkb/JSPxE+OLOfykeqHo78z2YF6OXf5LP1n+r+QRQyODnLo2C2x9CxX2cxNvLgkNCLzdgo51kPdo
	ULZPepYd/7y5u6UvKTAE1KW+VK0kf7MkFYCH07mZkF+r+eAm8152gi1m0GJRkz85LzvY2HpVFjqEH
	8Z+KQ6HfRMTih3QCXF88kvxg/CbSnjcoONfnl21mGP8h/jyWQ2M/rFSP/lOrZhknW2Ga/CCgFDvwi
	z0LdxihA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udv0l-00000000P1i-20bR;
	Mon, 21 Jul 2025 18:13:15 +0000
Message-ID: <53b1a47d-2338-44f3-8d78-8c4b02e0fa81@infradead.org>
Date: Mon, 21 Jul 2025 11:13:14 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: add urb->sgt parameter description
To: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
 sfr@canb.auug.org.au
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, imx@lists.linux.dev
References: <20250721104417.3442530-1-xu.yang_2@nxp.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250721104417.3442530-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/21/25 3:44 AM, Xu Yang wrote:
> The parameter description of urb->sgt is lost, this will add it for
> completeness.
> 
> Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20250711182803.1d548467@canb.auug.org.au/
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  include/linux/usb.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 535ac37198a1..9d662c6abb4d 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1455,6 +1455,10 @@ typedef void (*usb_complete_t)(struct urb *);
>   * @sg: scatter gather buffer list, the buffer size of each element in
>   * 	the list (except the last) must be divisible by the endpoint's
>   * 	max packet size if no_sg_constraint isn't set in 'struct usb_bus'
> + * @sgt: used to hold a scatter gather table returned by usb_alloc_noncoherent(),
> + *      which describes the allocated non-coherent and possibly non-contiguous
> + *      memory and is guaranteed to have 1 single DMA mapped segment. The
> + *      allocated memory needs to be freed by usb_free_noncoherent().
>   * @num_mapped_sgs: (internal) number of mapped sg entries
>   * @num_sgs: number of entries in the sg list
>   * @transfer_buffer_length: How big is transfer_buffer.  The transfer may

-- 
~Randy

