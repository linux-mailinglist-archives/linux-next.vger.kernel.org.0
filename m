Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 030CC434F90
	for <lists+linux-next@lfdr.de>; Wed, 20 Oct 2021 18:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbhJTQD7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 12:03:59 -0400
Received: from out03.mta.xmission.com ([166.70.13.233]:52932 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhJTQD5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Oct 2021 12:03:57 -0400
Received: from in02.mta.xmission.com ([166.70.13.52]:40844)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1mdE28-002QTs-V7; Wed, 20 Oct 2021 10:01:40 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:42706 helo=email.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1mdE27-000qtw-Tc; Wed, 20 Oct 2021 10:01:40 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yu Zhao <yuzhao@google.com>, Alexey Gladkov <legion@kernel.org>
References: <20211020144651.10321529@canb.auug.org.au>
Date:   Wed, 20 Oct 2021 11:00:14 -0500
In-Reply-To: <20211020144651.10321529@canb.auug.org.au> (Stephen Rothwell's
        message of "Wed, 20 Oct 2021 14:46:51 +1100")
Message-ID: <875ytrptyp.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1mdE27-000qtw-Tc;;;mid=<875ytrptyp.fsf@disp2133>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX1+nFg8WEoM2KyuoGiFCYzJt/cSk6/DICqw=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa05.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMSubLong autolearn=disabled
        version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4987]
        *  0.7 XMSubLong Long Subject
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa05 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Stephen Rothwell <sfr@canb.auug.org.au>
X-Spam-Relay-Country: 
X-Spam-Timing: total 402 ms - load_scoreonly_sql: 0.05 (0.0%),
        signal_user_changed: 10 (2.6%), b_tie_ro: 9 (2.3%), parse: 0.75 (0.2%),
         extract_message_metadata: 10 (2.4%), get_uri_detail_list: 1.11 (0.3%),
         tests_pri_-1000: 4.5 (1.1%), tests_pri_-950: 1.09 (0.3%),
        tests_pri_-900: 0.83 (0.2%), tests_pri_-90: 144 (35.9%), check_bayes:
        143 (35.5%), b_tokenize: 6 (1.4%), b_tok_get_all: 6 (1.4%),
        b_comp_prob: 1.59 (0.4%), b_tok_touch_all: 126 (31.4%), b_finish: 0.88
        (0.2%), tests_pri_0: 217 (54.0%), check_dkim_signature: 0.47 (0.1%),
        check_dkim_adsp: 2.4 (0.6%), poll_dns_idle: 1.74 (0.4%), tests_pri_10:
        1.74 (0.4%), tests_pri_500: 9 (2.2%), rewrite_mail: 0.00 (0.0%)
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
> In file included from arch/x86/include/asm/bug.h:84,
>                  from include/linux/bug.h:5,
>                  from arch/x86/include/asm/paravirt.h:15,
>                  from arch/x86/include/asm/irqflags.h:63,
>                  from include/linux/irqflags.h:16,
>                  from include/linux/rcupdate.h:26,
>                  from include/linux/rculist.h:11,
>                  from include/linux/pid.h:5,
>                  from include/linux/sched.h:14,
>                  from security/keys/process_keys.c:9:
> security/keys/process_keys.c: In function 'key_change_session_keyring':
> security/keys/process_keys.c:923:16: error: format '%s' expects a matching 'char *' argument [-Werror=format=]
>   923 |   WARN_ONCE(1, "In %s get_ucounts failed\n");
>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/asm-generic/bug.h:99:17: note: in definition of macro '__WARN_printf'
>    99 |   __warn_printk(arg);     \
>       |                 ^~~
> include/linux/once_lite.h:19:4: note: in expansion of macro 'WARN'
>    19 |    func(__VA_ARGS__);    \
>       |    ^~~~
> include/asm-generic/bug.h:150:2: note: in expansion of macro 'DO_ONCE_LITE_IF'
>   150 |  DO_ONCE_LITE_IF(condition, WARN, 1, format)
>       |  ^~~~~~~~~~~~~~~
> security/keys/process_keys.c:923:3: note: in expansion of macro 'WARN_ONCE'
>   923 |   WARN_ONCE(1, "In %s get_ucounts failed\n");
>       |   ^~~~~~~~~
> security/keys/process_keys.c:923:21: note: format string is defined here
>   923 |   WARN_ONCE(1, "In %s get_ucounts failed\n");
>       |                    ~^
>       |                     |
>       |                     char *
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   346b5b4aa656 ("ucounts: Move get_ucounts from cred_alloc_blank to key_change_session_keyring")
>
> I have used the userns tree from next-20211019 for today.

Thank you very much for catching that.

I am now quite embarrassed I did not catch that myself.

Eric

