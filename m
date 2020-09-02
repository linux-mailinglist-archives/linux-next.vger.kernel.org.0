Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BAF125AD8D
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 16:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgIBOo2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 10:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727955AbgIBOlC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2020 10:41:02 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649B9C061246
        for <linux-next@vger.kernel.org>; Wed,  2 Sep 2020 07:41:02 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id e14so2669861vsa.9
        for <linux-next@vger.kernel.org>; Wed, 02 Sep 2020 07:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B/zlgCI9QrJNPU4JJlp1UP/IMi9j+4O0vRWsFWmv0KI=;
        b=VLaaxBL3UFPDYVUJ5u3qnhXXYiWouCcUpbGhcl8mkRK7KVGFsfz0SiYYjhEZeqM6ev
         kLwMmuI2R1ybRDGdb62aq4/OF0wCpEegWeULD0pDxvQvQOYdsqWMqsQeAS2Reo9i5x5/
         q3Pj+eXZKms7JnqjKxS3W+KSojCcZudHAlWt9N4kJIusQD/NA3fN6BjnG+ZzVxveCxP0
         fjiTplf6t9cfgtQFRLmsTZPxJBxWO0rDplJuR+eYWn/uJvMpbzs4bqoGe1znbGzedqNS
         6Div+I9dOBnHLRefDLL+pXF2AJyMinxm8k5BWY7L7wyVghBHL/1XrzKok+a9FLkC8/x9
         EIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B/zlgCI9QrJNPU4JJlp1UP/IMi9j+4O0vRWsFWmv0KI=;
        b=YV2or5q2OFisSmUELTlwj6nHb/135+zADisyEqjHLDeoHV4Bg6FBT53GwzcpAgqFiN
         ZE6tTwpcaRocv0qEvc4/tybwYnERB8dR/RUHpBZ7vVxXVaELix9UInm6xtZwWEI+NXZs
         nsLP3hvAOmxFP299qlX9P4ZcGtsdw2lQZu6f7bfi4ZpK951x9Ur4Nw/uSQaZfWC7VRue
         YlaieE42Uk1HI7tPWr+mkiXPxrPE/s5WQoGoR4m05gvqDgoDldKB4o6p/zx0CMVgc8eY
         vA7Q9MlgdJ/jKwGZdUTP9JZI8E3H9vh8uSiM7mabV6aBFdHfeG08eIQ8jobi/fJ+ZIP2
         AUpg==
X-Gm-Message-State: AOAM532b97eqLs53hPjZH9zNhdvbn9pMppWB8t+l54YUr8BSymCp7B4p
        wu4xnkoMwuEiWkVle/uNBkziVaUExmwrJAU/U7qKaw==
X-Google-Smtp-Source: ABdhPJzlxTPaTI8JwFZQXPJBSSUSFEsHPrWt06u3qPZOY9J3wJyukGwQHEqGAZWmHxk7I65dz6qnkslKhZ6rX4tFp/8=
X-Received: by 2002:a67:e9d4:: with SMTP id q20mr5209551vso.83.1599057661252;
 Wed, 02 Sep 2020 07:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191112110330.179649-1-pihsun@chromium.org> <20191112110330.179649-5-pihsun@chromium.org>
 <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com>
In-Reply-To: <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 2 Sep 2020 20:10:49 +0530
Message-ID: <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>, Erin Lo <erin.lo@mediatek.com>,
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
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 27 Aug 2020 at 15:44, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 12/11/2019 12:03, Pi-Hsun Shih wrote:
> > From: Eddie Huang <eddie.huang@mediatek.com>
> >
> > Add scp node to mt8183 and mt8183-evb
> >
> > Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
>
> Sorry I somehow oversaw this. Next time please don't doubt to ping me.
>
> Bjorn, do I understand correctly that you don't send emails to the list
> informing of the inclusion of a patch/series in your tree?
>
> Anyway applied now to v5.9-next/dts64 :)

arm64 build dtbs failed on linux next 20200902.

mt8183.dtsi:342.21-352.5: ERROR (phandle_references):
/soc/scp@10500000: Reference to non-existent node or label
"scp_mem_reserved"

build log,

make -sk KBUILD_BUILD_USER=TuxBuild -C/linux ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- HOSTCC=gcc CC="sccache
aarch64-linux-gnu-gcc" O=build dtbs
#
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #address-cells (1) differs from / (2)
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #size-cells (1) differs from / (2)
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #address-cells (1) differs from / (2)
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #size-cells (1) differs from / (2)
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #address-cells (1) differs from / (2)
../arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14:
Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges"
property but its #size-cells (1) differs from / (2)
../arch/arm64/boot/dts/mediatek/mt8183.dtsi:342.21-352.5: ERROR
(phandle_references): /soc/scp@10500000: Reference to non-existent
node or label "scp_mem_reserved"


>
> Thanks!
>
> > ---
> > Changes from v20 ... v14:
> >   - No change.
> >
> > Changes from v13:
> >   - Change the size of the cfg register region.
> >
> > Changes from v12 ... v10:
> >   - No change.
> >
> > Changes from v9:
> >   - Remove extra reserve-memory-vpu_share node.
> >
> > Changes from v8:
> >   - New patch.
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 11 +++++++++++
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 12 ++++++++++++
> >   2 files changed, 23 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > index 1fb195c683c3..ddb7a7ac9655 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > @@ -24,6 +24,17 @@ memory@40000000 {
> >       chosen {
> >               stdout-path = "serial0:921600n8";
> >       };
> > +
> > +     reserved-memory {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +             scp_mem_reserved: scp_mem_region {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0 0x50000000 0 0x2900000>;
> > +                     no-map;
> > +             };
> > +     };
> >   };
> >
> >   &auxadc {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 10b32471bc7b..e582f5e6691d 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -269,6 +269,18 @@ pwrap: pwrap@1000d000 {
> >                       clock-names = "spi", "wrap";
> >               };
> >
> > +             scp: scp@10500000 {
> > +                     compatible = "mediatek,mt8183-scp";
> > +                     reg = <0 0x10500000 0 0x80000>,
> > +                           <0 0x105c0000 0 0x19080>;
> > +                     reg-names = "sram", "cfg";
> > +                     interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&infracfg CLK_INFRA_SCPSYS>;
> > +                     clock-names = "main";
> > +                     memory-region = <&scp_mem_reserved>;
> > +                     status = "disabled";
> > +             };
> > +
> >               systimer: timer@10017000 {
> >                       compatible = "mediatek,mt8183-timer",
> >                                    "mediatek,mt6765-timer";
> >

full build log,
https://builds.tuxbuild.com/_IfeLhOWMWxIkRkmAtAwOQ/build.log


-- 
Linaro LKFT
https://lkft.linaro.org
