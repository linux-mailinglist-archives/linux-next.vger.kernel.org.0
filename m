Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81F72C8B1C
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 18:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387573AbgK3RbZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 12:31:25 -0500
Received: from out03.mta.xmission.com ([166.70.13.233]:34036 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387570AbgK3RbZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2020 12:31:25 -0500
Received: from in02.mta.xmission.com ([166.70.13.52])
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1kjn0a-004dt6-HG; Mon, 30 Nov 2020 10:30:40 -0700
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95] helo=x220.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1kjn0U-001x1h-Rk; Mon, 30 Nov 2020 10:30:40 -0700
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
        <155a20fd-09c4-df35-9cc6-8526a89c2933@infradead.org>
        <20201128084414.3daa87d2@canb.auug.org.au>
        <87pn3unbtv.fsf@x220.int.ebiederm.org>
Date:   Mon, 30 Nov 2020 11:30:05 -0600
In-Reply-To: <87pn3unbtv.fsf@x220.int.ebiederm.org> (Eric W. Biederman's
        message of "Mon, 30 Nov 2020 08:44:44 -0600")
Message-ID: <87blfen46a.fsf_-_@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1kjn0U-001x1h-Rk;;;mid=<87blfen46a.fsf_-_@x220.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX18RelCMmMbZtHThwNkcw42rNjvm/YjAkTk=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
        DCC_CHECK_NEGATIVE,T_TooManySym_01,XMGappySubj_01,XMSubLong
        autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4757]
        *  0.5 XMGappySubj_01 Very gappy subject
        *  0.7 XMSubLong Long Subject
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
        *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Stephen Rothwell <sfr@canb.auug.org.au>
X-Spam-Relay-Country: 
X-Spam-Timing: total 5282 ms - load_scoreonly_sql: 0.04 (0.0%),
        signal_user_changed: 8 (0.2%), b_tie_ro: 7 (0.1%), parse: 0.81 (0.0%),
        extract_message_metadata: 14 (0.3%), get_uri_detail_list: 1.37 (0.0%),
        tests_pri_-1000: 13 (0.3%), tests_pri_-950: 1.18 (0.0%),
        tests_pri_-900: 0.96 (0.0%), tests_pri_-90: 244 (4.6%), check_bayes:
        242 (4.6%), b_tokenize: 7 (0.1%), b_tok_get_all: 6 (0.1%),
        b_comp_prob: 2.1 (0.0%), b_tok_touch_all: 224 (4.2%), b_finish: 0.77
        (0.0%), tests_pri_0: 256 (4.8%), check_dkim_signature: 0.50 (0.0%),
        check_dkim_adsp: 2.5 (0.0%), poll_dns_idle: 4685 (88.7%),
        tests_pri_10: 2.2 (0.0%), tests_pri_500: 4739 (89.7%), rewrite_mail:
        0.00 (0.0%)
Subject: [PATCH] signal/parics: Remove parsic specific definition of __ARCH_UAPI_SA_FLAGS
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Randy Dunlap wrote:
> On 11/27/20 10:43 AM, Randy Dunlap wrote:
>
> > on parisc, _SA_SIGGFAULT is undefined and causing build errors.
> >
> > commit 23acdc76f1798b090bb9dcc90671cd29d929834e
> > Author: Peter Collingbourne <pcc@google.com>
> > Date:   Thu Nov 12 18:53:34 2020 -0800
> >
> >     signal: clear non-uapi flag bits when passing/returning sa_flags
> >
> >
> >
> > _SA_SIGGFAULT is not used or defined anywhere else in the
> > kernel source tree.
>
>
> Here is the build error (although it should be obvious):
>
> ../kernel/signal.c: In function 'do_sigaction':
> ../arch/parisc/include/asm/signal.h:24:30: error: '_SA_SIGGFAULT' undeclared (first use in this function)
>    24 | #define __ARCH_UAPI_SA_FLAGS _SA_SIGGFAULT
>       |                              ^~~~~~~~~~~~~

Stephen Rothwell pointed out:
> _SA_SIGGFAULT was removed by commit
>
>   41f5a81c07cd ("parisc: Drop HP-UX specific fcntl and signal flags")
>
> which was added to Linus' tree in v5.10-rc1.

Solve this by removing the the parisc specific definition of
__ARCH_UAPI_SA_FLAGS that was just added.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: 23acdc76f179 ("signal: clear non-uapi flag bits when passing/returning sa_flags")
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---
 arch/parisc/include/asm/signal.h | 2 --
 1 file changed, 2 deletions(-)

I am applying this trivial fix to my signal-for-v5.11 branch.  Catalin
you shouldn't need to do anything unless someone tests your tree on
parisc.

diff --git a/arch/parisc/include/asm/signal.h b/arch/parisc/include/asm/signal.h
index 30dd1e43ef88..715c96ba2ec8 100644
--- a/arch/parisc/include/asm/signal.h
+++ b/arch/parisc/include/asm/signal.h
@@ -21,8 +21,6 @@ typedef struct {
 	unsigned long sig[_NSIG_WORDS];
 } sigset_t;
 
-#define __ARCH_UAPI_SA_FLAGS	_SA_SIGGFAULT
-
 #include <asm/sigcontext.h>
 
 #endif /* !__ASSEMBLY */
-- 
2.20.1

