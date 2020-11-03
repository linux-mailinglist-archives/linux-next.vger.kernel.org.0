Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4D32A4385
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 11:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgKCKyg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 05:54:36 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4396 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728138AbgKCKyg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2020 05:54:36 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A3AVZsk068215;
        Tue, 3 Nov 2020 05:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=9iZTx7ebHE1V+3EWClR6qMWS/MeynEeaDfbhOhmwIEg=;
 b=R/oD9Yt9yrSIfznfFr7D2t44Wk/SAXyXYW1A5iNzupzyRI33pk7O3CUdb5fQ/EjAC1DA
 Y1hUoz7R4QWEdP72ZsHLdLfQ8lj9XsYI0Szoh7t7KzVnREGb8iGqTSgS3vkEeuqWZhgW
 V0H+kYrAxhNxNdPXo/mkKH/RqRaxVEprlLFDL9XOIAvH3aLRyJyU0blhDj5sN17zL6o3
 t2Jk80aVvYHh3WCffkSMOIifxUFw84d8m1CmjmXBTFbhUXu7U8XeQvlXoQZ31urB2evf
 IWi2zsulo6vcFFZPiy3y2K+etoBQ2CQgxNwHYte+ooHFFMrQzNleymThOU45M6U0rN85 Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 34k3g2ck9d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Nov 2020 05:54:21 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A3AVdV7068466;
        Tue, 3 Nov 2020 05:54:20 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0b-001b2d01.pphosted.com with ESMTP id 34k3g2ck8b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Nov 2020 05:54:20 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A3ArgE7025828;
        Tue, 3 Nov 2020 10:54:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma06fra.de.ibm.com with ESMTP id 34h01khkx2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Nov 2020 10:54:18 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0A3AsGRs3670536
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 3 Nov 2020 10:54:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 11CDDAE056;
        Tue,  3 Nov 2020 10:54:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B3A5AAE053;
        Tue,  3 Nov 2020 10:54:15 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue,  3 Nov 2020 10:54:15 +0000 (GMT)
From:   Sven Schnelle <svens@linux.ibm.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        oleg@redhat.com, tglx@linutronix.de,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Qian Cai <cai@redhat.com>
Subject: Re: [PATCH] s390: add support for TIF_NOTIFY_SIGNAL
References: 
Date:   Tue, 03 Nov 2020 11:54:15 +0100
In-Reply-To: <54c02fa6-8c8a-667f-af99-e83a1f150586 () kernel ! dk> (Jens
        Axboe's message of "Mon, 02 Nov 2020 17:07:33 +0000")
Message-ID: <yt9dsg9q4so8.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-03_07:2020-11-02,2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 clxscore=1011 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=872 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030066
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Jens Axboe <axboe () kernel ! dk> writes:

> On 11/2/20 9:59 AM, Qian Cai wrote:
>> On Sun, 2020-11-01 at 17:31 +0000, Heiko Carstens wrote:
>>> On Thu, Oct 29, 2020 at 10:21:11AM -0600, Jens Axboe wrote:
>>>> Wire up TIF_NOTIFY_SIGNAL handling for s390.
>>>>
>>>> Cc: linux-s390@vger.kernel.org
>>>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>> 
>> Even though I did confirm that today's linux-next contains this additional patch
>> from Heiko below, a z10 guest is still unable to boot. Reverting the whole
>> series (reverting only "s390: add support for TIF_NOTIFY_SIGNAL" introduced
>> compiling errors) fixed the problem, i.e., git revert --no-edit
>> af0dd809f3d3..7b074c15374c [1]
>
> That's odd, it should build fine without that patch. How did it fail for you?
>
> Can you try and add this on top? Looks like I forgot the signal change for
> s390, though that shouldn't really cause any issues.
>
> diff --git a/arch/s390/kernel/signal.c b/arch/s390/kernel/signal.c
> index 9e900a8977bd..a68c3796a1bf 100644
> --- a/arch/s390/kernel/signal.c
> +++ b/arch/s390/kernel/signal.c
> @@ -472,7 +472,7 @@ void do_signal(struct pt_regs *regs)
>  	current->thread.system_call =
>  		test_pt_regs_flag(regs, PIF_SYSCALL) ? regs->int_code : 0;
>  
> -	if (get_signal(&ksig)) {
> +	if (test_thread_flag(TIF_NOTIFY_SIGNAL) && get_signal(&ksig)) {

Shouldn't that be TIF_SIGPENDING?

>  		/* Whee!  Actually deliver the signal.  */
>  		if (current->thread.system_call) {
>  			regs->int_code = current->thread.system_call;
