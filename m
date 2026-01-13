Return-Path: <linux-next+bounces-9629-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB4D16EF8
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 08:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24159301670B
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 07:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679FA270EC1;
	Tue, 13 Jan 2026 07:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1xCcGmPx"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0581E5B64;
	Tue, 13 Jan 2026 07:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768287669; cv=none; b=KJk2DAfR0pvryCO83CiaCUGdXPI2Z0Qr7ldoFtoZJbvAnX23go6urSVKELV5tCLMIYz41wtLimhW6qXLGa1K70/J5/0fIOrMargdT3CBQZ7aQ8SQPrfiJJ5+vXJ+foYtUmSr3duwNC0M6FHXv3KLZXQbelLdgn+w5QNTF6gOYx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768287669; c=relaxed/simple;
	bh=7J+GHnmeWPAoyDwtT/9uyf2wS+2hZwG9XnTIF+gtHdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvSx91WcHtePS+ZSPFcsAinFxyu/RNw92StbAFrscUjYekMlH5QB6xyP0qMjJ/xuouVKCiMYp6rPiQk/kyhunC0q2EQhCuDdjRuBI0Cds2h3pOgyWB6AktLEtRtUz0EdHXiPYMbKFj7wjZC14ORHPiyaTi9kM8N61Qubv6mgoFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1xCcGmPx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=A4riI63gWIIVJ9LgRa7g6OxGUvl4O/EUaGltMIMfg+o=; b=1xCcGmPxSbDKBAwk5YgV5iL6R5
	zF8Q5TOqeIq+9NfNVczhm12nK3neH/8LuCmwDr2WADMZfsV5MEXsvUUiP2SxWObX99VGohmCnEXSo
	sspW1vWCWhkICRPveuXOYgYg/3LnEUsNN80MZXvhyIBVdOyM0pcp6hS7cAtNdtugcGgI44wcXlCjS
	Vg5lgCA/It0po3ySrLb21DRZ9+55i1ICcAxc9D/upiCKdb4pYXQuHKp0hTBvrLeIV5r/+uyA3B5F9
	wfwRJhLqJeBbPlGeZrCw9FU9iBt9N0BfzxqhT+c/7szizYn7fKEt4Omfj4ZnBDBg1n5huebpWkkFA
	HkQBplOg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYOi-00000006cos-3azI;
	Tue, 13 Jan 2026 07:01:00 +0000
Message-ID: <2768c835-7ac9-4540-a665-5dd516a80eee@infradead.org>
Date: Mon, 12 Jan 2026 23:01:00 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the usb tree with the
 nn-nonmm-unstable tree
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>, Kuen-Han Tsai
 <khtsai@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20260113150752.2e2238f2@canb.auug.org.au>
 <3ad768b3-6c66-4e23-9bfb-145887313b78@infradead.org>
 <2026011356-hemstitch-rundown-ca92@gregkh>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2026011356-hemstitch-rundown-ca92@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/12/26 10:53 PM, Greg KH wrote:
> On Mon, Jan 12, 2026 at 10:44:29PM -0800, Randy Dunlap wrote:
>> Gi,
>>
>> On 1/12/26 8:07 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the usb tree, today's linux-next build (arm
>>> multi_v7_defconfig) failed like this:
>>>
>>> In file included from drivers/usb/gadget/function/f_ncm.c:27:
>>> drivers/usb/gadget/function/f_ncm.c: In function 'ncm_opts_dev_addr_store':
>>> drivers/usb/gadget/function/u_ether_configfs.h:243:31: error: implicit declaration of function 'hex_to_bin' [-Wimplicit-function-declaration]
>>>   243 |                         num = hex_to_bin(*p++) << 4;                            \
>>>       |                               ^~~~~~~~~~
>>> drivers/usb/gadget/function/f_ncm.c:1600:1: note: in expansion of macro 'USB_ETHER_OPTS_ATTR_DEV_ADDR'
>>>  1600 | USB_ETHER_OPTS_ATTR_DEV_ADDR(ncm);
>>>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Caused by commit
>>>
>>>   30034bbf280f ("kernel.h: drop hex.h and update all hex.h users")
>>>
>>> from the mm-nonmm-unstable tree interacting with commits
>>>
>>>   e065c6a7e46c ("usb: gadget: u_ether: add gether_opts for config caching")
>>>   56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind")
>>>
>>> from the USB tree.
>>>
>>> I have applied the following merge resolution patch for today.
>>>
>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>> Date: Tue, 13 Jan 2026 14:36:59 +1100
>>> Subject: [PATCH] fix up for "usb: gadget: u_ether: add gether_opts for config
>>>  caching"
>>>
>>> interacting with commit
>>>
>>>  30034bbf280f ("kernel.h: drop hex.h and update all hex.h users")
>>>
>>> from the mm-nonmm-unstable tree.
>>>
>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>> ---
>>>  drivers/usb/gadget/function/u_ether_configfs.h | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
>>> index 39d3a261496d..c2f8903d1400 100644
>>> --- a/drivers/usb/gadget/function/u_ether_configfs.h
>>> +++ b/drivers/usb/gadget/function/u_ether_configfs.h
>>> @@ -18,6 +18,7 @@
>>>  #include <linux/mutex.h>
>>>  #include <linux/netdevice.h>
>>>  #include <linux/rtnetlink.h>
>>> +#include <linux/hex.h>
>>
>> LGTM. What is the procedure for this? (my first AFAIK)
> 
> I can take a patch for this now in my tree, as it would "just work" for
> that, right?

Yes, it just needs that additional header file.
Thanks.
-- 
~Randy


