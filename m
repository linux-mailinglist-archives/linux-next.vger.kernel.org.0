Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F79F8BBAC
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 16:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729304AbfHMOjD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 10:39:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12674 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727768AbfHMOjD (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 10:39:03 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7DEcwUK059538
        for <linux-next@vger.kernel.org>; Tue, 13 Aug 2019 10:39:02 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ubwwbm5py-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 13 Aug 2019 10:39:00 -0400
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 13 Aug 2019 15:38:50 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
        by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 13 Aug 2019 15:38:47 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7DEckeT20447612
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Aug 2019 14:38:47 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E2228B206B;
        Tue, 13 Aug 2019 14:38:46 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C590EB2068;
        Tue, 13 Aug 2019 14:38:46 +0000 (GMT)
Received: from paulmck-ThinkPad-W541 (unknown [9.70.82.154])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 13 Aug 2019 14:38:46 +0000 (GMT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id 8094316C0A22; Tue, 13 Aug 2019 07:38:47 -0700 (PDT)
Date:   Tue, 13 Aug 2019 07:38:47 -0700
From:   "Paul E. McKenney" <paulmck@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Reply-To: paulmck@linux.ibm.com
References: <20190812161236.21defb17@canb.auug.org.au>
 <20190812161934.GJ28441@linux.ibm.com>
 <20190813152511.21737e32@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813152511.21737e32@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19081314-0060-0000-0000-0000036C2F42
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011588; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01246250; UDB=6.00657646; IPR=6.01027755;
 MB=3.00028160; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-13 14:38:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081314-0061-0000-0000-00004A8984B8
Message-Id: <20190813143847.GA28441@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-13_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130156
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 13, 2019 at 03:25:11PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Mon, 12 Aug 2019 09:19:34 -0700 "Paul E. McKenney" <paulmck@linux.ibm.com> wrote:
> >
> > Huh.  "It has been building fine for me."  I added
> > 
> > 	#include <uapi/asm-generic/types.h>
> > 	#include <asm-generic/atomic-long.h>
> > 
> > to include/linux/rcu_segcblist.h, which hopefully fixes it at your end.
> 
> That did not work as I got a lot of errors from
> include/asm-generic/atomic-long.h.  I have added the following patch
> for today (which does build).  These errors come from having
> CONFIG_{,KERNEL_,UAPI_}HEADER_TEST set (which allmodconfig a should do).
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 13 Aug 2019 15:12:00 +1000
> Subject: [PATCH] rcu: use the correct includes
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thank you, Stephen, I have merged this in with attribution.  Apologies
for my not being with the times on this one, and "make allmodconfig" it
will be in the future!

							Thanx, Paul

> ---
>  include/linux/rcu_segcblist.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/rcu_segcblist.h b/include/linux/rcu_segcblist.h
> index 43e2935e8966..646759042333 100644
> --- a/include/linux/rcu_segcblist.h
> +++ b/include/linux/rcu_segcblist.h
> @@ -14,8 +14,8 @@
>  #ifndef __INCLUDE_LINUX_RCU_SEGCBLIST_H
>  #define __INCLUDE_LINUX_RCU_SEGCBLIST_H
>  
> -#include <uapi/asm-generic/types.h>
> -#include <asm-generic/atomic-long.h>
> +#include <linux/types.h>
> +#include <linux/atomic.h>
>  
>  /* Simple unsegmented callback lists. */
>  struct rcu_cblist {
> -- 
> 2.20.1
> 
> -- 
> Cheers,
> Stephen Rothwell


