Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDB31F5AE1
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 23:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730118AbfKHW3o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Nov 2019 17:29:44 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:34775 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbfKHW3n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Nov 2019 17:29:43 -0500
Received: by mail-io1-f67.google.com with SMTP id q83so8071919iod.1
        for <linux-next@vger.kernel.org>; Fri, 08 Nov 2019 14:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tG3CMleYdOoOJlDJUqZcQjcg5RUyLpG6Jn1aCKR4UeI=;
        b=0QMe2DamNA24EOuI+UywMP9UlxhPIEd9A3ejSSwX5dRvxIuLh1eyekTxCIaEXQw45R
         54KJMXm13tA1bXnQ5gJkP3Bc2AXpK5GqrZmTonZGLH7QjaBf30/ySbas7znjaZC8cE1G
         dvINXztNO0uL0txG0mi6Bc5/ap9kcdnlTiqhlqswN/TjS2cBK4KeW5Nwx13lqVQuEvxX
         oGKBNxbZ5TalYTw1lCFi09i1ffQkcnGX5b5VkolnEU5VWoGxPkE3Trg9U5Fmdt/c9FIa
         zNy9okvAx34ttHfQFN4jU4TQ/XK6X0+WuB4rn384C8czKSZAdSDyG4KOBvp6caVBgMS9
         LBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tG3CMleYdOoOJlDJUqZcQjcg5RUyLpG6Jn1aCKR4UeI=;
        b=IHDDVmZwUK3brrY1WzWFyOUK6v3i+dlX88soklqSaXKi6bBOkQt3e+4Ysa5ElacEKj
         fSPgXQhb5of6NtnNY3TzPbayMheBx9ok//RPmozp/t2qWbszRW6nIOJToWEJIaQqrYlT
         hxaT+0QiEgEWk5Sb3ggR468Q5fN/A/AM6wOiBed8Eupgn3aKjaPJchjtV5B8yxO/eGZn
         ahTPT7xUDamzBKyTpHh8QP2AkZA8Dt8Rn9pL8qJ02EGQNrXo+q+gHpfffSQvSqnZFCFh
         B/IDLgNld60UatH0fnqIhK9mja29igobJm7qe9iE3Bo8N2bxkAntEmYWpq7Sm2dHHTel
         U3ow==
X-Gm-Message-State: APjAAAUnC4uP9LZyPDMEpfAqwtyWfYsacUvQFFgJetNPVfTm/XpE9wus
        XF727t3x1X25pOuNyQLniv9tTzPqr2PNZwQosLguOg==
X-Google-Smtp-Source: APXvYqxR2Iojnfzgt1D2EKNQghVo4JbH2TyZSSa7HkkqJ9Q6NanRF7wM7yANUTTIbJh1g1uWd98XskwAsn4twL28rCk=
X-Received: by 2002:a6b:6509:: with SMTP id z9mr12039319iob.123.1573252182905;
 Fri, 08 Nov 2019 14:29:42 -0800 (PST)
MIME-Version: 1.0
References: <CAOesGMjVUCd9bN=pggS-ECjMR42b0SqXKewsp+NYFSVqRgSWrg@mail.gmail.com>
 <20191107211801.GA107543@google.com> <20191108110736.GA10708@e121166-lin.cambridge.arm.com>
In-Reply-To: <20191108110736.GA10708@e121166-lin.cambridge.arm.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 8 Nov 2019 14:29:31 -0800
Message-ID: <CAOesGMhxs0A-YTXpS9Lqk_sn2=Q5jaCM2+mjEuvtwSX9Y49eMw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pci tree with the arm-soc tree
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xiaowei Bao <xiaowei.bao@nxp.com>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 8, 2019 at 3:07 AM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Thu, Nov 07, 2019 at 03:18:01PM -0600, Bjorn Helgaas wrote:
> > On Thu, Nov 07, 2019 at 10:27:20AM -0800, Olof Johansson wrote:
> > > On Wed, Nov 6, 2019 at 2:46 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > Today's linux-next merge of the pci tree got a conflict in:
> > > >
> > > >   arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > > >
> > > > between commit:
> > > >
> > > >   68e36a429ef5 ("arm64: dts: ls1028a: Move thermal-zone out of SoC")
> > > >
> > > > from the arm-soc tree and commit:
> > > >
> > > >   8d49ebe713ab ("arm64: dts: ls1028a: Add PCIe controller DT nodes")
> > >
> > > Bjorn, we ask that driver subsystem maintainers don't pick up DT
> > > changes since it causes conflicts like these.
> > >
> > > Is it easy for you to drop this patch, or are we stuck with it?
> > > Ideally it should never have been sent to you in the first place. :(
> >
> > Lorenzo, is it feasible for you to drop it from your pci/layerscape
> > branch and repush it?  If so, I can redo the merge into my "next"
> > branch.
>
> Done. Should we ignore all dts updates from now onwards ?

Thanks!

Indeed, dts updates should only go in through the platform maintainers
(i.e. through soc tree), unless there are strong reasons to bring them
in through driver trees.

If there's a need for a dt-include to be shared between driver and
dts, getting them on a stable branch that's merged through both trees
is usually the best way. Reach out when that happens and we can
coordinate.


Regards,

-Olof
