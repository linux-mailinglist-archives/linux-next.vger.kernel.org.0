Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5353C3AB696
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 16:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbhFQO6O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 10:58:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56854 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230299AbhFQO6N (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 10:58:13 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HEXsAu120967;
        Thu, 17 Jun 2021 10:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ZDrMf1r8Kl8gPUV4ySfa2nQ/MPIpUbeuBPOOaQuDwI4=;
 b=QL5yStQeDXXxRRJu4EmrY9DZQjuEKj5FpFMjWmZWgNGMPkZqy2rxvEL4WMTIv+N2ufZb
 brzzKp4igNJ2WPxwJTMVMVN489JGtYmslEnsaTlrTMwoj2/413gRqBM6ZJYtlTXEsH04
 0zl9csWTWYDzG2K1IQWoP69ATr06lDJ4ETaz7dwoEFi3ifOz/2V+DQVNxbisFwAOPUg/
 BIlOSehSm1azCNiYq0uBrW+/zlZrIaHcy1TWzcolHJCyJPsuEgG927N2hbsRmjMqeM1C
 zxx6ywGO1dOABMvGiIauF9GT8QmMBjhc8/TlYDIq9JtvFe/yYgTGfpKKu+fChUiw5h7J sw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39886p0xen-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Jun 2021 10:55:51 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HEYNQT125265;
        Thu, 17 Jun 2021 10:55:50 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39886p0xdp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Jun 2021 10:55:50 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HEqWBu029030;
        Thu, 17 Jun 2021 14:55:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma03ams.nl.ibm.com with ESMTP id 394mj8tse9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Jun 2021 14:55:48 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15HEsdIf17695074
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Jun 2021 14:54:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7439A4C044;
        Thu, 17 Jun 2021 14:55:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 04E684C052;
        Thu, 17 Jun 2021 14:55:45 +0000 (GMT)
Received: from osiris (unknown [9.145.177.22])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 17 Jun 2021 14:55:44 +0000 (GMT)
Date:   Thu, 17 Jun 2021 16:55:43 +0200
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        lkft-triage@lists.linaro.org,
        open list <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [next] [clang] s390: clang: error: unable to execute command:
 Segmentation fault (core dumped)
Message-ID: <YMtib5hKVyNknZt3@osiris>
References: <CA+G9fYsn-3rZXkHTtH33Oo0y97nfgkQmR_Echbu_-=WAbfo4Ug@mail.gmail.com>
 <CA+G9fYu2SvwA7CDxTAJVdTi1K1267WDcdx9m6Ds6z0D3borthQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYu2SvwA7CDxTAJVdTi1K1267WDcdx9m6Ds6z0D3borthQ@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WBdfFuvlbg97OnFmhWMVfxvlf1l2TOe7
X-Proofpoint-GUID: xsoFTxNvHHuKnwov2YPuHH_-U_2djiiw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-17_10:2021-06-15,2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106170092
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 17, 2021 at 06:19:14PM +0530, Naresh Kamboju wrote:
> The git bisect found the first bad commit,
> The first bad commit:
> commit 3abbdfde5a6588a92209cd8b131769b8058e7c21
> Author: Heiko Carstens <hca@linux.ibm.com>
> Date:   Wed Jun 9 22:59:13 2021 +0200
>     s390/bitops: use register pair instead of register asm
> 
>     Get rid of register asm statement and use a register pair.
>     This allows the compiler to allocate registers on its own.
> 
>     Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
>     Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
>  arch/s390/include/asm/bitops.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> Previous HEAD position was 3abbdfde5a65 s390/bitops: use register pair
> instead of register asm
> HEAD is now at 7d9c6b8147bd Add linux-next specific files for 20210617

You need clang-13 development version which contains commit
d058262b1471 ("[SystemZ] Support i128 inline asm operands.").
Every older clang version won't be able to complile the kernel for
s390 anymore.

This is intended and won't be fixed.
