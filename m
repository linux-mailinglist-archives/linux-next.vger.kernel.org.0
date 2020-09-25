Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A4227830D
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 10:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbgIYIqc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 04:46:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:41538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbgIYIqc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Sep 2020 04:46:32 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F04F420BED;
        Fri, 25 Sep 2020 08:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601023592;
        bh=cqGnC2dE/tP5DzXU4CSTePKkVGTpOhNGfsOxajMP9e4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BGVLVMCnSEckFEIQgBBTNXycgNLbb+1iJ7pWSTZ5apWzOce7iZJ4w5GEcQwKD/7G4
         +iJFy2WuuqiPs1V08SWj/nqUQ8BjfxbBzTV+pFj2p5MKJOp+rfCQ9DkuVzJ41yC7zq
         mk99HWKI652msHz6ovXy7vxSu4vL6sY2DsFtLblA=
Received: by mail-oi1-f170.google.com with SMTP id 26so2020278ois.5;
        Fri, 25 Sep 2020 01:46:31 -0700 (PDT)
X-Gm-Message-State: AOAM530NjjSyzSzsqK5CiexBMy6kxPOltFIxh+O4PMZe9O9HF4FeAToh
        3UjOMpCkRSituecMy+/hZwVsh8DEBTAT3gHHCQ0=
X-Google-Smtp-Source: ABdhPJyjtcsEZU8s8/86D7su1A8pZU3A8nfsY+QYXUU/rcdlQJI12343GH/RJ0qVA6dVvMeLXsv6v41O00O8A2pBQiU=
X-Received: by 2002:aca:b355:: with SMTP id c82mr952980oif.80.1601023591159;
 Fri, 25 Sep 2020 01:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200924115731.194ecd6f@canb.auug.org.au> <20200925083748.GJ25109@dragon>
In-Reply-To: <20200925083748.GJ25109@dragon>
From:   Shawn Guo <shawnguo@kernel.org>
Date:   Fri, 25 Sep 2020 16:46:20 +0800
X-Gmail-Original-Message-ID: <CAJBJ56JR3UyPkG2k9+1rKu9DwEN4PZObtk1nKiiBoe0j5-17AQ@mail.gmail.com>
Message-ID: <CAJBJ56JR3UyPkG2k9+1rKu9DwEN4PZObtk1nKiiBoe0j5-17AQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pci tree with the imx-mxs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Wasim Khan <wasim.khan@nxp.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Xiaowei Bao <xiaowei.bao@nxp.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 25, 2020 at 4:37 PM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Thu, Sep 24, 2020 at 11:57:31AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the pci tree got a conflict in:
> >
> >   arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> >
> > between commit:
> >
> >   f7d48ffcfc6e ("arm64: dts: layerscape: Add label to pcie nodes")
> >
> > from the imx-mxs tree and commit:
> >
> >   c9443b6500ff ("arm64: dts: layerscape: Add PCIe EP node for ls1088a")
> >
> > from the pci tree.
>
> It should go through imx-mxs -> arm-soc, not pci tree.

Okay, just saw the message from Lorenzo telling that the patch had
been dropped from his tree.

Shawn
