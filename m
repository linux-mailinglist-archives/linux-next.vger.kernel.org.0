Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E52B4612
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 05:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730011AbfIQDmk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 23:42:40 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:35253 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729345AbfIQDmk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 23:42:40 -0400
Received: by mail-vk1-f195.google.com with SMTP id d66so429099vka.2
        for <linux-next@vger.kernel.org>; Mon, 16 Sep 2019 20:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E7jFRh2n+jc8CB66SFHbbHRXtVEUNkro/yk+H2kFkL4=;
        b=FUcGfGtxkTlmSxmt5gQwEX7SA6xUHQX+bNPBzuYYzbxnau/esg+roqjPy12H12HyBR
         Zc8gHZ2vuWx3B14ue9hSTmXh7uTeYFFAinndbphpJ1tr39kAeihR/QQEuhgY3XRMvRY/
         1RoauBexXXia0w/m0sYWz9+GIXZxrbFb1BtQQiK/t6TjW8X7T4P4pRdxvomxNUBnxZAf
         4qstLG2jC3T0Gaj8ixNDXWhmW6qG4zpoimTr2cgIdksAirPMHKnisLEpFIEem9L5ikRR
         w0+lH6l71m+9WcIFlwhye0t8OP6AcQUUoEEcvK7PHMATLHnZcNC2jV2Nj2Aj5QCW23xa
         C/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E7jFRh2n+jc8CB66SFHbbHRXtVEUNkro/yk+H2kFkL4=;
        b=qajxFEEQlbfTUZFNcbPsL89qPN6k+scgMk5Twh/YzwY9xr1NnVUTdR7hlz5j2kBW81
         aV2PQXxf+Jgez/ZUefFiIX9hVKvUzMVSXPIBojw+q1sUbetJyRyq8RA7LcKXt2olft6Q
         iFbmiLXHBzMTY3eg9C5SzZabCMZbgyXad7y5mlb0PHUtmI/ugUZTyoE/G3kTA8aL0Hn1
         HhnZz26K/oNJjidU20pRUkuOcQkM3OXGPVdmd1FR21mMdSxb5mUQF6kPCYDoXyLnwE3m
         +WN2X2U4CTMXxNNjk7Oo0vK8G/+RMfmbjxs/BUR5TB/nlzCnIRPr6ecFlTucHV/bYj5z
         8+Tw==
X-Gm-Message-State: APjAAAWrz4h3OXFT8SsZGAuc7cLvIui9awbfsueyLPcc6G8osaqs62Nx
        SG6tyQ3ExbZ4X/9zKL+Wc5wdhLOaclhXN0sSTxN6cQ==
X-Google-Smtp-Source: APXvYqylyJkjns/aN+8l0EI9DIfbxa4N2MWKAfj7VPQ17LXO9wcipYNM8IikzhhUzIM4gFvBiWj5HLVhWZUDnoz6tN0=
X-Received: by 2002:a1f:1897:: with SMTP id 145mr495407vky.53.1568691759340;
 Mon, 16 Sep 2019 20:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190904233443.3f73c46b@canb.auug.org.au> <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
In-Reply-To: <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
From:   Kees Cook <keescook@google.com>
Date:   Mon, 16 Sep 2019 20:42:27 -0700
Message-ID: <CAGXu5jJ-LzJx1Fr8b2b4xv9i9yG99CPc8SUoT3eF44kO0G7tYg@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 4 (amd/display/)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 4, 2019 at 1:58 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 9/4/19 6:34 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > News: this will be the last linux-next I will release until Sept 30.
> >
> > Changes since 20190903:
> >
>
> on x86_64:
>
> In file included from ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn=
20/display_rq_dlg_calc_20v2.c:77:0:
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/../dml_inline_defs.=
h: In function =E2=80=98dml_min=E2=80=99:
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/../dml_inline_defs.=
h:34:1: error: SSE register return with SSE disabled

I'm still tripping over this too. What compilers are people building
with where this is NOT happening for an allmodconfig?

I'm using:
gcc (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0

But it happens on newer compilers too.

--=20
Kees Cook
