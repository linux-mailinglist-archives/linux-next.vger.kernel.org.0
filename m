Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D253133EFF1
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 13:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhCQMBd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 08:01:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46262 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231511AbhCQMBJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 08:01:09 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12HBXqD0089812;
        Wed, 17 Mar 2021 08:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=+AvwjVTs4arB4lH2vExImJyK14K/rk49V5KLPtQd7fE=;
 b=UIYG6/G0NbczWcO8BeJOvYnajdXdjne9pEFh4hv94rSa5lH6EyjVXyyM5LRw31IUU3MA
 ImS1E8B8xtnTV14HWxUzup7mgIRABilBvTL3BBv+PeQNSrYQ1tc1rRLdZSNyNHbm1fKN
 eFJoWBrspdWzf7kiiQXQ9htNOspESxU+TWRPzpP0ueho2yyXeqVkcTb/IR6uGe5PSAFf
 pIY8MlJfHvbGPUpxUmSFLFpqUg1B2nzRxpgBH0NJ/rtfUnm9wCmSwxGS4gIz1Lwv8n6G
 6dogftxheIurmBtru2tHpzLLaSvCUwNPBsLwfAw9Iz54l5+z7TgZyOftBWQ45vH+dxai vw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37bf3bm2gf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 08:00:51 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12HBqOta017130;
        Wed, 17 Mar 2021 12:00:49 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03ams.nl.ibm.com with ESMTP id 378n18ks4t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 12:00:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12HC0Uk237487074
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Mar 2021 12:00:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2E233A404D;
        Wed, 17 Mar 2021 12:00:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D8637A4057;
        Wed, 17 Mar 2021 12:00:46 +0000 (GMT)
Received: from osiris (unknown [9.171.81.227])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 17 Mar 2021 12:00:46 +0000 (GMT)
Date:   Wed, 17 Mar 2021 13:00:45 +0100
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 17
Message-ID: <YFHvbXwwRn5scIcz@osiris>
References: <20210317194241.1bf057bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317194241.1bf057bd@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-17_05:2021-03-17,2021-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103170087
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 07:42:41PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release on Friday this week.
> 
> Warning: Some of the branches in linux-next are still based on v5.12-rc1,
> so please be careful if you are trying to bisect a bug.
> 
> News: if your -next included tree is based on Linus' tree tag
> v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
> consider rebasing it onto v5.12-rc2. Also, please check any branches
> merged into your branch.
> 
> Changes since 20210316:
> 
> New tree: cifsd
> 
> The cifsd tree gained a build failure for which I applied a patch.
> 
> The drm-intel tree gained a conflict against the drm tree.
> 
> The tip tree gained a build failure so I used the version from
> next-20210316.
> 
> The rcu tree gained a build failure so I used the version from
> next-20210316.
> 
> Non-merge commits (relative to Linus' tree): 4404
>  4125 files changed, 288074 insertions(+), 79674 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you

This does unfortunately not compile on s390 due to commit 72dd1ce7ebd3
("quota: wire up quotactl_path").

The patch below fixes it:

diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
index 4aeaa89fa774..a421905c36e8 100644
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@ -445,4 +445,4 @@
 440  common	process_madvise		sys_process_madvise		sys_process_madvise
 441  common	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
 442  common	mount_setattr		sys_mount_setattr		sys_mount_setattr
-443  common	quotactl_path		sys_quotactl_path
+443  common	quotactl_path		sys_quotactl_path		sys_quotactl_path
