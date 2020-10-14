Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895FF28E087
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 14:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387485AbgJNM3D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 08:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730530AbgJNM3D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 08:29:03 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF23C061755;
        Wed, 14 Oct 2020 05:29:02 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c21so2935168ljn.13;
        Wed, 14 Oct 2020 05:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xtG/gwsTp/QhF3XrG67M9zGwKAJ8eN3YqnpNRk6BF4U=;
        b=uNUZMjRSap8H/u2m/asyiiVUQkHD9zJpWjpIoV35cXL/Dhr49H6Q7ybLUwt4m3yQKP
         dX4BCe24Zxu332bgNbY7UxDK5N4uP/NxF4mtEYH+ucfkEypyIZ9id0/kkg7j4+W1QzKP
         xKjhEYktxvhXEilqc0GIOlqxO00OoC7ORtuJgrLD2pVpYco8iSct0nfsM8nJFajXV/mZ
         dYhkFnXEeOzQaosyd7KwRtaSo8LMDMYhe5IAmiVyHVTOWnMoT9g2jIDrkCnzjAwZmrkf
         sgs847rPzMIM/wdGeqHC+TtYFoA3OURK/ZUaIqyywiM7YpeAfAwFHvbpfo7RB+GbtMw8
         zTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xtG/gwsTp/QhF3XrG67M9zGwKAJ8eN3YqnpNRk6BF4U=;
        b=uKBRuGnN3e5LS+ztEC5Nux5yjBsU99e69etct9KHvzW9f1wxTmQpDAMOiFBjE8871G
         mVpCK3BXhYjnrhLKRjkVH8vefDRBoajyFJ3FG9up07aFeI0oKjR9T/g5UXnScyS2lu8Z
         mypfLMsMUHxSYcq8ATay4NLkZI77XcEqf5QClWe0l4YloNyiYlzEUcOaV32ULz3ZwSH8
         vdiBU9TltOvKfDvSPz/ZDRwDhAtLY0bZ3Z9PVz3GOE4Td3/wY8KpGtqKukkGaay83OxP
         9vL1VMMQzG5WbD5tzMstOpWbFIFS7LkRTYTKU4q5HXmhGZ7tmKQ0Fia5qrGp4QnMmZVL
         +nVw==
X-Gm-Message-State: AOAM532HqzAHun82/XUkbq6cbX96yWJqt2nBOZLMO1XdRNvKsbgKARXO
        R8fdacEDrp9kI23aKKP5Q9epth1AO00B0FoQ9sjj76ALPnOvWA==
X-Google-Smtp-Source: ABdhPJwwcXa0eznaW8aSEwQEZZO7J2RVs3BEWKBFhgzX1yF1g22CuKEtKkJjzK+eCrn3V4OhjPkwYiOG4iypM8jxWGU=
X-Received: by 2002:a2e:9ed5:: with SMTP id h21mr1585898ljk.178.1602678541301;
 Wed, 14 Oct 2020 05:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org> <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org> <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org> <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
 <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
 <20201011055258.22337d66@canb.auug.org.au> <CA+-6iNwpFeJaa7CisS-DD2q45uaV8Jz6YU0kPucqpZAAK3ojuQ@mail.gmail.com>
 <c7e7b9ab-95a8-625f-7988-7f7397a0749f@gmail.com>
In-Reply-To: <c7e7b9ab-95a8-625f-7988-7f7397a0749f@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 14 Oct 2020 09:28:49 -0300
Message-ID: <CAOMZO5DxVQ1va4aviTkgC0O6+KmpkYvYDVPh7v2Ajqggq7aoow@mail.gmail.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Jim Quinlan <james.quinlan@broadcom.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        abhimanyu.saini@nxp.com, Ioana Ciornei <ioana.ciornei@nxp.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Poonam Aggrwal <poonam.aggrwal@nxp.com>,
        Rob Herring <robh@kernel.org>, Joerg Roedel <jroedel@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
        Will Deacon <will@kernel.org>,
        "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Florian,

On Sun, Oct 11, 2020 at 6:59 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> however the NAND warning still remains. Someone else familiar with these
> NXP development boards should fix the DTS so as to provide the require
> ECC strength property.

The ECC NAND warning looks like a regression.

I had originally reported it for an imx27 board and now I also pointed
out that it also affects Layerscape:
https://lore.kernel.org/linux-mtd/20201013193652.0c535c7c@xps13/T/#m09fad7eacdf86aee0834bbd8863d6d5ee2e69f8c

Thanks,

Fabio Estevam
