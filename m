Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F084AF48E
	for <lists+linux-next@lfdr.de>; Wed,  9 Feb 2022 15:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235362AbiBIO6G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Feb 2022 09:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbiBIO6F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Feb 2022 09:58:05 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBD5C06157B
        for <linux-next@vger.kernel.org>; Wed,  9 Feb 2022 06:58:08 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 192so6603860ybd.10
        for <linux-next@vger.kernel.org>; Wed, 09 Feb 2022 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ECpUMaTdm+yyS+IRsgx6JK+2PJOAWfEZbqpS8KRUZVM=;
        b=HtziXKNwy97T5nE4WySc3JUaj9CPpnWW5FC5nbT/LagHDXn71TVCpQ4AS2gUP0TTbO
         0pF5q+D+Cdr+w69NbcO9hAMYvbTDBmXooJN6jICUEcfd2fjNPhg3jr/Rnp0c3+CSV/l1
         vBfoGUMqkinuBVs3wgp44GH+BE6Qm/r63QstwFYosJR8ivZBa4UI1nwStTkGYZLUmHW1
         LKgIgIAhr5n4grPxJaztFFvrqjIAiW1p/LxmHBNIvz/Ffo22R0kCpRx4LBHRxP+AsXqE
         DG3opXXZKhg5P9yNB+RRXwDsUvg1cR75gRgbMAI0YejwfBwWcLG+/dsrAw+SABPIBWrn
         A7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ECpUMaTdm+yyS+IRsgx6JK+2PJOAWfEZbqpS8KRUZVM=;
        b=sweJE1p2dwPzQERXhKXWQ7I9lFNibS8NBBF4vN187ZMBwZWRILBXfMsezeywZNg0B3
         ysegle/3LIE7XiIKLwBzSLOrzJipsLVXOv+SzkkRkjVFhBxRkwS5EVgzInu7FzV+l/rj
         5yRb+HwbD/VPNSTbf3an2/uZkLFAP17usTGGnQ+LphaWa9QrE1JUp1ARgsJE6Ll/Vlp/
         LMEoWGGrxzH20QGd9fuNuUJQz7wuICOunkxuj1FLYfZTtep5xf7V3GpZ+omvrEoyeRQM
         HW01fXDF5/w9M/xeMIyuTI6UpERtk3F7g11D8/26/Am1rKblAsSlhqB/ZjaaRS/HpJd4
         PwVg==
X-Gm-Message-State: AOAM53183npfW14A3lfDBqUt7UQroSQu5L4kv5PXPs5+oeym8NKAoGMR
        O6ynucGS+dl6vZmtSM5SpAQmTcGgcgXb0dCb0b+TtA==
X-Google-Smtp-Source: ABdhPJx6k/2CaivTOLnv01Uwjtg/gSghQiwECY/vFRnpXknpD8tKFEXHMvirvryWKGLl396E5KSyDbgKusErY0jh9FY=
X-Received: by 2002:a25:6b45:: with SMTP id o5mr2446049ybm.704.1644418687758;
 Wed, 09 Feb 2022 06:58:07 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 9 Feb 2022 20:27:56 +0530
Message-ID: <CA+G9fYv_ssRhvYi4mM1ZeGCL2meFwRsakpADp_Cz3bNDZz2zSA@mail.gmail.com>
Subject: Re: mm/munlock: mlock_page() munlock_page() batch by pagevec
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org
Cc:     Hugh Dickins <hughd@google.com>,
        Alistair Popple <apopple@nvidia.com>,
        David Hildenbrand <david@redhat.com>,
        Greg Thelen <gthelen@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        Rik van Riel <riel@surriel.com>,
        Shakeel Butt <shakeelb@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>, Yu Zhao <yuzhao@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The following build regression noticed while building Linux next 20220209
arm/riscv/sh of allnoconfig and tinyconfig builds failed with gcc-10,
gcc-11 and clang-13.

clang: warning: argument unused during compilation: '-march=armv7-m'
[-Wunused-command-line-argument]
mm/swap.c:637:2: error: implicit declaration of function
'mlock_page_drain' [-Werror,-Wimplicit-function-declaration]
        mlock_page_drain(cpu);
        ^
1 error generated.
make[2]: *** [scripts/Makefile.build:289: mm/swap.o] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
