Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8E8B173C10
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2020 16:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgB1Pp5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Feb 2020 10:45:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65222 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727095AbgB1Pp5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 28 Feb 2020 10:45:57 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01SFZgHh059440
        for <linux-next@vger.kernel.org>; Fri, 28 Feb 2020 10:45:56 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2yepwu2x18-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 28 Feb 2020 10:45:56 -0500
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Fri, 28 Feb 2020 15:45:53 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 28 Feb 2020 15:45:48 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 01SFioZe35717538
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Feb 2020 15:44:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5F4D752051;
        Fri, 28 Feb 2020 15:45:47 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.11.131])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A345552050;
        Fri, 28 Feb 2020 15:45:46 +0000 (GMT)
Date:   Fri, 28 Feb 2020 16:45:44 +0100
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     linux-next@vger.kernel.org, akpm@linux-foundation.org
Cc:     borntraeger@de.ibm.com, david@redhat.com, aarcange@redhat.com,
        linux-mm@kvack.org, frankja@linux.ibm.com, sfr@canb.auug.org.au,
        jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: Re: [RFC v1 1/2] fixup for 9947ea2c1e608e32669d5caeb67b3e3fba3309e8
 "mm/gup: track FOLL_PIN pages"
In-Reply-To: <20200228154322.329228-2-imbrenda@linux.ibm.com>
References: <20200228154322.329228-1-imbrenda@linux.ibm.com>
        <20200228154322.329228-2-imbrenda@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20022815-4275-0000-0000-000003A66629
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022815-4276-0000-0000-000038BAFC16
Message-Id: <20200228164544.6360f17e@p-imbrenda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-28_04:2020-02-28,2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280124
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

sorry, this one was a mistake, please ignore


On Fri, 28 Feb 2020 16:43:20 +0100
Claudio Imbrenda <imbrenda@linux.ibm.com> wrote:

> in case pin fails, we need to unpin, just a put_page will not be
> enough
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>  mm/gup.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index f589299b0d4a..0b9a806898f3 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2134,7 +2134,10 @@ static int gup_pte_range(pmd_t pmd, unsigned
> long addr, unsigned long end, goto pte_unmap;
>  
>  		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
> -			put_page(head);
> +			if (flags & FOLL_GET)
> +				put_page(head);
> +			else if (flags & FOLL_PIN)
> +				unpin_user_page(head);
>  			goto pte_unmap;
>  		}
>  

