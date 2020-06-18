Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9AC1FF2E8
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 15:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729828AbgFRNXd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Thu, 18 Jun 2020 09:23:33 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51471 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgFRNXc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2020 09:23:32 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 73F3A20010;
        Thu, 18 Jun 2020 13:23:26 +0000 (UTC)
Date:   Thu, 18 Jun 2020 15:23:24 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
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
Message-ID: <20200618152324.0b0007a9@xps13>
In-Reply-To: <13497644-ae34-d5e3-e76a-742cddf0f0a9@collabora.com>
References: <5eeb5bf7.1c69fb81.4f6e3.8979@mx.google.com>
        <13497644-ae34-d5e3-e76a-742cddf0f0a9@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Guillaume,

Guillaume Tucker <guillaume.tucker@collabora.com> wrote on Thu, 18 Jun
2020 13:28:05 +0100:

> Please see the bisection report below about a kernel panic.
> 
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
> 
> See the kernel Oops due to a NULL pointer followed by a panic:
> 
>   https://storage.kernelci.org/next/master/next-20200618/arm/oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-series-3.html#L504

Thanks for the report, I will not be able to manage it before Monday,
but I'll try to take care of it early next week.

Thanks for your patience,
Miquèl
