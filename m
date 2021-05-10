Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD61437920D
	for <lists+linux-next@lfdr.de>; Mon, 10 May 2021 17:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbhEJPG7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 May 2021 11:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236860AbhEJPFz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 May 2021 11:05:55 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CB1C0612A8;
        Mon, 10 May 2021 07:25:10 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so8249925oth.8;
        Mon, 10 May 2021 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EYkIUvzFJ/x19hX03NM711t2Q8qmIUmkaVEh5NmA7zk=;
        b=uNFXfQuFIa834q925snTaXh041OPnfoWhZobxOAY7URCZ/2YXE8r+mjfQbfJpAJsiB
         PrrsIR1zNwQXnPfnGrUrhbJIkqsQu3RoVuo1fINYpMVPsoDjTSGVM2SxZycYuNTh1RBd
         HiUUgn/EVkofnFy9qvgPZZrSpzyMwVdEdEcTnsud3EYP1AiJe/4T6zr/RPBlryesvk2J
         WI2Zu7hq/afniuU6mhvvKxft5i6nOYTY/ch/qQVnZDpj7C1jmOjP5jwaMdkPtygSP9t9
         ZPPeRLHTKFJKQwgeKiNMeyn738HtozKIBL8/tWB7Db3SUEWEfK4M5HncbRoLFpqwlhXO
         zFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EYkIUvzFJ/x19hX03NM711t2Q8qmIUmkaVEh5NmA7zk=;
        b=QPhRPW9XevD3dCAHJsNxhAN0lwU7y/tNKwSQFoVyFCCJ6TagvOTtVpXhIwVgnnTq/p
         bdqqWMqowwqV4Cr+qszEKg0FepMkeVRsxXlsmtlErie2Ru7Uw4DAH7tUIxUWtHwzAl75
         WzDdMZlRkoup5CNb6VNZ5dPlGrDenuHi3wrth/udIFRI7ejTpxtTPvnXKMh/UN4YXjmN
         UqLzPNSQrPRnAO2IQV7eXKze8/ZdR7U9NLmW0q8GzGaSMLBL2or3wG92cs4o6mbTdwtm
         TlWc53u9lXH062ox3DkM07j24HZUb6w/4fANcPrb823AirQilGuShKPxlH2RrGsBzdfw
         fxhg==
X-Gm-Message-State: AOAM531CSFWlnkxc7uaEDH97y78JOVGc9XPlmBiGKLkWtZU9a76N1Zdx
        xA4ietzUI8Qd2KPoqreCUiuY5Wvg5xhjCElD8uQ=
X-Google-Smtp-Source: ABdhPJz2ghgexgkKkDyP+5Yj5566vPSJOh7e117kRSAf6UADg8Yc84KIcPNO+l93ev3XOL+uC/IjZrDjlY2YwPbm4Z8=
X-Received: by 2002:a9d:51c6:: with SMTP id d6mr15164044oth.311.1620656709689;
 Mon, 10 May 2021 07:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210505093458.23efd0ee@canb.auug.org.au> <20210510084628.0d4bbd6c@canb.auug.org.au>
In-Reply-To: <20210510084628.0d4bbd6c@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 10 May 2021 10:24:58 -0400
Message-ID: <CADnq5_OqX6EBWyt5TR1N2Fcwdq-0hWBzcRFnBSej=vCoPmZCrg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jude Shih <shenshih@amd.com>, Hanghong Ma <Hanghong.Ma@amd.com>,
        Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
        Daniel Wheeler <daniel.wheeler@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dave Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, May 9, 2021 at 6:46 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Wed, 5 May 2021 09:34:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the amdgpu tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_initialize_drm_device':
> > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3728:7: error: implicit declaration of function 'register_outbox_irq_handlers'; did you mean 'register_hpd_handlers'? [-Werror=implicit-function-declaration]
> >  3728 |   if (register_outbox_irq_handlers(dm->adev)) {
> >       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |       register_hpd_handlers
> >
> > Caused by commit
> >
> >   77a49c458931 ("drm/amd/display: Support for DMUB AUX")
> >
> > I have used the amdgpu tree from next-20210504 for today.
>
> This has now been broken for 6 days ... please fix or revert.

Fixed in this patch set:
https://patchwork.freedesktop.org/series/89890/

Alex

>
> --
> Cheers,
> Stephen Rothwell
