Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC6C54F7C8A
	for <lists+linux-next@lfdr.de>; Thu,  7 Apr 2022 12:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240291AbiDGKTI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Apr 2022 06:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243811AbiDGKTH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Apr 2022 06:19:07 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622D4FFFB8
        for <linux-next@vger.kernel.org>; Thu,  7 Apr 2022 03:17:07 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2e64a6b20eeso56403397b3.3
        for <linux-next@vger.kernel.org>; Thu, 07 Apr 2022 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=wohRNTw8lNqqmdn+Vx53fJpkpUwTxDNz3jWT8qdpbZE=;
        b=z4+AvWUUynitY8XdyVWSO43Rqy5TxhiJ9B29h/N0ous91xSah+pwksNJmafiFkxnoZ
         7aLl2eQNfanOZQKGMg682fGB7BjNsobvB8wRwSbMOVxAoNR+u1Ncqmcl9dP7Xt44TL66
         LVkvysPfS7+JFbgUCiW0fCeoQhdfjBaQH+pJO5t+nNAtG5C/CI8ihItQHIE2CbGfMCMx
         Xh/c659LIOiDN91dCcNfJes/TVv4KWYivbpxBQWH3HXUt9UysIIaLoz0rZTBXeNpXTOV
         a58FFgJcnZVykeVpigC+2RMV1CiNa0u5mxq30TzI5qEEBTwEKuKKp3WdlNNqAtkiK9Q1
         HWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=wohRNTw8lNqqmdn+Vx53fJpkpUwTxDNz3jWT8qdpbZE=;
        b=0GMWt1nqj5Da7RaY6dOtJ69y+gfiYVcHe1EOjx3gWJQZw58QybphgpfB02RP0vtg0x
         X4KaMhpC0OBgfGNqaAjHR6IzoVrsKTK7//UbT7SIWbHuvIfES+FaoSTZlqZkXrUJCN0C
         So7yukrv+hO94uoYMdvZT/x0//zsI9G6rQqpR0RD0YZl7FgxTETx9FofEfkX2jc0j1E5
         2x4j6yU0QnLpqOfa4KmLZFaudPZnP7DmTN+OPAUnOcSIJHqQ8zHsY9vV0ePLp50r7cxA
         OURQ93Gdev1SV+ts6u1fAAV4NxLd0/LE1IJb8iJC9svFoto1hFeeSJNHUjXTXxh6MeNm
         A88g==
X-Gm-Message-State: AOAM532JutLt02kRlI6+elGz1GQnM+WYf8IwL0YSkHObmUueStalrRQe
        3kLeWLihcSekzROjNM8yZIoCaLyYpPtpPMOkjTF6vIP/SlPSNg==
X-Google-Smtp-Source: ABdhPJyT8CGlRssb8AxHOFbKTjM7VrHXbd2+eo+HzGgTQmjA947rwLuTLUExeBPcpzMLnVgI/UlinU+75hXA4GYxBlE=
X-Received: by 2002:a0d:ffc3:0:b0:2eb:2327:3361 with SMTP id
 p186-20020a0dffc3000000b002eb23273361mr10687139ywf.36.1649326625926; Thu, 07
 Apr 2022 03:17:05 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 7 Apr 2022 15:46:53 +0530
Message-ID: <CA+G9fYvdH87k2sSy6g3ehkqE8W94wdg-ww9-wS_t9w48Sp55PQ@mail.gmail.com>
Subject: [next] perf build failures: libbpf.c:10946:50: error: format '%li'
 expects argument of type 'long int *', but argument 4 has type 'size_t *'
 {aka 'unsigned int *'} [-Werror=format=]
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        perf-users <perf-users@linaro.org>, lkft-triage@lists.linaro.org
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        NeilBrown <neilb@suse.de>, tanu235m@gmail.com,
        Matthew Wilcox <willy@infradead.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        mgorman@techsingularity.net,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

perf build errors on i386 [1] on Linux next-20220407 [2]

usdt.c:1181:5: error: "__x86_64__" is not defined, evaluates to 0
[-Werror=undef]
 1181 | #if __x86_64__
      |     ^~~~~~~~~~
usdt.c:1196:5: error: "__x86_64__" is not defined, evaluates to 0
[-Werror=undef]
 1196 | #if __x86_64__
      |     ^~~~~~~~~~
cc1: all warnings being treated as errors
make[4]: *** [/builds/linux/tools/build/Makefile.build:97:
/home/tuxbuild/.cache/tuxmake/builds/1/build/libbpf/staticobjs/usdt.o]
Error 1
make[4]: *** Waiting for unfinished jobs....
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/values.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/tests/backward-ring-buffer.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/tests/sdt.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/tests/is_printable_array.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/debug.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/fncache.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/tests/bitmap.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/machine.o
libbpf.c: In function 'attach_uprobe':
libbpf.c:10946:50: error: format '%li' expects argument of type 'long
int *', but argument 4 has type 'size_t *' {aka 'unsigned int *'}
[-Werror=format=]
10946 |         n = sscanf(func_name, "%m[a-zA-Z0-9_.]+%li", &func, &offset);
      |                                                ~~^          ~~~~~~~
      |                                                  |          |
      |                                                  long int *
size_t * {aka unsigned int *}
      |                                                %i
cc1: all warnings being treated as errors
make[4]: *** [/builds/linux/tools/build/Makefile.build:96:
/home/tuxbuild/.cache/tuxmake/builds/1/build/libbpf/staticobjs/libbpf.o]
Error 1

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 2e9a9857569ec27e64d2ddd01294bbe3c736acb1
  git_describe: next-20220407
  kernel-config: https://builds.tuxbuild.com/27SL0lCnWoPP04Jn8zKQ5nEEX7i/config
  target_arch: i386

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org


[1] https://builds.tuxbuild.com/27SL0lCnWoPP04Jn8zKQ5nEEX7i/
[2] https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/2302706510
