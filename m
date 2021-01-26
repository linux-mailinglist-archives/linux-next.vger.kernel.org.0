Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791793036FD
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 08:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730808AbhAZHCb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 02:02:31 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42912 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731603AbhAZHBA (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 02:01:00 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10Q6UpKu181284;
        Tue, 26 Jan 2021 01:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5PstgGtfJV5yM8M9dEKSWaqbGWhDuPRjgCWmNi5iJl4=;
 b=luFGroTGzqoqrC1YyMYaGDyLF8MYwXnA3HTpxWPz99k/RidnpGIZa9/JJZog/0+oB4Ez
 m3e6TE3Q8JtFMi21FXWr8Z/OTiYKMz8LGk9H0y0WfXfbraKRYknDJfsdyOwLm0n5bAM3
 XSYlokeoDcZ/ElvS/K/IpCdB1VomF6uCj8BUjtH/lcMaw6ktwuVeSdxqY1h3sGb11yOb
 zpBtK1Y3B1NhYuHim5Zs0o/4vbq1Iid2RzAgclI9xwOx94d1xcjeIkAsVELja8AHSl9B
 O8ORPDPnEy6CGhkRXH+53F+mKFQz0ByRzpLe59kdayEWV6lAype+UGAKm2jP2t9N38MJ lQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36ad5bsecs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 01:59:56 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10Q6wEfm017082;
        Tue, 26 Jan 2021 06:59:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma06fra.de.ibm.com with ESMTP id 368b2h9add-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 06:59:55 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10Q6xq1P13435240
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 06:59:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0735B11C052;
        Tue, 26 Jan 2021 06:59:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 94D9E11C050;
        Tue, 26 Jan 2021 06:59:51 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.45.123])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 26 Jan 2021 06:59:51 +0000 (GMT)
Subject: Re: [PATCH] s390: allow reschedule on syscall restart
To:     Sven Schnelle <svens@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
References: <20210121143926.21440-1-svens@linux.ibm.com>
 <20210121143926.21440-2-svens@linux.ibm.com>
From:   Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <a522c1ac-703a-ba99-c44c-3dd09e4cc4be@de.ibm.com>
Date:   Tue, 26 Jan 2021 07:59:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121143926.21440-2-svens@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-26_03:2021-01-25,2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260032
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 21.01.21 15:39, Sven Schnelle wrote:
> Commit 845f44e8ef28 ("sched: Report local wake up on resched blind zone
> within idle loop") from next-20210121 causes a warning because s390
> doesn't call sched_resched_local_allow() when restarting a syscall.
> 
> Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
> ---
>  arch/s390/kernel/syscall.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/s390/kernel/syscall.c b/arch/s390/kernel/syscall.c
> index bc8e650e377d..2b39ac40f970 100644
> --- a/arch/s390/kernel/syscall.c
> +++ b/arch/s390/kernel/syscall.c
> @@ -162,6 +162,7 @@ void noinstr __do_syscall(struct pt_regs *regs, int per_trap)
>  		do_syscall(regs);
>  		if (!test_pt_regs_flag(regs, PIF_SYSCALL_RESTART))
>  			break;
> +		sched_resched_local_allow();
>  		local_irq_enable();
>  	}
>  	exit_to_user_mode();

Yesterdays next now fails with


arch/s390/kernel/syscall.c: In function '__do_syscall':
arch/s390/kernel/syscall.c:165:3: error: implicit declaration of function 'sched_resched_local_allow' [-Werror=implicit-function-declaration]
  165 |   sched_resched_local_allow();
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [scripts/Makefile.build:288: arch/s390/kernel/syscall.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [scripts/Makefile.build:530: arch/s390/kernel] Error 2
make[1]: *** Waiting for unfinished jobs....
