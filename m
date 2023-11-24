Return-Path: <linux-next+bounces-64-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E957F82F5
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 20:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3979B250D5
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 19:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6D52C87B;
	Fri, 24 Nov 2023 19:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="Z+SdqjeT"
X-Original-To: linux-next@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD4B1FC1
	for <linux-next@vger.kernel.org>; Fri, 24 Nov 2023 11:08:00 -0800 (PST)
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id 6XfSrBPIH6nOZ6bWxrbHpI; Fri, 24 Nov 2023 19:07:59 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 6bWwrULyf8vT06bWwrEiTC; Fri, 24 Nov 2023 19:07:58 +0000
X-Authority-Analysis: v=2.4 cv=ffi+dmcF c=1 sm=1 tr=0 ts=6560f48e
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=yGeM7+xMb5a5VK1DGQx1ew==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=rOUgymgbAAAA:8
 a=_Wotqz80AAAA:8 a=ecaHyswvTsOv7WUB1IcA:9 a=QEXdDO2ut3YA:10
 a=MP9ZtiD8KjrkvI0BhSjB:22 a=buJP51TR1BpY-zbLSsyS:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1w/AweXFjJ5pk/0rI7lRBV4CiDYXVVx5J4CrYMUtMDM=; b=Z+SdqjeTYcR31SHnk3GJYLqLbQ
	/AfdLDyM5twWRsL5n4fh+OFdc68kj0qgDh6KHu4Lo6W/uG7Pz/t9yjpQVgWiUiHBr+Sm1V9ZsJxXE
	n19xImsipgkwTMe9xqF8YLvJadc5l8WsEAfkJiA/m8jDqbVgvi/NoK6kIOqW1r49ZQAFEKFjvMtD3
	C/KwH1juwKj3JLmeqeTF4RHbbNpVYenwQF2L4sAupHOAyJvpPNRU2Xehi69GLpfnZZPyt1RJTkpa4
	PZE4PKx44476ElWGOb+tuWxPoczhNlp6b9Ks5cFnjTyaWpC/pIGf/a00gP6HXm4tZVACtdA8Vd06E
	o57a8i0A==;
Received: from 187.184.157.122.cable.dyn.cableonline.com.mx ([187.184.157.122]:31138 helo=[192.168.0.25])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r6bWv-0047Be-2c;
	Fri, 24 Nov 2023 13:07:57 -0600
Message-ID: <b3c99290-40bc-426f-b3d2-1aa903f95c4e@embeddedor.com>
Date: Fri, 24 Nov 2023 13:07:55 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the kspp-gustavo tree
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231122144814.649823ac@canb.auug.org.au>
 <7e58f7a0-440f-4067-87e2-381f05bfce2b@embeddedor.com>
 <20231122161544.7a7b8c13@canb.auug.org.au>
 <bbde1882-9124-408c-9f59-de3de66bfc56@embeddedor.com>
In-Reply-To: <bbde1882-9124-408c-9f59-de3de66bfc56@embeddedor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.157.122
X-Source-L: No
X-Exim-ID: 1r6bWv-0047Be-2c
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.157.122.cable.dyn.cableonline.com.mx ([192.168.0.25]) [187.184.157.122]:31138
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfM0AYF2nZ2/iSHL4ZxUTQvLxMnA5IlPeZRxUNKMSenBYyTR71L4j5GE0S9m8QIKY96znSvGZB9a7WsTPP+wt3JRh2ugLd8yPC7cn3o2n6B7rt62NJDld
 1Oo0dS5hGPeUxxqMdrZ9WC3X4qwIvcXXn2v/TjQ4UN9n30EqJo2NZN8uZxAjYKoi+VuhG66Pp8UNKAgo5EikieraJm/ZE6dslCH41TnYu4pJzvnED/y7doAd
X-Spam-Level: *


Hi Stephen,

On 11/22/23 00:24, Gustavo A. R. Silva wrote:
> Stephen,
> 
> I need to double-check that. I'll be able to come back to work on this in 12-15 hours. I'm about to travel.
> 
> Thanks
> --
> Gustavo
> 
> 
> On Nov 21, 2023, 23:15, at 23:15, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Gustavo,
>>
>> On Tue, 21 Nov 2023 22:04:17 -0600 "Gustavo A. R. Silva"
>> <gustavo@embeddedor.com> wrote:
>>>
>>> This doesn't show up with more recent compilers because it was an
>> issue in GCC.
>>
>> Sure, but we do still support gcc back to v5.1 .. are there other
>> earlier versions where you may want to suppress these warnings?

The GCC bug only appears in GCC 11. We should catch and fix -Wstringop-overflow
warnings with the rest of the versions that support this compiler option. :)

Thanks!
--
Gustavo

