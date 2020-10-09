Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B2D288A17
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 15:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732547AbgJIN4h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 09:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731300AbgJIN4g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 09:56:36 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823F1C0613D2
        for <linux-next@vger.kernel.org>; Fri,  9 Oct 2020 06:56:36 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id q1so9221198ilt.6
        for <linux-next@vger.kernel.org>; Fri, 09 Oct 2020 06:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:from:date:message-id:subject:to:cc;
        bh=6o6qPP8lMx7cYOKA/MqaKbaqIjCjGnaiLWr14rPl5P0=;
        b=Hlz0T0HYpcI1RmYPyeOF014dP7wq6mto4JOO5AQX3su3fh95zbsrdvX+wsqbFQFmuk
         o56RJq7SGR5KyYMNTqsQjirLof/hnJtOBvvKEwO9b1+TN3p0b4gl92toDcBj7VMPnn7/
         8tY2NMUR4+quoUAFnkcxw7tVy93kHmwxgOPAcTX7m1Uo+ZCdjtmxau9fhNb4E82Tq5ot
         B5nJJa8LIH8PryvenpUGFLf4m8Kd88gjuibR7FbKT1TrjSS9oz09MR1uncgkH+1kLLzz
         /FVRczFb6cSO2chHkoCGBoFXPEzehWoc1SQrPGaGcYlVCO8j83PhHkDjqmQt2j07l4cf
         0s7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:from:date:message-id
         :subject:to:cc;
        bh=6o6qPP8lMx7cYOKA/MqaKbaqIjCjGnaiLWr14rPl5P0=;
        b=HolQp+SL5n7tSGcdSQ0iJvshWAT3VOpZKlXRAkdl7ty6Yj+kzD+9rL0+JBrTn9BDui
         O92gfyNrZTyIbclMEvqa1do41QtaYBf1yIxPgPUoH0+Mu9oLghqspMsf3Y8sDG3rKEas
         DA7z4LmB69XKb7GaJZKBP8NMxXA9PEKgBUfnD/Hwjf0emo6LanbPLgnyp20aVLyM3HWQ
         CPfy52DYwqCKqwLQhRaZZGQJBlmMZzeCJoHwdL5Tde+maPrUBDHNM15x0Z0JMNcam/k7
         F0JVWQdtTVDG8bT5cARBbvkBKdtSwJo1h806helvTpTDExvJv/N1EfCHscHHpHvmjqKS
         h1mA==
X-Gm-Message-State: AOAM532nKV6btWnZ9pG07+6c/TuCjm6QWBODaxKhPRqOktvgNCTNhBL9
        8Rt3cQt8Zifasz7JZ+hITvK/IpWt8tWzuZIrvb19sw==
X-Google-Smtp-Source: ABdhPJzUkvbAvYEa3k1BsUYozC/xotWpIsogjry89hwi8FrKRfRA/5IIZf6URsj+bAxUF2s9ybtiMe1E4JF5+OFqUys=
X-Received: by 2002:a05:6e02:664:: with SMTP id l4mr11033643ilt.81.1602251795786;
 Fri, 09 Oct 2020 06:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org> <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org> <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org> <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 9 Oct 2020 19:26:24 +0530
Message-ID: <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
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

On Fri, 9 Oct 2020 at 19:24, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
>
>
> On Thu, 24 Sep 2020 at 15:26, Joerg Roedel <joro@8bytes.org> wrote:
> >
> > On Thu, Sep 24, 2020 at 10:36:47AM +0100, Robin Murphy wrote:
> > > Yes, the issue was introduced by one of the changes in "dma-mapping:
> > > introduce DMA range map, supplanting dma_pfn_offset", so it only existed in
> > > the dma-mapping/for-next branch anyway.
>

FYI,
The reported problem still exists on 5.9.0-rc8-next-20201009.

[    1.843814] Driver must set ecc.strength when using hardware ECC
[    1.849847] WARNING: CPU: 4 PID: 1 at
drivers/mtd/nand/raw/nand_base.c:5687 nand_scan_with_ids+0x1450/0x1470
[    1.859676] Modules linked in:
[    1.862730] CPU: 4 PID: 1 Comm: swapper/0 Not tainted
5.9.0-rc8-next-20201009 #1
[    1.870125] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
[    1.876478] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=--)
[    1.882483] pc : nand_scan_with_ids+0x1450/0x1470
[    1.887183] lr : nand_scan_with_ids+0x1450/0x1470

full test log,
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201009/testrun/3284876/suite/linux-log-parser/test/check-kernel-warning-92014/log

> >
> > Okay, alright then.
> >

- Naresh
