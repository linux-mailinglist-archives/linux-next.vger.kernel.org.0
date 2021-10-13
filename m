Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE5042CDB5
	for <lists+linux-next@lfdr.de>; Thu, 14 Oct 2021 00:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhJMWTn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Oct 2021 18:19:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:45748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229883AbhJMWTm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 Oct 2021 18:19:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A74D610F9;
        Wed, 13 Oct 2021 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634163459;
        bh=iAXL5wKCTXDPPJMdmvXuQp/LrnAKr8yFIpif7ovGZS8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kXUS5NJmuLj3/+fqDgJFea1cIf6pXU0CZxKV8eXurkJ7/LIT1jCSDCzxreAPi6Fvy
         eN+KojwSmLouJZ/rgCsKg2rW3S0fPo8w3MUb45fKv71v9ytpURRH8BJMEMLCff7tFv
         RpU+4cgZwm/4KZhiiB+laX41W2l38EBVY74sm6vb7zKyzb/IngDx0dskYf6WcS7wuM
         awg5BupiA7j7CRjJ1Po9FVkf8hU2z4SLnvIVP/TSeSMGmcAnYT2MOv8yEbjPxL3a64
         GefIW8RHrKgRwRUosvDcy7Jm1OO79V4uY1dIU3o7o+umKn2YaWEARFWozCY5xhcqLt
         HV5dUuoZsd5Rg==
Received: by mail-qv1-f41.google.com with SMTP id a16so2668419qvm.2;
        Wed, 13 Oct 2021 15:17:39 -0700 (PDT)
X-Gm-Message-State: AOAM531DhcnvD8448kFpbG+ePsuvt7Mu5Z4GDW4dJjxIWyr7RUi8/HvA
        +Y8eiy6wYQZ1zzL6Dbt7NzyNFlsKv4FnKZRI3Q==
X-Google-Smtp-Source: ABdhPJxmJi2Xxza37sFggFJC2MLH2xZUa4xlWBETq+bdhKMaOqGK0gTFoAvZo3wfhHajb/fq+U3qA04vhbeonKCE6ls=
X-Received: by 2002:a05:6214:50c:: with SMTP id v12mr1582348qvw.45.1634163458268;
 Wed, 13 Oct 2021 15:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211008164728.30e3d3a3@canb.auug.org.au> <20211011082704.3cff4568@canb.auug.org.au>
 <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
 <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com> <20211014001232.3becbe99@crub>
In-Reply-To: <20211014001232.3becbe99@crub>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 13 Oct 2021 17:17:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJSqqYya-xe8YQs0-0KTF3LzwkyGD_2dUxQY9SKVV7RMw@mail.gmail.com>
Message-ID: <CAL_JsqJSqqYya-xe8YQs0-0KTF3LzwkyGD_2dUxQY9SKVV7RMw@mail.gmail.com>
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

On Wed, Oct 13, 2021 at 5:12 PM Anatolij Gustschin <agust@denx.de> wrote:
>
> Hi Arnd, Rob,
>
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
> I've sent first series to fix some warnings. Other dts fixes
> require driver changes, so it will take some time to fix them.

In general, you shouldn't need to be changing the drivers. Can you
tell me which warnings need driver changes?

Rob
