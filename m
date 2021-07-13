Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C1A3C77AA
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 22:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234726AbhGMUMz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 16:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234290AbhGMUMy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jul 2021 16:12:54 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81389C0613DD;
        Tue, 13 Jul 2021 13:10:01 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u14so21063595ljh.0;
        Tue, 13 Jul 2021 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bpDCW++1gO2M56q1+jpsZUKW3MSgWQPFJkKR8oSYa2g=;
        b=YJrjG8o5uAvVp69w54NnRPzFP0r50GOMCSle0h7PMLFVqbxBClCYY7jBiltM6wPxfz
         sQfzkPbvHWdois2LHiTv6My+myepePDdTYjxdvczsqH3LUDUHtL7KlEd5MY0r7Oty9uI
         xfJef+b59vSH+FumO9fuEaXgF7i+1j0YocboHoGZIGrqLK79n8tndvQHzXjQ9gjW4DzO
         HJjn8j21de9To+XtW5yARdLxJ/fyKsuRJ7NJFD/Wc/6D0Eg6IKF2hLyLQG1mBVRy2tTq
         /32UgbI/cJ/OBha9I8p6VccokhgHnzo9dtwOzMUPsN4u8kofhh7kiG6ngAIYrbaxQ11S
         Bx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bpDCW++1gO2M56q1+jpsZUKW3MSgWQPFJkKR8oSYa2g=;
        b=GcCwMcTYhflYNPJ/ag5CHwc3nj37NFEO1IYYACYlFEruitDwTV3w8LOYow2QDnonVO
         GGRqt0Y3fBBAlAhtQJkfvTqu0nFQU2oOYOuhpJ5nXBo/SPa7bdR2UIpuThpqEj4k2uK4
         lfZ5cdhcoh2AbgTrICl5jtPy4o1bLvCZW2xzxkmzYajPtuaETsFnCJE5+YhbCrCgqAlg
         qm5srEkjtpeJz8cLy8b+n5iBNakFwSlPtAsLx+pZvE7N03A5o96KFhMWT/iBJE+xlVK7
         N5Yp9EuIpioJOIFdXTdpxYytn+rbxdFDGDqT4RrNZFNdMs3kIFaqtDSTcKtTqRqEzvUO
         b4Vg==
X-Gm-Message-State: AOAM533Jde192mY9PI7hKyt38E/2KE7xnavVYxdbiAGhXkgf4Tt8PbXq
        ebGAg1PhUWVA066NdRGFYvk3ZRg/gH9ZIJe932k=
X-Google-Smtp-Source: ABdhPJxJAPwjwsmS879OcMkey5vVAbrr+cvhPfFvxUhRDYgRjyPL3CIm6UZURJJxV+lV1/ZxMBuVGN6M13Km5lBBAd0=
X-Received: by 2002:a2e:a785:: with SMTP id c5mr5727249ljf.490.1626206999281;
 Tue, 13 Jul 2021 13:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210713195416.277153-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20210713195416.277153-1-oleksandr.suvorov@toradex.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 13 Jul 2021 17:09:48 -0300
Message-ID: <CAOMZO5D+4Dg1q+fxM7Dfz_y1f1wpE=kZx7ew+bdkBiQdWB7YCA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz
To:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Oleksandr,

On Tue, Jul 13, 2021 at 4:54 PM Oleksandr Suvorov
<oleksandr.suvorov@toradex.com> wrote:
>
> NXP and AzureWave don't recommend using SDIO bus mode 3.3V@50MHz due
> to noise affecting the wireless throughput. Colibri iMX6ULL uses only
> 3.3V signaling for Wi-Fi module AW-CM276NF.
>
> Limit the SDIO Clock on Colibri iMX6ULL to 25MHz.

What about adding a Fixes tag so that it can go to the stable trees?

Reviewed-by: Fabio Estevam <festevam@gmail.com>
