Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464141D6DF1
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 01:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgEQXDH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 May 2020 19:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbgEQXDG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 May 2020 19:03:06 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17EBC061A0C;
        Sun, 17 May 2020 16:03:06 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id t25so6722762qtc.0;
        Sun, 17 May 2020 16:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uP+BJks78Cw8hFZ6ExUWOwpm0gcTasCzbmr1LXcv5YI=;
        b=K4Ppj68DvSp7b47uEiyj00ptLskcQtLI5M8kgyBdOn8V++Xq4dk3rGo1p+e2fM090U
         /SGjQfqdgUjUbajAXBzG3OXLJmezcSWrHShPeyDcu94ilKi+aCgRaT+Gx13I3gnTsL/7
         duYCyAD0BtgMfLD5U7ylhjCwKCdywy0jI2gZ/SgsYaMpMkmmsnUQQJllIvgddLN2c+Ot
         zuv6mZzIJcZwv2XLBeLwjheHeiW/cljb6LRl5YFktIqdQTKFfoO1K7FNDmlALhkvcSjc
         m1IOe3Evukw43qnh6mLO2ymgD/XbElRzIpHw6+UsqodWdNF2Vlx10Q6bFuVrQU9bteld
         oUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uP+BJks78Cw8hFZ6ExUWOwpm0gcTasCzbmr1LXcv5YI=;
        b=HgQnm84Ie3X5X8br17KPr5yp0K/1zHpHHsICwz5EAarcDWz+xJZ1gjmiGdnQ0C3ZX5
         jFVcQJUr74ua1gerc4Ap2fxB22pYEG7AqA/8+k+YtBSQad132eGvNZBHA0Lq6BK2lDHR
         FIOkqDKo+ZE/JhTFy4MyUMZubauTRfmU3FDWLT6L2eUOj0nyFuGpwk4kKpdfVBzavxtN
         AtJdskFAF2HqW7BbIR7e0c/SLqFCp64/U5Ci9CavO299c71V9zGQnv0Dh2aLGaNnFLX1
         8hHx3qJawaOUNupoteECPwZHhF/TRiJ4zwpk1hCu/M5AzxqoJcKDn4ac/oNmnofadqt7
         XwCA==
X-Gm-Message-State: AOAM530Br+DzwIxV5OEeAmC4sgQC80vIkZKuaXcvnvdwyK9nXt6OqaML
        1R6PUPlM/ux+aKljz8zcmTbER1D64i35ta9P7gaQN5YQ
X-Google-Smtp-Source: ABdhPJwCtehNuP0QOs/pXKe/WRpQU0htDhj7YwpiaCCmZczOjdHUOKCeDWPqSF5Z4vJ/kUTJcCGuebaRLa1sZNbDMm4=
X-Received: by 2002:ac8:1967:: with SMTP id g36mr13283333qtk.332.1589756585834;
 Sun, 17 May 2020 16:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200518084021.64cbf411@canb.auug.org.au>
In-Reply-To: <20200518084021.64cbf411@canb.auug.org.au>
From:   Richard Weinberger <richard.weinberger@gmail.com>
Date:   Mon, 18 May 2020 01:02:54 +0200
Message-ID: <CAFLxGvy-MytQLhrju0cBaC5rz-80XA29R4EU_eh9LC670h2H5w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mtd-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 18, 2020 at 12:41 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the mtd-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /home/sfr/next/next/drivers/mtd/nand/spi/core.c: In function 'spinand_init':
> /home/sfr/next/next/drivers/mtd/nand/spi/core.c:1093:26: error: 'struct nand_device' has no member named 'ecc'
>  1093 |  mtd->ecc_strength = nand->ecc.ctx.conf.strength;
>       |                          ^~
> /home/sfr/next/next/drivers/mtd/nand/spi/core.c:1094:27: error: 'struct nand_device' has no member named 'ecc'
>  1094 |  mtd->ecc_step_size = nand->ecc.ctx.conf.step_size;
>       |                           ^~
>
> Caused by commit
>
>   d5baa0ec83de ("mtd: spinand: Propagate ECC information to the MTD structure")
>
> "This fix depends on recent changes and should not be backported as-is." ?

Urgh, yes.
This patch slipped in.

Anyway, Miquel, the ready-to-backport diff would be this?

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 248c4d7a0cf4..e2c382ffc5b6 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1090,8 +1090,8 @@ static int spinand_init(struct spinand_device *spinand)
        mtd->oobavail = ret;

        /* Propagate ECC information to mtd_info */
-       mtd->ecc_strength = nand->ecc.ctx.conf.strength;
-       mtd->ecc_step_size = nand->ecc.ctx.conf.step_size;
+       mtd->ecc_strength = nand->eccreq.strength;
+       mtd->ecc_step_size = nand->eccreq.step_size;

        return 0;

-- 
Thanks,
//richard
