Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0168F3EE8C6
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 10:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238797AbhHQIny convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 17 Aug 2021 04:43:54 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57373 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235078AbhHQIny (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 04:43:54 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9EB4724000D;
        Tue, 17 Aug 2021 08:43:18 +0000 (UTC)
Date:   Tue, 17 Aug 2021 10:43:16 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Jaime Liao <jaimeliao@mxic.com.tw>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nand tree
Message-ID: <20210817104316.4c967dd4@xps13>
In-Reply-To: <20210817080824.7fa1ee3b@canb.auug.org.au>
References: <20210817080824.7fa1ee3b@canb.auug.org.au>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> wrote on Tue, 17 Aug 2021
08:08:24 +1000:

> Hi all,
> 
> Commit
> 
>   c26b316307ff ("mtd: spinand: macronix: Add Quad support for serial NAND flash")
> 
> is missing a Signed-off-by from its author.
> 

Fixed, thanks for the warning.

Miquèl
