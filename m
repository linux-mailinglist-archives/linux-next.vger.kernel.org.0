Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC61429839
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 22:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhJKUoO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 16:44:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:51164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229627AbhJKUoO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Oct 2021 16:44:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C7B560F23;
        Mon, 11 Oct 2021 20:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633984934;
        bh=ibFTHb+m3Z5pkvpLr9kxh7hAkVuH9dWI+TtoS66LBss=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hd6bqWiokjnvfWsKkWSYNKdO2Hw/sTNInPnU2c2coke5zm/Qke5RHdxh4QeSh28S9
         DExN41HF1TehUVhN1ayjJnYGUqqzXo4iCljRwR+FdElZ/Ltbv3fGhzvco5W/wF9QIX
         +l3P7+NpuWbg10JW6U4Q1E8L4CcKaWdhsCV0NO2ONXWWDjaljcmNrD5A7ukfUKh8H2
         sT89DOfyMuaNnfDTICPVP8HZtGqKtMtn4n2kKPfiv1gHK3iMiC1sxiZml3r6H2mEXG
         WED2pJdqDnw7LZSKdOGe6MI468c1DdU9ZKulkLEyhLYY5kHALd3Zx44EUZyvoHkDoj
         HRMWP+fMCKLGA==
Received: by mail-ed1-f54.google.com with SMTP id t16so50572958eds.9;
        Mon, 11 Oct 2021 13:42:13 -0700 (PDT)
X-Gm-Message-State: AOAM531xNxsCv/1zShdD6SR2XhQCuS37qsYIxyb8RkvijaMEAoqnr8+B
        7HsJQKdR+FoXrfYdNeuUP8UooM8GK5vxbmJ12w==
X-Google-Smtp-Source: ABdhPJyuQvOrfitnTSM7CD8MUEyAH4rqnj7rt9TGPaP73gd4ePuhtXG3Htc00PD+tsTKC+JIU18wvsUhRLtOgD4aqqQ=
X-Received: by 2002:a05:6402:1d55:: with SMTP id dz21mr32990982edb.164.1633984932421;
 Mon, 11 Oct 2021 13:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211008164728.30e3d3a3@canb.auug.org.au> <20211011082704.3cff4568@canb.auug.org.au>
In-Reply-To: <20211011082704.3cff4568@canb.auug.org.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 11 Oct 2021 15:42:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
Message-ID: <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
Subject: Re: linux-next: build warnings in Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+Arnd in regards to removing platforms.

On Sun, Oct 10, 2021 at 4:27 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> [Cc'ing Rob]
>
> Rob: these warnings have been there for a long time ...

If anyone cares about these platforms, then the warnings should be
fixed by folks that care. If not, then perhaps the DT files should
just get removed.

FYI, u-boot removed mpc5xxx support in 2017, so maybe there's
similarly not a need to keep them in the kernel? It does appear NXP
will still sell you the parts though the last BSP was 2009.

Rob
