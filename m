Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C0433FA16
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 21:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhCQUok (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 16:44:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47088 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233360AbhCQUoe (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 16:44:34 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12HKYcci129399;
        Wed, 17 Mar 2021 16:44:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=TZWvtxAEABDXhAWjElMwLqknxdMXxE+DwRpI7YG7zAE=;
 b=f3GN9vIXTvfPkOBe29Kswwhf71nvONnFHfjZWc1UGrjVQ+rFcr9X9Ir3J1Nhb5W76D5s
 7A07d0HXnj4nH6ROCleEkcpwCPymGX+21nYaceAeuiYjNzbeqJ7o/5Jyts4t0E5rXsMK
 OEl1cWm3itLl43SzGviUkwOm6aIhNIhDsNhH46m6WMKrPZTpTEEVxH2xSB3/Ev9EDcLk
 BCABErJpgnuqyTBIiC40GsOZMTNGsUs8EYyb7NX4xyc6J73F7iKWSw2f7DBz+3U4j6ar
 xtt+KGRE2zt+p9vZMyJFpug8j/7rQlCh+pHaYMQYKXr2qHgDdqR53EcwjHjmFpxp1MV3 kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37bnrcp0pa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 16:44:28 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12HKYeOp129537;
        Wed, 17 Mar 2021 16:44:28 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37bnrcp0nt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 16:44:28 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12HKgXkl025562;
        Wed, 17 Mar 2021 20:44:25 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma06ams.nl.ibm.com with ESMTP id 37b30p0yd9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 20:44:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12HKiMvN27591166
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Mar 2021 20:44:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DF19AAE051;
        Wed, 17 Mar 2021 20:44:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 67798AE057;
        Wed, 17 Mar 2021 20:44:22 +0000 (GMT)
Received: from osiris (unknown [9.171.26.13])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 17 Mar 2021 20:44:22 +0000 (GMT)
Date:   Wed, 17 Mar 2021 21:44:21 +0100
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
Message-ID: <YFJqJeMDc/JCjfSv@osiris>
References: <YFEeWD7LMPYngtbA@osiris>
 <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
 <YFFRcPUtddlIB21l@osiris>
 <CALvZod5k5wgE-d=U=thhQp5bwQ6t0ugKDtZj75qSSYVB27uCuQ@mail.gmail.com>
 <YFIfjPzLzeJKs3hE@osiris>
 <CALvZod6GxjppjNuX5BQD+2WwWsdOcDqbKmCy6XGJyBsT_p2SxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvZod6GxjppjNuX5BQD+2WwWsdOcDqbKmCy6XGJyBsT_p2SxA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-17_11:2021-03-17,2021-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103170144
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 08:44:14AM -0700, Shakeel Butt wrote:
> > Config below. And the fun thing is that I cannot reproduce it today
> > anymore with the elfutils test case - what _seems_ to be different is
> > that the test suite runs much faster than yesterday evening. Usually
> > an indication that there is no steal time (other guests which steal
> > cpu time), which again _could_ indicate a race / lack of locking
> > somewhere.
> > This is kind of odd, since yesterday evening it was very reliable to
> > trigger the bug :/
> >
> 
> Thanks for the config. One question regarding swap, is it disk based
> swap or zram?

Swap device is a real disk.

> By guests, do you mean there was another significant workload running
> on the machine in parallel to the tests?

That I don't know. I didn't check. I still can't reproduce with
elfutils anymore, however...

> If you don't mind can you try swapping01 as well.

ltp's swapping01 test triggers immediately random processes being
killed with SIGSEGV. I also tested with linux-next 20210316 and _only_
"memcg: charge before adding to swapcache on swapin" being reverted on
top, and the problem is away - so it looks like the result of
yesterday's bisect is indeed valid.
