Return-Path: <linux-next+bounces-154-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B387FF905
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 19:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C306B21118
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 18:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1A75677D;
	Thu, 30 Nov 2023 18:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="PJ6JiSRb"
X-Original-To: linux-next@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D3D10D9
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 10:04:32 -0800 (PST)
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTPS
	id 8irHrJ0vK8Hte8lOqrmimV; Thu, 30 Nov 2023 18:04:32 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 8lOprBaWW0xkr8lOprbpM7; Thu, 30 Nov 2023 18:04:31 +0000
X-Authority-Analysis: v=2.4 cv=N7U6qkxB c=1 sm=1 tr=0 ts=6568ceaf
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=8XV0R0IcXUXM6S+KMni/4w==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10
 a=fa1ft06VDggV8PKGu0QA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UIrw8mPmKxRewSnqZF1Z5qtHPBEGCfslbycsdPU0pvk=; b=PJ6JiSRbvQou1dDcs8kwpfAiyl
	BA2lcL6e6oN0F06vz6QlHEzA72qaEVNgW2bR/laH7280WxW/vktQ1VcemY21E7bqp0kkNs1eW1f9g
	1gIrm7lCt55LpHXcVeC/jSxWTSINmrKy6yp0fD+5CUovpP4EayTTCTFfnH5CidWdSyHU3tFHKRxx8
	J6TyecUNg4rur8egWNsaePQqbq71kw32btau8vYDrFHCo/lAI8aSeYe55ncNXnIOar8Urh76nmicK
	oZdlEO+Kg/DU2+G6g7x/NT9KLdTwC7jt/ZqV+sJKUqCPol+Kuge6XiSsJhjyUsFY5flXKuKG40MqQ
	hqHirOCQ==;
Received: from 189.215.208.186.cable.dyn.cableonline.com.mx ([189.215.208.186]:21783 helo=[192.168.0.28])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r8lOo-004KwP-2L;
	Thu, 30 Nov 2023 12:04:30 -0600
Message-ID: <c3167ae2-fd98-4e68-9112-cfdfbb34b87b@embeddedor.com>
Date: Thu, 30 Nov 2023 12:04:28 -0600
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
 <ZWjK_UX6skFwECNi@smile.fi.intel.com> <ZWjLehXvSPGm_gre@smile.fi.intel.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <ZWjLehXvSPGm_gre@smile.fi.intel.com>
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
X-Exim-ID: 1r8lOo-004KwP-2L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 189.215.208.186.cable.dyn.cableonline.com.mx ([192.168.0.28]) [189.215.208.186]:21783
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJLjoOCgxgYldLo0zmTOJUlqspIa8gH1yEVrZ70BOGwhnM8F82+k4lMZ9LsVHjJphmHDp1ShfZwrKWjBk6e1KiTlgMQ20mzmsZ0Vwe9/bovJlEuoqovm
 OSEFBUUgLqnOvmB60dqV1+Y2t8DqcSFH8bklINs2J9K4PO5HHipiDLq9tBYyI1hQaYA4slhwlhZ1jE19m2QStcigF6I4yUVhFdBLf5+J8Uh7UoJxL4WoRVM7



On 11/30/23 11:50, Andy Shevchenko wrote:
> On Thu, Nov 30, 2023 at 07:48:46PM +0200, Andy Shevchenko wrote:
>> On Thu, Nov 30, 2023 at 09:52:42AM -0600, Gustavo A. R. Silva wrote:
>>> On 11/30/23 04:57, Wenyu Huang wrote:
> 
> ...
> 
>>>> Fixes: 89741e7e42f6 ("Makefile: Enable -Wstringop-overflow globally")
>>>
>>> The commit ID is from a patch that's currently in linux-next, which
>>> does not guarantee it's a stable commit. So, it shouldn't be used
>>> for any tag in any changelog text. In fact, it has changed a couple
>>> of times in the last couple of weeks.
>>
>> I disagree on this in general.
>>
>> The case in practice I have. I does something in new cycle that broke the
>> enumeration of some devices. The patch is in the maintainer's tree pending
>> for the next release (v6.8-rc1). There are I see two options:
>> - revert patch completely and redo it properly
>> - add a fix (which is one liner)
>>
>> Now, what you are suggesting is to drop the Fixes tag on the grounds that
>> the culprit and the fix are to be in the same release (as we go let's say
>> with the latter approach). In case that the culprit will be backported
>> (let's say to satisfy dependencies, as per se it's not a fix), it will
>> bring a regression and become unnoticed for some time until first reports
>> will appear. Additional resources would be need for all this.
>>
>> So, I'm fully in favour of using Fixes tag as it makes clear if we have
>> some broken changes in the kernel for which the fix is known and exists.
> 
> On top of that, Fixes tag is not enough to get it to stable. See the rules
> on how to submit a material to stable kernels, it's in the documentation.

We are talking about different things. I'm talking about commit IDs staying
unchanged (stable commit IDs). That's different to stable kernels. :)

--
Gustavo

