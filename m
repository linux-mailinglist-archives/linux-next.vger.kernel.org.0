Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF6EE53581A
	for <lists+linux-next@lfdr.de>; Fri, 27 May 2022 05:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239235AbiE0DnR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 May 2022 23:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239176AbiE0DnQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 May 2022 23:43:16 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62CFA1A3
        for <linux-next@vger.kernel.org>; Thu, 26 May 2022 20:43:14 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id c93so2615499edf.7
        for <linux-next@vger.kernel.org>; Thu, 26 May 2022 20:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SPBb+g0viJg5NqTEyDBHqBkftk1kmk7JjYgXXaPHViY=;
        b=QU3l08rm3NqbUG4rASTLaS9tNuaMKT998BWPJJS6SNMsHt6Nj82cqHJ09FZe56QEYz
         ItovWKnHQvkgOX0S9uKQ5o+SRbcNcwsRrja5IRwjub0+ItN6yzbgpTUB4iWoPPAH/viN
         iWBtDpLr0KpZjXTH6wz7YJOUUEkerlOMA+sxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SPBb+g0viJg5NqTEyDBHqBkftk1kmk7JjYgXXaPHViY=;
        b=1VEtWWAlUBaBEpLNeuY/5LqCU5IB/aaG35iOWqCKpLvQzEvxhfTCQYHcAeXxdxrEEv
         yTM+bpbGk5pBARKOrt3q7J7AGh4iUHeXuO9e/Fbah9HRcABl6Hmt6+y+LJQGgS21KZ/Y
         hnkmEl2cy90Scf2ivnwiwd/WuXZ7sU/lc9qJLoCkYzjj5qDTEN6vly3Ibfh0tOjg9oL4
         X2B68lKVTRue1eCNKVi31qsmFn952AgcptJegQuN125mrDjP5au2DRglVLP8iOUzwmcc
         0DCXlvUXpWgWsI9QzHqiWYa3DpKWAPd8a5x/LSP8LEI8yDWGDbAS0L/5sFfXrYq9auSU
         ifnQ==
X-Gm-Message-State: AOAM533DV9ULXFlbKOHqWpc9Iik/ROWY0jl74BIIGlqit+zfn+kU+AHQ
        dtC+Ca5dm7tLXr05Nw2Mhixh1i7M/TeuDT4ehTg=
X-Google-Smtp-Source: ABdhPJwfN4k/XfAZzXJ+v67C8zQV4f3ZBFD0wc1iptRE46D5j8C4h5EJZg/go2jvuPNPhfBU/JEcbg==
X-Received: by 2002:a50:cd1c:0:b0:42b:e327:7012 with SMTP id z28-20020a50cd1c000000b0042be3277012mr3796504edi.76.1653622993262;
        Thu, 26 May 2022 20:43:13 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a24-20020a056402237800b0042ae4dea360sm1532485eda.63.2022.05.26.20.43.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 20:43:11 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id z15so4251818wrg.11
        for <linux-next@vger.kernel.org>; Thu, 26 May 2022 20:43:11 -0700 (PDT)
X-Received: by 2002:a5d:6152:0:b0:210:1864:2fbc with SMTP id
 y18-20020a5d6152000000b0021018642fbcmr753156wrt.97.1653622990694; Thu, 26 May
 2022 20:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtDBZaBGkEp5tRMM5C1xHEKeyyNK1S4WoKvrOoFxGm4KQ@mail.gmail.com>
 <ac245d62-2295-8cf6-6808-4a6eb6bdbd21@linux.alibaba.com>
In-Reply-To: <ac245d62-2295-8cf6-6808-4a6eb6bdbd21@linux.alibaba.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 26 May 2022 20:42:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjgGW_jsjZxKLcKCf4Di22vzJU6K56j0Oe8Td6RgKrc+A@mail.gmail.com>
Message-ID: <CAHk-=wjgGW_jsjZxKLcKCf4Di22vzJU6K56j0Oe8Td6RgKrc+A@mail.gmail.com>
Subject: Re: mm: change huge_ptep_clear_flush() to return the original pte
To:     Baolin Wang <baolin.wang@linux.alibaba.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 26, 2022 at 8:36 PM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> That is caused by commit:
>
> 00df1f1a133b ("mm: change huge_ptep_clear_flush() to return the original
> pte")
>
> interacting with commit:
>
> fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")
>
> And Catalin has fixed the conflict with below changes [1], not sure why
> it is not merged.

Argh. Nobody informed me (or if they did, I clearly missed it).

> Linus, should I send a proper patch to fix this conflict for you?

Yeah, somebody please send me a proper tested fix-up patch with commit
message etc.

Thanks,

              Linus
