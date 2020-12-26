Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFE132E2E8F
	for <lists+linux-next@lfdr.de>; Sat, 26 Dec 2020 16:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgLZPvQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 26 Dec 2020 10:51:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgLZPvQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 26 Dec 2020 10:51:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C34C0613C1
        for <linux-next@vger.kernel.org>; Sat, 26 Dec 2020 07:50:35 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1ktBpk-0008BG-43; Sat, 26 Dec 2020 16:50:20 +0100
Subject: Re: [Linux-stm32] [PATCH] mfd: stmpe: Support disabling sub-functions
To:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        linux-next@vger.kernel.org
Cc:     Igor Opaniuk <igor.opaniuk@toradex.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        linux-kernel@vger.kernel.org,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20201226094722.16580-1-oleksandr.suvorov@toradex.com>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <bf750784-eb4a-675a-2ec4-bc52283dcc9a@pengutronix.de>
Date:   Sat, 26 Dec 2020 16:50:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201226094722.16580-1-oleksandr.suvorov@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Oleksander,

On 26.12.20 10:47, Oleksandr Suvorov wrote:
> Add support of sub-functions disabling. It allows one to define
> an stmpe sub-function device in devicetree, but keep it disabled.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> ---
> 
>  drivers/mfd/stmpe.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index 90f3292230c9..2182607b75f6 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -1358,6 +1358,9 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
>  	pdata->autosleep = (pdata->autosleep_timeout) ? true : false;
>  
>  		(np, child) {
> +		/* skip disabled sub-function */
> +		if (!of_device_is_available(child))
> +			continue;

Better use for_each_available_child_of_node().

>  		if (of_node_name_eq(child, "stmpe_gpio")) {
>  			pdata->blocks |= STMPE_BLOCK_GPIO;
>  		} else if (of_node_name_eq(child, "stmpe_keypad")) {
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
