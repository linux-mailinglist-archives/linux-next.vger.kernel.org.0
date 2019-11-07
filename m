Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61B09F372F
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 19:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfKGS1d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 13:27:33 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:41169 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfKGS1d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2019 13:27:33 -0500
Received: by mail-il1-f195.google.com with SMTP id z10so2702046ilo.8
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2019 10:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rd9MmtJg9I99NObgfoHTcrVObiv2Cbuzz8bmb7geaL4=;
        b=RCkNMdzGc1LN3YG+0B6dyUeVDjoayLlIYaA/TR/KKf2ybkTWOvD1B8gHfC0cpiTlZ7
         MC307bK9xpKSFf34KshZo12CllR1OL3R1cVihIZnHVOka2zKUJEKAtywg/Tj+6ARagJb
         cUqp7bI9Ok/XhJAO4ns5ztqpjhDSn8xXgEzlkMwnil5nV1o8L41J8CP4Ej++81A0MhvQ
         DQ6aYdVeFxzQEiCDPQ7/ezGCcF6BEM522HdH/gVCeHAFotAhln6YcX+BRgEJ1Ufd58D4
         AatnXtd7UPS9/XPcPi4+EPVAPdLhmGxuuIlXZQnPLMXllDUQKyAEgB6JHWqW2jNmUPKG
         Gy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rd9MmtJg9I99NObgfoHTcrVObiv2Cbuzz8bmb7geaL4=;
        b=aqGNLqUJmlKlGn+368K+Tz9StjHWrK+6KXmXEwkWI3vCQXipo+QCrtv7xNSfHTDjMJ
         jt1mm108iHJ+BHEfaspCAzdM9MH5uh470FLJXLoDwDPWkZ0wCEdWcFBx1IdkYWpNeJZG
         cyzpBHgPRY2nLDA4pnMvGIlpuAoJ3NEMGQW8/yXWohjr+262Dq5SNXpDQ+9WX5SyLAze
         nFnOAMdddaCc2ptiwLB4dFvKSR2irwJ5mB3aR9cijBEZPMjc5gAQJfuO52x7czbcm2ma
         OwxAYCZE8MHxLHs/B86nt2eLGtSRgpELKrg8P8kvxaWJ+3IctJNBZ4YYgM5orT7mwFvZ
         E5tw==
X-Gm-Message-State: APjAAAXNPK7xkPqlpc5Nhh27HLj6OWDom/1F10ProqjqS+048CFi1GH7
        y0qCD5klkeHqGinb9boCSynGUm3V1QzeicCvRVw7Mw==
X-Google-Smtp-Source: APXvYqx0c2ixEzl/1P2k8VNqVuu1KNzt7oNq9iie0yTRSLDbulT1QQzNkdoy2JYIN8yiPQWt9b0MdCPxqVncDCDKQ6E=
X-Received: by 2002:a92:8c49:: with SMTP id o70mr6407569ild.72.1573151252255;
 Thu, 07 Nov 2019 10:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20191107094555.6296b943@canb.auug.org.au>
In-Reply-To: <20191107094555.6296b943@canb.auug.org.au>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 7 Nov 2019 10:27:20 -0800
Message-ID: <CAOesGMjVUCd9bN=pggS-ECjMR42b0SqXKewsp+NYFSVqRgSWrg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pci tree with the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xiaowei Bao <xiaowei.bao@nxp.com>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 6, 2019 at 2:46 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the pci tree got a conflict in:
>
>   arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
>
> between commit:
>
>   68e36a429ef5 ("arm64: dts: ls1028a: Move thermal-zone out of SoC")
>
> from the arm-soc tree and commit:
>
>   8d49ebe713ab ("arm64: dts: ls1028a: Add PCIe controller DT nodes")

Bjorn, we ask that driver subsystem maintainers don't pick up DT
changes since it causes conflicts like these.

Is it easy for you to drop this patch, or are we stuck with it?
Ideally it should never have been sent to you in the first place. :(


-Olof
