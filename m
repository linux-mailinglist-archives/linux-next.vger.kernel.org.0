Return-Path: <linux-next+bounces-162-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F0A7FFE11
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 22:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 485211C20BF8
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 21:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380B25A0EE;
	Thu, 30 Nov 2023 21:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="mMiffwqt"
X-Original-To: linux-next@vger.kernel.org
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF8110F8
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 13:55:01 -0800 (PST)
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTPS
	id 8mhxrgbT9WcCI8ozsr6nYC; Thu, 30 Nov 2023 21:55:00 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 8ozrroQYvM0U28ozrrxrq1; Thu, 30 Nov 2023 21:55:00 +0000
X-Authority-Analysis: v=2.4 cv=BuKOfKb5 c=1 sm=1 tr=0 ts=656904b4
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=8XV0R0IcXUXM6S+KMni/4w==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=zd2uoN0lAAAA:8
 a=VwQbUJbxAAAA:8 a=Kg8e4WwB38ma1Z1VaQoA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0jen8kdfIh24UVe/0TrHAVR7LS4PbKHvWju6bbFi/X4=; b=mMiffwqt7JlYCd+/FhAKIV3nv6
	TK8DFVgBrw2dnuxT51DmDaI21Dl0sBvA7VvARCjmkz8dArEvFguZVL3AreH4yX8dZ0nTI7n68RnBk
	Akk40eOlXFFS9c4n0KE1rPlzaxus9Oj0VVD0nuG4VQJvym6433jAhJZ/c5MMeNplC1DQdkJAxmKb+
	EmPc+O8Q2nUGWEvXEJ6OhzU12bEWOC9+ufJav+4e2/zeZ8xIrYS4QGuwtfcfaX0KzQtF1v+G0JeOQ
	TubmLK6NFbgoptZhhBKgokrQXorW5NKBRacw26IoDNnbgTvzdQEn2o3WBXWEv09wTwzJ2gxFiiPKD
	JCAZyqTQ==;
Received: from 189.215.208.186.cable.dyn.cableonline.com.mx ([189.215.208.186]:1908 helo=[192.168.0.28])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r8ozr-003hpQ-0g;
	Thu, 30 Nov 2023 15:54:59 -0600
Message-ID: <402fc89f-96ff-4f64-ad6d-aaa7ecc284e7@embeddedor.com>
Date: Thu, 30 Nov 2023 15:54:57 -0600
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
Cc: "Aithal, Srikanth" <sraithal@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231122144814.649823ac@canb.auug.org.au>
 <813f3aa2-3449-7264-fa54-eaafd9981add@amd.com>
 <20231128091351.2bfb38dd@canb.auug.org.au>
 <001021e0-2262-49c8-89d0-c0d0720ca313@embeddedor.com>
In-Reply-To: <001021e0-2262-49c8-89d0-c0d0720ca313@embeddedor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.215.208.186
X-Source-L: No
X-Exim-ID: 1r8ozr-003hpQ-0g
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 189.215.208.186.cable.dyn.cableonline.com.mx ([192.168.0.28]) [189.215.208.186]:1908
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKlakc22IIdN8A91jivxu+6yB1x1XMvchH5184+G+RXUFbC6bW1+Mbt4QnUNeHZAjM48dBM1WtA3lw7GBJL+3touQK71wUjEKcBTHuSwBQhvb0zNIz9M
 DtcU7pP7xyOrr7wu3QOsdSuPhEayuXT0qgy37lwIIUdechsK/ySlWAIBRDZpZ2Ham9apQIzNa+Bs6UIzQCi4Yq9qaas9t/MJrsTkwWqnErlBOZCwBKa7/yqU

Hi Stephen,

On 11/28/23 15:11, Gustavo A. R. Silva wrote:
> Hi Stephen,
> 
> On 11/27/23 16:13, Stephen Rothwell wrote:
>> Hi Gustavo,
>>
>> On Wed, 22 Nov 2023 10:21:27 +0530 "Aithal, Srikanth" <sraithal@amd.com> wrote:
>>>
>>> @Gustavo I see you have mentioned it as gcc issue. I was not hitting this until yesterdays linux-next build. I am on latest gcc which RHEL 9.x provides,
>>> gcc --version
>>> gcc (GCC) 11.4.1 20230605 (Red Hat 11.4.1-2)
>>
>> Given that gcc 11 is a provided compiler on RHEL 9, can you not add
>> -Wstringop-overflow for that compiler, please.

Done:

https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?h=for-next/kspp&id=617ab3c357d2ebdfff0e1a090c46f2f3f29b45e2

Thanks!
--
Gustavo

> 
> 
> Sure thing. Working on that. :)
> 
> -- 
> Gustavo
> 

