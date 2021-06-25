Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF2F3B3FCE
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 10:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbhFYIzz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 04:55:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53838 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229839AbhFYIzz (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Jun 2021 04:55:55 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15P8hPXA183902;
        Fri, 25 Jun 2021 04:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=rzTA+p0RdFBI5z/WkZursu+QbEA1OamEUn7j39jhXIU=;
 b=Qm04eXvVh7tDMekns85//HjA/SBCn/GLO7P3ljc+bCbA4OEzNIqaDocBi6s3nZ8gKK6q
 fOI2ihOUU0gpjzd9B5VFCOd532VVCdSfXgMRxiwKBXnnCU1OfOpvEIi3WkGgbZZD8Vc+
 LBGVgPSDkzeUZsD8UNJWlrXdFGnlMbEX0nWYBCNSOxAHPoaSbAsAYgrairJgwbPMGQoe
 0hD80s2Q+4OHTXPT4ghSntiAYGlgH6u8wD8VFjrcAZ2l3QTGBBwA+o1jxl1ojQFGrhB1
 4aLFu91Xxqx/dgIUvmdNbdIJa6Z1K6LSAA+ul98870ojhzrd1R/Ff/FuJ0LK0o7RaWMk mg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39db9vshxa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 25 Jun 2021 04:53:25 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15P8h3bB028442;
        Fri, 25 Jun 2021 08:53:22 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma04fra.de.ibm.com with ESMTP id 399878smpx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 25 Jun 2021 08:53:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15P8puO932768294
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 25 Jun 2021 08:51:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 75B3E4C046;
        Fri, 25 Jun 2021 08:53:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 153744C04A;
        Fri, 25 Jun 2021 08:53:19 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.119.88])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 25 Jun 2021 08:53:18 +0000 (GMT)
Date:   Fri, 25 Jun 2021 14:23:16 +0530
From:   Bharata B Rao <bharata@linux.ibm.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
        linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        LKML <linux-kernel@vger.kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: PowerPC guest getting "BUG: scheduling while atomic" on
 linux-next-20210623 during secondary CPUs bringup
Message-ID: <YNWZfKK+KBQSUdG5@in.ibm.com>
Reply-To: bharata@linux.ibm.com
References: <YNSq3UQTjm6HWELA@in.ibm.com>
 <20210625054608.fmwt7lxuhp7inkjx@linux.vnet.ibm.com>
 <YNWFiZii+MINhUC3@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNWFiZii+MINhUC3@hirez.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zejoDKfRsTOUHTH3skiJaY9mJAi7R_6z
X-Proofpoint-GUID: zejoDKfRsTOUHTH3skiJaY9mJAi7R_6z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-25_03:2021-06-24,2021-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106250049
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 25, 2021 at 09:28:09AM +0200, Peter Zijlstra wrote:
> On Fri, Jun 25, 2021 at 11:16:08AM +0530, Srikar Dronamraju wrote:
> > * Bharata B Rao <bharata@linux.ibm.com> [2021-06-24 21:25:09]:
> > 
> > > A PowerPC KVM guest gets the following BUG message when booting
> > > linux-next-20210623:
> > > 
> > > smp: Bringing up secondary CPUs ...
> > > BUG: scheduling while atomic: swapper/1/0/0x00000000
> 
> 'funny', your preempt_count is actually too low. The check here is for
> preempt_count() == DISABLE_OFFSET (aka. 1 when PREEMPT=y), but you have
> 0.
> 
> > > no locks held by swapper/1/0.
> > > Modules linked in:
> > > CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.13.0-rc7-next-20210623
> > > Call Trace:
> > > [c00000000ae5bc20] [c000000000badc64] dump_stack_lvl+0x98/0xe0 (unreliable)
> > > [c00000000ae5bc60] [c000000000210200] __schedule_bug+0xb0/0xe0
> > > [c00000000ae5bcd0] [c000000001609e28] __schedule+0x1788/0x1c70
> > > [c00000000ae5be20] [c00000000160a8cc] schedule_idle+0x3c/0x70
> > > [c00000000ae5be50] [c00000000022984c] do_idle+0x2bc/0x420
> > > [c00000000ae5bf00] [c000000000229d88] cpu_startup_entry+0x38/0x40
> > > [c00000000ae5bf30] [c0000000000666c0] start_secondary+0x290/0x2a0
> > > [c00000000ae5bf90] [c00000000000be54] start_secondary_prolog+0x10/0x14
> > > 
> > > <The above repeats for all the secondary CPUs>
> > > 
> > > smp: Brought up 2 nodes, 16 CPUs
> > > numa: Node 0 CPUs: 0-7
> > > numa: Node 1 CPUs: 8-15
> > > 
> > > This seems to have started from next-20210521 and isn't seen on
> > > next-20210511.
> > > 
> > 
> > Bharata,
> > 
> > I think the regression is due to Commit f1a0a376ca0c ("sched/core:
> > Initialize the idle task with preemption disabled")
> 
> So that extra preempt_disable() that got removed would've incremented it
> to 1 and then things would've been fine.
> 
> Except.. Valentin changed things such that preempt_count() should've
> been inittialized to 1, instead of 0, but for some raisin that didn't
> stick.. what gives.
> 
> So we have init_idle(p) -> init_idle_preempt_count(p) ->
> task_thread_info(p)->preempt_count = PREEMPT_DISABLED;
> 
> But somehow, by the time you're running start_secondary(), that's gotten
> to be 0 again. Does DEBUG_PREEMPT give more clues?

PREEMPTION is off here.

Regards,
Bharata.
