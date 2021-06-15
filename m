Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3763A86D2
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 18:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbhFOQtN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 15 Jun 2021 12:49:13 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52109 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbhFOQtN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 12:49:13 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 25CBA200009;
        Tue, 15 Jun 2021 16:47:05 +0000 (UTC)
Date:   Tue, 15 Jun 2021 18:47:04 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        Richard Weinberger <richard.weinberger@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the mtd
 tree
Message-ID: <20210615184704.4204347f@xps13>
In-Reply-To: <20210615125958.541c275c@canb.auug.org.au>
References: <20210615125958.541c275c@canb.auug.org.au>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> wrote on Tue, 15 Jun 2021
12:59:58 +1000:

> Hi all,
> 
> Today's linux-next merge of the devicetree tree got a conflict in:
> 
>   Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> 
> between commit:
> 
>   6947ad674944 ("dt-bindings: mtd: Convert ti, am654-hbmc.txt to YAML schema")
> 
> from the mtd tree and commit:
> 
>   9b358af7c818 ("dt-bindings: mux: Convert mux controller bindings to schema")
> 
> from the devicetree tree.
> 
> I fixed it up (the latter removed the file, so I just did that) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 

Thanks for the warning. Indeed the txt file being touched by
9b358af7c818 is being updated into a yaml file which does not reference
the mux binding anymore.

Rob, how do you want to proceed?

Thanks,
Miquèl
