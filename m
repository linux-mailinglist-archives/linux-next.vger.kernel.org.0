Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B393B4342
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 14:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhFYMfJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 08:35:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60170 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229934AbhFYMfI (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Jun 2021 08:35:08 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15PC6Dv5041356;
        Fri, 25 Jun 2021 08:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=FoqHMAo4aVfUw7gRnFnF1SD6HsPYwczaCD7oSLM5WBA=;
 b=nUMMTBqDvJIih/X7JDOZmrS8GdPnkabPWcS6DUypfccsgqEf/TYCugWJi38V//M93xXc
 wqz3WJei/Qi0Hd5LMzr7ByGIKp7+Kn0KGG18gm/VKHVtdhx7FVlPlwi1z0OpFmRlCSpp
 lKim+Z9jvKtFjf/LAbQKXqu8Rxsp4CF7ejnd0jjC2SgXSMRBeQQ7kykwG1dw+/33HB4B
 VH/z5zJv+J9WfZ3qK69CLDYV96gDfSDK5D5r7/InCwV0+F0WHiHOM0Ij1micY85kTC4Q
 R8MZ998B50+VcGKMGnp515Q3+qAePAckuefIP1Wr6cLTvOXGBDIDIDzRtb5QDjE6YBNa qQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39dd7hcn90-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 25 Jun 2021 08:32:40 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15PCSuIG002538;
        Fri, 25 Jun 2021 12:32:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma03ams.nl.ibm.com with ESMTP id 399878b1fs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 25 Jun 2021 12:32:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 15PCWZWk32571762
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 25 Jun 2021 12:32:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 76B01A4051;
        Fri, 25 Jun 2021 12:32:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 24D93A4053;
        Fri, 25 Jun 2021 12:32:34 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.119.88])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 25 Jun 2021 12:32:33 +0000 (GMT)
Date:   Fri, 25 Jun 2021 18:02:31 +0530
From:   Bharata B Rao <bharata@linux.ibm.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
        linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        LKML <linux-kernel@vger.kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: PowerPC guest getting "BUG: scheduling while atomic" on
 linux-next-20210623 during secondary CPUs bringup
Message-ID: <YNXM33OD8/qLkygG@in.ibm.com>
Reply-To: bharata@linux.ibm.com
References: <YNSq3UQTjm6HWELA@in.ibm.com>
 <20210625054608.fmwt7lxuhp7inkjx@linux.vnet.ibm.com>
 <YNWFiZii+MINhUC3@hirez.programming.kicks-ass.net>
 <YNWZfKK+KBQSUdG5@in.ibm.com>
 <YNWtFKdSuoYTfSon@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNWtFKdSuoYTfSon@hirez.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: znBsyfVCmurmTMEpzxmyjHoqgWGHADw-
X-Proofpoint-GUID: znBsyfVCmurmTMEpzxmyjHoqgWGHADw-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-25_04:2021-06-25,2021-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106250069
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 25, 2021 at 12:16:52PM +0200, Peter Zijlstra wrote:
> You mean: CONFIG_PREEMPTION=n, what about CONFIG_PREEMPT_COUNT?
> 
> Because if both are =n, then I don't see how that warning could trigger.
> in_atomic_preempt_off() would then result in prempt_count() == 0, and
> per the print above, it *is* 0.

CONFIG_PREEMPTION isn't set.

Also other PREEMPT related options are as under:

# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set

Regards,
Bharata.
