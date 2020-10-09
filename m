Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268E62887C5
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 13:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388055AbgJILXj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 07:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52915 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387961AbgJILXj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 07:23:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602242617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WJdri2oZoNVHxIAcqLLd1XqQYsP87sfa6ccUO/06Bx8=;
        b=I7GpRWv4Zzfgdkzg++YdC4AHjWxrUMLWCX+WmqBcZ6cEaCLXiYNFAQHSAMCdox2WFdABut
        V3TsAts78n+kSYSUOUqAAHsNk+Sf4dp5iT8hjcDjFZTp54fdY3NlXxMgnjSxHk6rkVxW1A
        OvKMX+7rlXEEG/biTpPYgVL+32ufskM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-UloWVlHdOoWuW2NlJ9hzUw-1; Fri, 09 Oct 2020 07:23:33 -0400
X-MC-Unique: UloWVlHdOoWuW2NlJ9hzUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B079D80401F;
        Fri,  9 Oct 2020 11:23:31 +0000 (UTC)
Received: from krava (unknown [10.40.195.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 19B2F75124;
        Fri,  9 Oct 2020 11:23:27 +0000 (UTC)
Date:   Fri, 9 Oct 2020 13:23:27 +0200
From:   Jiri Olsa <jolsa@redhat.com>
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
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
Subject: Re: [PATCH 1/1] perf build: Allow nested externs to enable
 BUILD_BUG() usage
Message-ID: <20201009112327.GC656950@krava>
References: <20201009152846.072e6bbf@canb.auug.org.au>
 <cover.thread-d92c35.your-ad-here.call-01602224864-ext-8734@work.hours>
 <patch-1.thread-d92c35.git-d92c35ca4748.your-ad-here.call-01602224864-ext-8734@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <patch-1.thread-d92c35.git-d92c35ca4748.your-ad-here.call-01602224864-ext-8734@work.hours>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 09, 2020 at 08:47:45AM +0200, Vasily Gorbik wrote:
> Currently BUILD_BUG() macro is expanded to smth like the following:
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
>  tools/perf/Makefile.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 190be4fa5c21..8137a6046a47 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -16,7 +16,7 @@ $(shell printf "" > $(OUTPUT).config-detected)
>  detected     = $(shell echo "$(1)=y"       >> $(OUTPUT).config-detected)
>  detected_var = $(shell echo "$(1)=$($(1))" >> $(OUTPUT).config-detected)
>  
> -CFLAGS := $(EXTRA_CFLAGS) $(EXTRA_WARNINGS)
> +CFLAGS := $(EXTRA_CFLAGS) $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))

looks good, but I can't apply the patch with 'git am'

	Applying: perf build: Allow nested externs to enable BUILD_BUG() usage
	error: patch failed: tools/perf/Makefile.config:16
	error: tools/perf/Makefile.config: patch does not apply
	Patch failed at 0001 perf build: Allow nested externs to enable BUILD_BUG() usage
	hint: Use 'git am --show-current-patch=diff' to see the failed patch
	When you have resolved this problem, run "git am --continue".
	If you prefer to skip this patch, run "git am --skip" instead.
	To restore the original branch and stop patching, run "git am --abort".

I wonder it's that picture at the bottom ;-)

jirka


>  
>  include $(srctree)/tools/scripts/Makefile.arch
>  
> -- 
> ⣿⣿⣿⣿⢋⡀⣀⠹⣿⣿⣿⣿
> ⣿⣿⣿⣿⠠⣶⡦⠀⣿⣿⣿⣿
> ⣿⣿⣿⠏⣴⣮⣴⣧⠈⢿⣿⣿
> ⣿⣿⡏⢰⣿⠖⣠⣿⡆⠈⣿⣿
> ⣿⢛⣵⣄⠙⣶⣶⡟⣅⣠⠹⣿
> ⣿⣜⣛⠻⢎⣉⣉⣀⠿⣫⣵⣿

