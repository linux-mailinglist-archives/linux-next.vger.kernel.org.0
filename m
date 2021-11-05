Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE1A446274
	for <lists+linux-next@lfdr.de>; Fri,  5 Nov 2021 12:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhKELDg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Nov 2021 07:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbhKELDf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Nov 2021 07:03:35 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECB7C061714;
        Fri,  5 Nov 2021 04:00:56 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id v65so10204933ioe.5;
        Fri, 05 Nov 2021 04:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CYwhEvv3UvTqA9MLBaZXm4VtQAjQOsl7jwgvhaMJC9Y=;
        b=InPhZF78h5Sc0L3eEeCWK0a362vCcN7XYR2ZIRUgHH6pNR71Qrc6UP7fbhNlMEITL4
         shbd9MLm06dHr4Pn/b30BfWonIfD6p3Vc/kopjPkvgdntRlMvwPZspADNlPD0vD6B8aq
         1Y0Dj4IrC/hNNW8yLzp8DdiD6PdMQRE8Dx0KPNAt6bSvDJVpVDUwA9vRtL8X8/+IKL0m
         ajgugTRSGjXVUP+UJw/XAmn09qktjcBL7y4vUCeK4LLj2oswZAtv9DQas4kVdvMQoTD7
         3OUZChIHjJKmH4Kq0FqtncoqSm+/LNnOOgm16QUjZH8ho2097/h5q3wb6up67t4nJgRv
         hk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CYwhEvv3UvTqA9MLBaZXm4VtQAjQOsl7jwgvhaMJC9Y=;
        b=BwRHZOZlgOoDGIQ/LxoViJcEGtQEEL4nxV2vsVlu+e6ZmSyTs6AAsbM3FF9yaOpGzc
         T7ORwrAYEVPgROwNPrBBr9hW9bQnmBxu5fIFu3smL4xdewsXC7cUukBtch5L3M18K7ys
         alaS55KWPZxURD5lzRkbMubm9wXseq678t1+ckjDHdaLXZ+1dfJOQMOihZGpHGB5hIOV
         ZNZJAwF9RcxnDTfjAc/4TjwBqD3naCi8+W6KC4yVEQUiArkl2UDGquhwISEDkVtGaEuo
         HJ+oEk4/qOHAtYuyrBogV3gspP5GBnP1dEu6/NAR8kgihL0qRBhN1ojyn3Z5pOeoyL5y
         2byQ==
X-Gm-Message-State: AOAM530GEa8kUJTqE1J3sakV+vcfr9Zn1iBG8h6j9Iu+RsLgSRaaEwQ7
        7+2PVuvda3yeq2NA8kgzjqFZkEnvHAlGab5pHqE=
X-Google-Smtp-Source: ABdhPJxXzYHL9WhnmbFj/fHx0zrqSB8IVr79t5HSqXxdoREMNz77EU1+CsOF76L2OAyfFeMYAgk6vWYxt+xvFGGwAV0=
X-Received: by 2002:a5d:9e44:: with SMTP id i4mr5939590ioi.172.1636110055750;
 Fri, 05 Nov 2021 04:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211103141919.4feefaf0@canb.auug.org.au> <CANiq72=fuk-eVuCpW5jkDn71Pbs=1L2LhSvadR_bTjxcPvtVUQ@mail.gmail.com>
 <20211104080152.41c38912@canb.auug.org.au> <CANiq72mLAc1OMTo6LBTy1bwxM_+BbrRSCNn1uKW0irezUXBFcg@mail.gmail.com>
 <20211105073149.5bc4e8a7@canb.auug.org.au>
In-Reply-To: <20211105073149.5bc4e8a7@canb.auug.org.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 5 Nov 2021 12:00:44 +0100
Message-ID: <CANiq72=Pgts+RmQ3f1UzOG-o_MrS=CnJaLAaDU1UGDr2OUOWRw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Andrii Nakryiko <andrii@kernel.org>,
        Antonio Terceiro <antonio.terceiro@linaro.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Daniel Xu <dxu@dxuuu.xyz>,
        Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Gary Guo <gary@garyguo.net>, Jiri Olsa <jolsa@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 4, 2021 at 9:31 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I would suggest that you don't rebase if you are intending to submit to
> Linus.  Instead, do a test merge with his tree and fix the issue in the
> merge and test that, then explain it all the in the pull request (but
> ask him to pull your tree without the merge).

Note that I am still submitting this as patches, not as a PR. After we
are in, yes, of course!

Cheers,
Miguel
