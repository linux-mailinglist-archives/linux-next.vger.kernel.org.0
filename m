Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2384341CB0F
	for <lists+linux-next@lfdr.de>; Wed, 29 Sep 2021 19:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245005AbhI2R1d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Sep 2021 13:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244721AbhI2R1c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Sep 2021 13:27:32 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F0CC06161C;
        Wed, 29 Sep 2021 10:25:51 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id z184so4124332iof.5;
        Wed, 29 Sep 2021 10:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uo5wdJ8tx91k6K+DQc3R4uUM/2lDe3STxWI2pnba17U=;
        b=iJ129/aov0nIqZFamxuJI7mJgmJBAfoum+Qn/kk6TykHWPUrtc14DgykBQAJdHFDV5
         XvjK1UC0J8L1BKGOr6N3taLXft9EyPvcvgqBPW7ksc16KOB0wTiYuNymoZ8ALMCEsidc
         VCO2miR8FZ8hEL6eQa837HgZZn6AEqT4k8IiHUwncEflJDhFBPVSfiyvdBCV02sajv2+
         V/d4ZXUP6DR0mI9SU3018yCiPL01SOYImRFkvcUtZwKJ+zJxaqJH0fLiXEohx41n3hsk
         /zVmTtUpLE4WnYqhwp9NRCkGIiRrNsViDCdrM8Gc6EVB13cCrJpkPfShYP3v7cMDoaQ1
         Rf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uo5wdJ8tx91k6K+DQc3R4uUM/2lDe3STxWI2pnba17U=;
        b=8M/usWVziDsbzkE9F3kQKFi7Eg2m/Ls/cB2Lak0a3Pqv2xsObwSEJKRxTZFujAPur5
         dRXwcFQnY4W+Jxms2eAkwk0O1pHpinBSE9sOZShJfmdJ8qDuXOvffuqSEkNxJnliKmRo
         1vbu6q1/GgjhIu6N/O4Tjv5buEsVDLe8keZnDbcF5iBdA/CHhicb5jmtDhWHP91WF4Tk
         45vA6dxfDF7QSmyU5vr5K06uSnnNqQ8HvLZRuOhIvpXrni7uqRdCdLam4/sEJBvUIHOV
         5Y65pqtj9kNNRRFqenp5l62t++4arTDhcULbfDKcot6io1cEoYO+pYa3oQKy+gm+N0NA
         hPLw==
X-Gm-Message-State: AOAM531/IUxDw2LEZsncFKm0huE3wgYAAI6HiIw8uB0EzgCOhwcgT0yW
        vtMYMP+TBWCgY3yEyeM+QkhdMWjYeUnhhT1u6HY=
X-Google-Smtp-Source: ABdhPJxHjaDT8w89zUg3jVpR9+G7WpkM+ROb+WNCdC2U7BMn2xokhYELmFSWrtOPd1naZNGHmrREUJ5dlYdy9SVllOk=
X-Received: by 2002:a5d:9cd4:: with SMTP id w20mr727907iow.172.1632936351043;
 Wed, 29 Sep 2021 10:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210928140932.41432dff@canb.auug.org.au> <20210928051849.00000e99@garyguo.net>
 <20210928155247.5220932c@canb.auug.org.au> <20210929093758.7af9e589@canb.auug.org.au>
 <CAK7LNARKydbF1rHhKoqO9hmokuy401vJbAKSGZn1J2uuzXHRuQ@mail.gmail.com>
In-Reply-To: <CAK7LNARKydbF1rHhKoqO9hmokuy401vJbAKSGZn1J2uuzXHRuQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 29 Sep 2021 19:25:39 +0200
Message-ID: <CANiq72mcK_7JDRJy7aDDLVvYTHaUhbH=Pfaf_fG9FKp9Ckp8Og@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Gary Guo <gary@garyguo.net>,
        Richard Weinberger <richard@nod.at>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Yuki Okushi <jtitor@2k36.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 29, 2021 at 7:14 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I dropped those two offending commits from my tree for now
> (with a different reason).
>
> I will try my best to avoid complex conflicts next time.

Thanks Masahiro -- let me know if you need anything from my side or if
you prefer another solution etc.

Cheers,
Miguel
