Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538D21FF49B
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 16:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgFROXu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Jun 2020 10:23:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46824 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbgFROXu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2020 10:23:50 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 048132A4DC9
Subject: Re: next/master bisection: baseline.login on
 ox820-cloudengines-pogoplug-series-3
To:     Miquel Raynal <miquel.raynal@bootlin.com>
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
References: <5eeb5bf7.1c69fb81.4f6e3.8979@mx.google.com>
 <13497644-ae34-d5e3-e76a-742cddf0f0a9@collabora.com>
 <20200618152324.0b0007a9@xps13> <20200618160925.6f77b1d1@xps13>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <0c00fe0b-c38b-3d69-8f93-3fe8c3675113@collabora.com>
Date:   Thu, 18 Jun 2020 15:23:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618160925.6f77b1d1@xps13>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 18/06/2020 15:09, Miquel Raynal wrote:
> Hi Guillaume,
> 
> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 18 Jun 2020
> 15:23:24 +0200:
> 
>> Hi Guillaume,
>>
>> Guillaume Tucker <guillaume.tucker@collabora.com> wrote on Thu, 18 Jun
>> 2020 13:28:05 +0100:
>>
>>> Please see the bisection report below about a kernel panic.
>>>
>>> Reports aren't automatically sent to the public while we're
>>> trialing new bisection features on kernelci.org but this one
>>> looks valid.
>>>
>>> See the kernel Oops due to a NULL pointer followed by a panic:
>>>
>>>   https://storage.kernelci.org/next/master/next-20200618/arm/oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-series-3.html#L504
>>
>> Thanks for the report, I will not be able to manage it before Monday,
>> but I'll try to take care of it early next week.
> 
> Actually Boris saw the issue, I just updated nand/next, it should be
> part of tomorrow's linux-next. Could you please report if it fixes your
> boot?

Sure, will check tomorrow.  Thanks for the update.

We may also consider adding the nand/next branch to kernelci.org
and catch issues earlier.  We can discuss that separately.

Guillaume
