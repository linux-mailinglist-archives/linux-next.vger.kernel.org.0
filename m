Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBA36E5D1B
	for <lists+linux-next@lfdr.de>; Tue, 18 Apr 2023 11:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbjDRJNk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Apr 2023 05:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbjDRJNe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Apr 2023 05:13:34 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B4C59FE
        for <linux-next@vger.kernel.org>; Tue, 18 Apr 2023 02:13:32 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id o9-20020a05600c510900b003f17012276fso3722822wms.4
        for <linux-next@vger.kernel.org>; Tue, 18 Apr 2023 02:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1681809211; x=1684401211;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCixI1+y2f03CzXnOxTWUKZd4Pw4T9zMGxQbxJp97nI=;
        b=bJ+RCrMsqPe9Zc1s2tGX8kN2w7XMUjRyJp/N52iBt7+raTilclJ4iy6GRRW+cwZmOT
         Q7yyL4lKs9KAT4jtg46ZbloKdsf2JqIe0jwpNOP7zG6U9YMhrP94mf8BSIWS9xQxCz6I
         +1h1GQEfgXWHW28lHA3dqNZceEe6Ss0GO9+8OEN07LKDM6OOMX/1meSFE2wkVy5XGQ4P
         RnFzCT0s9CjsfHQOLc+LPuyZVhSCCvU5we7M+IKp1iTBnqVeh5DJf8xSjbdquq5l4dm/
         lO1PRsXvFS7UBvIB5lmZtLf1vLr9w/v9wu5GUMubwCBhcMAIY/EG9TUz6zna5QsCzlbM
         hs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681809211; x=1684401211;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCixI1+y2f03CzXnOxTWUKZd4Pw4T9zMGxQbxJp97nI=;
        b=I2FYXU+z9AiAtwiKPNMeNKfh6pKTppL+PWwlrjQF41pLfHxSkjbSBp9U+t1Tk3H/nj
         KwBcvoRHSmtH5kkjpvHrE9DT+9Psbv2Q19QttGo/KBdXXEqO6N/Y6zN2VISPfALYc+0V
         EVfZ4nhqwAF5+kpm7ZVovrchyoeePrilsE9Ml5dBNUcDNLewXfLd4b89ZrHAmm1a4CXa
         dQ97kMlQ1t7ET4autx24+nnjzsIA8MQQiNBVHmic+uN3vQwmbvegFJIn5BwLN2kt5ZSM
         yTrZLcdx2SdI9lSO7hiehMC6fi1dyktHpqo7CySiUxxjjrb+vHoU5SIkanj/bzE+uV00
         hqyQ==
X-Gm-Message-State: AAQBX9eehS3JbtwmaY/M88oRBRS6TaKNy9Uf6GfV8O/VCCaIC8BzlHaU
        FpsjGXv/8emswuGxqItqbEuEpviCjywc48H2Xc7tRw==
X-Google-Smtp-Source: AKy350a8n9IhWAwAJKbLn/J/Q34z6C3y6l0/L0Y3idG8WGBYm9YyUoPWn5DyLCNNReaXHTqmOzzGGg==
X-Received: by 2002:a7b:ce06:0:b0:3eb:29fe:f922 with SMTP id m6-20020a7bce06000000b003eb29fef922mr12852249wmc.29.1681809210900;
        Tue, 18 Apr 2023 02:13:30 -0700 (PDT)
Received: from ?IPV6:2a02:8011:e80c:0:192d:7ca1:96c2:5c9b? ([2a02:8011:e80c:0:192d:7ca1:96c2:5c9b])
        by smtp.gmail.com with ESMTPSA id q18-20020adff792000000b002f8d402b191sm7621799wrp.112.2023.04.18.02.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 02:13:30 -0700 (PDT)
Message-ID: <51f19356-2a42-bb2d-7d4f-275fe334f73a@isovalent.com>
Date:   Tue, 18 Apr 2023 10:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] bpftool: fix broken compile on s390 for linux-next
 repository
Content-Language: en-GB
To:     Thomas Richter <tmricht@linux.ibm.com>, broonie@kernel.org,
        hca@linux.ibm.com, sfr@canb.auug.org.au, liam.howlett@oracle.com,
        acme@redhat.com, ast@kernel.org, bpf@vger.kernel.org,
        linux-next@vger.kernel.org
References: <20230418085516.1104514-1-tmricht@linux.ibm.com>
From:   Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <20230418085516.1104514-1-tmricht@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

2023-04-18 10:55 UTC+0200 ~ Thomas Richter <tmricht@linux.ibm.com>
> Commit 9fd496848b1c ("bpftool: Support inline annotations when dumping the CFG of a program")
> breaks the build of the perf tool on s390 in the linux-next repository.
> Here is the make output:
> 
> make -C tools/perf
> ....
> btf_dumper.c: In function 'dotlabel_puts':
> DEBUG: btf_dumper.c:838:25: error: '__fallthrough' undeclared \
> 		(first use in this function); did you mean 'fallthrough'?
> DEBUG:   838 |                         __fallthrough;
> DEBUG:       |                         ^~~~~~~~~~~~~
> DEBUG:       |                         fallthrough
> DEBUG: btf_dumper.c:838:25: note: each undeclared identifier is reported \
> 		only once for each function it appears in
> DEBUG: btf_dumper.c:837:25: warning: this statement may fall through \
>                 [-Wimplicit-fallthrough=]
> DEBUG:   837 |                         putchar('\\');
> DEBUG:       |                         ^~~~~~~~~~~~~
> DEBUG: btf_dumper.c:839:17: note: here
> DEBUG:   839 |                 default:
> DEBUG:       |                 ^~~~~~~
> DEBUG: make[3]: *** [Makefile:247: /builddir/build/BUILD/kernel-6.2.fc37/\
> 		        linux-6.2/tools/perf/util/bpf_skel/ \
> 		        .tmp/bootstrap/btf_dumper.o] Error 1
> 
> The compile fails because symbol __fallthrough unknown, but symbol
> fallthrough is known and works fine.
> 
> Fix this and replace __fallthrough by fallthrough.
> 
> With this change, the compile works.
> 
> Output after:
> 
>  # make -C tools/perf
>  ....
>  CC      util/bpf-filter.o
>  CC      util/bpf-filter-flex.o
>  LD      util/perf-in.o
>  LD      perf-in.o
>  LINK    perf
>  make: Leaving directory '/root/mirror-linux-next/tools/perf'
>  #
> 
> Fixes: 9fd496848b1c ("bpftool: Support inline annotations when dumping the CFG of a program")
> Signed-off-by: Thomas Richter <tmricht@linux.ibm.com>

(Repost from
https://lore.kernel.org/all/20230412123636.2358949-1-tmricht@linux.ibm.com)

Acked-by: Quentin Monnet <quentin@isovalent.com>

