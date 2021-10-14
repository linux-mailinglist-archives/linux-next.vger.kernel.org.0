Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD34042D553
	for <lists+linux-next@lfdr.de>; Thu, 14 Oct 2021 10:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhJNIrJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 04:47:09 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:55665 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhJNIrI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 04:47:08 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N2VCb-1mjlFB2aA3-013t07; Thu, 14 Oct 2021 10:45:02 +0200
Received: by mail-wr1-f54.google.com with SMTP id m22so17170935wrb.0;
        Thu, 14 Oct 2021 01:45:02 -0700 (PDT)
X-Gm-Message-State: AOAM532LVWDbnxESNLroeG3ifExw6VhYQT7QdZkPTOO1Mz2ffkIwDTRY
        Te1HlwviBHY6NoNPtFmGBwWMumXSZqvech5WEUM=
X-Google-Smtp-Source: ABdhPJy2Q55sSkLZB6jxCTWqm25cFC7UAeGhHD3tsyQeSyokhHvq8V2pJoW6joP1ItyVfyCebQbp8k3zAHKoURn20CM=
X-Received: by 2002:a1c:4b08:: with SMTP id y8mr4618289wma.98.1634201102285;
 Thu, 14 Oct 2021 01:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211008164728.30e3d3a3@canb.auug.org.au> <20211011082704.3cff4568@canb.auug.org.au>
 <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
 <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com> <20211014001232.3becbe99@crub>
In-Reply-To: <20211014001232.3becbe99@crub>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 14 Oct 2021 10:44:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0yKvZW2-XFJtPORpa=FhG+UJgk=m0O1GiC_yLw+1Pfvw@mail.gmail.com>
Message-ID: <CAK8P3a0yKvZW2-XFJtPORpa=FhG+UJgk=m0O1GiC_yLw+1Pfvw@mail.gmail.com>
Subject: Re: linux-next: build warnings in Linus' tree
To:     Anatolij Gustschin <agust@denx.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6Yv4eaUGMtbIlsCrktG1sQMSXp+EgvJPyfDzjPo4e5eIfxrGVyO
 RCWBUrsYG8kCqcG0uFDo9OWGuTpuQYOqOULr0O2HLWB5ZUwCOTmLeNJ06Q0Z+ylJgLtwZSO
 JXiSgPFiCIKzXKEvXcQfhTPo0zNfHrMsPnN9y7Jgl4GZkFIvsLBPto/4VIX43+x9omn7spB
 TQc577mYa0VzRyA1fstrw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CDX8eeXsrJ4=:3sPMwRMFoqdR01p2h7k8ZB
 x0K21C88T1+nmImCwCUNxv+H5QsdKIsLVit9dqmCm4EAxptvoBFNXgvxkZ/9WYLGlBLVvgfRZ
 428PYf4a87240lxJHIH8FEsNN//TA/Xqmclj+5sbvFQErhndHXmZAI5zIUEoAdUa5a24fx6r0
 vbudP8Q5AwczwH1EscdRTenLNEALX5rH2I/NIlbv49HMaNx4Z1/mjBw0gY+qOS5uFmlumjKBU
 SkAmZOkxfROWropGlScHwPLLNuHUf8jfXJ/IMoBd42ktZWxXgSJp+UnL7BmB7+y2dGSy7tl+y
 39n+lcILjmIxNYr/fQtex7pKa/IHKoJy8Rh4fXSbRiTQfExCA3KO7iqnbU1vvlk/SXmQvcnh+
 etu0oAU3VY5cuAsvjp7gX1IhXx7S5N+7oKGv6/zNUKcagpXIzF/UFF2lgcip/74IuUXxWCjyz
 3l9uRpWd+2ce5OEa2UWpaEzUvrDl3f3fk0PDfrOEAEnpXU656AqwvhWbVYyy1qZJRJ9G1s3YQ
 CwaJE/PQj6Q8DQUXjtvOhO5jTK92aATXv4LF0syUhBl+OSdUgpYOq3huzX9QopDRlru8gqf/O
 RpABwl+C71rWSCMqvGD3EsBo+5CXTSbu5s8/o/dx/DhOa0EcxomuafDAq1551WSFpnB2sXGAR
 LqyPAJV5iWxhC9yTSPBoR7/QNFur/GwWAXNWjjtIyBvoQjbb6Zi4pG/43pw+AFq+vWhnFwYB9
 Q2FZN2JEzyw+D86kjVKuh3Haw7Y3dZoFw+lGuA==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 14, 2021 at 12:12 AM Anatolij Gustschin <agust@denx.de> wrote:
> On Tue, 12 Oct 2021 16:39:56 +0200
> Arnd Bergmann arnd@arndb.de wrote:
> ...
> >Grant Likely was the original maintainer for MPC52xx until 2011,
> >Anatolij Gustschin is still listed as maintainer since then but hasn't
> >been active in it for a while either. Anatolij can probably best judge
> >which of these boards are still in going to be used with future kernels,
> >but I suspect once you start removing bits from 52xx, the newer
> >but less common 512x platform can go away as well.
>
> many of these boards are still used, i.e. o2d*, digsy_mtc, tqm5200.

Just for clarification, I assume when you say "still used" that implies
getting updated to new kernels rather than just running the old BSPs,
right?

What are the typical distro release cycles for those machines
you list: do you move from one LTS kernel to the next each year,
or are they getting more sporadic over time?

Do you expect the machines with the lowest memory such as the
32MB digsy to stop getting kernel updates before the others?

> I've sent first series to fix some warnings. Other dts fixes
> require driver changes, so it will take some time to fix them.

Thanks!

      Arnd
