Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 991495ECCE7
	for <lists+linux-next@lfdr.de>; Tue, 27 Sep 2022 21:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbiI0TaW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Sep 2022 15:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiI0TaR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2022 15:30:17 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1235A7F27C
        for <linux-next@vger.kernel.org>; Tue, 27 Sep 2022 12:30:16 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so10991044pjk.2
        for <linux-next@vger.kernel.org>; Tue, 27 Sep 2022 12:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=844Pn5/LmB3AgRBlNHvx7SD6mQmPiws8Jz+CEqeNnBo=;
        b=NIU9GtqmP9SDovCmNROhmPvmHVSL46uToOK7pH6L3+xEm/abkir/lYfF28EfoVzaJE
         kEvjRmoqPn6n9rXPvTiGDvjIjvZiiWEuBmI6Fu/izAFImycrwcT7EySvkV6kA9KXWfc2
         GYaKA1YJM5uZDZVZ5HSkj9e/QZgOHJ44Opmqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=844Pn5/LmB3AgRBlNHvx7SD6mQmPiws8Jz+CEqeNnBo=;
        b=JPBH9g7eDoWnjpQdIWjcfjgGx1bmIb9S6fvfdiAb1CrKvnBUbHcoQUbI0C4mbAGK3w
         an9BvaLseCspSXmwQLqP4oyGJPzzdOUaf7onRNj0pl//HvTLqyIr9jjiGyrvDiJtfIOA
         raV8RfulgV8rkJSw1M9HRk5Zd2QVvh8mmtgXRm5MYxzEp+y6xYvwnZTMcgHqFKBe668J
         bXqT/Gt/ktmD0xCgl+UMQfIJu5WBO7leh2tN6tZPoTWFBt9t0vQGVXCzvIr+40EjG4gm
         gIpQhry2KNM7eeOa9cMn19V5dH/peH65SQyp93XjzxoMx54MLsq0uuDNsMY+wMbfyENR
         VRSA==
X-Gm-Message-State: ACrzQf0qYYsIo27nyLfMoOXxIJL9o4rRFr3/91bJtYPqEdzGO/YHf0T/
        SIzZRyqh1e0eFMIJsyCVjxGMng==
X-Google-Smtp-Source: AMsMyM4ueT7KkoBG8PtpFhz2PTg1nUZLbqZsIiH9K9mxTYh5fN11JIHtpv9FEpVzMaKNZ9MptQ2HOw==
X-Received: by 2002:a17:90b:4d12:b0:202:f027:557e with SMTP id mw18-20020a17090b4d1200b00202f027557emr6325309pjb.1.1664307015549;
        Tue, 27 Sep 2022 12:30:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c17-20020a170903235100b001732a019dddsm1967091plh.174.2022.09.27.12.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 12:30:14 -0700 (PDT)
Date:   Tue, 27 Sep 2022 12:30:14 -0700
From:   Kees Cook <keescook@chromium.org>
To:     broonie@kernel.org
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Jiri Olsa <jolsa@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the kspp tree with the bpf-next tree
Message-ID: <202209271229.83AC9BAA0F@keescook>
References: <20220927190811.514527-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927190811.514527-1-broonie@kernel.org>
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 27, 2022 at 08:08:11PM +0100, broonie@kernel.org wrote:
> Hi all,
> 
> Today's linux-next merge of the kspp tree got a conflict in:
> 
>   tools/objtool/check.c
> 
> between commit:
> 
>   9440155ccb948 ("ftrace: Add HAVE_DYNAMIC_FTRACE_NO_PATCHABLE")
> 
> from the bpf-next tree and commit:
> 
>   3c68a92d17add ("objtool: Disable CFI warnings")
> 
> from the kspp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc tools/objtool/check.c
> index fcc4d8ea8cec3,48e18737a2d18..0000000000000
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@@ -4124,7 -4118,7 +4128,8 @@@ static int validate_ibt(struct objtool_
>   		    !strcmp(sec->name, "__ex_table")			||
>   		    !strcmp(sec->name, "__jump_table")			||
>   		    !strcmp(sec->name, "__mcount_loc")			||
>  -		    !strcmp(sec->name, ".kcfi_traps"))
> ++		    !strcmp(sec->name, ".kcfi_traps"))			||
>  +		    strstr(sec->name, "__patchable_function_entries"))
>   			continue;
>   
>   		list_for_each_entry(reloc, &sec->reloc->reloc_list, list)

Thanks, yes; this matches what I had when I did a test merge yesterday
too.

-- 
Kees Cook
