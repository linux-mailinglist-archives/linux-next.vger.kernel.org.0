Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A63950C317
	for <lists+linux-next@lfdr.de>; Sat, 23 Apr 2022 01:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbiDVWMA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Apr 2022 18:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbiDVWLG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Apr 2022 18:11:06 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9C030075B
        for <linux-next@vger.kernel.org>; Fri, 22 Apr 2022 13:57:36 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2f7bb893309so17864817b3.12
        for <linux-next@vger.kernel.org>; Fri, 22 Apr 2022 13:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=paM4ZFe32zXjEAEL1QAXaw+y9M+Olh2UYHZJ2Zmqcfs=;
        b=HTWV2tbqF/Fw+AZQyOXGIaxL+oUNtWeKA2WgHADrKMCgGmoAO2bS4yhD4WlruS+xtt
         WZcnxDLyzmyacrH8ibFjqvKG8s0aZH331a5erdvmxBb/KaG/+muiddh3LhB9wNZDARL+
         EQTW8xj/Qcm5B5nu8ls3aR18PW+nNijbIVVWj4xzCZsivf0pwLJCDPNz26r1+JD63VIj
         SIqKjPqDfN8k+dkfyPRdYgu+ngVJKFbw8crgP4KLF3e//j8Mg6j+gJDG7O/MUhccBokM
         C7123BKlcDpKXT8EsybGogYe94lMxg+29/Qqzrtut+4sNTo9zy3KPf11g3l78Okk9EK9
         XKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=paM4ZFe32zXjEAEL1QAXaw+y9M+Olh2UYHZJ2Zmqcfs=;
        b=C+5Khy+9wyPrHfEs5EzPTr6RdmdYQFMm9DaCVwet1D3eJN684DnGuYh/23q1kcJE1Y
         8zgrPoaf5CIkltMg6s8syXKadd1gIpKwoirfvi8DuKPR06r3b53Vcvb4zpbAJnsvPtXr
         uB+nYKHvyMYw9WgCNVrYvhqnWHXrmilHdgb8cwgtkAJT/oGD7yVZ5ROvZnfiuS3uoW0E
         MpQGu0rmKqpcgwFhlONBP7KI4QRPI5vEBdn445JlM2IW3TCVwfm12fsWz+zt3TI1HNiQ
         Pcry06CXw0Z3HMe2midY45Xq+kvMkrObr8DjgLa9JJS4UBxv2rierAUX3J3MLYVK3uk1
         40wg==
X-Gm-Message-State: AOAM530dF6RGXHchfyhWnia5C0IbUQg7XB5ZQkUJYZAdCP3pZUeTtz27
        FuadH9iSI0KtUqwIDb21Dbq3I0H8r7EUt2Fub7oYW15V3LA=
X-Google-Smtp-Source: ABdhPJzRA09Os35MxrURwq66GBXME7v/WCyxoVco5IwR5ofnF5p/aH09aiSipEl0/QBCGFZOsTOomcY7oAiNUhVH4IU=
X-Received: by 2002:a81:b50d:0:b0:2e5:b653:7e97 with SMTP id
 t13-20020a81b50d000000b002e5b6537e97mr7403919ywh.140.1650661055368; Fri, 22
 Apr 2022 13:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220421091055.12d6465c@canb.auug.org.au>
In-Reply-To: <20220421091055.12d6465c@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 22:57:24 +0200
Message-ID: <CACRpkdaD1G9J+jTJH4oGrcF_dinMjBjHCGMJqRZh8FC0dy+Xfw@mail.gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Caleb Connolly <kc@postmarketos.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 21, 2022 at 1:11 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In commit
>
>   6548c9dc711d ("pinctrl/rockchip: support deferring other gpio params")
>
> Fixes tags
>
>   Fixes: e7165b1d ("pinctrl/rockchip: add a queue for deferred pin output settings on probe")
>   Fixes: 59dd178e ("gpio/rockchip: fetch deferred output settings on probe")
>
> have these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").

Fixed it up by rebasing, thanks!

Yours,
Linus Walleij
