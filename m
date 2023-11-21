Return-Path: <linux-next+bounces-13-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B82177F3A33
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 00:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E971E1C20A3C
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 23:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EEE55C07;
	Tue, 21 Nov 2023 23:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="Mc9Q8Zu6"
X-Original-To: linux-next@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAC2D58
	for <linux-next@vger.kernel.org>; Tue, 21 Nov 2023 15:19:43 -0800 (PST)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
	by cmsmtp with ESMTPS
	id 5UtirOdT7gpyE5a1urQi5d; Tue, 21 Nov 2023 23:19:42 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 5a1tr4HQA1J285a1urfHZl; Tue, 21 Nov 2023 23:19:42 +0000
X-Authority-Analysis: v=2.4 cv=Tqz1ORbh c=1 sm=1 tr=0 ts=655d3b0e
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=pVh-v41mxNHzIYEOPEMA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lDvRMk22BIWU3sgPfy8qmzMfyKnlWxCtumFka5E6NCg=; b=Mc9Q8Zu6bJ5ik2N0m+s4wfPtTA
	AWi9u0xmalpHRskVu6RrscCkEqRxsgyabJ3IG4/8u8flsb3K+OsqGMZqOkvTabudyyy2o59zZqn/K
	Ua4CSN7kaIsnJEHlDMm/jsEcLA0nq9xpxZOMxO2uAOQkF0+WJiHwe1NsfvkVkvE8ptFgLhoCYUeqj
	x5Xt3j2t6DgqL/141AzfzuOREHabIR9rygCWaV9Rh3lxoGklzKCRdYmCTO5/HFVDmmJCzV+4Xn6f2
	5gcUpScBfO0i14crR5AFXYVcm7W3z8OQBz3BnjEHBNXZsmnPlDYhBBcJg9sX1q8vBAhg9RWiSX2lu
	ybXCGIkQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:40180 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r5a1t-0006IF-1l;
	Tue, 21 Nov 2023 17:19:41 -0600
Message-ID: <e178b9aa-f766-4c3f-820a-ce02cc98830f@embeddedor.com>
Date: Tue, 21 Nov 2023 17:19:40 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the kspp-gustavo tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231122095009.294994e0@canb.auug.org.au>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231122095009.294994e0@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1r5a1t-0006IF-1l
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:40180
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGjgfApDtaBbP/Fco7B0jhIwSYkLiuR3f8CzBdEzx4vr5y/Kjj7EoawyYLCRU23PjH0HJ64+Y6ii6jW6lph4FCgmB21QzTp4yHMzi39ctbBXwODUcHdw
 48tvQsznAegtfDor4z/sheUN97DkonbNSHiQ73mGI+mRk3BteLGu2HcoW2J2AcTu+0PXQ50ttwRdqdMZXMMeTGTeUj+weiYxa/XgtELfy965uyXPbYx0g3Wu


On 11/21/23 16:50, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp-gustavo tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> In function 'aspeed_create_fan_tach_channel',
>      inlined from 'aspeed_create_fan' at drivers/hwmon/aspeed-pwm-tacho.c:877:2,
>      inlined from 'aspeed_pwm_tacho_probe' at drivers/hwmon/aspeed-pwm-tacho.c:936:9:
> drivers/hwmon/aspeed-pwm-tacho.c:751:49: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
>    751 |                 priv->fan_tach_ch_source[index] = pwm_source;
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
> drivers/hwmon/aspeed-pwm-tacho.c: In function 'aspeed_pwm_tacho_probe':
> drivers/hwmon/aspeed-pwm-tacho.c:193:12: note: at offset [48, 255] into destination object 'fan_tach_ch_source' of size 16
>    193 |         u8 fan_tach_ch_source[16];
>        |            ^~~~~~~~~~~~~~~~~~
> 
> Exposed by commit
> 
>    1b56c90018f0 ("Makefile: Enable -Wstringop-overflow globally")
> 
> This is with your tree on top of Linus' tree (and some fix patches but
> nothing that obviously touches anything relevent) and CONFIG_WERROR
> not set.
> 

Hi Stephen,

The fix for this issue is also in linux-next already:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=72cfe7a99c9ea1e64fc532f4f05c99991858dc34

Thanks!
--
Gustavo

