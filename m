Return-Path: <linux-next+bounces-14-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB067F3A39
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 00:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B766D1C20A65
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 23:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850305101D;
	Tue, 21 Nov 2023 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="PHQ2S9kS"
X-Original-To: linux-next@vger.kernel.org
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D71E97
	for <linux-next@vger.kernel.org>; Tue, 21 Nov 2023 15:23:19 -0800 (PST)
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id 5V3hrCZYrKOkL5a5Orcjpo; Tue, 21 Nov 2023 23:23:18 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 5a5NrE64397pz5a5Or49cv; Tue, 21 Nov 2023 23:23:18 +0000
X-Authority-Analysis: v=2.4 cv=ULDOoQTy c=1 sm=1 tr=0 ts=655d3be6
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=_Wotqz80AAAA:8
 a=VwQbUJbxAAAA:8 a=ZDCJzDVboqx1uGGEYfQA:9 a=QEXdDO2ut3YA:10
 a=buJP51TR1BpY-zbLSsyS:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9TTVj2r9ym3H/3Y5iMg4QwMLFGalkbg7SD2uX0LagwM=; b=PHQ2S9kS1qGOr037HiUuQzx1UD
	pynpFI9nXM/kkynVNGdYCjMcFSRDK9Z4Ji+qobkRVM/qzmLxjq/aXeLlpaYgLhqkj/eNY/PRkzGZD
	5lr3XrDMSU6v6GRsnR7AcIoqnACaQJDUaQgoD3E1yHwCrWuOm9lwRenl+pueOPYVhteJtFyAJs41c
	nsPCZpY5F1NzRECyS69g3CWo0/6iSgiqIMGij71D5RCQbrGSaZInqgkIGOnxBTdFPe1UsqmB8JCzn
	3nVRc3IANVaO6LX+ZvHD7rVt1MDvOk/mKqpmOcfk05Ugy4wzuarf4VDGEtSQEJlWeHExRvykJvFR/
	aGNe4d9Q==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:39860 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r5a5N-000AhK-1E;
	Tue, 21 Nov 2023 17:23:17 -0600
Message-ID: <37ad0c83-4ea7-4707-bd90-3a0c08cc028b@embeddedor.com>
Date: Tue, 21 Nov 2023 17:23:16 -0600
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
Cc: Kalle Valo <kvalo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231122094739.38465ed3@canb.auug.org.au>
 <9d3b74ec-4a92-4304-b8ee-5f70711666bc@embeddedor.com>
 <20231122101928.55737aac@canb.auug.org.au>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231122101928.55737aac@canb.auug.org.au>
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
X-Exim-ID: 1r5a5N-000AhK-1E
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:39860
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCrOJBFI5f1o+ZdFYFxpoG9YXuqXcfw6pmoDt/CNBr2p6sHbuj/iE8wcnA3GCjUb2DWrfdgk2eSw2lwA+zygWQV5RLk7P7O8Jh1M+Dk5YPanLXI9TUxp
 q5J7fiKoLqJGvRHyvTcRhHS8hyu89swGhKc2lX8P1LbUii0RTbwkMr4v6Z1l/Um0FnM16dTTs6vcaa7cnPE3P3+YJYGaWbAKz30L7FC5S/4MRMCARLOZ1MdW



On 11/21/23 17:19, Stephen Rothwell wrote:
> Hi Gustavo,
> 
> On Tue, 21 Nov 2023 17:07:32 -0600 "Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:
>>
>> The fix for that shows up in linux-next already:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ca76817f4c4bbf8f98268772f4eeea8382a34bcd
> 
> OK, so if maintainers are putting fixes exposed by this change into
> their own trees, I need to merge your tree last then ...
> 

Yep; that seems to be the right way to go. :)

Thank you!
--
Gustavo

