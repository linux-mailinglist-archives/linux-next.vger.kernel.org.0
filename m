Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08841288905
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 14:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731643AbgJIMlZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 08:41:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30704 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731486AbgJIMlX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 08:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602247281;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8iSaIMVSVQHr/JxIqXJ8Ng+pow+HPTQuFy/2lPul82w=;
        b=fROop0BNQh3SRDftXs2ZPqW/LkLnPwLk2WoHyCLsh37uQR6d501RVWTEbp817yKh+j2F6U
        FJDwmSsk+aa4Rb6z2nn4P1WRVJJ5ambw6WHgbfQM0YkZx1J9DSSuMEQVJEDDGEMMQRC4Te
        ux7uAnJgqb0WdKtxOo2ngM1KzgXnufA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-Cqu0nr04MvioROAHMnDFuA-1; Fri, 09 Oct 2020 08:41:17 -0400
X-MC-Unique: Cqu0nr04MvioROAHMnDFuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 757FE10E2180;
        Fri,  9 Oct 2020 12:41:15 +0000 (UTC)
Received: from krava (unknown [10.40.195.10])
        by smtp.corp.redhat.com (Postfix) with SMTP id 7C51B5D9E8;
        Fri,  9 Oct 2020 12:41:12 +0000 (UTC)
Date:   Fri, 9 Oct 2020 14:41:11 +0200
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
Subject: Re: [PATCH RESEND 1/1] perf build: Allow nested externs to enable
 BUILD_BUG() usage
Message-ID: <20201009124111.GD656950@krava>
References: <20201009112327.GC656950@krava>
 <cover.thread-251403.your-ad-here.call-01602244460-ext-7088@work.hours>
 <patch-1.thread-251403.git-2514037e9477.your-ad-here.call-01602244460-ext-7088@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <patch-1.thread-251403.git-2514037e9477.your-ad-here.call-01602244460-ext-7088@work.hours>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 09, 2020 at 02:25:23PM +0200, Vasily Gorbik wrote:
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

that one applied nicely ;-) thanks

Acked-by: Jiri Olsa <jolsa@redhat.com>

jirka

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
> 

