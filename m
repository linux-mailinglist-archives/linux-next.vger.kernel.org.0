Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02D528A326
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 18:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbfHLQTj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 12:19:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26182 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725887AbfHLQTg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 12:19:36 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7CGHO97109706
        for <linux-next@vger.kernel.org>; Mon, 12 Aug 2019 12:19:35 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ub8s6g2gr-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 12 Aug 2019 12:19:34 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 12 Aug 2019 17:19:34 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
        by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Mon, 12 Aug 2019 17:19:31 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7CGJUou52953408
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Aug 2019 16:19:30 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8263BB2067;
        Mon, 12 Aug 2019 16:19:30 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 66259B2064;
        Mon, 12 Aug 2019 16:19:30 +0000 (GMT)
Received: from paulmck-ThinkPad-W541 (unknown [9.70.82.154])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Mon, 12 Aug 2019 16:19:30 +0000 (GMT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id 319BE16C0F68; Mon, 12 Aug 2019 09:19:34 -0700 (PDT)
Date:   Mon, 12 Aug 2019 09:19:34 -0700
From:   "Paul E. McKenney" <paulmck@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Reply-To: paulmck@linux.ibm.com
References: <20190812161236.21defb17@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812161236.21defb17@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19081216-2213-0000-0000-000003BB0EFE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011585; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01245807; UDB=6.00657379; IPR=6.01027309;
 MB=3.00028147; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-12 16:19:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081216-2214-0000-0000-00005F9E3441
Message-Id: <20190812161934.GJ28441@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-12_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908120182
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 12, 2019 at 04:12:36PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> arch/x86/xen/smp_pv.c: In function 'xen_pv_play_dead':
> arch/x86/xen/smp_pv.c:439:2: error: implicit declaration of function 'tick_nohz_idle_stop_tick_protected'; did you mean 'tick_nohz_idle_stop_tick'? [-Werror=implicit-function-declaration]
>   tick_nohz_idle_stop_tick_protected();
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   tick_nohz_idle_stop_tick
> 
> Caused by commit
> 
>   a96f9dca9820 ("idle: Prevent late-arriving interrupts from disrupting offline")

Peter, I reverted the portion of this commit that removes the
tick_nohz_idle_stop_tick_protected() function.  Please let me know if
you instead convince the Xen people to stop using it.

> Also:
> 
> In file included from <command-line>:
> include/linux/rcu_segcblist.h:69:2: error: unknown type name 'atomic_long_t'
>   atomic_long_t len;
>   ^~~~~~~~~~~~~
> include/linux/rcu_segcblist.h:74:2: error: unknown type name 'u8'
>   u8 enabled;
>   ^~
> include/linux/rcu_segcblist.h:75:2: error: unknown type name 'u8'
>   u8 offloaded;
>   ^~
> 
> Caused by commits:
> 
>   e084617762b7 ("rcu/nocb: Use separate flag to indicate disabled ->cblist")
>   5e114ba3d7a5 ("rcu/nocb: Use separate flag to indicate offloaded ->cblist")
>   9f3ca0945104 ("rcu/nocb: Atomic ->len field in rcu_segcblist structure")
> 
> We prefer our include files to be standalone now if at all possible.

Huh.  "It has been building fine for me."  I added

	#include <uapi/asm-generic/types.h>
	#include <asm-generic/atomic-long.h>

to include/linux/rcu_segcblist.h, which hopefully fixes it at your end.
I will push this after testing and rearrangement at this end.

							Thanx, Paul

> I have used the rcu tree from next-20190809 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


