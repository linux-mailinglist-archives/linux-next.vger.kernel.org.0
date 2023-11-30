Return-Path: <linux-next+bounces-157-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFC7FF927
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 19:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9CD51F20FF0
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 18:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB2F59162;
	Thu, 30 Nov 2023 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="npYD61bH"
X-Original-To: linux-next@vger.kernel.org
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FAC1B3
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 10:13:59 -0800 (PST)
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTPS
	id 8jDrrfKRRWcCI8lXwr4lqd; Thu, 30 Nov 2023 18:13:56 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 8lXvrMevphDny8lXwrqSjv; Thu, 30 Nov 2023 18:13:56 +0000
X-Authority-Analysis: v=2.4 cv=fda+dmcF c=1 sm=1 tr=0 ts=6568d0e4
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=8XV0R0IcXUXM6S+KMni/4w==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10
 a=PVSOBieIn8NgmMscb9EA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NjabATgC5jPAzirodaq7Hzl5wjX/HOiBM6z4A8/ofHw=; b=npYD61bHIit3EaU9YU6B6D3QyP
	dR28QobYNsmPh/4HUf1373dXGUamqZ/H0hpOjZwzfFCF4LhC2gXDumHe98GYw7abuGkYwi9a4YQtf
	Ru8Y5wLaM+rry2Ifd3gPfM+wQYs7BlcdpMGDaD5Nnwe4ClaiRWm3xm9x1IaIMXeo+vXantszVnrXU
	nw1FoLaIabOV/SnOcoySs0BeRIACKVoW5uDznGNYWZ6Iz11kBRroOD74G5rcVKgSAST8VRjXIOyM6
	fKb6yKqYmP1kAxGD+uLgBe0AJS1Ujn8m8q3hmWacfurlMucqM+DUYnWghg4VX9zcdS4GHqJVZqcw3
	3tOA6jXQ==;
Received: from 189.215.208.186.cable.dyn.cableonline.com.mx ([189.215.208.186]:12148 helo=[192.168.0.28])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r8lXv-00078V-0X;
	Thu, 30 Nov 2023 12:13:55 -0600
Message-ID: <6f275a31-7495-48c8-88a6-90a7bcf865b8@embeddedor.com>
Date: Thu, 30 Nov 2023 12:13:52 -0600
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
 <c3167ae2-fd98-4e68-9112-cfdfbb34b87b@embeddedor.com>
 <ZWjPEFMwEsVMwqZq@smile.fi.intel.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <ZWjPEFMwEsVMwqZq@smile.fi.intel.com>
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
X-Exim-ID: 1r8lXv-00078V-0X
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 189.215.208.186.cable.dyn.cableonline.com.mx ([192.168.0.28]) [189.215.208.186]:12148
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 11
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfG0k6UuB3bL05xZUtFwCgNonx8yNVBRhWoEB3spHAUt5dqn6NLyRJVllx2m1NKaAzbkHrgPRI/YptPzZPeqRBat6TMDTPk6i7djEO+MpRLWt5Qv3T3QA
 Lx6QmCB5msRoeFF5fZC6BhBk5gO8WbEcM1T8n6M9RD/+VLsuaxVG1VbyL0rx3ZkuMCO3kFrEcBXSYGLTdksfG/D1SE29+TqogZvcUouuL2edZT8rAnoyjA6v



On 11/30/23 12:06, Andy Shevchenko wrote:
> On Thu, Nov 30, 2023 at 12:04:28PM -0600, Gustavo A. R. Silva wrote:
>> On 11/30/23 11:50, Andy Shevchenko wrote:
>>> On Thu, Nov 30, 2023 at 07:48:46PM +0200, Andy Shevchenko wrote:
>>>> On Thu, Nov 30, 2023 at 09:52:42AM -0600, Gustavo A. R. Silva wrote:
>>>>> On 11/30/23 04:57, Wenyu Huang wrote:
> 
> ...
> 
>>> On top of that, Fixes tag is not enough to get it to stable. See the rules
>>> on how to submit a material to stable kernels, it's in the documentation.
>>
>> We are talking about different things. I'm talking about commit IDs staying
>> unchanged (stable commit IDs). That's different to stable kernels. :)
> 
> I see, but look at my answer to your previous email.
> 

Yes, we are on the same page.

Thanks
--
Gustavo

