Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C7D3799FC
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 00:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhEJWYy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 May 2021 18:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhEJWYx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 May 2021 18:24:53 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04BADC061574;
        Mon, 10 May 2021 15:23:47 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id s1-20020a4ac1010000b02901cfd9170ce2so3798767oop.12;
        Mon, 10 May 2021 15:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QCCAqPTZBF64Wcz0OzYKh9FxhocZKj638y/bsgfHqaY=;
        b=vdbfis9OQebCZQtShlG+bJNaMWtCaAiyndH/iMzQB5CagdEoxGZyg3CHnmxmKTdrXQ
         dZmk5pTGdJHLIJu/Fun+YlnvOfJl494tSMKoSdbNi9/pftvm+wAKqh4zwDA75ka92X/H
         rscNB79xIYkYP3h5g8eChzgSFQDNt8lmVSedjXlMDtAcLFX1kVM83GH3glhMi97I+oqD
         bLiIIlTwrg1E7s4wxRKRb+Jn9QGHwkcduItlYjMzspEeAggto+M3xr7PxaPVHoqh18pW
         LNhMpvWGQDm3j5ZTHZgzYYeGPKJ0D1g/2BOTFMUbG/UzTjOGpJPOvr5BiFFgTFqhlg7X
         3X8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QCCAqPTZBF64Wcz0OzYKh9FxhocZKj638y/bsgfHqaY=;
        b=A39fZaHXcYc7sUQzeDGB6B7RUZ0gmrKGkR8froOSuyq7RC5bb3JsFAaMu0NrhgbD36
         M+Q7vIganZkJSaujbUh/yADMdBIS04n2IoD7a7OsDI8ExXj6GLK4MEFVSr8+omirsc6N
         5FljGU1n7wTlHPhrdU0sRNdn1sNVpohTO9S26S50kW52nJ6RjKl6nNR9ei1uOp15Lser
         4dmbjLIfml3bbpZiZRW4cUP/pDOq8IdFGCgsU8dzNvALPGP+iNTacdTeuDL7oqU/jRcu
         hxBQhVOND1yIn/0kicIc+YdvNa9V4TmRwBYIJT3DrGFabZNyiSn6ZPaKLoX/yp/Q3yoC
         I/EA==
X-Gm-Message-State: AOAM530zbhd5RnmtRIZ/GsyMzIVwSYUBjYw0PHZ3c8NpsXI8c15yyGdb
        LDDad5uye5lNffaoJECqkjmjfNWpAiUTI6nJ3j4VhDdq
X-Google-Smtp-Source: ABdhPJwceOxV9rhx5D1qlkldGGeorKT1USdtoQUaL3tNrmJJY3Xg6nU9kuvg2kFpipfBN0ROoSVxY7Tjv0fl4tUiaxk=
X-Received: by 2002:a4a:d543:: with SMTP id q3mr20705575oos.72.1620685426502;
 Mon, 10 May 2021 15:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210505093458.23efd0ee@canb.auug.org.au> <20210510084628.0d4bbd6c@canb.auug.org.au>
 <CADnq5_OqX6EBWyt5TR1N2Fcwdq-0hWBzcRFnBSej=vCoPmZCrg@mail.gmail.com> <20210511081849.59d41322@elm.ozlabs.ibm.com>
In-Reply-To: <20210511081849.59d41322@elm.ozlabs.ibm.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 10 May 2021 18:23:35 -0400
Message-ID: <CADnq5_PgHV07dXabX9kiJzqW13W2YeYJ146=BJ-uGCxTt6-_pQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To:     Stephen Rothwell <sfr@rothwell.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jude Shih <shenshih@amd.com>,
        Hanghong Ma <Hanghong.Ma@amd.com>,
        Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
        Daniel Wheeler <daniel.wheeler@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dave Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 10, 2021 at 6:18 PM Stephen Rothwell <sfr@rothwell.id.au> wrote:
>
> Hi Alex,
>
> On Mon, 10 May 2021 10:24:58 -0400 Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Fixed in this patch set:
> > https://patchwork.freedesktop.org/series/89890/
>
> Sure, but that is not in the amdgpu tree that linux-next includes
> (https://gitlab.freedesktop.org/agd5f/linux#drm-next).  Did you forget
> to push it out, or is it still being reviewed/tested?

Was still being reviewed.  I just pushed out the tree with it included.

Alex

>
> --
> Cheers,
> Stephen Rothwell
