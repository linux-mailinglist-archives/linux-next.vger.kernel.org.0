Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F5528AEC3
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 09:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgJLHGc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 03:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgJLHGb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2020 03:06:31 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFFA9C0613CE;
        Mon, 12 Oct 2020 00:06:31 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id q7so14971175ile.8;
        Mon, 12 Oct 2020 00:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=SRoIVG6H/Y91QXxgqhGCHvTR9cPOGgBN0laolAnXTB8=;
        b=Yliuc5PIIDYE3gdaIPk5I885ofQSSAeTB1cjLn38xOO1eZ9MCVMzSbcQZuwzoDrgWd
         s7xonkYufqJkNGYWYHON783DAGCjAS/wQZ9vdQsGZhiSY2WwyDqPKQ02xwo4IWjzqlSw
         lyZ6JWONaZeLnEDVwjXBytGO0U+aZEtJVf8I3a++o0KaeOCXb/uplt0V7WCEm31sejaX
         NXj+kgZ14QNmo0adPHCUGo4jV5rYwE3gvje7QOgBch07vtgilC+DFc6qC11ibFUU1Jwf
         bX7czaYK9NkS4WE/r0mfAsBqnrXBjttL8tSWXShwdGzFUheYqJJYs0lqG9QNUphZ4uii
         ADCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=SRoIVG6H/Y91QXxgqhGCHvTR9cPOGgBN0laolAnXTB8=;
        b=YJcHQgt8d4+FvJJ+HdfrHz4eyLLi+lnaKhKRq2GZZFh3LaKClcm8yz0vxu9eajTBg9
         /HdFYZCmzD+/svxZYwfFJUgKcSdZWs12+cc4AhAf9sQQyxBTsp20C4oPLO2zWFY/Fgsw
         uxieI2ztgzAcGzMTN5HcIHr09uDKHHzfQ+dCt8Rb0L8K3mOr2CW16/sS9L18QjjKnKyk
         mI2qOqIalkmCB+BxSkSKoDkeX+HwllxoZPttjjjiERZwoO0f0GPLqdOKpMa5pWufAk8o
         uwX/BwFOjcIZxGUkSKZjC2aLH/yLFeiMRFlnOfAW8hf1Edx+J98sKCirbqpWOG59vePp
         bfOg==
X-Gm-Message-State: AOAM532Vi6R783arnfo0qczP7sObzXh/leDI+rkjwnA7wT7HbWhiOTyu
        ZOGHT4OzrzcKDdgsnWKb3CF4npcp4ugPfqcPjFZPYkoj0VA=
X-Google-Smtp-Source: ABdhPJwFv69oxeR9rSNckDagw2DpAldHoeht35URq3zDQ0LOTiz62VTmJrRKYRHst/a5B169av6GUd3BhLnLDdxOnqs=
X-Received: by 2002:a92:c986:: with SMTP id y6mr17476173iln.10.1602486390850;
 Mon, 12 Oct 2020 00:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201009112327.GC656950@krava> <cover.thread-251403.your-ad-here.call-01602244460-ext-7088@work.hours>
 <patch-1.thread-251403.git-2514037e9477.your-ad-here.call-01602244460-ext-7088@work.hours>
In-Reply-To: <patch-1.thread-251403.git-2514037e9477.your-ad-here.call-01602244460-ext-7088@work.hours>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 12 Oct 2020 09:06:17 +0200
Message-ID: <CA+icZUVk_OMN76PCug-QAAzMOw=EWFwt=-MdxDVGpj5NYQ-bvg@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/1] perf build: Allow nested externs to enable
 BUILD_BUG() usage
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Jiri Olsa <jolsa@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 9, 2020 at 8:35 PM Vasily Gorbik <gor@linux.ibm.com> wrote:
>
> Currently BUILD_BUG() macro is expanded to smth like the following:

Two feedbacks:

#1: Greg KH told me to expand abbreviated words, here "smth = something".

#2: Interesting to see an ASCII-art in the signature is causing such troubles.

- Sedat -


>    do {
>            extern void __compiletime_assert_0(void)
>                    __attribute__((error("BUILD_BUG failed")));
>            if (!(!(1)))
>                    __compiletime_assert_0();
>    } while (0);
>
> If used in a function body this obviously would produce build errors
> with -Wnested-externs and -Werror.
>
> To enable BUILD_BUG() usage in tools/arch/x86/lib/insn.c which perf
> includes in intel-pt-decoder, build perf without -Wnested-externs.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
> ---
>  Resend with no fancy signatures.
>
>  tools/perf/Makefile.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 854da830b5ca..834061e94e7c 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -16,7 +16,7 @@ $(shell printf "" > $(OUTPUT).config-detected)
>  detected     = $(shell echo "$(1)=y"       >> $(OUTPUT).config-detected)
>  detected_var = $(shell echo "$(1)=$($(1))" >> $(OUTPUT).config-detected)
>
> -CFLAGS := $(EXTRA_CFLAGS) $(EXTRA_WARNINGS)
> +CFLAGS := $(EXTRA_CFLAGS) $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))
>
>  include $(srctree)/tools/scripts/Makefile.arch
>
> --
> 2.25.4
