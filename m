Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27EEA262A06
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 10:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgIIITf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 04:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbgIIITd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 04:19:33 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B290C061757
        for <linux-next@vger.kernel.org>; Wed,  9 Sep 2020 01:19:29 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id e23so2294656eja.3
        for <linux-next@vger.kernel.org>; Wed, 09 Sep 2020 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pXeIVny4SCjQpHOWRmhg1e5D0Af+TbFGDr+gvAazg8=;
        b=BzvSFaQJLJILAdbXFT5uKFET8GO6bhTFU1aGXOdyFeuKWcsNprgoucxgyYron9HPfk
         HZ97W1WAJu2i1eDwe14xs0xptM1CRb0niUmbUMgS/GaowyFio56M3+/7vkgyS/mZ9TA+
         pkreEdffWjXtuxoj2tazieSNZxqOVRvmruuzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pXeIVny4SCjQpHOWRmhg1e5D0Af+TbFGDr+gvAazg8=;
        b=CbYs2s4dJ+lG2qGk062lCDhYz6Jh5PeTvUwrDuUFkUK4FBX/c+Ch9Aj/Nx9O5BJ2kK
         AmD5siZSgX6kYZbKy1mcHClevYDBaTSftJQW3mZ2BNknxQ0KHtgKVTogsOfydFdVhQSh
         iswgvO1poGobGEID2omx2vRceQxuCOqxY/kYkNC9a2Dcii7RfFkFJ75stQpPphQ4qFzG
         C61uyL++s0kCseTWfiBxefRkbPmqJMs4dhVfUKsfCaMR4dW+L4yE3bT6KopFWls0sTxd
         dr6vIQhSOJuCzT8DFC2q/tOUQ6C+ln7CSxM4KP0DJDWItDXKWjuC4cu2TivPLGZ16KSJ
         KSow==
X-Gm-Message-State: AOAM530iXaBPTCaCt+frBDoYs7flCYw8GsagRpE5imnKuHwHgelMRfvg
        XLvv+EJqHjxO0HXXNEoT5EVoqSgg0z6xiTkA/XrG2g==
X-Google-Smtp-Source: ABdhPJzvfIij7YO4hihFiSb4hxA+NHJOifz4cTebwv29YbC+ZXbvBjLWdaVioZkEamOkVZ0ebFwb4JDa7iEPkbmLQ3o=
X-Received: by 2002:a17:906:f150:: with SMTP id gw16mr2384862ejb.528.1599639568574;
 Wed, 09 Sep 2020 01:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191112110330.179649-1-pihsun@chromium.org> <20191112110330.179649-5-pihsun@chromium.org>
 <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com> <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
 <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com> <ab35a9c7-1b33-dc75-8520-ee072ff1309f@nvidia.com>
In-Reply-To: <ab35a9c7-1b33-dc75-8520-ee072ff1309f@nvidia.com>
From:   Pi-Hsun Shih <pihsun@chromium.org>
Date:   Wed, 9 Sep 2020 16:18:52 +0800
Message-ID: <CANdKZ0eGTqxkcdgyAR6ay4yJNy74v5SqAOh96u+v4WzbZRf32Q@mail.gmail.com>
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Erin Lo <erin.lo@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 9, 2020 at 3:37 PM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 02/09/2020 17:23, Krzysztof Kozlowski wrote:
> > On Wed, 2 Sep 2020 at 16:45, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >>
> >> On Thu, 27 Aug 2020 at 15:44, Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >>>
> >>>
> >>>
> >>> On 12/11/2019 12:03, Pi-Hsun Shih wrote:
> >>>> From: Eddie Huang <eddie.huang@mediatek.com>
> >>>>
> >>>> Add scp node to mt8183 and mt8183-evb
> >>>>
> >>>> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> >>>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> >>>> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
> >>>
> >>> Sorry I somehow oversaw this. Next time please don't doubt to ping me.
> >>>
> >>> Bjorn, do I understand correctly that you don't send emails to the list
> >>> informing of the inclusion of a patch/series in your tree?
> >>>
> >>> Anyway applied now to v5.9-next/dts64 :)
> >>
> >> arm64 build dtbs failed on linux next 20200902.
> >
> > I just hit it as well... I wish the kernel was built after applying
> > patches... it would make the next a better place.
>
>
> Any update on this? It is still broken as of next-20200908.
>
> Jon
>

I just sent https://lore.kernel.org/patchwork/patch/1303034/ which
should fix this.

The build failure is because another patch for the mt8183-kukui.dtsi
(cd894e274b74 "arm64: dts: mt8183: Add krane-sku176 board") that was
merged after this patch is submitted to list is missing the
scp_mem_reserved field. Sorry for that.


> --
> nvpublic
