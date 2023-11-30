Return-Path: <linux-next+bounces-153-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0927FF8E3
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 18:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 211C9B20DBD
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 17:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7653A584C9;
	Thu, 30 Nov 2023 17:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="BUAy9WjN"
X-Original-To: linux-next@vger.kernel.org
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC30131
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 09:56:34 -0800 (PST)
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
	by cmsmtp with ESMTPS
	id 8jSErfPRBWcCI8lH7r4Zxe; Thu, 30 Nov 2023 17:56:33 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 8lH6rprCFkUbt8lH6rj5Bd; Thu, 30 Nov 2023 17:56:32 +0000
X-Authority-Analysis: v=2.4 cv=WpU4jPTv c=1 sm=1 tr=0 ts=6568ccd0
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=8XV0R0IcXUXM6S+KMni/4w==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10
 a=5pUdmbC4H_Li8H7PXGEA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NDj5FbrGydGegUkvTDeNdFEISqMjV0+MxTv6KupUKV8=; b=BUAy9WjNlLCGT4/uJ8YXANhMRM
	7SszS5r39g3kQv4OmvC7XN88n1aEiA5fJ+6t7AHjxMlEf9Zo4GjAKFb59GcIzARC+8oeucaP4o9Rk
	ofmSdmO93l6KG7GU9VzIRIdXWWMZX6/lAEtp9MVqqgOLkIxgaoD9ZEDO9uvVabLhluEG4+c+r1FT+
	R+/10Kz1hK3zqPO97QiMBmFu7U8zd8doNB0OVAD5pnExO0F2wthh5SNNduLRri2VBPVttvz3YvwW+
	0OM2O8sEvTEnO9yCnqpAryXWopN8Qc/rXS9oEjbDp0QOCvunp+f53Q7IFRbkMPvMIrEw+8JdC7+0w
	blHu/Mow==;
Received: from 189.215.208.186.cable.dyn.cableonline.com.mx ([189.215.208.186]:61564 helo=[192.168.0.28])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r8lH5-004AuF-1j;
	Thu, 30 Nov 2023 11:56:31 -0600
Message-ID: <508507b2-be1d-403a-876e-f49f5d0a2a49@embeddedor.com>
Date: Thu, 30 Nov 2023 11:56:29 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] Fix the build failed caused by -Wstringop-overflow
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wenyu Huang <huangwenyu5@huawei.com>, pmladek@suse.com,
 rostedt@goodmis.org, linux@rasmusvillemoes.dk, senozhatsky@chromium.org,
 akpm@linux-foundation.org, linux-next@vger.kernel.org, gustavoars@kernel.org
References: <20231130105741.2849670-1-huangwenyu5@huawei.com>
 <730544ae-1e7f-4622-b986-839f81e60384@embeddedor.com>
 <ZWjK_UX6skFwECNi@smile.fi.intel.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <ZWjK_UX6skFwECNi@smile.fi.intel.com>
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
X-Exim-ID: 1r8lH5-004AuF-1j
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 189.215.208.186.cable.dyn.cableonline.com.mx ([192.168.0.28]) [189.215.208.186]:61564
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHk3CuWQM5UCE0yuLXu84m+d9xaoF3J0bRPbJ9XDPvbNN1tIkTG/KXTdMiYvkxJDiz0w6tQoMvMMc99lMl0EyNxVesPYyIgi83UXLJXjyRW83sdKbMIV
 JyrrbyL4jgrbD+sxjhyKC70pdWAhc7P59jOb3/J2uCkStDKaPcPwoQbOXZV1OF1fXHDIu8hHzzcg0coCJe5PeERR2Nj3VvfcdrQhA64qXxk7OBHUl5KMNGoR



On 11/30/23 11:48, Andy Shevchenko wrote:
> On Thu, Nov 30, 2023 at 09:52:42AM -0600, Gustavo A. R. Silva wrote:
>> On 11/30/23 04:57, Wenyu Huang wrote:
> 
> ...
> 
>>> Fixes: 89741e7e42f6 ("Makefile: Enable -Wstringop-overflow globally")
>>
>> The commit ID is from a patch that's currently in linux-next, which
>> does not guarantee it's a stable commit. So, it shouldn't be used
>> for any tag in any changelog text. In fact, it has changed a couple
>> of times in the last couple of weeks.
> 
> I disagree on this in general.
> 
> The case in practice I have. I does something in new cycle that broke the
> enumeration of some devices. The patch is in the maintainer's tree pending
> for the next release (v6.8-rc1). There are I see two options:
> - revert patch completely and redo it properly
> - add a fix (which is one liner)
> 
> Now, what you are suggesting is to drop the Fixes tag on the grounds that
> the culprit and the fix are to be in the same release (as we go let's say
> with the latter approach). In case that the culprit will be backported
> (let's say to satisfy dependencies, as per se it's not a fix), it will
> bring a regression and become unnoticed for some time until first reports
> will appear. Additional resources would be need for all this.
> 
> So, I'm fully in favour of using Fixes tag as it makes clear if we have
> some broken changes in the kernel for which the fix is known and exists.

I'm fully in favor, as well. :)

I'm talking about patches in linux-next, exclusively.

--
Gustavo




