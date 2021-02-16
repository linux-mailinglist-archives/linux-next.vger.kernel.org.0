Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB8631C4BE
	for <lists+linux-next@lfdr.de>; Tue, 16 Feb 2021 02:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhBPBEW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 20:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhBPBEF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2021 20:04:05 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D777FC061756
        for <linux-next@vger.kernel.org>; Mon, 15 Feb 2021 17:03:24 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id do6so3639745ejc.3
        for <linux-next@vger.kernel.org>; Mon, 15 Feb 2021 17:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zrjbMWbLD5k1YU1gY6sgg8lrLPs48sMOTQtq5qr6+JE=;
        b=LIupk08tNIWocLfmHYdevHIaMUM6xGoaBpAWMYTkuBgf3r3EGTFB209egHvSXfoGNS
         GWCWd7fEN/Bq4pnpKID2URgFbQqUTAU0x5/K9yCIWixQjRfUYcasFfnfI4Dz/HnBRG54
         dhmq2a26jT7RKOsFjj3UmPANSPpO/7HeXa05EhfgHmDdrRYh0xun30YVkTlAlSliJdOU
         x9oPZ9Mw5Y+RDjR1FrWgrdAicmx3f7lHd4l1LWa9dYQyyqjqsWggjk61PKX40m4ENZxw
         pC5aJ3gDug4zgcA1QWzS75Qk5sOiWwwLuPUfn3cSlR4bGI7xeUwEbZSP01Nb3XKKQ4gp
         NviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zrjbMWbLD5k1YU1gY6sgg8lrLPs48sMOTQtq5qr6+JE=;
        b=cC7Mx+kVTSYTcUs1cpeQ/Z5QdhZsMSekegJ3GbvxCcEbv288tlvxIMkqrI1Hgbvoj6
         r8W4vNNGzD8o3vP5tDS9lpgCYw7qKpw/B6dCjsJD7lL0flrSJYiMlyVUgcTCnajayAbY
         u8MqQPzxe0vB7Cm00U0Rx3o4XZhco9+30CJXGCjrlMZSQ4QnLVxaOQdqNpV7SiQk/1DY
         ZpTxd8Wt6uLNNaKsKc0rhLlVaXnjl2EQfDhV394ul3Y7ef1xw+LnPWtbw/Ve51vbY4Y2
         f2UhMFcN1fNBv03eCGzH3/8gyvgHnbjx/AC4+tNcV6xiMUURi4AMjQR+BH29SZZcVPaY
         bQvQ==
X-Gm-Message-State: AOAM532fqyfnvefyhssoTX2KRR5O8tzonBJhYC3sar1Mga4G9FhcSPvb
        O4wtl7BS/DIIv9FE5/q+7LMasi8jTB+WAmwyIxa6iw==
X-Google-Smtp-Source: ABdhPJy8c/0gVUxzxzOu465gevLaW/oq5+vXZq8cBcdf0ZCueZjV3UO69BfxcbMCkyHxtXaBOFrKeIBIx/oCPyWBv/g=
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr17896470eju.375.1613437403417;
 Mon, 15 Feb 2021 17:03:23 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
 <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
 <CA+G9fYv89bfbixjuudPWkBAucTYg7qhNxcV54RMEkRP5is-bnQ@mail.gmail.com>
 <YCmAGNyFAOZs7GCG@zeniv-ca.linux.org.uk> <CA+G9fYsZnBv4wAEKYb0mgMd-BsgXcPUGBQ=VRKcONqAZry_4XQ@mail.gmail.com>
 <YCqGX36I+KR7SoA8@zeniv-ca.linux.org.uk>
In-Reply-To: <YCqGX36I+KR7SoA8@zeniv-ca.linux.org.uk>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 16 Feb 2021 06:33:12 +0530
Message-ID: <CA+G9fYuq7bpDhY3cA5O66bf0nxKUkbtiTMcLMqBYvWKLhNfrjQ@mail.gmail.com>
Subject: Re: LTP: madvise08.c:203: TFAIL: No sequence in dump after MADV_DODUMP.
To:     Al Viro <viro@zeniv.linux.org.uk>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 15 Feb 2021 at 20:05, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Feb 15, 2021 at 02:11:15PM +0530, Naresh Kamboju wrote:
>
> > fs/coredump.c:903:9: error: 'return' with a value, in function
> > returning void [-Werror=return-type]
> >  903 | return 0;
> >         | ^
> >
> > Build failed due to above error.
>
> FWIW, here the test results in
> Running tests.......
> <<<test_start>>>
> tag=madvise08 stime=1613398818
> cmdline="madvise08"
> contacts=""
> analysis=exit
> <<<test_output>>>
> incrementing stop
> tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
> madvise08.c:78: TINFO: Temporary core pattern is '/tmp/ltp-tgvQ3Lz1UZ/B6lwy6/dump-%p'
> madvise08.c:117: TINFO: Dump file should be dump-2276
> madvise08.c:201: TPASS: madvise(..., MADV_DONTDUMP)
> madvise08.c:117: TINFO: Dump file should be dump-2277
> madvise08.c:205: TPASS: madvise(..., MADV_DODUMP)
>
> Summary:
> passed   2
> failed   0
> skipped  0
> warnings 0
> <<<execution_status>>>
> initiation_status="ok"
> duration=0 termination_type=exited termination_id=0 corefile=no
> cutime=0 cstime=0
> <<<test_end>>>
>
> (built without -Werror=return-type, so I'd missed the warnings)
>
> Anyway, I've folded the fix (with those stray return 0 removed, of course)
> into #work.coredump and #for-next; works here.  Could you test either
> branch (in git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git)?

By using Linaro tuxsuite [1] I have built your tree and tested on x86_64 and
the reported test PASS now.

LTP syscalls [2] and LTP fs [3] tested on x86_64 and both PASS.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>


[1] https://gitlab.com/Linaro/tuxsuite
[2] https://lkft.validation.linaro.org/results/2278012
[3] https://lkft.validation.linaro.org/results/2280979

- Naresh
