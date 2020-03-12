Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24587183681
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 17:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgCLQsQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 12:48:16 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:37538 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgCLQsQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2020 12:48:16 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CGi5iM183139;
        Thu, 12 Mar 2020 16:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=WrMmx2DDsTqMo/jYyhxelBCY3lDUc+W1B/z+/bIn6zc=;
 b=SdKeG9d8850Zg/StyrlJHSQH/HWmkR1zRpT/1J8fOcltDvJULts1C2eMurOhvFUnqp5M
 6h5qX1P7ZpTt5xi+CaZTEnNDMMEDZ9d/wK6V1OgU8nolAieaxT5w7V4JwVjAWMWcnM0U
 RdGZmA/FacQ+lqIH4H9ritW1Wv8oSWVXA9tzB1yKe5xT5Kl8NYZF6m2USIqPC3i7m8AH
 n2XGIWOdpArOVg+I7dSmT68Q0rRXIIENhj2jsX19seO0Vj+uCRip16qfpxsijP31S0fI
 3suhf7P8ZkxDBYeDJ7G7IJ2VzjqeBbn0w39AGgd8IknawHW3qKz+LV4UR83A40deXTkv ng== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2yqkg89ybk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Mar 2020 16:48:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CGm6gW048560;
        Thu, 12 Mar 2020 16:48:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2yqgvdat68-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Mar 2020 16:48:06 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02CGm1sL006874;
        Thu, 12 Mar 2020 16:48:01 GMT
Received: from [192.168.1.206] (/71.63.128.209)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 12 Mar 2020 09:48:01 -0700
Subject: Re: linux-next: build warning after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200312183142.108df9ac@canb.auug.org.au>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <4e163fd8-4d76-4bdf-daea-4d0ae7eb78f7@oracle.com>
Date:   Thu, 12 Mar 2020 09:48:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312183142.108df9ac@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9558 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9558 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120084
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/12/20 12:31 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/hugetlbfs/inode.c: In function 'remove_inode_hugepages':
> fs/hugetlbfs/inode.c:460:44: warning: 'hash' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   460 |     mutex_unlock(&hugetlb_fault_mutex_table[hash]);
>       |                                            ^
> fs/hugetlbfs/inode.c:463:5: warning: 'index' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   463 |     hugetlb_vmdelete_list(&mapping->i_mmap,
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   464 |      index * pages_per_huge_page(h),
>       |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   465 |      (index + 1) * pages_per_huge_page(h));
>       |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   6fdc8f8d1781 ("hugetlbfs: use i_mmap_rwsem to address page fault/truncate race")
> 

This is a false positive.  However, there are more serious issues with this
patch series as reported here:
https://lore.kernel.org/linux-mm/1584028670.7365.182.camel@lca.pw/

I'm working on the issue, but these may need to be reverted if I can not come
up with a solution quickly.  So, I am ignoring the false positive warning
until the more serious issue is resolved.
-- 
Mike Kravetz
