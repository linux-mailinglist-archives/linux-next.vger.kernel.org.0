Return-Path: <linux-next+bounces-715-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E185A82A36F
	for <lists+linux-next@lfdr.de>; Wed, 10 Jan 2024 22:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9125C2895AC
	for <lists+linux-next@lfdr.de>; Wed, 10 Jan 2024 21:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA084F602;
	Wed, 10 Jan 2024 21:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="bswW/z/V"
X-Original-To: linux-next@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03384F5FB
	for <linux-next@vger.kernel.org>; Wed, 10 Jan 2024 21:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id NWJXrdjb7MVQiNgI1r3uXm; Wed, 10 Jan 2024 21:39:09 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id NgHzrNEKWKleDNgI0r2EFV; Wed, 10 Jan 2024 21:39:08 +0000
X-Authority-Analysis: v=2.4 cv=KcbBDCUD c=1 sm=1 tr=0 ts=659f0e7c
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=dEuoMetlWLkA:10 a=wYkD_t78qR0A:10
 a=8QZFKcEgNozHmhM6A3IA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ikwnzEJu2M0+m4lkcWw1qB9XSjz76xb4QlquZPT3Wrk=; b=bswW/z/VN9kLFmCQrsSuW6WyDM
	HI3dufIk1DrX5PQd0lkL9feZocOieM3lUAAeiZYtmh8mvn0zCaocZguH8wqw0A87Lc5Hr2A9+5kcS
	Be7WEYyWICojC7wKiPVRrTqQ7bK4qteNFM7KMIqEtCQx6uHE3cj9uj39RpCQDAIDOpWgsa9rD4kju
	169VcYGZ4LDFKtq/L/VEyFTy5tOEvvbNqQcxa6vRpeVOHLOrgzauQl7CgbmN3ZVDgAtu5KLdCiLe0
	K0zumY0ROxYaJ/O2PvJg53Z3q/EAdak+CEuSFulLPUYuIRFOSeTkGfahK9OaG/Uj4Bd0w+lhdzv/k
	zlGUpjbg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:54016 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rNgHz-003ZrY-1S;
	Wed, 10 Jan 2024 15:39:07 -0600
Message-ID: <e4234695-7f1e-4f1d-86d3-3f22ae8956b7@embeddedor.com>
Date: Wed, 10 Jan 2024 15:38:43 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the kspp-gustavo tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240111082350.5aca9bef@canb.auug.org.au>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240111082350.5aca9bef@canb.auug.org.au>
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
X-Exim-ID: 1rNgHz-003ZrY-1S
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:54016
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKDh2BnE3MwUpLIldJcK5Pqi4PcxXDPQaMIxldgmxxQc4pVCQ2UZJcCcE6lw3LnYiL2x8Nt0j8Rvx95RpKkjoLdrikVBB4dBbf4pit5zRtT4S8xPJOVA
 BefqBAAnT2/7diqUnrEJyy84d0RES+oS8e6Bt2P0fEvNF95wSV+K81AcuTn0wqo4+5ysyI0/RfPhr6YPoGcWA2YsLH2UDy1THUOP0Y33pGgBpanJhkuQI9Or

Hi Stephen,

On 1/10/24 15:23, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>    e5c35432f91c ("powerpc/crypto: Avoid -Wstringop-overflow warnings")
> 
> This is commit
> 
>    aaa03fdb56c7 ("crypto: p10-aes-gcm - Avoid -Wstringop-overflow warnings")
> 
> in Linus' tree.
> 

Thanks a lot for the report.

--
Gustavo

