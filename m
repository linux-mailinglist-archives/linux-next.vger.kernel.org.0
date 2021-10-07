Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED2F425B2E
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 20:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbhJGS7n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Oct 2021 14:59:43 -0400
Received: from out03.mta.xmission.com ([166.70.13.233]:46128 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbhJGS7m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Oct 2021 14:59:42 -0400
Received: from in02.mta.xmission.com ([166.70.13.52]:56214)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1mYYaR-005Ij6-8u; Thu, 07 Oct 2021 12:57:47 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:48228 helo=email.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1mYYaP-006fsf-4s; Thu, 07 Oct 2021 12:57:46 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211007144701.67592574@canb.auug.org.au>
Date:   Thu, 07 Oct 2021 13:56:43 -0500
In-Reply-To: <20211007144701.67592574@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 7 Oct 2021 14:47:01 +1100")
Message-ID: <87fstcfytw.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1mYYaP-006fsf-4s;;;mid=<87fstcfytw.fsf@disp2133>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX1+CuyOSS9Ee+C+kXl+dwJxQ622Pnrj4nis=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa03.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=8.0 tests=ALL_TRUSTED,BAYES_40,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMSubLong autolearn=disabled
        version=3.4.2
X-Spam-Virus: No
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
        *      [score: 0.2187]
        *  0.7 XMSubLong Long Subject
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa03 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa03 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Stephen Rothwell <sfr@canb.auug.org.au>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1401 ms - load_scoreonly_sql: 0.04 (0.0%),
        signal_user_changed: 4.5 (0.3%), b_tie_ro: 3.1 (0.2%), parse: 1.03
        (0.1%), extract_message_metadata: 11 (0.8%), get_uri_detail_list: 1.27
        (0.1%), tests_pri_-1000: 4.0 (0.3%), tests_pri_-950: 1.15 (0.1%),
        tests_pri_-900: 0.85 (0.1%), tests_pri_-90: 89 (6.4%), check_bayes: 88
        (6.2%), b_tokenize: 3.9 (0.3%), b_tok_get_all: 5 (0.4%), b_comp_prob:
        1.38 (0.1%), b_tok_touch_all: 74 (5.3%), b_finish: 0.78 (0.1%),
        tests_pri_0: 1163 (83.0%), check_dkim_signature: 0.37 (0.0%),
        check_dkim_adsp: 2.4 (0.2%), poll_dns_idle: 116 (8.2%), tests_pri_10:
        1.70 (0.1%), tests_pri_500: 123 (8.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: linux-next: build failure after merge of the userns tree
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the userns tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> In file included from include/linux/kernel.h:19,
>                  from mm/debug.c:9:
> mm/debug.c: In function 'dump_mm':
> mm/debug.c:251:28: error: 'const struct mm_struct' has no member named 'core_state'
>   251 |   mm->binfmt, mm->flags, mm->core_state,
>       |                            ^~
> include/linux/printk.h:418:19: note: in definition of macro 'printk_index_wrap'
>   418 |   _p_func(_fmt, ##__VA_ARGS__);    \
>       |                   ^~~~~~~~~~~
> include/linux/printk.h:459:2: note: in expansion of macro 'printk'
>   459 |  printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
>       |  ^~~~~~
> mm/debug.c:208:2: note: in expansion of macro 'pr_emerg'
>   208 |  pr_emerg("mm %px mmap %px seqnum %llu task_size %lu\n"
>       |  ^~~~~~~~
>
> Caused by commit
>
>   483f2bb374b7 ("coredump: Limit coredumps to a single thread group")
>
> I have used the userns tree from next-20211006 for today.

Thanks for the catch.

I removed mm->core_state and apparently mm->debug was printing it out
for no apparent reason.

I will add a patch to remove the debug information as well.

Eric

