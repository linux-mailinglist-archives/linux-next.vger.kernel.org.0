Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899942D6E83
	for <lists+linux-next@lfdr.de>; Fri, 11 Dec 2020 04:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395046AbgLKDY4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 22:24:56 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56384 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731311AbgLKDYb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 22:24:31 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BB3BwEl061205;
        Fri, 11 Dec 2020 03:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=/0jt2e4Zd4vXzIHSGMFMCysmzRkn7VKS9uTJK+Cre5A=;
 b=TMgi7h/mJcRxJ7PRt1Rq+aZa33QULq17WjijYeu0e2dblQmQUnTeKBR1kxW+yJBLvqmm
 MT81EriHfG0EyrCrxKyoaRZ9oQY0BHZy2/Z3PaZvrwXVC/1wT9f57YmpbiLoM8HfauEE
 yYMG8KAT8wcXXe7eeuFReHEW4iPq0jTjjk/t7mbJBNwbQf47npPsXf1OWzhANBc1+U3V
 2D237ibz4tDpu0Dn+4Lxyv+zUJ8KyqEgIhos6xLJwCCgJNhkfjBP0JoCankfL5NPERWP
 /tgqOA7sktGik25OxTJ8Pw6vwYEaRzZxkgAfUfezR29Vdo4nwJqJQcpIEnvJLBHWUxe2 VQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 357yqc8may-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Dec 2020 03:23:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BB3AesU046809;
        Fri, 11 Dec 2020 03:23:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 358m42sgb6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Dec 2020 03:23:41 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BB3NZqA021437;
        Fri, 11 Dec 2020 03:23:38 GMT
Received: from char.us.oracle.com (/10.152.32.25)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 10 Dec 2020 19:23:35 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
        id 8BDA46A0121; Thu, 10 Dec 2020 22:25:39 -0500 (EST)
Date:   Thu, 10 Dec 2020 22:25:39 -0500
From:   Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To:     Ashish Kalra <Ashish.Kalra@amd.com>
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        bp@alien8.de
Subject: Re: [PATCH] x86,swiotlb: Fix build warning after merge of the
 SWIOTLB bounce buffer adjustment patch
Message-ID: <20201211032539.GA4970@char.us.oracle.com>
References: <20201211024533.29182-1-Ashish.Kalra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211024533.29182-1-Ashish.Kalra@amd.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110018
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110018
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Dec 11, 2020 at 02:45:33AM +0000, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> Need to add "inline" to swiotlb_adjust_size() when
> CONFIG_SWIOTLB is not defined.

I am just going to squash that in. Thanks.
> 
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  include/linux/swiotlb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 075748f367ea..e8074ff1b8c7 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -104,7 +104,7 @@ static inline bool is_swiotlb_active(void)
>  	return false;
>  }
>  
> -static void swiotlb_adjust_size(unsigned long new_size)
> +static inline void swiotlb_adjust_size(unsigned long new_size)
>  {
>  }
>  #endif /* CONFIG_SWIOTLB */
> -- 
> 2.17.1
> 
