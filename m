Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4276C42CF27
	for <lists+linux-next@lfdr.de>; Thu, 14 Oct 2021 01:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhJMXYa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Oct 2021 19:24:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229575AbhJMXYa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 Oct 2021 19:24:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C319E61130;
        Wed, 13 Oct 2021 23:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634167346;
        bh=K5KsIlS9mVWjzKzbP+EwldW57G6BoWfvsfYiavmtyik=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OqT1oEZAJlox3bcvPNUTZGrXxa3T7rZNlH1iqIqhncwVz4rV7GWn3h18yr5y1Ha9u
         u1d6xaO0Ih6LONwBGwEUJOvToQRNlDT9Mm3o7x3GjDCsmAhznIfoiNgOe5hjM9o33d
         RPhyzETlV0NPJahQqWZ9HxZK8QRNNqkYxMtlZcWblbnCAtuROO3qCt2Tsw+Ojem3qo
         O9UmnxtUsiC0iYt5lfaBivvZru/iKR40sUygK1aUjYb1mYrDmy+yQtI2cOfWYER6iM
         Cr55v4KCxM5ZQgfdbNdEYA8r26zyvXLnWMF1hoLNN+VJOpQ7IDyGKhVmTivORok7MI
         kGbasftgTfHWw==
Received: by mail-ed1-f47.google.com with SMTP id d3so16588622edp.3;
        Wed, 13 Oct 2021 16:22:26 -0700 (PDT)
X-Gm-Message-State: AOAM531ZsYAq87zhn0wUpW4gzk/gJgyKjQfREl2rOEz2Wf4D1Lr7Wh1M
        CXd2JLt6sR3YRvOFWzR4REGxsduwQ5jwGQULwg==
X-Google-Smtp-Source: ABdhPJyUy4HLQa9Am8aZBwEmHklQVZ9rPvCBp9S58spLgaM4WzZGcyNsKEEty06SU62BPKNJ///cgxizZ5xdwFC1eI0=
X-Received: by 2002:a05:6402:4382:: with SMTP id o2mr3382495edc.271.1634167345178;
 Wed, 13 Oct 2021 16:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211008164728.30e3d3a3@canb.auug.org.au> <20211011082704.3cff4568@canb.auug.org.au>
 <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
 <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
 <20211014001232.3becbe99@crub> <CAL_JsqJSqqYya-xe8YQs0-0KTF3LzwkyGD_2dUxQY9SKVV7RMw@mail.gmail.com>
 <20211014002841.7c4ccf2f@crub>
In-Reply-To: <20211014002841.7c4ccf2f@crub>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 13 Oct 2021 18:22:13 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL1uKAOR3z8freTWo_GNEtRAeYcgTuRF6s3X6DOvzCFww@mail.gmail.com>
Message-ID: <CAL_JsqL1uKAOR3z8freTWo_GNEtRAeYcgTuRF6s3X6DOvzCFww@mail.gmail.com>
Subject: Re: linux-next: build warnings in Linus' tree
To:     Anatolij Gustschin <agust@denx.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 13, 2021 at 5:28 PM Anatolij Gustschin <agust@denx.de> wrote:
>
> On Wed, 13 Oct 2021 17:17:25 -0500
> Rob Herring robh+dt@kernel.org wrote:
> ...
> >In general, you shouldn't need to be changing the drivers. Can you
> >tell me which warnings need driver changes?
>
> ethernet and mdio drivers share registers, so they use same unit-address:
>
> arch/powerpc/boot/dts/tqm5200.dts:127.17-133.5: Warning (unique_unit_address): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>
> arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>   also defined at arch/powerpc/boot/dts/digsy_mtc.dts:60.17-62.5

Those are W=1 warnings and off by default. You shouldn't fix them if
it breaks compatibility with the driver.

Rob
