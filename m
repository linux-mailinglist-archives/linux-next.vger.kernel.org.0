Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2DE61FA9CC
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 09:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgFPHNr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 16 Jun 2020 03:13:47 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:45317 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgFPHNr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Jun 2020 03:13:47 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0B53E1C000F;
        Tue, 16 Jun 2020 07:13:44 +0000 (UTC)
Date:   Tue, 16 Jun 2020 09:13:42 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: linux-next: Fixes tag needs some work in the nand tree
Message-ID: <20200616091342.359443cb@xps13>
In-Reply-To: <20200616082312.76d03fe8@canb.auug.org.au>
References: <20200616082312.76d03fe8@canb.auug.org.au>
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

Stephen Rothwell <sfr@canb.auug.org.au> wrote on Tue, 16 Jun 2020
08:23:12 +1000:

> Hi all,
> 
> In commit
> 
>   350e8dab0868 ("mtd: rawnand: qcom: avoid write to unavailable register")
> 
> Fixes tag
> 
>   Fixes: d49076a1347ea ("mtd: nand: qcom: Support for IPQ8074 QPIC NAND controller")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: dce84760b09f ("mtd: nand: qcom: Support for IPQ8074 QPIC NAND controller")
> 

Corrected.


Thanks!
Miquèl
