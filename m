Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87EE61E584D
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 09:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgE1HPe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Thu, 28 May 2020 03:15:34 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56583 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgE1HPe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 03:15:34 -0400
X-Originating-IP: 93.23.196.101
Received: from xps13 (101.196.23.93.rev.sfr.net [93.23.196.101])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 88E7720004;
        Thu, 28 May 2020 07:15:30 +0000 (UTC)
Date:   Thu, 28 May 2020 09:15:28 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the nand
 tree
Message-ID: <20200528091528.0ef4bbbc@xps13>
In-Reply-To: <20200528145205.13cb8288@canb.auug.org.au>
References: <20200528145205.13cb8288@canb.auug.org.au>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> wrote on Thu, 28 May 2020
14:52:05 +1000:

> Hi all,
> 
> Today's linux-next merge of the devicetree tree got a conflict in:
> 
>   Documentation/devicetree/bindings/mtd/nand-controller.yaml
> 
> between commit:
> 
>   1777341d9335 ("dt-bindings: mtd: Deprecate OOB_FIRST mode")
> 
> from the nand tree and commit:
> 
>   3d21a4609335 ("dt-bindings: Remove cases of 'allOf' containing a '$ref'")
> 
> from the devicetree tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

My change can wait, it's part of a preparation series for a bigger
rework that will come with 5.9 so I'll drop the patch for this release.
I already carry a much bigger release than usual, I don't want to
bother with merge conflicts. Thanks for the fix though!


Cheers,
Miquèl
