Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60CAE216E24
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 15:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgGGN5m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 09:57:42 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:55622 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgGGN5m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2020 09:57:42 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 067DuY8J117402;
        Tue, 7 Jul 2020 13:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=MjwWplxfK1RilGvrN/7KblwD+GglAte1BvP/6SXwa8E=;
 b=Z+DO7BJQMWMwVm/ursUier07EJ5QalHzkRkpCUf+9KfipyUjnGCL/ukgzr56ZVWsahZJ
 NSpjoI/IIl6vLvgxVxG8d/5adyUynUttBMS8qL33v3W7ct2oqQQQ4Kt8UpCwfyFLM5YE
 tr62UlE6GHo7wcZBVX/8sFxASyPi7NudVtarm9uDIFJ8eueqCgGhjNl/rGthBDMO6/L/
 lmM2z4TtHTUpk8+4E3BvDpgxLXbhfNrX2zbswM4EpRgfTK/vy2Uybu/P2y3BwfgPJY3C
 JarMsxhmPMZ8jfdaIlBYvgicC/3i3AsEbsoLE/iahNgrtJc1vlHG2U9PApfOCf0Eo464 9w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 322kv6cee6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 07 Jul 2020 13:57:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 067Dd8uu068538;
        Tue, 7 Jul 2020 13:57:29 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 3233p2q4a0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Jul 2020 13:57:29 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 067DvRUg004792;
        Tue, 7 Jul 2020 13:57:27 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Jul 2020 06:57:27 -0700
Date:   Tue, 7 Jul 2020 06:57:25 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Dave Chinner <david@fromorbit.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-xfs@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brian Foster <bfoster@redhat.com>
Subject: Re: [PATCH] xfs: fix non-quota build breakage
Message-ID: <20200707135725.GI7606@magnolia>
References: <20200707102754.65254f1e@canb.auug.org.au>
 <20200707022825.GL2005@dread.disaster.area>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707022825.GL2005@dread.disaster.area>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9674 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 mlxlogscore=999
 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007070103
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9674 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=1 mlxlogscore=999 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 mlxscore=0 adultscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007070104
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 07, 2020 at 12:28:25PM +1000, Dave Chinner wrote:
> 
> From: Dave Chinner <dchinner@redhat.com>
> 
> Oops, I forgot that you can config out quotas because nobody
> ever does that when they build XFS anymore.
> 
> Fixes: 018dc1667913 ("xfs: use direct calls for dquot IO completion")
> 
> Signed-off-by: Dave Chinner <dchinner@redhat.com>

Looks ok,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/xfs/xfs_dquot.h | 1 -
>  fs/xfs/xfs_quota.h | 9 +++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_dquot.h b/fs/xfs/xfs_dquot.h
> index fe9cc3e08ed6..71e36c85e20b 100644
> --- a/fs/xfs/xfs_dquot.h
> +++ b/fs/xfs/xfs_dquot.h
> @@ -174,7 +174,6 @@ void		xfs_qm_dqput(struct xfs_dquot *dqp);
>  void		xfs_dqlock2(struct xfs_dquot *, struct xfs_dquot *);
>  
>  void		xfs_dquot_set_prealloc_limits(struct xfs_dquot *);
> -void		xfs_dquot_done(struct xfs_buf *);
>  
>  static inline struct xfs_dquot *xfs_qm_dqhold(struct xfs_dquot *dqp)
>  {
> diff --git a/fs/xfs/xfs_quota.h b/fs/xfs/xfs_quota.h
> index aa8fc1f55fbd..c92ae5e02ce8 100644
> --- a/fs/xfs/xfs_quota.h
> +++ b/fs/xfs/xfs_quota.h
> @@ -13,6 +13,7 @@
>   */
>  
>  struct xfs_trans;
> +struct xfs_buf;
>  
>  /*
>   * This check is done typically without holding the inode lock;
> @@ -107,6 +108,8 @@ extern void xfs_qm_mount_quotas(struct xfs_mount *);
>  extern void xfs_qm_unmount(struct xfs_mount *);
>  extern void xfs_qm_unmount_quotas(struct xfs_mount *);
>  
> +void		xfs_dquot_done(struct xfs_buf *);
> +
>  #else
>  static inline int
>  xfs_qm_vop_dqalloc(struct xfs_inode *ip, kuid_t kuid, kgid_t kgid,
> @@ -148,6 +151,12 @@ static inline int xfs_trans_reserve_quota_bydquots(struct xfs_trans *tp,
>  #define xfs_qm_mount_quotas(mp)
>  #define xfs_qm_unmount(mp)
>  #define xfs_qm_unmount_quotas(mp)
> +
> +static inline void xfs_dquot_done(struct xfs_buf *bp)
> +{
> +	return;
> +}
> +
>  #endif /* CONFIG_XFS_QUOTA */
>  
>  #define xfs_trans_unreserve_quota_nblks(tp, ip, nblks, ninos, flags) \
