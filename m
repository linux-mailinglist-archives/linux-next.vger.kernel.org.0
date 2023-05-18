Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50358707C52
	for <lists+linux-next@lfdr.de>; Thu, 18 May 2023 10:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjERIqr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 May 2023 04:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjERIqq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 May 2023 04:46:46 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B429310F
        for <linux-next@vger.kernel.org>; Thu, 18 May 2023 01:46:45 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-434706ea450so514318137.2
        for <linux-next@vger.kernel.org>; Thu, 18 May 2023 01:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684399605; x=1686991605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t7ewcVJ8ISOfeb+KpfuhQ6AeIHogwRgTzugd0nWPdnU=;
        b=h2ciERUagWk0JlNb//ZlnDpn4X9iHUtBfUjbwz3pvZPzgMV9FKObm58H3mmiWfgXzE
         E7XEsJxRkKc/MSsO4MF96k+knklhn0XAHYagtUhALntYWsNN3u0gEJWWzgTJezgun+bh
         o9odSUAGDalMDzsVT9NN2jBoLOJ7ZwIiuCeflchy2gA6knHkpl0fNnGUs7nIKA1VnSL6
         TuRALolEkweQX1nznc4RBRlLOIUstWDYBOLcX32lDCTpM6gryEaYOJ4pVmG/xtrg2kgi
         sZz8KCbXa5ldZFIzk4G1TasEtAYdw1RvE0BFiTDijz98woMqP4OZHhuli5sR4WnxHUQj
         QDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684399605; x=1686991605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7ewcVJ8ISOfeb+KpfuhQ6AeIHogwRgTzugd0nWPdnU=;
        b=b92wFHUsJj8bBjvMwq9IAiBHLWLU82GDK6AJrYPHpQlYFaeMj8GoeLyT/L8zLQ2AG4
         sq5lWIWDhblpU86fZym019LLox2jMmZnlLh+SEEFU6/dSaG5+Jsi27J37ThpHEQkO0IG
         ZKSU+JZS/xlbncWQYaWn/U/c35Gs+wUal1WiQY9CHv0UnwQDhzSgczDgJiNegX1PmKnB
         ujs+FmxbVfPkRngvcHs2ZaWiPOLEtsDA1bH1GIIuNKlxCEMhz5cKru930GDin4Ew49Rn
         /d42Ifj43HJyKjhJnE0H8lhiNCre6xl7w9YKY6YPqmBZTV9uPegSZgofRZWb8otFDDzK
         KgBA==
X-Gm-Message-State: AC+VfDzyFfOinCRFd5wzOlCwgSDVBwSdixc7Qmk2pdtzRJOYGQcJa8uI
        MgMSZXjYXGnyiobKwzQXXF1yvEn4q41uFlIM3FsaiQ==
X-Google-Smtp-Source: ACHHUZ4fCNj+bGYt3HAQex+FVnJC/1RnptY69fAvJezRQq5T3f1oewFRzo6OZ6pUPcfeOr8qkTj/iWY9HO7fuZ6izCk=
X-Received: by 2002:a05:6102:245:b0:436:18b:6a31 with SMTP id
 a5-20020a056102024500b00436018b6a31mr216763vsq.26.1684399604549; Thu, 18 May
 2023 01:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvgBR1iB0CorM8OC4AM_w_tFzyQKHc+rF6qPzJL=TbfDQ@mail.gmail.com>
 <b28dc2c4-6694-1699-b4a2-a8e71d179073@loongson.cn>
In-Reply-To: <b28dc2c4-6694-1699-b4a2-a8e71d179073@loongson.cn>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 18 May 2023 14:16:33 +0530
Message-ID: <CA+G9fYtcW9AU_OiQJSbKTdYBsW1naO=MnqDJowTLpP7ygqbjMA@mail.gmail.com>
Subject: Re: next: perf: i386: bench/syscall.c:101:22: error: '__NR_execve'
 undeclared (first use in this function)
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-perf-users@vger.kernel.org, lkft-triage@lists.linaro.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 18 May 2023 at 12:17, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
>
>
> On 05/17/2023 11:04 PM, Naresh Kamboju wrote:
> > Linux next perf build failing for i386 architecture.
> >  - build/gcc-11-lkftconfig-perf
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Build log:
> >   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/bench/syscall.o
> >   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/tests/parse-events.o
> >   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/build-id.o
> >   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/cacheline.o
> >   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/config.o
> >   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/copyfile.o
> >   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/bench/mem-functions.o
> > bench/syscall.c: In function 'bench_syscall_common':
> > bench/syscall.c:101:22: error: '__NR_execve' undeclared (first use in
> > this function)
>
> Hi Naresh,
>
> Sorry for that, the __NR_execve definition for i386 was deleted
> by mistake in the commit ece7f7c0507c ("perf bench syscall: Add
> fork syscall benchmark").
>
> Could you please help to check whether the build error can be
> fixed with the following changes? If yes, I will send a formal
> patch as soon as possible, thank you.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Build tested this patch and perf build pass on i386 now.

Thanks for the quick fix patch.

>
> $ git diff tools/arch/x86/include/uapi/asm/unistd_32.h
> diff --git a/tools/arch/x86/include/uapi/asm/unistd_32.h
> b/tools/arch/x86/include/uapi/asm/unistd_32.h
> index b8ddfc4..bc48a4d 100644
> --- a/tools/arch/x86/include/uapi/asm/unistd_32.h
> +++ b/tools/arch/x86/include/uapi/asm/unistd_32.h
> @@ -2,6 +2,9 @@
>   #ifndef __NR_fork
>   #define __NR_fork 2
>   #endif
> +#ifndef __NR_execve
> +#define __NR_execve 11
> +#endif
>   #ifndef __NR_getppid
>   #define __NR_getppid 64
>   #endif
>
> Thanks,
> Tiezhu

- Naresh
