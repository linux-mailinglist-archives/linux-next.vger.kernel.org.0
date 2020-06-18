Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11AA1FF4C9
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 16:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgFROdr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Jun 2020 10:33:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47014 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728161AbgFROdr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2020 10:33:47 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 01C172A4E1D;
        Thu, 18 Jun 2020 15:33:44 +0100 (BST)
Date:   Thu, 18 Jun 2020 16:33:41 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
        Allison Randal <allison@lohutok.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        kernelci-results@groups.io, Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
        Enrico Weigelt <info@metux.net>,
        Mason Yang <masonccyang@mxic.com.tw>,
        linux-next@vger.kernel.org
Subject: Re: next/master bisection: baseline.login on
 ox820-cloudengines-pogoplug-series-3
Message-ID: <20200618163341.12f7c996@collabora.com>
In-Reply-To: <0c00fe0b-c38b-3d69-8f93-3fe8c3675113@collabora.com>
References: <5eeb5bf7.1c69fb81.4f6e3.8979@mx.google.com>
        <13497644-ae34-d5e3-e76a-742cddf0f0a9@collabora.com>
        <20200618152324.0b0007a9@xps13>
        <20200618160925.6f77b1d1@xps13>
        <0c00fe0b-c38b-3d69-8f93-3fe8c3675113@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 18 Jun 2020 15:23:45 +0100
Guillaume Tucker <guillaume.tucker@collabora.com> wrote:

> On 18/06/2020 15:09, Miquel Raynal wrote:
> > Hi Guillaume,
> > 
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 18 Jun 2020
> > 15:23:24 +0200:
> >   
> >> Hi Guillaume,
> >>
> >> Guillaume Tucker <guillaume.tucker@collabora.com> wrote on Thu, 18 Jun
> >> 2020 13:28:05 +0100:
> >>  
> >>> Please see the bisection report below about a kernel panic.
> >>>
> >>> Reports aren't automatically sent to the public while we're
> >>> trialing new bisection features on kernelci.org but this one
> >>> looks valid.
> >>>
> >>> See the kernel Oops due to a NULL pointer followed by a panic:
> >>>
> >>>   https://storage.kernelci.org/next/master/next-20200618/arm/oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-series-3.html#L504  
> >>
> >> Thanks for the report, I will not be able to manage it before Monday,
> >> but I'll try to take care of it early next week.  
> > 
> > Actually Boris saw the issue, I just updated nand/next, it should be
> > part of tomorrow's linux-next. Could you please report if it fixes your
> > boot?  
> 
> Sure, will check tomorrow.  Thanks for the update.
> 
> We may also consider adding the nand/next branch to kernelci.org
> and catch issues earlier.  We can discuss that separately.

If you're testing linux-next that shouldn't help us much (nand/next is
pulled in linux-next already), but maybe it's just about making the
bisection easier for kernelci (less commits to inspect), in which case
that's probably a good idea. You might also want to add mtd/next,
spi-nor/next and cfi/next so the entire MTD subsystem gets tested.
