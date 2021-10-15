Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7E342F0AF
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 14:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235485AbhJOM0X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 08:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbhJOM0W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 08:26:22 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EE8C061570;
        Fri, 15 Oct 2021 05:24:16 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id z69so4323761iof.9;
        Fri, 15 Oct 2021 05:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAyjugmg5Mv75JBFPEqwszkslYTtQxxb0IvNxSWP6po=;
        b=f/+IYWil+zNWZGd0wMWT4p8jE4Gz0FIqvt/i4VGlropBXrS5fExNb63zjgLP8Sg61O
         Siaga79iLCLjPAAVfs9vbCiuRi/Pyda/pDf3VuvaYzgLmXmcny1AxBSUATunv3AOxSTo
         dWcfPJyrM+Bdtc4WA0mvxP5lpXgVA9s8VtaqbaesmGq50jYNdo+uuv1OL+Zy1XXbKa+Y
         +D6c/virXU1My47Mh5XUeFEtJqgPV2Eg0UFCvza6jF9p6a9Xi8k47XfBUufw1o9oRkm5
         1aM6TBmXbzRpJZuDqb3E4cNX10c5UZX/SMfnHNcbu3vjPqkjHlOCt16pjcLjhIQXG79F
         ZIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAyjugmg5Mv75JBFPEqwszkslYTtQxxb0IvNxSWP6po=;
        b=sYNsQTm9F7dS55noRH9eAoUbV5+odWGRzJk852Bub1tQxzmi6Wxd7Qb+mMDMTZTsSx
         vS67C1+ofgCmgoTSOIofnif+F4f/pft8cm3UGU46Bp5y8yBKux2yBLeWnoNbOsMZpCtV
         Ly2/G87SajA0JElpKYWTVHltjv2SuCt0yNziS1COOi8952grM8IwMprG9/h11WkC8isY
         ycqM48EArRBv6Uj/vWoiETrdR3KI6As9tpKBuuBnaL3tI1aFkPTIBeSP4ny7Es/ai8ni
         /6mBCLOyeZ11qeogaGSBUzw9wpNuNs+mfLt+IbEG5JsJeMfouTQR5eeEtkC8GmYBQWSu
         CQFw==
X-Gm-Message-State: AOAM5329xMcorfscfqOGVJh377cnpzsZOoxYxE0eXqphI6OpM4zxWhl3
        mp8au1IuTPV/Q59RHuAzSE31YXGsGqO0eVOQT0dyPUoVjh5vFSj1
X-Google-Smtp-Source: ABdhPJzVLkZ6wdtrB3q4T3yAE7OnjNxLzHnQvoX6qU1VhzniVbLb5RoQ1n8mr3PverhOkt7mp6pINw2lh4pCeNYU/HE=
X-Received: by 2002:a05:6602:2d4e:: with SMTP id d14mr3621368iow.172.1634300655868;
 Fri, 15 Oct 2021 05:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211015182404.0355bef6@canb.auug.org.au>
In-Reply-To: <20211015182404.0355bef6@canb.auug.org.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 15 Oct 2021 14:24:04 +0200
Message-ID: <CANiq72mpkr9SvLytg9CY4dufJFtggbr-k64=2sJaRrAqJ3cS=g@mail.gmail.com>
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

On Fri, Oct 15, 2021 at 9:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Miguel,  it might be worth do a back merge of v5.14 (or maybe even
> v5.15-rc1) to fix up the old conflicts ... If you do that, though,
> please don't use github's GUI to do it, do it in your own git tree,
> include a good commit message in the merge commit (saying why you did
> the merge), and push it up to git hub.

Yeah, the last release has been rough on conflicts. I will move the
new code to rust-next for your Monday run (based onto -rc5) -- there
has been some changes since last time and I already have it in sync in
our internal branch. Thanks for keeping up with all the conflicts!

As for GitHub, thanks for the warning! We only use the GUI for
internal development only; for the -next branch I prepare it manually.
I will also rearrange things to follow a normal kernel process when we
hit mainline.

Cheers,
Miguel
