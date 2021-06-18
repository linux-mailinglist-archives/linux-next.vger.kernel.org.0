Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F1D3AC660
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 10:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbhFRIo7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Jun 2021 04:44:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59708 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233622AbhFRIo5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Jun 2021 04:44:57 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15I8X1ts086417;
        Fri, 18 Jun 2021 04:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=WbzSnA8nbxcmk/DChKVe5ctPYDstqZgdtPrr/A1odZk=;
 b=anGd94GRoGP3ejjfGZmoGJuEgtrxm+2O4ND8aiBWc8oAKKC+NzQ34O5BkUwrh6Llmx71
 t/AR94zUihUiwvxsa9rPeIRZY3jf0Qq4DuxKqSrY5H4FXseQV7OgmumUjRRa6MFDoZ9T
 1U8DBukm1pAP2+O6FGOYuB9JeURR2UKUm+t8ehEgEGVhfHbNEAUmYLJpDhVQJB8NeM/x
 0qwjJZhgE9y9xSgbxg/bVrDYW5TBLCPqGpKfOPlVJ8KdBxO5V7Ck+/VeqzNYHZw/MQy4
 0gdph09Hf5aO4m5xO29TEfR57uGkTT0pSiu+Xazr634cg1tuCfJtHI74T16Fp9E67QlD gA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 398nvavcqj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Jun 2021 04:42:39 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15I8X3fC086574;
        Fri, 18 Jun 2021 04:42:38 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 398nvavcpj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Jun 2021 04:42:38 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15I8Wsr6015449;
        Fri, 18 Jun 2021 08:42:35 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma04ams.nl.ibm.com with ESMTP id 394mj8u6mj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Jun 2021 08:42:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15I8gWB624117562
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 08:42:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9584B52052;
        Fri, 18 Jun 2021 08:42:32 +0000 (GMT)
Received: from osiris (unknown [9.145.4.27])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 154A75204E;
        Fri, 18 Jun 2021 08:42:32 +0000 (GMT)
Date:   Fri, 18 Jun 2021 10:42:30 +0200
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-s390@vger.kernel.org, linux-next@vger.kernel.org,
        lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] scripts/min-tool-version.sh: Raise minimum clang version
 to 13.0.0 for s390
Message-ID: <YMxcdv/1taBevSjP@osiris>
References: <YMtib5hKVyNknZt3@osiris>
 <20210617193139.856957-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617193139.856957-1-nathan@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4bCbJ863SOOjvOHDFC_wa6hO-bo1QLk6
X-Proofpoint-ORIG-GUID: xW4I_Z0qNkRAMI_ghInzYLw6jUTbad0d
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-18_04:2021-06-15,2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106180048
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 17, 2021 at 12:31:40PM -0700, Nathan Chancellor wrote:
> clang versions prior to the current development version of 13.0.0 cannot
> compile s390 after commit 3abbdfde5a65 ("s390/bitops: use register pair
> instead of register asm") and the s390 maintainers do not intend to work
> around this in the kernel. Codify this in scripts/min-tool-version.sh
> similar to arm64 with GCC 5.1.0 so that there are no reports of broken
> builds.
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> This should probably go through the s390 tree with Masahiro's ack.

Thank's a lot!

I'll add the below text to the commit message, and apply it internally
first:

[hca@linux.ibm.com: breaking compatibility with older clang compilers
 is intended to finally make use of a feature which allows the
 compiler to allocate even/odd register pairs. This is possible since
 a very long time with gcc, but only since llvm-project commit
 d058262b1471 ("[SystemZ] Support i128 inline asm operands.") with
 clang. Using that feature allows to get rid of error prone register
 asm statements, of which the above named kernel commit is only the
 first of a larger not yet complete series]
