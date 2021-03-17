Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A1633EBA0
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 09:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhCQIhQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 04:37:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51632 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229549AbhCQIgt (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 04:36:49 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12H8Wcn2065652;
        Wed, 17 Mar 2021 04:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EvqVbsppmDzzwYI0V8yma2J/QAKgUZV6Cj85cbt4KxA=;
 b=Zm8RHrvC0+KxgNR4PSTyIfpQIvpWSKnj74/D92FT+s13W5QgVHLztGziAh1P64HhFaxL
 yNZo4zZ9DrIrY1nO9Dw0rZVGOqyZYALTYi7vSYGubd6uZMsKdHW9Oescq1YFyb5HrLH7
 YTbC2/tUS5VPeH7UgTKun5VTdUcJaFN9eBgIaPBSA+Xp7orxXqQDo1HerqtCIE9vHKMk
 2lcXV14cFLS05GDpIOuAMukHdLc4aR551GCfgJdU+XW11idG30JE48DG/AX0plsMBXcU
 vonZGoZFbdQkuG3S0E2AGoJYrdk5kziBIdZ7kePGtudDfBdBshRewmjEoDChA4ETvxZo vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37be740anb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 04:36:38 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12H8Wf59065986;
        Wed, 17 Mar 2021 04:36:37 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37be740am8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 04:36:37 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12H8aZTn008742;
        Wed, 17 Mar 2021 08:36:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma04fra.de.ibm.com with ESMTP id 37b6xjg5d7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Mar 2021 08:36:35 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12H8aG5730081500
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Mar 2021 08:36:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A1119A4060;
        Wed, 17 Mar 2021 08:36:32 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 14071A4054;
        Wed, 17 Mar 2021 08:36:32 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.90.29])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 17 Mar 2021 08:36:31 +0000 (GMT)
Subject: Re: [BUG -next] "memcg: charge before adding to swapcache on swapin"
 broken
To:     Heiko Carstens <hca@linux.ibm.com>,
        Shakeel Butt <shakeelb@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Hugh Dickins <hughd@google.com>,
        Juergen Christ <jchrist@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <YFEeWD7LMPYngtbA@osiris>
 <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
 <YFFRcPUtddlIB21l@osiris>
From:   Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <d8bfcd54-e69e-1485-922f-d8bd11a4507f@de.ibm.com>
Date:   Wed, 17 Mar 2021 09:36:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFFRcPUtddlIB21l@osiris>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-17_02:2021-03-17,2021-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 clxscore=1011 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxlogscore=933 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103170065
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 17.03.21 01:46, Heiko Carstens wrote:
> Hi Shakeel,
> 
>>> your commit 3a9ca1b0ac0f ("memcg: charge before adding to swapcache on
>>> swapin") in linux-next 20210316 appears to cause user process faults /
>>> crashes on s390 like:
>>>
>>> User process fault: interruption code 003b ilc:3 in sshd[2aa15280000+df000]
>>> Failing address: 0000000000000000 TEID: 0000000000000800
>>> Fault in primary space mode while using user ASCE.
>>> AS:00000000966b41c7 R3:0000000000000024
>>> CPU: 0 PID: 401 Comm: sshd Not tainted 5.12.0-rc3-00048-geba7667a8534 #10
>>> Hardware name: IBM 8561 T01 703 (z/VM 7.2.0)
>>> User PSW : 0705000180000000 0000000000000000
>>>             R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:1 AS:0 CC:0 PM:0 RI:0 EA:3
>>> User GPRS: 0000000000000000 fffffffffffff000 0000000000000001 000002aa157b88f0
>>>             000002aa157c43c0 0000000000000000 0000000000000000 0000000000000000
>>>             0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>             0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>> User Code: Bad PSW.
>>
>> Thanks for the report. Can you please explain a bit what the above report tells?
> 
> Ah, sorry. This is the s390 output for exception-traces. That is if
> /proc/sys/debug/exception-trace is set to one, and a process gets
> killed because of an unhandled signal.
> 
> In this particular case sshd was killed because it tried to access
> address zero, where nothing is mapped.
> 
> Given that all higher registers are zero in the register dump above my
> guess would be this happened because a stack page got unmapped, and
> when it got accessed to restore register contents a zero page was
> mapped in instead of the real old page contents.
> 
> We have also all other sorts of crashes in our CI with linux-next
> currently, e.g. LTP's testcase "swapping01" seems to be able to make
> (more or less) sure that the init process get's killed (-> panic).

In other words it would be good if we could drop this patch from next until we have
a fix. Otherwise we loose a lot of CI coverage for next.
