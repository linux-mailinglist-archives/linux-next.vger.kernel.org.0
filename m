Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E4622E684
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 09:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgG0H1Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 03:27:25 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:39727 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgG0H1Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 03:27:24 -0400
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mc0Aj-1kVSTM0AMJ-00dX0t; Mon, 27 Jul 2020 09:27:23 +0200
Received: by mail-qv1-f41.google.com with SMTP id y11so4044003qvl.4;
        Mon, 27 Jul 2020 00:27:22 -0700 (PDT)
X-Gm-Message-State: AOAM531O+m0T9tHYKL4f9Pg8nd+PzZFE/BzLY7mvOXZBKFi5BkzdSAdZ
        mfkwG+3LoKb2GYC+SNOU7L/lt5Fc1Xlf/hvjoLY=
X-Google-Smtp-Source: ABdhPJx7QfkbbHjeVpGBxLCfoP6oDWFRJdrfbKfyxAw4Od2mQhSmfIx4RhJICA2HJ/eXvfrqvup2jjTrQDLzEQ1GJaw=
X-Received: by 2002:a05:6214:1926:: with SMTP id es6mr21364796qvb.222.1595834841785;
 Mon, 27 Jul 2020 00:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200727073547.5c556e10@canb.auug.org.au>
In-Reply-To: <20200727073547.5c556e10@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 27 Jul 2020 09:27:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3-Ak5fEUHTYSPv7-OZSjMWBxRLW4S4fBoixBbP1AN60Q@mail.gmail.com>
Message-ID: <CAK8P3a3-Ak5fEUHTYSPv7-OZSjMWBxRLW4S4fBoixBbP1AN60Q@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/amC9IBt/UbantO2zf7s24pWcu4BZvWhZhrfh5w1idseTnu6Rcy
 3fT8G5drD+6ACtNKMP7M6cm1IsuQnQc3Jm66a8UO3Y2QEuoJRNYBT3HqX9zNnIa03QCYeOl
 gboZI522ecWS4WEnmOzMy49qlI5NrfQuuZfET4uBPKt5AU+nEcj94ci9/s57Ezr/AQVuN/0
 Alj9vMqySAH9qYBS9qaBQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jW7s+W57WR0=:Dq8HlZRf4l1ngxt/u4OIHa
 7QumopPHxq8a57Q8XQMT5VEpMFu7YxFsa/zaO/vrvKbIxMRs6xslfgmRLrVtWqwKHdPi1v1aw
 R9Z3fiA97ZEDRLjyZOSSa9Kqzb9tSf3BjIqYySazDSkVFVEVA3nLeOF56svrGaUL6YrsNJT5B
 hV11RjwkNOGZ5CGesNuAHCFYylqLnBCh3gNi3/X9P7UAbhsOvxwuyrxJo0XNrYOk3L4adQwR8
 ykPHLoNY/ISFWKWVgzAElZt9ms9Q+eP8GOOpehAHa1b6fA7NCN2s7jvAnNoIvzNZqsWGmMabX
 aM1FZEh16p0pVKXOfN2TcHzAUAIGbtlw7RiYXHrxE888qwPIy4elK0sBay3M/0lPAQwCfHCIe
 wvl5ZRpLRkAVH001hpSQ9ZA2G1dWizc7y4yKhL7bq0ZD6HR0Q54aEYpaPUq70wx+2JsBtUcO2
 bFlzB1FkSHgH5f/7VUMzeJAxUVf+kdvWeOITpcBvuc6sVVnnIBchG2m/rDSsnOglwvL75vLtt
 BqROxiTQvq/8mmjmEE1CzHPF+2uCXSMiaasEvuG5hMmHDJY9b1KT7GZ9ADHDgSm0u+GnPAZIF
 F7tsGrhcc7yxOjl/Um9LGJUwjnuuXBrxYDXMqIBipiKUciOLpm960xLj3MiZcw0ZwT1gRrbaJ
 qiOXDTXLchAsW4lUxXPk+1PQ5owsx873oXab6zrjQSzxzLlvg9o5SbOj9qvcuHoMwsC64P3Sp
 FUCvcuRCOB6ohpKlWM5SjvJdZDZz4sKraDwh6c1cELAzgc9ccoj11XxOaltsUppHkxCdtasKP
 In/baMv1zjOS8hvvQK31w90gGDvIKZZ5BcJXv+Nab4H2W/CVQ5BP+xVcUUW6fElGOzO4YED4Z
 ytzinLT5+t8P8r+9Y9xb80L6j7bkaJxr5I2/kcHpIfYEwbZdFFJK/EfA4vA0hqw+mN1nSTaqG
 aO4aINQKNQNAJ8T5tcg5CJejc5sSxaVts/4CGKg71LLTKw357UTY7
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Jul 26, 2020 at 11:35 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   16730dda542e ("ARM: mstar: Add dts for 70mai midrive d08")
>   22a30e8035c6 ("ARM: mstar: Add dts for msc313(e) based BreadBee boards")
>   b6d785a8410e ("ARM: mstar: Add mercury5 series dtsis")
>   34a6a898b3f4 ("ARM: mstar: Add infinity/infinity3 family dtsis")
>   b968eee1862f ("ARM: mstar: Add Armv7 base dtsi")
>   d1c7f6eb7e48 ("ARM: mstar: Add binding details for mstar,l3bridge")
>   9c2387eeba44 ("ARM: mstar: Add machine for MStar/Sigmastar Armv7 SoCs")
>   04c7bb3695ef ("dt-bindings: arm: Add mstar YAML schema")
>   97771c5bcbe7 ("dt-bindings: vendor-prefixes: Add thingy.jp prefix")
>   9f9b6e5560fe ("dt-bindings: vendor-prefixes: Add 70mai vendor prefix")
>   13fd6dfd3503 ("dt-bindings: vendor-prefixes: Add sstar vendor prefix")
>   cb0d5cba0294 ("dt-bindings: vendor-prefixes: Add mstar vendor prefix")
>
> are missing a Signed-off-by from their committer.

Thanks for the report. I had already noticed this when I added a follow-up
patch and I fixed the arm/newsoc branch (which is the one destined for
inclusion)
that contains these commits, but I failed to rebase the for-next branch, which
now contains both copies of the patches. I'll fix it up with the next
set of merges
and recreate the for-next branch.

      Arnd
