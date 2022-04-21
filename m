Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4AD150AB09
	for <lists+linux-next@lfdr.de>; Thu, 21 Apr 2022 23:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442253AbiDUV7p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Apr 2022 17:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442249AbiDUV7o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2022 17:59:44 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B2A4E385
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 14:56:52 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id t25so8182798edt.9
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 14:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q2XnpBOwTDdjnVA+25Nh56cl0azTcJsJDuS10iR7LTc=;
        b=C4S3R9quYIAIUDMHwwKrVcSNKDQy/sv5rRXpMlQl5RbY0E6QCEpJJslLkmjuhZaAhy
         MSMKHKSuf9ocQqSSQIHa2TXWFKOr3GZsp0jsMvlUHKBNUoENlr+MfnW9fWQJjtpaQswu
         BvBzah3BjlbBsTa9DlggZC/CzseNvWqWXRWXPItaAi67V6OqN9DuiCVfzGm63cR6f3Uo
         DKZnpaVsA6/FbxqZsYxc0qZDUxvK66K37vUU0Oul6qCZKrEqwR78CHZWvJjpLhLmmBMY
         6rkaE84XTfRzu+0ONujt4PsR5Es3nLyMPVkCCPRiCy+dDRwAcQYp6lkalo/DThefYCqE
         Ry1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q2XnpBOwTDdjnVA+25Nh56cl0azTcJsJDuS10iR7LTc=;
        b=zKNrtaFywSGVb3a86m8rb4U229umZ62SEcP/y4PSGXC7Io5OR7Ob2rLgwQWcleNswu
         jidCZ9njXy8QOuz+lBQ2OTH+0B9xIwktIKwILMf1tmhUSZyhqohT4phsety3oP414hT4
         RT6z4owAcj3/VlMxQp2nmMkUhfm4gHel16BTEz5q9voH71AKedPEgJMgYJVHUF3BVoUP
         12BM/kFurQiBdZ5EyT/4VQOHZU9oLsF3IusEq53FWgcDiu5ks3U22zRR8GnZ2e9tg3ZI
         /B89wpZxfD1E0yNFgTxBNIJQfHls2bFJHLSh/odP0Thm1vGXLnG3yRzbdh7OYQT9hk84
         M2vQ==
X-Gm-Message-State: AOAM533Nd0Wkh9EHt0p5trq5FvIkk9QI8xCfh9bhZG9Yb97See4QEeNm
        O+ynwrVl3nZK0XTXjvClLBslCw/JUhyAQO8CDmm5cQ==
X-Google-Smtp-Source: ABdhPJyVlCrDZZJwxaQZkTgcqpx6uvDXQzPAyz56fmdnocfKZWMqx+j2dPO18ZFNTaOiEQNbpcGIzLIYnQKG5YtYBJE=
X-Received: by 2002:a05:6402:11cd:b0:424:ba:877f with SMTP id
 j13-20020a05640211cd00b0042400ba877fmr1700976edw.292.1650578210823; Thu, 21
 Apr 2022 14:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220422075024.161914a8@canb.auug.org.au>
In-Reply-To: <20220422075024.161914a8@canb.auug.org.au>
From:   Atish Kumar Patra <atishp@rivosinc.com>
Date:   Thu, 21 Apr 2022 14:56:40 -0700
Message-ID: <CAHBxVyEM4gO2KMP-+cGHLSvriYDuF+TO2JoETh-x1X+bRwuOfA@mail.gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the kvm-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, KVM <kvm@vger.kernel.org>,
        Anup Patel <anup@brainfault.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 21, 2022 at 2:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   38d9a4ac65f2 ("RISC-V: KVM: Restrict the extensions that can be disabled")
>
> Fixes tag
>
>   Fixes: 92ad82002c39 ("RISC-V: KVM: Implement
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> In commit
>
>   3ab75a793e49 ("RISC-V: KVM: Remove 's' & 'u' as valid ISA extension")
>
> Fixes tag
>
>   Fixes: a33c72faf2d7 ("RISC-V: KVM: Implement VCPU create, init and
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over more than one line.
>
Sorry for that.
This probably happened while copying the fixes tag from mail to the
actual patch.
Let me know if I should resend the patches with correctly formatted fixes tag.


> --
> Cheers,
> Stephen Rothwell
