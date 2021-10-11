Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F8742905D
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 16:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237865AbhJKOHe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 10:07:34 -0400
Received: from out02.mta.xmission.com ([166.70.13.232]:33340 "EHLO
        out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236251AbhJKOFc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 10:05:32 -0400
Received: from in02.mta.xmission.com ([166.70.13.52]:51804)
        by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1mZvtq-009WKJ-9e; Mon, 11 Oct 2021 08:03:30 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:37486 helo=email.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1mZvto-00Dphn-T0; Mon, 11 Oct 2021 08:03:29 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
References: <20211011174103.58413a7b@canb.auug.org.au>
Date:   Mon, 11 Oct 2021 09:03:22 -0500
In-Reply-To: <20211011174103.58413a7b@canb.auug.org.au> (Stephen Rothwell's
        message of "Mon, 11 Oct 2021 17:41:03 +1100")
Message-ID: <87bl3vbqvp.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1mZvto-00Dphn-T0;;;mid=<87bl3vbqvp.fsf@disp2133>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX18pvCoX97MHC/BwHnU46j5q1g3ulNRVMTw=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=8.0 tests=ALL_TRUSTED,BAYES_20,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMSubLong autolearn=disabled
        version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        * -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
        *      [score: 0.1903]
        *  0.7 XMSubLong Long Subject
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Stephen Rothwell <sfr@canb.auug.org.au>
X-Spam-Relay-Country: 
X-Spam-Timing: total 526 ms - load_scoreonly_sql: 0.03 (0.0%),
        signal_user_changed: 10 (1.8%), b_tie_ro: 8 (1.6%), parse: 0.76 (0.1%),
         extract_message_metadata: 11 (2.1%), get_uri_detail_list: 0.82 (0.2%),
         tests_pri_-1000: 5.0 (0.9%), tests_pri_-950: 1.27 (0.2%),
        tests_pri_-900: 1.01 (0.2%), tests_pri_-90: 252 (48.0%), check_bayes:
        247 (46.9%), b_tokenize: 4.6 (0.9%), b_tok_get_all: 4.6 (0.9%),
        b_comp_prob: 2.6 (0.5%), b_tok_touch_all: 231 (44.0%), b_finish: 1.01
        (0.2%), tests_pri_0: 231 (43.9%), check_dkim_signature: 0.75 (0.1%),
        check_dkim_adsp: 12 (2.3%), poll_dns_idle: 2.7 (0.5%), tests_pri_10:
        2.4 (0.5%), tests_pri_500: 9 (1.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: linux-next: manual merge of the akpm-current tree with the userns tree
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   kernel/exit.c
>
> between commits:
>
>   d67e03e36161 ("exit: Factor coredump_exit_mm out of exit_mm")
>   92307383082d ("coredump:  Don't perform any cleanups before dumping core")
>
> from the userns tree and commit:
>
>   27692e64c49c ("lazy tlb: introduce lazy mm refcount helper functions")
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.  This looks like a trivial conflict, and the resolution looks
correct.

Eric

