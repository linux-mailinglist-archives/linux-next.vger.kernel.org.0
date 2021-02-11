Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEBD2319484
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 21:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhBKUbm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 15:31:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5870 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230239AbhBKUba (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Feb 2021 15:31:30 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 11BKCGIG064089;
        Thu, 11 Feb 2021 15:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ROz2wy+tfHmzyk8OFNNn20qMGn94yfZ2/J6Kwdt1ltQ=;
 b=AvpP70iVjdpliwPUEVuBbKmU3t+fF2z5vopY6TADyoJi9FwikljaIgpey4ljZS2Ye0pP
 MWPpCKZwg/ylhBMHcR0tf+YSCDJGVIWLyty7Sk4xNBelISPYTR5kUYDkudHYjTQxFQtU
 Wqg1dxgzUi/VlzhTE+7GXl+FoH28T0v6+Qcx2JjUJ2Mx1syZtWCLpaQSEzfU+qNknm/e
 BmzwBKS6X7dMI8ThXgl3jAkR3RL9a68vNk7xM/DvdNg94MKZ9XtXSc+Ksg7BVZ7bTwO/
 FuwjViLbfxf9KTX+lagLs7GVQr+745dmC6ng+iXx5u5NUtE/qOkeYccTAcJaSrehsZwY IA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36nbdhrcm3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Feb 2021 15:30:39 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11BKN0OZ012344;
        Thu, 11 Feb 2021 20:30:37 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma03ams.nl.ibm.com with ESMTP id 36m1m2t86j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Feb 2021 20:30:37 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 11BKUZqw46072274
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Feb 2021 20:30:35 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 63E324204C;
        Thu, 11 Feb 2021 20:30:35 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0CBFC42047;
        Thu, 11 Feb 2021 20:30:35 +0000 (GMT)
Received: from osiris (unknown [9.171.6.148])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 11 Feb 2021 20:30:34 +0000 (GMT)
Date:   Thu, 11 Feb 2021 21:30:33 +0100
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Vlad Buslov <vladbu@nvidia.com>,
        Dmytro Linkin <dlinkin@nvidia.com>,
        Roi Dayan <roid@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Feb 11
Message-ID: <YCWT6TZCGQOXlf6B@osiris>
References: <20210211222604.51bd537c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211222604.51bd537c@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-11_07:2021-02-11,2021-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102110153
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 11, 2021 at 10:26:04PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210210:
> 
> The powerpc tree still had its build failure in the allyesconfig for
> which I applied a supplied patch.
> 
> The v4l-dvb tree lost its build failure.
> 
> The drm-misc tree lost its build failure.
> 
> The modules tree lost its build failure.
> 
> The device-mapper tree gained a build failure so I used the version
> from next-20210210.
> 
> The tip tree lost its boot failure.
> 
> The rcu tree gained conflicts against the block tree.
> 
> The driver-core tree lost its build failure.
> 
> The akpm-current tree gained conflicts against the fscache tree.
> 
> Non-merge commits (relative to Linus' tree): 9533
>  9470 files changed, 385794 insertions(+), 266880 deletions(-)
> 
> ----------------------------------------------------------------------------

Build fails on s390 using defconfig with:

In file included from drivers/net/ethernet/mellanox/mlx5/core/en_tc.h:40,
                 from drivers/net/ethernet/mellanox/mlx5/core/en_main.c:45:
drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun.h:24:29: error: field 'match_level' has incomplete type
   24 |  enum mlx5_flow_match_level match_level;
      |                             ^~~~~~~~~~~
drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun.h:27:26: warning: 'struct mlx5e_encap_entry' declared inside parameter list will not be visible outside of this definition or declaration
   27 |  int (*calc_hlen)(struct mlx5e_encap_entry *e);
      |                          ^~~~~~~~~~~~~~~~~

caused by this:
commit 0d9f96471493d5483d116c137693f03604332a04 (HEAD, refs/bisect/bad)
Author: Vlad Buslov <vladbu@nvidia.com>
Date:   Sun Jan 24 22:07:04 2021 +0200

    net/mlx5e: Extract tc tunnel encap/decap code to dedicated file
    
    Following patches in series extend the extracted code with routing
    infrastructure. To improve code modularity created a dedicated
    tc_tun_encap.c source file and move encap/decap related code to the new
    file. Export code that is used by both regular TC code and encap/decap code
    into tc_priv.h (new header intended to be used only by TC module). Rename
    some exported functions by adding "mlx5e_" prefix to their names.
    
    Signed-off-by: Vlad Buslov <vladbu@nvidia.com>
    Signed-off-by: Dmytro Linkin <dlinkin@nvidia.com>
    Reviewed-by: Roi Dayan <roid@nvidia.com>
    Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>

Note: switching on NET_SWITCHDEV fixes the build error.
