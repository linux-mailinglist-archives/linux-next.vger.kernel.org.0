Return-Path: <linux-next+bounces-9632-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D24D16F83
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 08:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E788530198BD
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 07:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8C536921D;
	Tue, 13 Jan 2026 07:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s4sIUaqm"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FE22E11BC;
	Tue, 13 Jan 2026 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768288711; cv=none; b=ISWTowwzFUZBFI16mo0dG5ghWz470R73lwcClFoqCRZnO15IZJbHiyyfEdMiEcJzuz2903Vrzho4ENcX3wMT42FcCClxMel5vUAlltcpuZFSdSUthma48YklyeqHAKol1GyDZsn25dBBAb3VFvzgeMM08J8+1JkoS9Olzp9hD4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768288711; c=relaxed/simple;
	bh=VZacC+rzEk7R1+VBuT9hvDeu117I14+MmPFy5i4uUWE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XT9tgsBpx5lMZm5E4ebZTfVeRmMB4Z3FkSsYpAAP7YbuTESZ2CjGW++3PgiIUK5Y7LCQ6NhSeiyrp95OXiUtpvkhMCoXNoS8VlmrBeI5O9YROymDpQ9SUe4JPL2iyWvxRfse5A+6zWuI5ZGT9jJW9dphPdiCLsE8hGekdBiR7f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=s4sIUaqm; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=28IPEbrxhd/LCNx3ahYrYaA1Dl1d6axFnK8Ir36ARKo=; b=s4sIUaqmLvRx9hhKcMKhTfsgQS
	NUM9r7QASlJu2ein97qZnTVSwoNnFS93Ap9SAoHa8grufpzErzX7ZtlduVuv39s1jlQBilEOKqvvZ
	k0Eud4rW0JJ85gG/bPTSV8fRXJAI3PFS9dptnoziNVMzCvkNhxXG4P/w3BouGw5vUAwJzpQ25ZrZo
	qxoNB56R3yaC0Yux1vuOrj3C9lXY87AqLy9dgbtIV2sqshg2+foCOo+jq9PBjaCQIsafUyr5ZewLo
	1qmIvcKhho5E5NDHWG7rL6mXdg3KeRDAv+6XLpRy/sY/1HxQupvta85WZxPzPAae+2uXjXy3lHhNM
	6oE/avEQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYfZ-00000006dLu-1UrV;
	Tue, 13 Jan 2026 07:18:25 +0000
Message-ID: <a28702fb-32c5-4286-88ee-1186c444ea37@infradead.org>
Date: Mon, 12 Jan 2026 23:18:24 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the usb tree with the
 nn-nonmm-unstable tree
From: Randy Dunlap <rdunlap@infradead.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>, Kuen-Han Tsai
 <khtsai@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20260113150752.2e2238f2@canb.auug.org.au>
 <3ad768b3-6c66-4e23-9bfb-145887313b78@infradead.org>
 <2026011356-hemstitch-rundown-ca92@gregkh>
 <2768c835-7ac9-4540-a665-5dd516a80eee@infradead.org>
Content-Language: en-US
In-Reply-To: <2768c835-7ac9-4540-a665-5dd516a80eee@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/12/26 11:01 PM, Randy Dunlap wrote:
> 
> 
> On 1/12/26 10:53 PM, Greg KH wrote:
>> On Mon, Jan 12, 2026 at 10:44:29PM -0800, Randy Dunlap wrote:
>>> Gi,
>>>
>>> On 1/12/26 8:07 PM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> After merging the usb tree, today's linux-next build (arm
>>>> multi_v7_defconfig) failed like this:
>>>>
>>>> In file included from drivers/usb/gadget/function/f_ncm.c:27:
>>>> drivers/usb/gadget/function/f_ncm.c: In function 'ncm_opts_dev_addr_store':
>>>> drivers/usb/gadget/function/u_ether_configfs.h:243:31: error: implicit declaration of function 'hex_to_bin' [-Wimplicit-function-declaration]
>>>>   243 |                         num = hex_to_bin(*p++) << 4;                            \
>>>>       |                               ^~~~~~~~~~
>>>> drivers/usb/gadget/function/f_ncm.c:1600:1: note: in expansion of macro 'USB_ETHER_OPTS_ATTR_DEV_ADDR'
>>>>  1600 | USB_ETHER_OPTS_ATTR_DEV_ADDR(ncm);
>>>>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>
>>>> Caused by commit
>>>>
>>>>   30034bbf280f ("kernel.h: drop hex.h and update all hex.h users")
>>>>
>>>> from the mm-nonmm-unstable tree interacting with commits
>>>>
>>>>   e065c6a7e46c ("usb: gadget: u_ether: add gether_opts for config caching")
>>>>   56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind")
>>>>
>>>> from the USB tree.
>>>>
>>>> I have applied the following merge resolution patch for today.
>>>>
>>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>>> Date: Tue, 13 Jan 2026 14:36:59 +1100
>>>> Subject: [PATCH] fix up for "usb: gadget: u_ether: add gether_opts for config
>>>>  caching"
>>>>
>>>> interacting with commit
>>>>
>>>>  30034bbf280f ("kernel.h: drop hex.h and update all hex.h users")
>>>>
>>>> from the mm-nonmm-unstable tree.
>>>>
>>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>>> ---
>>>>  drivers/usb/gadget/function/u_ether_configfs.h | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
>>>> index 39d3a261496d..c2f8903d1400 100644
>>>> --- a/drivers/usb/gadget/function/u_ether_configfs.h
>>>> +++ b/drivers/usb/gadget/function/u_ether_configfs.h
>>>> @@ -18,6 +18,7 @@
>>>>  #include <linux/mutex.h>
>>>>  #include <linux/netdevice.h>
>>>>  #include <linux/rtnetlink.h>
>>>> +#include <linux/hex.h>
>>>
>>> LGTM. What is the procedure for this? (my first AFAIK)
>>
>> I can take a patch for this now in my tree, as it would "just work" for
>> that, right?
> 
> Yes, it just needs that additional header file.
> Thanks.

I'm sending a patch, or you can just go with the patch that Stephen added.

-- 
~Randy


