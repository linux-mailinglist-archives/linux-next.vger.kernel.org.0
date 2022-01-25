Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D29549AF52
	for <lists+linux-next@lfdr.de>; Tue, 25 Jan 2022 10:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1452440AbiAYJJA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Jan 2022 04:09:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1453534AbiAYIyp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jan 2022 03:54:45 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61393C078504
        for <linux-next@vger.kernel.org>; Mon, 24 Jan 2022 23:44:07 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id u130so14604420pfc.2
        for <linux-next@vger.kernel.org>; Mon, 24 Jan 2022 23:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YDl8tuenOB7OINLaTsYd1+PC6tJZxYpv16l39VyIDDg=;
        b=jhLcV//DEN8NAy6w0LcFzAs7igIi+ZA17lYQTXWHFHsVoY0ehWuVVsQ1YPRQ/SSvsI
         u0qOQ/gMEy+9Td2Idd9gSVlVTZPXe76GHBVLil/jwoskzCcRJYwuez58o6gJRmGvoWdp
         QgzmSigJP7mawexsbZ4FSNnGvZX2o2y0b+Eww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YDl8tuenOB7OINLaTsYd1+PC6tJZxYpv16l39VyIDDg=;
        b=q7PtFXxjPlB5+X2CIzc2EW6Z3L46iTeArHv2IJAH+hP0/Ed5IwsGmWqhKg/0oRbPGn
         6AVl1w9IPzilnp3yq4FLM6aQh8ET0KWr8KfDlEKWNzivwrBM21bdFaXiY7ffdsQni17E
         RLXn1q/JluOgkLZxy1IpOAo3rljfZ9xaBX479dNTtDHbuoB8y8UcZpkS87+3QnN5iOFq
         KFWO9ywSzV6dzCVaCWSo4bXvGH9VMAltSPT3kUhIt4pL/LvO8+bdlZZh3sRM9lcS2klL
         RNbyrRnBt2dvzjZ5xsRty8G2XjsCH4V7sZUjWPmfMf6rmPqHOuer1ukghODhImgz55jr
         ajYA==
X-Gm-Message-State: AOAM532kW5B+znVUdK9Ck8I9+w+quu0IUCCuduBWCYlGTYmOZ+kY/1eu
        bHMMXIgpxm5kU4FqxEhtmfSiIQK0jkyBpA==
X-Google-Smtp-Source: ABdhPJx1eKNMtskZDfwNpOccUTY1Kim/WLynhTPSIe0KGbPCH/+gumJHFG8D9tPvqfTxjWfWVTu7rg==
X-Received: by 2002:a65:6ab0:: with SMTP id x16mr14730337pgu.24.1643096646857;
        Mon, 24 Jan 2022 23:44:06 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s23sm20534298pfg.144.2022.01.24.23.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 23:44:06 -0800 (PST)
Date:   Mon, 24 Jan 2022 23:44:05 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202201242230.C54A6BCDFE@keescook>
References: <20220125145006.677e3709@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125145006.677e3709@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 25, 2022 at 02:50:06PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (powerpc
> allmodconfig) failed like this:
> 
> In file included from include/linux/string.h:253,
>                  from include/linux/bitmap.h:11,
>                  from include/linux/cpumask.h:12,
>                  from include/linux/mm_types_task.h:14,
>                  from include/linux/mm_types.h:5,
>                  from include/linux/buildid.h:5,
>                  from include/linux/module.h:14,
>                  from samples/trace_events/trace-events-sample.c:2:
> In function '__fortify_strcpy',
>     inlined from 'perf_trace_foo_rel_loc' at samples/trace_events/./trace-events-sample.h:519:1:
> include/linux/fortify-string.h:47:33: error: '__builtin_strcpy' offset 12 is out of the bounds [0, 4] [-Werror=array-bounds]

-Warray-bounds thinks something is trying to get at offset 12 of an
object it thinks is only 4 bytes in size.

>    47 | #define __underlying_strcpy     __builtin_strcpy
>       |                                 ^
> include/linux/fortify-string.h:445:24: note: in expansion of macro '__underlying_strcpy'
>   445 |                 return __underlying_strcpy(p, q);
>       |                        ^~~~~~~~~~~~~~~~~~~
> 
> Exposed by (probably) commit
> 
>   602670289b69 ("fortify: Detect struct member overflows in memcpy() at compile-time")
> 
> Introduced by commit
> 
>   b466b1332164 ("samples/trace_event: Add '__rel_loc' using sample event")
> 
> I have reverted that latter commit for today.

Digging through the macros, I end up reconstructing this:

	strcpy( (char *)((void *)(&__entry->__rel_loc_foo) +
				  sizeof(__entry->__rel_loc_foo) +
				  (__entry->__rel_loc_foo & 0xffff)),
		foo ? (const char *)(foo) : "(null)");

I couldn't figure out how __entry is being allocated, but it seemed
maybe related to this note:

/*
 * struct trace_event_data_offsets_<call> {
 *      u32                             <item1>;
 *      u32                             <item2>;
 *      [...]
 * };
 *
 * The __dynamic_array() macro will create each u32 <item>, this is
 * to keep the offset of each array from the beginning of the event.
 * The size of an array is also encoded, in the higher 16 bits of
 * <item>.
 */

So, I think -Warray-bounds is refusing to see the destination as
anything except a u32, but being accessed at 4 (sizeof(u32)) + 8
(address && 0xffff) (?)

But if this is true, I would imagine there would be plenty of other
warnings? I'm currently stumped.

Reading 55de2c0b5610 ("tracing: Add '__rel_loc' using trace event
macros") did not help me. ;)

-Kees

-- 
Kees Cook
