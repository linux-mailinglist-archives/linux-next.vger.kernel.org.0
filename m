Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7644452E0
	for <lists+linux-next@lfdr.de>; Thu,  4 Nov 2021 13:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhKDMWS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Nov 2021 08:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbhKDMWP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Nov 2021 08:22:15 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C028FC061714;
        Thu,  4 Nov 2021 05:19:34 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id i79so6307213ioa.13;
        Thu, 04 Nov 2021 05:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FAhOhIoKCmk+qa4z0Rjp9YHAgZ274dKuMxynLfkh9us=;
        b=pa7WIvUUEyxCKFgQH8p4wLZJdLZqKt/Sjz+XzsqXy6JJgzTP5oM5Mm7bp+1I5p4nxW
         iZ8cqLs0CNAq970bOgA720t6U9xYTcnUgG1hhL4RegoqEuFwAzObhaZPpaqt4X0RftqD
         qmrG0NOO0H+d/p5JQIGEl32TTC9BWzGuVTkrN+VtkTHiCmk7AI2DxEDVvJxhLwAdsJY+
         UHw9iCiwpjYxuPqQEh0os/issivmfzEChE8lAp/ZKTh6jQ36EZ3r6JG8nsuSZQg/7Qb8
         Thu4GIzuFVN0y0X+BlciwVWB0FUQcjUpye9H8KVrZ9fNKhnv92McT/YbM/emsM4r5VZy
         L78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FAhOhIoKCmk+qa4z0Rjp9YHAgZ274dKuMxynLfkh9us=;
        b=IJMX39uywSfjuF0WAyJLC6vCP/RbSshMvKmIknzmr2iRAoknPblfaEj6m18lzDruT0
         wK98c3/bVnenV1IwMt4z4l9pjl2BogrTGD5DOmgL78B9EKijrzeXXz7CYWjpnm7yqF6Y
         0qzCJx9EEV/R8T8aPO9V8rEwdYETvPGo32QUN13Sm+SLiQV2S5anihPaDvTsDyrCGORD
         exV3UZXkxtX2ixwHlUkwNLHzLdncJCAUQ5w6DE93m0zD5x6JER7YZWgfBqwLrNB0ULep
         tCsQqVSzKWctokokWpiMeM//h/hyy3L2LRRilSoeap47kq+Fb6IKXbuJD9NdJuuWTRSM
         M/7g==
X-Gm-Message-State: AOAM531XohXscduVX//re0Jed1Gzg81i4dLpsww/3NJ+kEH7/6B/iHiT
        mIKREIrlkdkSYve1fF0QAngjzeIPfcisIdHGcSQ=
X-Google-Smtp-Source: ABdhPJwxm1lrvQinBF79LcB5XUUY1yWDHu+l/aM99OB1uLMV8VpmguwLQvgshZzUQSk9qB3j+P5I2TJ3N9QQWP78HqA=
X-Received: by 2002:a6b:f812:: with SMTP id o18mr5287460ioh.64.1636028374264;
 Thu, 04 Nov 2021 05:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211103141919.4feefaf0@canb.auug.org.au> <CANiq72=fuk-eVuCpW5jkDn71Pbs=1L2LhSvadR_bTjxcPvtVUQ@mail.gmail.com>
 <20211104080152.41c38912@canb.auug.org.au>
In-Reply-To: <20211104080152.41c38912@canb.auug.org.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 4 Nov 2021 13:19:22 +0100
Message-ID: <CANiq72mLAc1OMTo6LBTy1bwxM_+BbrRSCNn1uKW0irezUXBFcg@mail.gmail.com>
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

On Wed, Nov 3, 2021 at 10:01 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Oops, sorry about that.  I have added it back from today.

No worries! By the way, I will be rebasing soon to fix a build error
that happened due to some changes in mainline, so the conflict will
disappear.

> BTW, are you intending to submit the rust tree this merge window?

That was the idea, but a few things need to be taken care of before.
In any case, I was told to start submitting it every couple weeks or
so, so I think Linus et. al. do not mind if it aligns to a merge
window or not (though I might be wrong...).

Cheers,
Miguel
