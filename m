Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63D533FA50
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 22:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbhCQVL2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 17:11:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31342 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229602AbhCQVLN (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 17:11:13 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12HL4WFN019290;
        Wed, 17 Mar 2021 17:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=Qn7R1DBn+FXVKxPU1O+Exq3JbNzLw1oLSBeg+fv0Obk=;
 b=bqGiezT020jDhjQXyIkknb87l6F5bEQphOBTvCLmcSXEX4wDrZ+gHcKq/lCmccVx3P+B
 +8zLsIJttQc1P57WS89qlNBfIcu9gdFHlBScagOZfbq9q5l6T82ESG3IqwzU6AvMjvND
 w8YDx4FPsB6raHdbOrBjLMh2whgWDrk8m7ngwog6LHMofEm6Lk9czLUVYfg4JV4OAE1H
 ZWzyFX/c61btgDUSFNjosLOeA8nojkpenCNE6a9DkAahQvVg/sqt8u3cj2G5ds5EE0rz
 0AsITdwI3AswR/k40khtRH7XEGWHYRSGQABqHVSmbwChblS9bFyu7hjvy1+D+/LlvumQ YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37bnrmej7q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 17:11:09 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12HL5cZs022575;
        Wed, 17 Mar 2021 17:11:09 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37bnrmej73-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 17:11:09 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12HL7Via012753;
        Wed, 17 Mar 2021 21:11:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma04ams.nl.ibm.com with ESMTP id 378n18m5bb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 21:11:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12HLB4XG34078982
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Mar 2021 21:11:04 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0EE624C04E;
        Wed, 17 Mar 2021 21:11:04 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 987954C040;
        Wed, 17 Mar 2021 21:11:03 +0000 (GMT)
Received: from osiris (unknown [9.171.26.13])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 17 Mar 2021 21:11:03 +0000 (GMT)
Date:   Wed, 17 Mar 2021 22:11:02 +0100
From:   Heiko Carstens <hca@linux.ibm.com>
To:     Shakeel Butt <shakeelb@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Hugh Dickins <hughd@google.com>,
        Juergen Christ <jchrist@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [BUG -next] "memcg: charge before adding to swapcache on swapin"
 broken
Message-ID: <YFJwZoUalBM/lBBr@osiris>
References: <YFEeWD7LMPYngtbA@osiris>
 <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
 <YFFRcPUtddlIB21l@osiris>
 <CALvZod5k5wgE-d=U=thhQp5bwQ6t0ugKDtZj75qSSYVB27uCuQ@mail.gmail.com>
 <YFIfjPzLzeJKs3hE@osiris>
 <CALvZod6GxjppjNuX5BQD+2WwWsdOcDqbKmCy6XGJyBsT_p2SxA@mail.gmail.com>
 <YFJqJeMDc/JCjfSv@osiris>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFJqJeMDc/JCjfSv@osiris>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-17_11:2021-03-17,2021-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170149
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 09:44:21PM +0100, Heiko Carstens wrote:
> On Wed, Mar 17, 2021 at 08:44:14AM -0700, Shakeel Butt wrote:
> > > Config below. And the fun thing is that I cannot reproduce it today
> > > anymore with the elfutils test case - what _seems_ to be different is
> > > that the test suite runs much faster than yesterday evening. Usually
> > > an indication that there is no steal time (other guests which steal
> > > cpu time), which again _could_ indicate a race / lack of locking
> > > somewhere.
> > > This is kind of odd, since yesterday evening it was very reliable to
> > > trigger the bug :/
> > >
> > 
> > Thanks for the config. One question regarding swap, is it disk based
> > swap or zram?
> 
> Swap device is a real disk.
> 
> > By guests, do you mean there was another significant workload running
> > on the machine in parallel to the tests?
> 
> That I don't know. I didn't check. I still can't reproduce with
> elfutils anymore, however...
> 
> > If you don't mind can you try swapping01 as well.
> 
> ltp's swapping01 test triggers immediately random processes being
> killed with SIGSEGV. I also tested with linux-next 20210316 and _only_
> "memcg: charge before adding to swapcache on swapin" being reverted on
> top, and the problem is away - so it looks like the result of
> yesterday's bisect is indeed valid.

I have to correct myself, actually the system has both: a real disk
_and_ zram as swap devices:

# swapon -s
Filename                                Type            Size    Used    Priority
/dev/dasdb1                             partition       21635084        0       -2
/dev/zram0                              partition       1014780 0       100

When I disable /dev/zram with "swapoff /dev/zram0" the problem is away
as well, even with your patch applied.
