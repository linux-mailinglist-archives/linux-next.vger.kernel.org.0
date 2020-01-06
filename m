Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24784130F79
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 10:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgAFJbf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 04:31:35 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:33654 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgAFJbf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 04:31:35 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 623D9FB03;
        Mon,  6 Jan 2020 10:31:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Nr9twsA5t1BE; Mon,  6 Jan 2020 10:31:30 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id A095D49C60; Mon,  6 Jan 2020 10:31:29 +0100 (CET)
Date:   Mon, 6 Jan 2020 10:31:29 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds tree
Message-ID: <20200106093129.GA13043@bogon.m.sigxcpu.org>
References: <20200106142116.538320e1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106142116.538320e1@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,
On Mon, Jan 06, 2020 at 02:21:16PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the leds tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/leds/leds-lm3692x.c: In function 'lm3692x_max_brightness':
> drivers/leds/leds-lm3692x.c:355:9: error: 'struct lm3692x_led' has no member named 'brightness_ctrl'
>   355 |  if (led->brightness_ctrl & LM3692X_MAP_MODE_EXP) {
>       |         ^~

That's a result of a patch from the mid of the series not being applied.
'leds: lm3692x: Allow to configure brigthness mode' introduces that
struct member.

> drivers/leds/leds-lm3692x.c: In function 'lm3692x_probe_dt':
> drivers/leds/leds-lm3692x.c:437:61: error: 'max_cur' undeclared (first use in this function)
>   437 |  ret = fwnode_property_read_u32(child, "led-max-microamp", &max_cur);
>       |                                                             ^~~~~~~

That somehow got lost during merge of this commit:

    https://lore.kernel.org/linux-leds/5826b77d42521595e93d01d53475a8881cad1875.1578134779.git.agx@sigxcpu.org/T/#u

Pavel, shall i send a patch to fix that up or should we rather try to
get the rest of the series in in the right order? Resetting linux-next
back to cffd61a5c7755546154539dcd7f36590e91e002f for the moment?

Cheers,
 -- Guido

> Caused by commit
> 
>   ef791c4d0ce8 ("leds: lm3692x: Make sure we don't exceed the maximum LED current")
> 
> I have used the leds tree from next-20191220 for today.


> 
> -- 
> Cheers,
> Stephen Rothwell


