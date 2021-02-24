Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA800323758
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 07:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhBXGUM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 01:20:12 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:28192 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbhBXGUL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2021 01:20:11 -0500
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 11O6JB53018028;
        Wed, 24 Feb 2021 15:19:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 11O6JB53018028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614147552;
        bh=lpPPRF28T9s9qcY6N1lW7SUSaBdvR0+aWwdIbHDTS40=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=clnVVmYBuQy+8946K2zuFdPYenz0wBe5fW6bsfu1+PxqRYMQL5SIOlNTtbkreqdZZ
         61Pos3jkgB8t+e8HMiLj8yo01GO1JPpkjFBqXcd6FY5KELDmsaX6/5iUR6pc/WnChX
         4cmBwWqslT5REGMjV3cIqx8x5YbnRh/6YhLDVbxbjJ4YcYsTA095wE4xC21MQZ3sNi
         hD83VEhoZXNc2uqFAKDAqA/v0rWMdNx5IbgZXJ2RnnxTkRuuZbUlk0487l1HuB3r2X
         tsP89nML7JAalwnAwD/ZfWOoEKswdqe8u6vfAS0gCtNQYD6n1bqSxqMd/tVwcly07A
         PCLe6VyQ+xwvA==
X-Nifty-SrcIP: [209.85.215.170]
Received: by mail-pg1-f170.google.com with SMTP id t25so819858pga.2;
        Tue, 23 Feb 2021 22:19:11 -0800 (PST)
X-Gm-Message-State: AOAM530q04YF8WLhQw5qIE+y1bKsZxJzQDEdld8sCjC1f4/uonfY7EcA
        82QE0QA/oF8Ykp6mf6Z5IfQ8d/mVgYJT4VX0uGY=
X-Google-Smtp-Source: ABdhPJxPHKDXwO8cJ9qBp96+fREM+MUIMzPzYkhTKpRql8VloLP8VPzDT6I9XsxOf6trrY+ls+29pHPvyImXFxz0xQ4=
X-Received: by 2002:a62:b416:0:b029:1e4:fb5a:55bb with SMTP id
 h22-20020a62b4160000b02901e4fb5a55bbmr29362715pfn.80.1614147551126; Tue, 23
 Feb 2021 22:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20210224144635.45d68aec@canb.auug.org.au>
In-Reply-To: <20210224144635.45d68aec@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 24 Feb 2021 15:18:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNARASBekYTxzf-9bUa-z3BUPSmvc+mKAY5aeT7PRtW20jQ@mail.gmail.com>
Message-ID: <CAK7LNARASBekYTxzf-9bUa-z3BUPSmvc+mKAY5aeT7PRtW20jQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 24, 2021 at 12:46 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   67cbb9c55759 ("Makefile: reuse CC_VERSION_TEXT")
>
> is missing a Signed-off-by from its committer.

Thanks for catching this.
I will fix it for tomorrow's linux-next.



> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
