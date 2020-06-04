Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145B91EDCD0
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 07:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgFDF64 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 01:58:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5674 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726104AbgFDF6z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 01:58:55 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0545WT7Y143073;
        Thu, 4 Jun 2020 01:58:15 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31efd5b3g0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Jun 2020 01:58:15 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0545oBWO000717;
        Thu, 4 Jun 2020 05:58:12 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma02dal.us.ibm.com with ESMTP id 31bf4a8j8a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Jun 2020 05:58:12 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0545wBgB44761534
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 4 Jun 2020 05:58:11 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BDAB4AE063;
        Thu,  4 Jun 2020 05:58:11 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D488AAE060;
        Thu,  4 Jun 2020 05:58:02 +0000 (GMT)
Received: from [9.85.152.111] (unknown [9.85.152.111])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu,  4 Jun 2020 05:58:02 +0000 (GMT)
Message-ID: <1591250278.9016.2.camel@abdul>
Subject: Re: [mainline][Oops][bisected 2ba3e6 ] 5.7.0 boot fails with kernel
 panic on powerpc
From:   Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To:     Joerg Roedel <jroedel@suse.de>
Cc:     sachinp <sachinp@linux.vnet.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        manvanth <manvanth@linux.vnet.ibm.com>,
        linux-next <linux-next@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
        akpm@linux-foundation.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hch <hch@lst.de>
Date:   Thu, 04 Jun 2020 11:27:58 +0530
In-Reply-To: <20200603133257.GL6857@suse.de>
References: <1591181457.9020.13.camel@abdul> <20200603133257.GL6857@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-04_01:2020-06-02,2020-06-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=913 phishscore=0 cotscore=-2147483648 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006040033
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2020-06-03 at 15:32 +0200, Joerg Roedel wrote:
> On Wed, Jun 03, 2020 at 04:20:57PM +0530, Abdul Haleem wrote:
> > @Joerg, Could you please have a look?
> 
> Can you please try the attached patch?

Thanks Joerg, The given patch fixes the boot problem.

Please add Reported-by in fix commit.

Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>

> 
> diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
> index 58046ddc08d0..afbab31fbd7e 100644
> --- a/include/asm-generic/5level-fixup.h
> +++ b/include/asm-generic/5level-fixup.h
> @@ -17,6 +17,11 @@
>  	((unlikely(pgd_none(*(p4d))) && __pud_alloc(mm, p4d, address)) ? \
>  		NULL : pud_offset(p4d, address))
> 
> +#define pud_alloc_track(mm, p4d, address, mask)					\
> +	((unlikely(pgd_none(*(p4d))) &&						\
> +	  (__pud_alloc(mm, p4d, address) || ({*(mask)|=PGTBL_P4D_MODIFIED;0;})))?	\
> +	  NULL : pud_offset(p4d, address))
> +
>  #define p4d_alloc(mm, pgd, address)		(pgd)
>  #define p4d_alloc_track(mm, pgd, address, mask)	(pgd)
>  #define p4d_offset(pgd, start)			(pgd)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 7e07f4f490cb..d46bf03b804f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2088,35 +2088,35 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
>  		NULL : pud_offset(p4d, address);
>  }
> 
> -static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
> +static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
>  				     unsigned long address,
>  				     pgtbl_mod_mask *mod_mask)
> -
>  {
> -	if (unlikely(pgd_none(*pgd))) {
> -		if (__p4d_alloc(mm, pgd, address))
> +	if (unlikely(p4d_none(*p4d))) {
> +		if (__pud_alloc(mm, p4d, address))
>  			return NULL;
> -		*mod_mask |= PGTBL_PGD_MODIFIED;
> +		*mod_mask |= PGTBL_P4D_MODIFIED;
>  	}
> 
> -	return p4d_offset(pgd, address);
> +	return pud_offset(p4d, address);
>  }
> 
> -#endif /* !__ARCH_HAS_5LEVEL_HACK */
> -
> -static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
> +static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
>  				     unsigned long address,
>  				     pgtbl_mod_mask *mod_mask)
> +
>  {
> -	if (unlikely(p4d_none(*p4d))) {
> -		if (__pud_alloc(mm, p4d, address))
> +	if (unlikely(pgd_none(*pgd))) {
> +		if (__p4d_alloc(mm, pgd, address))
>  			return NULL;
> -		*mod_mask |= PGTBL_P4D_MODIFIED;
> +		*mod_mask |= PGTBL_PGD_MODIFIED;
>  	}
> 
> -	return pud_offset(p4d, address);
> +	return p4d_offset(pgd, address);
>  }
> 
> +#endif /* !__ARCH_HAS_5LEVEL_HACK */
> +
>  static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
>  {
>  	return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?


-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



