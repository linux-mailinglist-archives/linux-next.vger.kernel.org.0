Return-Path: <linux-next+bounces-146-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBCC7FF3FC
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 16:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 255AAB20D40
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 15:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A04524DB;
	Thu, 30 Nov 2023 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="WKTIFw98"
X-Original-To: linux-next@vger.kernel.org
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EFAC1
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 07:52:57 -0800 (PST)
Received: from eig-obgw-5002a.ext.cloudfilter.net ([10.0.29.215])
	by cmsmtp with ESMTPS
	id 8bxrrNHqtL9Ag8jLSrA5sA; Thu, 30 Nov 2023 15:52:54 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 8jLRrTk7iRQmi8jLRr8Yyh; Thu, 30 Nov 2023 15:52:53 +0000
X-Authority-Analysis: v=2.4 cv=CdcbWZnl c=1 sm=1 tr=0 ts=6568afd5
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=7m0pAUNwt3ppyxJkgzeoew==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10
 a=Zq8NaG4NZQ_Hog5x324A:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NYGGXfz3k+0Na3QNYJYqk59wr8y1uvRXMMlAblXBrVg=; b=WKTIFw980PeTy/ggSFW0YQxf9n
	2QvByb5GwZjp7wKwUDG+mLOpylY2Im0JoOQ9CW1N9vJBJzNEp4DQ3XwPpLyIEFbzH5XMrI8FU4zfs
	lTBQyldFsmbA4tnPHjNm/wgz92TuPcrCNSoM8l65d2yFUGUrI9zhSTPztMs6kejPupeEXP+02PH8N
	nqKcW+tMjhCUE2XqIb5ivAjnscYrNM32PQcpCHdAAwXC7oypNo52wRvgAW1uTYB/+r/0odeq5ZyzI
	k7CAyoefcV//A6cNIAKhB+k7VtCliHkKP73862hKNRMRYtPYjdNdpwZZoPv3rcL9VyMziC3Qtml8H
	3Krd+tNQ==;
Received: from 187.184.156.122.cable.dyn.cableonline.com.mx ([187.184.156.122]:57202 helo=[192.168.0.28])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r8jLQ-0028gj-26;
	Thu, 30 Nov 2023 09:52:52 -0600
Message-ID: <730544ae-1e7f-4622-b986-839f81e60384@embeddedor.com>
Date: Thu, 30 Nov 2023 09:52:42 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] Fix the build failed caused by -Wstringop-overflow
To: Wenyu Huang <huangwenyu5@huawei.com>, pmladek@suse.com,
 rostedt@goodmis.org
Cc: andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
 senozhatsky@chromium.org, akpm@linux-foundation.org,
 linux-next@vger.kernel.org, gustavoars@kernel.org
References: <20231130105741.2849670-1-huangwenyu5@huawei.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231130105741.2849670-1-huangwenyu5@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.156.122
X-Source-L: No
X-Exim-ID: 1r8jLQ-0028gj-26
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.156.122.cable.dyn.cableonline.com.mx ([192.168.0.28]) [187.184.156.122]:57202
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJL5Kd0ODjVaB+AZsIrOBCphoMKJyPmpE26e2N0OeVgAEAgtxCXXMt73Z/eD+N3a6c4slzzxy7NosykIte9PCvLT8QoPl41gTh98ImBkFfFYHFB5zk1V
 djNJg0hcQh7MMsW0ty9vxlnVBwcIAXZlwVAtF7xKxjbNE1IjWoN5yNS2kWIW/BLfqCZ6YfoWDhyhVboqkAeH0ZYD5jQ1Ukakc+PbZq+aA+o0P2PegOvar8W/



On 11/30/23 04:57, Wenyu Huang wrote:
> gcc version: gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
> 
> I use this version of gcc to compile, and the compilation fails. It said
> that "error: writing 1 byte into a region of size 0
> [-Werror=stringop-overflow=]".
> 
> This patch is to fix it to build successfully.
> 

This doesn't really fix anything. GCC 11 is buggy and the issues you
see are false positives that doesn't show up in other versions of
the compiler.

> Fixes: 89741e7e42f6 ("Makefile: Enable -Wstringop-overflow globally")

The commit ID is from a patch that's currently in linux-next, which
does not guarantee it's a stable commit. So, it shouldn't be used
for any tag in any changelog text. In fact, it has changed a couple
of times in the last couple of weeks.

-Wstringop-overflow will soon be disabled for GCC 11 by default. So,
this patch is unnecessary. I'll probably commit a patch for this next
week. :)

Thanks
--
Gustavo


