Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37D528AF93
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 10:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgJLIDC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 04:03:02 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:53605 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgJLIDC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2020 04:03:02 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mx0VH-1kHvLz2vvv-00yQ5g; Mon, 12 Oct 2020 10:03:00 +0200
Received: by mail-lf1-f53.google.com with SMTP id c141so10789852lfg.5;
        Mon, 12 Oct 2020 01:03:00 -0700 (PDT)
X-Gm-Message-State: AOAM5329rPpF4X0jNpISzjyKGS9ElycpcARJDozJ56RnJ66uV3ypd9tX
        3wzPkXSqMqnKu1qiwSZ5g87TZu1gGWijPS/Oe4E=
X-Google-Smtp-Source: ABdhPJx11cXgd7NuyGgFGTokjzGvI9x76aNkz9qF5daELeSTHToGxJqvkn1G/zD5r3PdGT6e1Rse9dVo5HWd3YU1gAM=
X-Received: by 2002:ac2:446b:: with SMTP id y11mr4705383lfl.403.1602489780126;
 Mon, 12 Oct 2020 01:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201012095158.779c6d9d@canb.auug.org.au>
In-Reply-To: <20201012095158.779c6d9d@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 12 Oct 2020 10:02:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2gLDw8rOYPgg=-hnNcK_5NW-fGHmiJ3ntb0dbf1EjQOQ@mail.gmail.com>
Message-ID: <CAK8P3a2gLDw8rOYPgg=-hnNcK_5NW-fGHmiJ3ntb0dbf1EjQOQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the asm-generic tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xjt3PXPnjTuI/+1Dwfs2jLk7eSdwUQnP7mRB6hkbAUPLqqPBDoe
 vVpzSDhsw3iVH2AdbC5t5lgvVhTflkVgXGeNVGemPiWNlyxYI0E78GrBEZX6wq+ry3r9r2d
 SQy6t/tInQgWYmzWEBjo395Eh/ksXTA9h1g+C437WzJKcJg4l7yX7qTcZ+yjPvkClTkxu7L
 X6xVKDmI4chPLMgVU08Rw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5A5TrkE48kY=:ZcYEY4RLldJ54grMBAQIMc
 T7APgyTnY4Lo9n/iJup7Wr+9Fkpp9oa0fgJE41CiTDEfVauiRWyvr7Ffjh8rCU2xCCufKCy5X
 5y/CDc+JB9hdTX1ARA8UUxhr38GL69Zqcv9iBsZGGEHef7XLizzfPFmX0Po1i7jMbfpVm8M1Z
 7cXR5gyrLiWRESpzWU9aUFKll57JQlNEze1BdAzlyJlb2+DyHTzXjmVpkLhgRDJNPnF/87iRi
 8YlGpojFMq3dnPoMYQ8rrarvjkVMXKOAZczAKn/TO1jsldVZM4Hy8pqATctqXvorA/l3rYnCv
 h8CaIOTu8c/blXqaiPK7vdXPlzKUtW7uvU2Jw7VfQQ+It0nEZa1/11P2nPQK+4rCVZbTaGINa
 MGbgPx6EVGimce5u9ivGDZFB1cmia8lVtNPb0St6sYRQ8aB9Wv99louZRhX52ZPW8scahaoUs
 hXe9AmbsnBVNAaugNtO83XOAQxWP92hYtc+q4LYdgiyUO3dgG3hEcIUY79JPTZ6h/2iI6LUhU
 oLo9EFkAMUvO7KR4RN2EzcftRb/eEMq8h8yMCWqoMU1LkzCGioCPpgJO1Rx3spotyzGn1zCr+
 IWSuFPXZfPoBDdSChUDk0ZJ3CxGFo+tbkNWLSsPnPReFGDJ0enwnFXaPkHtNtTzvUuqSekrYa
 D+EaINPLuePNXXmqLhZeypaRxREmGnO2Ec9aAhF99eCxvR9RVvQ1kzcp/sUFVrdlpo91Mz1Gl
 WKjO63jBFdeApOXVI7ewZhZNMpRVoTitii9s7pYEfepXvKlpyRPDykPqZECkqo9/Tg/SD9ooZ
 dYSVuUBdrFQm7T+7t95OwTUngHYPBg7Fe3ZF10PHMeYHahdonefTVcZvMEWQLKsSnjfFs12M+
 yTmc0bQwmIJX67OpztIABOCQDTClvcZ/7yspeBZ5H0GrYbfpNgp5vFhbBpurkVizp7YsvluHe
 c1cUf3iGWrwBG7mFu6bv8lvggymVsXw9+V5kt1YqRk8ooRdGXomuO
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 12, 2020 at 12:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the arm64 tree got a conflict in:
>
>   arch/arm64/include/asm/mmu_context.h
>
> between commit:
>
>   f911c2a7c096 ("arm64: use asm-generic/mmu_context.h for no-op implementations")
>
> from the asm-generic tree and commit:
>
>   48118151d8cc ("arm64: mm: Pin down ASIDs for sharing mm with devices")
>
> from the arm64 tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

Sorry about that, I had pushed my asm-generic branch to the correct
location on Friday after I noticed it was missing. Removed it again now
until the end up the merge window.

       Arnd
