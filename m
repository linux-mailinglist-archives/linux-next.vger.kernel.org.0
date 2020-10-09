Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE50288A12
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 15:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387462AbgJINzG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 09:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732456AbgJINzG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 09:55:06 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A545C0613D2
        for <linux-next@vger.kernel.org>; Fri,  9 Oct 2020 06:55:06 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id r10so4344536ilm.11
        for <linux-next@vger.kernel.org>; Fri, 09 Oct 2020 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2S3D9iYx51A87Z/QbgZ/692gZHGuP26oR+0wJ2UbLg8=;
        b=hX9UyplGhpPB5uZa13A2uK91raJ+XXjUWlWCULGthc4S0OtZCfMyA1Sc9MTHzTbgC4
         msSG67tcHwpsaaHcIcBIxD//0F918iRlSssC5PR4njAqbOOYLyKqyC5a8bmRJ+42fVIX
         m5szy0Q1jAgH4+eL9obnuOTNuNffxCrmelyiwXC67CEvoRL3Yl5tuCyUnJ8SRVUT/wwd
         h1sLQ8miFedqdQqlUJXnL3yQoAhnGJv523s7udQLzJJ8AiSS3EpjHJGGcxtnuYqvMEPB
         GokfmAsUWyD3jFdgVaVDlBKgdFPczycyRd6zaGtUR6Beyb3OEx622w4pKxPRyQvqURMf
         1iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2S3D9iYx51A87Z/QbgZ/692gZHGuP26oR+0wJ2UbLg8=;
        b=bhtepXssxDQDPdbUb1vhP9jhT/P7WCUlUOtMxTcPm4yKUL61kbC9KcCTvEOca0BwLI
         khqNoOBSPZiI8H/TG9QmWF8q7eCDg6cL1kSrZvJN4S/ksEHlsEQPdLjS0ApN6LYC9uiH
         +WaUwT/I4nBVSu4t9RUkVqAnAMt2P5AN/GotMchdFFpez94SMroROx0jy0FWyyNDb2ge
         5vbi0iQUQA1lc41ewQ3kdKBncguHo3sbsHPqX9AMiT3loKeRlFHPbtkNN+fuKlqo4IaZ
         xyNO/7/A6pxF+rYlYWOewgDQTwu1G5A4bOTFVYpzec4b85Zp4gaJk+B1d7/5CwWApy7v
         k4jQ==
X-Gm-Message-State: AOAM5302XwKJDYa1qDXq/uAGMMWTTYEEeEYS7+r27jSjxDP7O6p3vx1S
        rzwQGXwn2hKrMTZXEclx9+BXWEuJav2lFm6b3SGxywvSUf6V5A==
X-Google-Smtp-Source: ABdhPJwJSrz7eUwTvUf7DlETg6YMldEBYzcCV0k+8KYceSzIWftZL4GSM73AlaH1smsxWJNOo4qH2nJDd79/yrPumYg=
X-Received: by 2002:a05:6e02:664:: with SMTP id l4mr11028746ilt.81.1602251705277;
 Fri, 09 Oct 2020 06:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org> <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org> <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org>
In-Reply-To: <20200924095629.GL27174@8bytes.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 9 Oct 2020 19:24:54 +0530
Message-ID: <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Poonam Aggrwal <poonam.aggrwal@nxp.com>,
        Rob Herring <robh@kernel.org>, Joerg Roedel <jroedel@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
        Will Deacon <will@kernel.org>,
        "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 24 Sep 2020 at 15:26, Joerg Roedel <joro@8bytes.org> wrote:
>
> On Thu, Sep 24, 2020 at 10:36:47AM +0100, Robin Murphy wrote:
> > Yes, the issue was introduced by one of the changes in "dma-mapping:
> > introduce DMA range map, supplanting dma_pfn_offset", so it only existed in
> > the dma-mapping/for-next branch anyway.

FYI,
The reported problem still exists
>
> Okay, alright then.
>
