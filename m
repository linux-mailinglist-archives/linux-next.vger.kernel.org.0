Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231D131BB29
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 15:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhBOOfX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 09:35:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhBOOfW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2021 09:35:22 -0500
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0964C061756;
        Mon, 15 Feb 2021 06:34:41 -0800 (PST)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lBewx-00EHAn-AI; Mon, 15 Feb 2021 14:34:07 +0000
Date:   Mon, 15 Feb 2021 14:34:07 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        LTP List <ltp@lists.linux.it>, lkft-triage@lists.linaro.org,
        chrubis <chrubis@suse.cz>, Jan Stancek <jstancek@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Christian Brauner <christian@brauner.io>,
        Kees Cook <keescook@chromium.org>,
        Peter Xu <peterx@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Vorel <pvorel@suse.cz>,
        Richard Palethorpe <rpalethorpe@suse.com>,
        Joerg.Vehlow@aox-tech.de
Subject: Re: LTP: madvise08.c:203: TFAIL: No sequence in dump after
 MADV_DODUMP.
Message-ID: <YCqGX36I+KR7SoA8@zeniv-ca.linux.org.uk>
References: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
 <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
 <CA+G9fYv89bfbixjuudPWkBAucTYg7qhNxcV54RMEkRP5is-bnQ@mail.gmail.com>
 <YCmAGNyFAOZs7GCG@zeniv-ca.linux.org.uk>
 <CA+G9fYsZnBv4wAEKYb0mgMd-BsgXcPUGBQ=VRKcONqAZry_4XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsZnBv4wAEKYb0mgMd-BsgXcPUGBQ=VRKcONqAZry_4XQ@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 15, 2021 at 02:11:15PM +0530, Naresh Kamboju wrote:

> fs/coredump.c:903:9: error: 'return' with a value, in function
> returning void [-Werror=return-type]
>  903 | return 0;
>         | ^
> 
> Build failed due to above error.

FWIW, here the test results in
Running tests.......
<<<test_start>>>
tag=madvise08 stime=1613398818
cmdline="madvise08"
contacts=""
analysis=exit
<<<test_output>>>
incrementing stop
tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
madvise08.c:78: TINFO: Temporary core pattern is '/tmp/ltp-tgvQ3Lz1UZ/B6lwy6/dump-%p'                              
madvise08.c:117: TINFO: Dump file should be dump-2276
madvise08.c:201: TPASS: madvise(..., MADV_DONTDUMP)
madvise08.c:117: TINFO: Dump file should be dump-2277
madvise08.c:205: TPASS: madvise(..., MADV_DODUMP)

Summary:
passed   2
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>

(built without -Werror=return-type, so I'd missed the warnings)

Anyway, I've folded the fix (with those stray return 0 removed, of course)
into #work.coredump and #for-next; works here.  Could you test either
branch (in git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git)?
