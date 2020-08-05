Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C8A23C48C
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 06:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbgHEEZc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 00:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgHEEZa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2020 00:25:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CF8C06174A
        for <linux-next@vger.kernel.org>; Tue,  4 Aug 2020 21:25:29 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1k3AzV-0001QO-R1; Wed, 05 Aug 2020 06:25:25 +0200
Subject: Re: linux-next: Fixes tag needs some work in the watchdog tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wim Van Sebroeck <wim@iguana.be>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200805082635.6cbf7f2d@canb.auug.org.au>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <0d1a3936-d206-fdd7-43b0-3fa730c5a8b7@pengutronix.de>
Date:   Wed, 5 Aug 2020 06:25:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200805082635.6cbf7f2d@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Stephen,

On 8/5/20 12:26 AM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   95d0c04e0cf9 ("watchdog: f71808e_wdt: remove use of wrong watchdog_info option")
> 
> Fixes tag
> 
>   Fixes: 96cb4eb019ce ("watchdog: f71808e_wdt: new watchdog driver for
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line.

I wasn't sure of the convention. I will take care not to split in future.

Thanks!
Ahmad

> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
