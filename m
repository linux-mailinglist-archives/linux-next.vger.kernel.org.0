Return-Path: <linux-next+bounces-50-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2837F6A18
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 02:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93DE62813FE
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 01:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C46625;
	Fri, 24 Nov 2023 01:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="LMKE00oI"
X-Original-To: linux-next@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF5BD50
	for <linux-next@vger.kernel.org>; Thu, 23 Nov 2023 17:23:37 -0800 (PST)
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTPS
	id 6At6rhUPk8Hte6KuurlgIA; Fri, 24 Nov 2023 01:23:36 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 6KutrUHnchDny6KutrEg0Z; Fri, 24 Nov 2023 01:23:36 +0000
X-Authority-Analysis: v=2.4 cv=fda+dmcF c=1 sm=1 tr=0 ts=655ffb18
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=yGeM7+xMb5a5VK1DGQx1ew==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10
 a=hy65s6PCVsRWhxaC_Y0A:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Xce5fXDshzVqJJD4AIumwGg26b48GuDNWNLxAdAWO74=; b=LMKE00oIG3u2KsxJv+PLCD9Yv2
	TI+u3cUJvVXVATHU2mXt26gL1aCjCT/9TGQZqHN9yxSQ9gmb1zoIW6AhHKNbfKdFbKvZE/DHn7dQO
	UicQOTYc+oqzwCvfM62Jktp/7Hzj66ZbIralhoP5V5ezgrq4RRnn2UuTGbBpjHe9ym2w+Zwpy6pjl
	9BzSK4uBLzyfNUi5XEqTk+x6z9rVjM1v2YNgt8GNFc79s2WPfHdo4oe+HtfP1DUOczQLFbbt7YaIH
	x9zCy59JJfig21czpfmh0XaBYL2ikB4hZ2jU2CTjfMv5ia4NTRnbOi2lXnXDuD5iWzorhjIEJRcAE
	fW4OLnfw==;
Received: from 187.184.157.122.cable.dyn.cableonline.com.mx ([187.184.157.122]:58578 helo=[192.168.0.25])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r6Kut-001U4W-0D;
	Thu, 23 Nov 2023 19:23:35 -0600
Message-ID: <17b92a96-f197-49f5-a040-35b65adae70a@embeddedor.com>
Date: Thu, 23 Nov 2023 19:23:27 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the kspp-gustavo tree
To: "Aithal, Srikanth" <sraithal@amd.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231122144814.649823ac@canb.auug.org.au>
 <813f3aa2-3449-7264-fa54-eaafd9981add@amd.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <813f3aa2-3449-7264-fa54-eaafd9981add@amd.com>
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
X-Exim-ID: 1r6Kut-001U4W-0D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.157.122.cable.dyn.cableonline.com.mx ([192.168.0.25]) [187.184.157.122]:58578
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPUYrWUd5eJhAymP+MLF0x8H0ixk7VhaTO2nR0iFb9H/o/P545mAlIboTbu5lvW2OekIOOnJE6RWlQGq9+pHj3uALkiRUA/cIkN16B45YIkXiVQYbsvH
 1ko2eQUDd1kvOJfsriDzUK5B3+sMAhtOcqpxTV1VOfwfCW93iY66lRwRwOIMcvG8aI5nsn9WpFc+dN0Dc2bqfFFFATQCmO0BC3blQPalCQh+KgVGeR78lM/q
X-Spam-Level: *


> which version of gcc resolves this issue?

GCC 12.1.0

--
Gustavo

