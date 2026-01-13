Return-Path: <linux-next+bounces-9626-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C10A3D16E21
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 07:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8534C3016984
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 06:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055912FFDE3;
	Tue, 13 Jan 2026 06:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="beuMoHV2"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A702535CB8D;
	Tue, 13 Jan 2026 06:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768286678; cv=none; b=qbn7hMGlTxo1AxrbTN7Km4uwbwbCNRC24q3u9R+L/JTZPnuXz036a5sysKlKpRiAfzUcOy9fW72kH3raxmSf51VwMOD4MqXsgjbkReNxd4DocfS1OPaGHXeYNn2uqWBVlYdMxrv4qResYcGMnYPpiX1bZ36IlybYnof1lsQ1+tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768286678; c=relaxed/simple;
	bh=T4N9+CVRjfVQCYYKYkV63+XXzQ9uycF6PYVuNHN3nec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGccFfXw4dlmiyvgIMBEKYKslaTG8SVdwdf2Eog8xOIu/7LniVHIcETBy3Mn9T0rmWNOwZRcCt0UFtkaHFXE62poqxnKX+2XP5jONjJw6VkfaCedYuDJG3W/RqCcwz68tOb7tHdEp3jhiAsl2eTcneeC3f/Zn6OuL7lmjcQrBQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=beuMoHV2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=bUuCiAFoRM39c6rMYhXWFl770OMhjv0+0z4R6oJ+0aY=; b=beuMoHV2Kl2/0OuvPzJpKt+0jp
	5ga/aUY9vP7VtfrlJLtfswzrnk2YwwTcUroo4EQ8bW+gg4CjFxG0BBbFgtaV10vCu+ckBokyv8XtN
	1GPVrq8IszyDY0IsPJVNUT/0AtX1GuTkmx5u6CkcMe0389YUJSub0jsa49PIKDEMs7W5qmIsQwp9u
	rQxkMBvc71KWIDoRMUEZiEMud8ATtRFAUo9VWSxXrpM75g+x4+x924bbE20wZB+X1G4607TZHkHr6
	5W82pvcJueC8xWy9J0oBtv4oz6ZQ8eUvkraA1emcG28eDv4TDGEXmJya8LNiVDRmMjuAWSrgEaasu
	BYkoI/cw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfY8l-00000006cAF-1GpB;
	Tue, 13 Jan 2026 06:44:31 +0000
Message-ID: <3ad768b3-6c66-4e23-9bfb-145887313b78@infradead.org>
Date: Mon, 12 Jan 2026 22:44:29 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the usb tree with the
 nn-nonmm-unstable tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuen-Han Tsai <khtsai@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20260113150752.2e2238f2@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260113150752.2e2238f2@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Gi,

On 1/12/26 8:07 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the usb tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from drivers/usb/gadget/function/f_ncm.c:27:
> drivers/usb/gadget/function/f_ncm.c: In function 'ncm_opts_dev_addr_store':
> drivers/usb/gadget/function/u_ether_configfs.h:243:31: error: implicit declaration of function 'hex_to_bin' [-Wimplicit-function-declaration]
>   243 |                         num = hex_to_bin(*p++) << 4;                            \
>       |                               ^~~~~~~~~~
> drivers/usb/gadget/function/f_ncm.c:1600:1: note: in expansion of macro 'USB_ETHER_OPTS_ATTR_DEV_ADDR'
>  1600 | USB_ETHER_OPTS_ATTR_DEV_ADDR(ncm);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   30034bbf280f ("kernel.h: drop hex.h and update all hex.h users")
> 
> from the mm-nonmm-unstable tree interacting with commits
> 
>   e065c6a7e46c ("usb: gadget: u_ether: add gether_opts for config caching")
>   56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind")
> 
> from the USB tree.
> 
> I have applied the following merge resolution patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 13 Jan 2026 14:36:59 +1100
> Subject: [PATCH] fix up for "usb: gadget: u_ether: add gether_opts for config
>  caching"
> 
> interacting with commit
> 
>  30034bbf280f ("kernel.h: drop hex.h and update all hex.h users")
> 
> from the mm-nonmm-unstable tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/usb/gadget/function/u_ether_configfs.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
> index 39d3a261496d..c2f8903d1400 100644
> --- a/drivers/usb/gadget/function/u_ether_configfs.h
> +++ b/drivers/usb/gadget/function/u_ether_configfs.h
> @@ -18,6 +18,7 @@
>  #include <linux/mutex.h>
>  #include <linux/netdevice.h>
>  #include <linux/rtnetlink.h>
> +#include <linux/hex.h>

LGTM. What is the procedure for this? (my first AFAIK)

I can send a patch to Greg or Kuen-Han could do that.

>  #define USB_ETHERNET_CONFIGFS_ITEM(_f_)					\
>  	static void _f_##_attr_release(struct config_item *item)	\

Thanks.
-- 
~Randy


