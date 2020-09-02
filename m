Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884F825B17A
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 18:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgIBQXf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 12:23:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:60662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbgIBQXe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Sep 2020 12:23:34 -0400
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 039A420FC3;
        Wed,  2 Sep 2020 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063814;
        bh=RJITFA13mQCqYxoOB5UPOQVnK4Vx480+dtACmh6ut/o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=X2W8hvQFB4ALK9iv68uHX+G1jHVkBtqL72qdB3KH1GQfSk07N39TEWUrf4X+EKoU7
         vu4w/Sn1BNuBJK+hmrEdjtCqAt7dJpo5MAGOixqbkc2tzltTA1OAapRjqDJAvDV/px
         o99CjILlylsFoibtHn/r1/fMRVKFXhQuJuBaKSUc=
Received: by mail-ed1-f42.google.com with SMTP id q21so5546558edv.1;
        Wed, 02 Sep 2020 09:23:33 -0700 (PDT)
X-Gm-Message-State: AOAM532+4TGw+XwAnoNyqF9GzoYjiE9qvpMog7s/c+GCcS0IZM46hTht
        Qw9+08O18yZWjHBqmi213QXXsN/79YPVN6xtBRU=
X-Google-Smtp-Source: ABdhPJzUU8aJWJbuyjEWTDBzeTSsYZUP7N9/p6dhBdP07EBrMjqVyaYzkDcmRbTXkPN8IbfThl9NYXrG39SJOGiVlIE=
X-Received: by 2002:a05:6402:180a:: with SMTP id g10mr878676edy.18.1599063812518;
 Wed, 02 Sep 2020 09:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191112110330.179649-1-pihsun@chromium.org> <20191112110330.179649-5-pihsun@chromium.org>
 <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com> <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
In-Reply-To: <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 2 Sep 2020 18:23:20 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
Message-ID: <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
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
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2 Sep 2020 at 16:45, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Thu, 27 Aug 2020 at 15:44, Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >
> >
> >
> > On 12/11/2019 12:03, Pi-Hsun Shih wrote:
> > > From: Eddie Huang <eddie.huang@mediatek.com>
> > >
> > > Add scp node to mt8183 and mt8183-evb
> > >
> > > Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> > > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > > Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
> >
> > Sorry I somehow oversaw this. Next time please don't doubt to ping me.
> >
> > Bjorn, do I understand correctly that you don't send emails to the list
> > informing of the inclusion of a patch/series in your tree?
> >
> > Anyway applied now to v5.9-next/dts64 :)
>
> arm64 build dtbs failed on linux next 20200902.

I just hit it as well... I wish the kernel was built after applying
patches... it would make the next a better place.

Best regards,
Krzysztof
