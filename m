Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673C733E2FF
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 01:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhCQArV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 20:47:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37524 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229492AbhCQAqv (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Mar 2021 20:46:51 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12H0XwHL156360;
        Tue, 16 Mar 2021 20:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=TgRJHGmY/Lmg21fjougRlDbB5mEv52uqLd8013fEMbA=;
 b=K4ZVVGXapqtgMQNFXQStwf36NkVxzNP/SIRtyX0kYiovyNGo/PCEJAmYS7+rRwjKbKhe
 qJoQfEdSqxDDGJM+1pTgMYR+HR+rC50UKZj0pOvXmhKL3uAQkdwrul/BCrn2sxfZpcxi
 b/HQmXm/VhlBWU8GcFndrnns6PEPy+l0cQ1pkDoTj2Z5sRKwV3Rc2xTAo3MaRUmtbln+
 y5H3n2JKJCOdeVcpWO8rmjJYHNF7OB1IpIuA0vLa06iBf34D8HHSW2CaORQDrMZMyycv
 8vgG5sXN+pYhUo6u+6AUsF9A6QvmClyoREpVzT3fIOuOCGfpF2Hw/f3SLlpQOaDChxoc pw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37b0rcj8fx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Mar 2021 20:46:47 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12H0Yqtk161392;
        Tue, 16 Mar 2021 20:46:47 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37b0rcj8fm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Mar 2021 20:46:47 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12H0Y1Uw000912;
        Wed, 17 Mar 2021 00:46:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma04ams.nl.ibm.com with ESMTP id 378n18kanq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 00:46:45 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12H0kQcs32440812
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Mar 2021 00:46:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A770FAE045;
        Wed, 17 Mar 2021 00:46:42 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3E00AAE055;
        Wed, 17 Mar 2021 00:46:42 +0000 (GMT)
Received: from osiris (unknown [9.171.90.195])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 17 Mar 2021 00:46:42 +0000 (GMT)
Date:   Wed, 17 Mar 2021 01:46:40 +0100
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
Message-ID: <YFFRcPUtddlIB21l@osiris>
References: <YFEeWD7LMPYngtbA@osiris>
 <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-16_09:2021-03-16,2021-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=812 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103170001
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Shakeel,

> > your commit 3a9ca1b0ac0f ("memcg: charge before adding to swapcache on
> > swapin") in linux-next 20210316 appears to cause user process faults /
> > crashes on s390 like:
> >
> > User process fault: interruption code 003b ilc:3 in sshd[2aa15280000+df000]
> > Failing address: 0000000000000000 TEID: 0000000000000800
> > Fault in primary space mode while using user ASCE.
> > AS:00000000966b41c7 R3:0000000000000024
> > CPU: 0 PID: 401 Comm: sshd Not tainted 5.12.0-rc3-00048-geba7667a8534 #10
> > Hardware name: IBM 8561 T01 703 (z/VM 7.2.0)
> > User PSW : 0705000180000000 0000000000000000
> >            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:1 AS:0 CC:0 PM:0 RI:0 EA:3
> > User GPRS: 0000000000000000 fffffffffffff000 0000000000000001 000002aa157b88f0
> >            000002aa157c43c0 0000000000000000 0000000000000000 0000000000000000
> >            0000000000000000 0000000000000000 0000000000000000 0000000000000000
> >            0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > User Code: Bad PSW.
> 
> Thanks for the report. Can you please explain a bit what the above report tells?

Ah, sorry. This is the s390 output for exception-traces. That is if
/proc/sys/debug/exception-trace is set to one, and a process gets
killed because of an unhandled signal.

In this particular case sshd was killed because it tried to access
address zero, where nothing is mapped.

Given that all higher registers are zero in the register dump above my
guess would be this happened because a stack page got unmapped, and
when it got accessed to restore register contents a zero page was
mapped in instead of the real old page contents.

We have also all other sorts of crashes in our CI with linux-next
currently, e.g. LTP's testcase "swapping01" seems to be able to make
(more or less) sure that the init process get's killed (-> panic).
