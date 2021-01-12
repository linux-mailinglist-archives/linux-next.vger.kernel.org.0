Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E062F3FA8
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 01:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394931AbhALW6A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 17:58:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394929AbhALW6A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2021 17:58:00 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6C3C061575;
        Tue, 12 Jan 2021 14:57:19 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id f4so317914ejx.7;
        Tue, 12 Jan 2021 14:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jgonOAH3Wwn1HxalGc+7artiADZIPJ4uTKWNQPhxHvo=;
        b=f6pdAy4F/Pe/pntaG11Q+05GPc5RZ3uZob0nHFoxLyLKBMOJv6fE1gaKYEZ7kqkZJB
         WQ8AsNtADCiWjcPUueJ1yDi44sVJIMNkn+KTMgPO5t4ccul2JGaciBQ1mgzBw2RaW25u
         1GGdUA2r4hX/HbzcOvmciwbg/9arKcltgwgxfK7ZFXSGp3TbHCOP2AoBEeaU6xhPj4yk
         bnyk2Z9C4NjX0AkN+IrxPiLEDleM0WV9HFzvd4/6jeAVTcvW3SAaU47OUYl5yuM6F07O
         3WQR+q/285yN4X/IdlOWDmTmzppPW0zkedjxbTgYHLO7lIcwhXxnEGBnflgBrPJ7IIKa
         sqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jgonOAH3Wwn1HxalGc+7artiADZIPJ4uTKWNQPhxHvo=;
        b=Vfp26y4NbdB+y8iba8zrV1IBgHon7iBCPp9KHqn8b104ajql0DJG6rlGTSa+07wPfG
         452Jq7bdFrYIhG7SitisO2VzyRnp78zXPIZmg6LddS1yEd8sPmYNQqdUh8l3mn91SU7V
         0otCCbzjbhuwhYdAi9LLvzEfvOHPg0n3tjHHCN/ikW67mD/IvqAnzZ6jhLmNOvw0E68i
         uD9GV0ys26YZz/qmgwWBD+iYS8GfKYsY7ZUC2509e5bJfTSVxBqEAsvEGXlr/PRJFWHo
         1jQK/4s7+QOCkEWAKn7ikEz68RQ1zXLg0W1GdW80UDANsGRyT8kALd/Wb1Qh2S09gEK9
         Hq2Q==
X-Gm-Message-State: AOAM532i4FaYa+vgdATWVpX1U7qpeTiYps3S3N5PxqIeBueRSFtiA3ng
        NO6ViMpbw9c804sy6VI46y/Gw9I6ztNBuci+aB4CXkc=
X-Google-Smtp-Source: ABdhPJzuS0dEj3Zchd5Q4xPhugka8ptm6jFACjEcsVRd6HjYgIfTVV3RwZDdgBTuV9H7toKPTdLLnntzW3QcduKRBJA=
X-Received: by 2002:a17:906:ae43:: with SMTP id lf3mr687903ejb.130.1610492238269;
 Tue, 12 Jan 2021 14:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20210113092845.0ed42cf2@canb.auug.org.au>
In-Reply-To: <20210113092845.0ed42cf2@canb.auug.org.au>
From:   Rob Herring <robherring2@gmail.com>
Date:   Tue, 12 Jan 2021 16:57:06 -0600
Message-ID: <CAL_Jsq+pyCs17v84pdnJTL0bDMyxYmxBG-v=CgJfeLZcfp=vgA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the devicetree tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Sameer Pujar <spujar@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 12, 2021 at 4:28 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   e9805cb2a361 ("dt-bindings: Remove plain text OF graph binding")
>
> is missing a Signed-off-by from its author.

I meant to make myself the author here because what Sameer wrote
really ended up in the dt-schema repo. For this commit, I wrote the 1
line remaining in graph.txt and the commit message. Now fixed unless
there's any objection.

Rob
