Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED2043DFB7
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 13:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhJ1LIl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 07:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbhJ1LIk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 07:08:40 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14489C061570;
        Thu, 28 Oct 2021 04:06:14 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id f9so7388315ioo.11;
        Thu, 28 Oct 2021 04:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h4XHdrIv1HDiwAZPrPrcypY+aG2ceOoEyiSRVZ/2s6k=;
        b=csBznBljmfFGgcwKos4ymIRDXfxQETShEhrOy8QRE/C/WMPIxkQJDrs6vVeKOZ3lhZ
         Tf5TVAK5MR94w4M4pgMBePDf0AUxy0nmUczuyNszAnqT4Gxhhlm2at4OCAHgq54N+XBz
         yyrtRX9eYS8AotnDDK3U0MjFPGVWOopRBceD/p4myDQRLITQkfKVkuPriSF8c0Xn3y2d
         X0Z0l43LSFBvOkBUBPavmYgQONXCZCJwb+Z28KGMm8IGDUq5dPBvib0l2uqbez1brAhM
         p2DljpfS7hBgrx+oKz6YQ8WH61+6pNEODLgBMPXKwbeC+dxQd+jx2CnuxWlLPsJCCs36
         YI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h4XHdrIv1HDiwAZPrPrcypY+aG2ceOoEyiSRVZ/2s6k=;
        b=r6FXfjoL/fZaw/rkYWRk2opVV8AiSh3pACGkx4Iug2chuZ0KYjdTzzkcD2Q3RAU4EC
         Yg9qUOm3bfBE9SnlDAXALKCt8bp6zdP3sAtgTDQKdDn/NQdUScwyQLbKLDWUEy0b46Nr
         Kg/jQZpTpXi/DiCjNx30X+9e14Y3R/PMp6golGzuU0x8fOSPUlBPp9aQFhAZGacGl+Do
         A3OpkaVhIXkNcqtQPmNZ/+UcoOv3NtiyP46c2PxwtSuZ1jWrKpQRuKDw6vYi2wnDzGl4
         Fgp6DtbrNXdmQy0jVP0iSCy/3n6Nppdz+mrNocAdQ++c+Itpf4OA0DvXFsPwjfr1HNqH
         Uxdw==
X-Gm-Message-State: AOAM532I8uPaH2GJ5DZlS7H/OfYb2D7iihtRahE/efWKS996fvVS7mVG
        md7Ni9tMQLfBuhn+L+kt7Bod6JwhtUPKR1EzEwU=
X-Google-Smtp-Source: ABdhPJyT90cv6SBcU391+xj6djUtZQZ4objc8y9miW+EfsEEcPIGMSHz7N6eSofMPV8e7i3Ncy287DTsAIs0J90+eHc=
X-Received: by 2002:a6b:e50f:: with SMTP id y15mr2407145ioc.177.1635419173590;
 Thu, 28 Oct 2021 04:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211015182404.0355bef6@canb.auug.org.au> <20211028200925.64f16df2@canb.auug.org.au>
In-Reply-To: <20211028200925.64f16df2@canb.auug.org.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 28 Oct 2021 13:06:02 +0200
Message-ID: <CANiq72nKMjg6w=fEqVnU3_qGzeoEe2JP-fWgJKntr_1O7F_yvw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Fox Chen <foxhlchen@gmail.com>, Gary Guo <gary@garyguo.net>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Yuki Okushi <jtitor@2k36.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, Oct 28, 2021 at 11:09 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> The fixup patch now looks like this:

Looks correct, thanks!

(This was triggered due to my rebase tonight which contained a fix for
an `endif` in the vicinity)

Cheers,
Miguel
