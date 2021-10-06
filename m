Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383404248F4
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 23:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhJFVeS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 17:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbhJFVeS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 17:34:18 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB623C061746;
        Wed,  6 Oct 2021 14:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=6m+HOLtIGRYfM6J5PYZs3JgnY5b6/ZoAnBR86sWEAgo=; b=F1fxSx3EZhvdv+VChR3eF+tXny
        lwpw5rR99hKW2Q/EWjJ2czVgQWT3k16IZzHvQYwY63Q+YQ23rVDG4B6WGklna1btXO/dNc0XmK43s
        xvGlbnNE2xFRqklTxl4MjcgXTYhMm0DPIerZ89+x8+gPkKdqm4wyQ5HfR2kpjI91bajjpWX53FU7f
        Kl8iy1/CjGg/ctF/hletub3XgRIy23JWxm5vulwNzUK/wJ/qrVfrtJXUVKlLweqIbw7ByPTPqlKIf
        f/wNLiyDDTRvMbKG359Wd2wa196B32crSPrImazHMag8KMM9dFUJxpGyO1ydrvO2iBV1qI++pPjwc
        Py3tLOqQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mYEWU-00FbpY-6B; Wed, 06 Oct 2021 21:32:22 +0000
Subject: Re: linux-next: Tree for Oct 5 (warnings: a. trace; b. mm/migrate)
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
References: <20211005190628.1f26b13d@canb.auug.org.au>
 <c1d9e328-ad7c-920b-6c24-9e1598a6421c@infradead.org>
 <20211006172207.11982951@gandalf.local.home>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6d8f22a1-5f54-aa2a-7628-1d98a7f0fb95@infradead.org>
Date:   Wed, 6 Oct 2021 14:32:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006172207.11982951@gandalf.local.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/6/21 2:22 PM, Steven Rostedt wrote:
> On Tue, 5 Oct 2021 13:46:52 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> a. randconfig: KCONFIG_SEED=0xBFBEA13C
>> ../kernel/trace/trace.c:1712:13: error: 'trace_create_maxlat_file' defined but not used [-Werror=unused-function]
>>    static void trace_create_maxlat_file(struct trace_array *tr,
> 
> Does this fix it?
> 
> -- Steve

Yes, thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 7896d30d90f7..4520cbab0da5 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -1744,16 +1744,15 @@ void latency_fsnotify(struct trace_array *tr)
>   	irq_work_queue(&tr->fsnotify_irqwork);
>   }
>   
> -/*
> - * (defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER)) && \
> - *  defined(CONFIG_FSNOTIFY)
> - */
> -#else
> +/* CONFIG_FSNOTIFY else */
> +#elif CREATE_MAX_TRACE_FILE
>   
>   #define trace_create_maxlat_file(tr, d_tracer)				\
>   	trace_create_file("tracing_max_latency", 0644, d_tracer,	\
>   			  &tr->max_latency, &tracing_max_lat_fops)
>   
> +#else
> +#define trace_create_maxlat_file(tr, d_tracer) do { } while (0)
>   #endif
>   
>   #ifdef CONFIG_TRACER_MAX_TRACE
> @@ -9473,9 +9472,7 @@ init_tracer_tracefs(struct trace_array *tr, struct dentry *d_tracer)
>   
>   	create_trace_options_dir(tr);
>   
> -#if defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER)
>   	trace_create_maxlat_file(tr, d_tracer);
> -#endif
>   
>   	if (ftrace_create_function_files(tr, d_tracer))
>   		MEM_FAIL(1, "Could not allocate function filter files");
> diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
> index b7c0f8e160fb..680935949aef 100644
> --- a/kernel/trace/trace.h
> +++ b/kernel/trace/trace.h
> @@ -679,8 +679,11 @@ void update_max_tr_single(struct trace_array *tr,
>   #endif /* CONFIG_TRACER_MAX_TRACE */
>   
>   #if (defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER) \
> -	|| defined(CONFIG_OSNOISE_TRACER)) && defined(CONFIG_FSNOTIFY)
> -#define LATENCY_FS_NOTIFY
> +	|| defined(CONFIG_OSNOISE_TRACER))
> +# define CREATE_MAX_TRACE_FILE
> +# ifdef CONFIG_FSNOTIFY
> +#  define LATENCY_FS_NOTIFY
> +# endif
>   #endif
>   
>   #ifdef LATENCY_FS_NOTIFY
> 


-- 
~Randy
