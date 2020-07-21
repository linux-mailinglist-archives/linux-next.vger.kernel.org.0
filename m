Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC6D2286C9
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 19:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbgGURFv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 13:05:51 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:36932 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730120AbgGURFv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2020 13:05:51 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06LGlQAi131749;
        Tue, 21 Jul 2020 17:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=U8rsu8OEcOF6ZyhEIv1vKXBX17S62Qnhb7hHFJSUhuo=;
 b=bsxsVR7l1RDpCsrDB7Jj19d/QM2y4YQZOwOkemAh+qYE4eQ7ZBhtNoqTQVMnt88459cL
 t7JjMg9G7uxgMt620eCRkNh9SKuWyi8PgayDQoqRVq1/z+e3WAPOQT7wGHeGsPHoQZhq
 z02DqTIdyvYXhL5fsLR12aOTr5gin2dHzfiWLqrcJtjvh4HKZYvmVeiqh0EYqJOIx/nX
 cQYanUxfadgM35I2A2PGdpsBpY9V9kGacLprllG98vfxhuYq2HxV3hQOBIcgCRWYsFDs
 h5grdeahCkxej6oE92wvYqhglnIeZoxsCETgGmJ/+HzxSPFebmBqXWGNpUK864kw6Ylb Lg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 32bs1megjs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Jul 2020 17:05:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06LGm3b9125264;
        Tue, 21 Jul 2020 17:05:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 32e3vehune-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jul 2020 17:05:26 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06LH5Nlj013809;
        Tue, 21 Jul 2020 17:05:23 GMT
Received: from [192.168.2.112] (/50.38.35.18)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 21 Jul 2020 17:05:23 +0000
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Roman Gushchin <guro@fb.com>
References: <20200721205716.6dbaa56b@canb.auug.org.au>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <e921bf90-d1f5-3795-478b-4cfae9086749@oracle.com>
Date:   Tue, 21 Jul 2020 10:05:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200721205716.6dbaa56b@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=2
 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9689 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210115
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/21/20 3:57 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build
> (sparc64 defconfig) failed like this:
> 
> mm/hugetlb.c: In function 'free_gigantic_page':
> mm/hugetlb.c:1233:18: error: 'hugetlb_cma' undeclared (first use in this function); did you mean 'hugetlb_lock'?
>       cma_release(hugetlb_cma[page_to_nid(page)], page, 1 << order))
>                   ^~~~~~~~~~~
>                   hugetlb_lock
> 
> Caused by commits
> 
>   ee0889218f26 ("mm/hugetlb: avoid hardcoding while checking if cma is enabled")
>   8729fda59982 ("mm-hugetlb-avoid-hardcoding-while-checking-if-cma-is-enabled-fix")
> 
> I have added this patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 21 Jul 2020 20:44:57 +1000
> Subject: [PATCH] mm/hugetlb: better checks before using hugetlb_cma
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks Stephen, sorry for missing that in review.

Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
-- 
Mike Kravetz

> ---
>  mm/hugetlb.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 4b560c7555e7..4645f1441d32 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1229,9 +1229,10 @@ static void free_gigantic_page(struct page *page, unsigned int order)
>  	 * If the page isn't allocated using the cma allocator,
>  	 * cma_release() returns false.
>  	 */
> -	if (IS_ENABLED(CONFIG_CMA) &&
> -	    cma_release(hugetlb_cma[page_to_nid(page)], page, 1 << order))
> +#ifdef CONFIG_CMA
> +	if (cma_release(hugetlb_cma[page_to_nid(page)], page, 1 << order))
>  		return;
> +#endif
>  
>  	free_contig_range(page_to_pfn(page), 1 << order);
>  }
> @@ -1242,7 +1243,8 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
>  {
>  	unsigned long nr_pages = 1UL << huge_page_order(h);
>  
> -	if (IS_ENABLED(CONFIG_CMA)) {
> +#ifdef CONFIG_CMA
> +	{
>  		struct page *page;
>  		int node;
>  
> @@ -1256,6 +1258,7 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
>  				return page;
>  		}
>  	}
> +#endif
>  
>  	return alloc_contig_pages(nr_pages, gfp_mask, nid, nodemask);
>  }
> 
