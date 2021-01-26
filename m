Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0821A3040C6
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 15:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405960AbhAZOrG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 09:47:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1348 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391384AbhAZJkK (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 04:40:10 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10Q9WVcE181071;
        Tue, 26 Jan 2021 04:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=GG7/Jgtg+8SYLOTHa7G339+/UHCbE56tCf2wd7jUbhk=;
 b=LCKBK+eXWE2qiiYl2dtU1kYpAC4IovLIk4gAoIq+J6zl+D09zmyIGwxbRWBmWCpaJmok
 fqEmPDFprfnvPzmXK1Vud2HDT/EMPUL86uhPmb7DpZHoeh4AhwJbHCDZ8b6tLr5QDGOp
 qKNzaJG/Dcn1dHYvG6Mzu+kiZDs01HDn4kwJ6XO3UPSjx5g5tQBFnuKhoLLYJ74QgjkY
 BHT18F3iEBsAzlabk0N7PQ2vARPpNF5lpzn/wxVTY1mL2j3S3jXD9KI8JCxVWbFtNrht
 l5DYKJ/obzRATjljjv0WWjGaMKph3/9Ma+f7QGT5vM1ZoiQb6EUDIrFxjEj+moSDZLVF 6Q== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36aftc15wp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 04:39:16 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10Q9Ww6G027120;
        Tue, 26 Jan 2021 09:39:15 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma04fra.de.ibm.com with ESMTP id 369jjsgphx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 09:39:14 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10Q9d4OT35389938
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 09:39:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BAAB152054;
        Tue, 26 Jan 2021 09:39:11 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 6FA5B52052;
        Tue, 26 Jan 2021 09:39:11 +0000 (GMT)
From:   Sven Schnelle <svens@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] s390: allow reschedule on syscall restart
References: <20210121143926.21440-1-svens@linux.ibm.com>
        <20210121143926.21440-2-svens@linux.ibm.com>
        <a522c1ac-703a-ba99-c44c-3dd09e4cc4be@de.ibm.com>
Date:   Tue, 26 Jan 2021 10:39:11 +0100
In-Reply-To: <a522c1ac-703a-ba99-c44c-3dd09e4cc4be@de.ibm.com> (Christian
        Borntraeger's message of "Tue, 26 Jan 2021 07:59:51 +0100")
Message-ID: <yt9dy2gg11hc.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-26_06:2021-01-25,2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 mlxlogscore=881 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101260048
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Christian Borntraeger <borntraeger@de.ibm.com> writes:

> On 21.01.21 15:39, Sven Schnelle wrote:
>> Commit 845f44e8ef28 ("sched: Report local wake up on resched blind zone
>> within idle loop") from next-20210121 causes a warning because s390
>> doesn't call sched_resched_local_allow() when restarting a syscall.
>> 
>> Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
>> ---
>>  arch/s390/kernel/syscall.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/arch/s390/kernel/syscall.c b/arch/s390/kernel/syscall.c
>> index bc8e650e377d..2b39ac40f970 100644
>> --- a/arch/s390/kernel/syscall.c
>> +++ b/arch/s390/kernel/syscall.c
>> @@ -162,6 +162,7 @@ void noinstr __do_syscall(struct pt_regs *regs, int per_trap)
>>  		do_syscall(regs);
>>  		if (!test_pt_regs_flag(regs, PIF_SYSCALL_RESTART))
>>  			break;
>> +		sched_resched_local_allow();
>>  		local_irq_enable();
>>  	}
>>  	exit_to_user_mode();
>
> Yesterdays next now fails with
>
>
> arch/s390/kernel/syscall.c: In function '__do_syscall':
> arch/s390/kernel/syscall.c:165:3: error: implicit declaration of function 'sched_resched_local_allow' [-Werror=implicit-function-declaration]
>   165 |   sched_resched_local_allow();
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[2]: *** [scripts/Makefile.build:288: arch/s390/kernel/syscall.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [scripts/Makefile.build:530: arch/s390/kernel] Error 2
> make[1]: *** Waiting for unfinished jobs....

Looks to me like 845f44e8ef28 ("sched: Report local wake up on resched
blind zone") was removed from linux-next. Stephen, can you remove my
commit as well? It is no longer needed.

Thanks
Sven
