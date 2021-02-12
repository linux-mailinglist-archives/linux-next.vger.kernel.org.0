Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46ED2319D10
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 12:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhBLLGW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 06:06:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30480 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231216AbhBLLEZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Feb 2021 06:04:25 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 11CAXWo0027883;
        Fri, 12 Feb 2021 06:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=usnjfiBWFcGZxVK1Au441a6j8vI6WTNGS2y2zdPYlkQ=;
 b=D6vfk5vCMzFH00BjA+U2zc/EPPPjan4K5nTWnni1MCLiXiaj2ReYjDt0YvKJFlQKFBvH
 ew3IJzTod9Kc1q8m+VM8yhUwTVylhkxf44xAPc8bKHTEYsoGYtPJQRWN2CEF9YvauMLx
 c48nfpdyJ8QU/P9NTzr731SKR0CStrEmLf62oM5K8tjjXb2TauSz7LW2+2WN36xNYs3L
 KwG/+MSNRj1jpA4wokC4l0/pSBblrVUx9jpyIt4aRNCqRneWvPcHvYjRl9gtoApIzHJm
 4MxEhpZnkSQJUfRD3Ut2RX0mTa4QzwfK4dU6PeR5XPM5cqJtYpySR6AXZHIZKju67wQP 2A== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36nr068u58-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Feb 2021 06:03:24 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
        by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11CB2Z5f002841;
        Fri, 12 Feb 2021 11:03:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma01fra.de.ibm.com with ESMTP id 36hjr83evk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Feb 2021 11:03:11 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 11CB39T025100784
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Feb 2021 11:03:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BBDE742047;
        Fri, 12 Feb 2021 11:03:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6A4AA42041;
        Fri, 12 Feb 2021 11:03:09 +0000 (GMT)
Received: from osiris (unknown [9.171.56.89])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 12 Feb 2021 11:03:09 +0000 (GMT)
Date:   Fri, 12 Feb 2021 12:03:08 +0100
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Vlad Buslov <vladbu@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dmytro Linkin <dlinkin@nvidia.com>,
        Roi Dayan <roid@nvidia.com>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Feb 11
Message-ID: <YCZgbOpD1xDw4PT8@osiris>
References: <20210211222604.51bd537c@canb.auug.org.au>
 <YCWT6TZCGQOXlf6B@osiris>
 <ygnh8s7tsk4i.fsf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ygnh8s7tsk4i.fsf@nvidia.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-12_03:2021-02-12,2021-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102120081
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Vlad,

> > Build fails on s390 using defconfig with:
> >
> > In file included from drivers/net/ethernet/mellanox/mlx5/core/en_tc.h:40,
> >                  from drivers/net/ethernet/mellanox/mlx5/core/en_main.c:45:
> > drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun.h:24:29: error: field 'match_level' has incomplete type
> >    24 |  enum mlx5_flow_match_level match_level;
> >       |                             ^~~~~~~~~~~
> > drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun.h:27:26: warning: 'struct mlx5e_encap_entry' declared inside parameter list will not be visible outside of this definition or declaration
> >    27 |  int (*calc_hlen)(struct mlx5e_encap_entry *e);
> >       |                          ^~~~~~~~~~~~~~~~~
> >
> > caused by this:
> > commit 0d9f96471493d5483d116c137693f03604332a04 (HEAD, refs/bisect/bad)
> > Author: Vlad Buslov <vladbu@nvidia.com>
> > Date:   Sun Jan 24 22:07:04 2021 +0200
> >
> >     net/mlx5e: Extract tc tunnel encap/decap code to dedicated file
> >     
> >     Following patches in series extend the extracted code with routing
> >     infrastructure. To improve code modularity created a dedicated
> >     tc_tun_encap.c source file and move encap/decap related code to the new
> >     file. Export code that is used by both regular TC code and encap/decap code
> >     into tc_priv.h (new header intended to be used only by TC module). Rename
> >     some exported functions by adding "mlx5e_" prefix to their names.
> >     
> >     Signed-off-by: Vlad Buslov <vladbu@nvidia.com>
> >     Signed-off-by: Dmytro Linkin <dlinkin@nvidia.com>
> >     Reviewed-by: Roi Dayan <roid@nvidia.com>
> >     Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
> >
> > Note: switching on NET_SWITCHDEV fixes the build error.
> 
> Hi Heiko,
> 
> This problem is supposed to be fixed by 36280f0797df ("net/mlx5e: Fix
> tc_tun.h to verify MLX5_ESWITCH config"). I'm trying to reproduce with
> config supplied by test robot in another thread (config: s390-defconfig)
> and current net-next builds fine for me. I've also verified that config
> option you mentioned is not set in that config:
> 
> $ grep NET_SWITCHDEV .config
> # CONFIG_NET_SWITCHDEV is not set
> 
> Can you help me reproduce?

The commit you mention is not part of linux-next 20210211 (I'm not
talking of net-next). So, probably will be fixed with today's
release. I just checked: net-next builds with s390 defconfig.

Thanks!
