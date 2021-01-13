Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2042F576B
	for <lists+linux-next@lfdr.de>; Thu, 14 Jan 2021 04:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbhANB7o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Jan 2021 20:59:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729538AbhAMXj5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Jan 2021 18:39:57 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B44C0617BC;
        Wed, 13 Jan 2021 15:30:15 -0800 (PST)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 51BD96132;
        Wed, 13 Jan 2021 23:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 51BD96132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610580451; bh=AfOuwhmfaD02ekVU1GGni51IgmEpyeh7+rhK6G6gXxs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dWMJqd/cgurptoBg3bh1legndEL0hYObyySvktxE2qBEIAw7XoD7gY+tiwxQFulGp
         VA9F4+Bi8QgAnEZ5DQN4cHsQYa3tVtG9Vc3SBC7wH/0r483ZlqjEauw/f/iyyFr8sT
         7ifKUmimdy001OjsD4UT/ZTfDPrOXe7nIEgk3R9BMU8ba+2sqwbCxFJLczkVowX6xp
         ZGpUiPM7ps+QXjRygWsHv38bqJtxDyIzQE0DMjNxPHdPAW221jhPlsie7EsG+r2WLl
         QCU1mz7lzevEerVRCPO3IvuDgWvII82lcLfzKns+wMfpIbqBFluEL18cZEbJZvTgRz
         POle3BjId1tQg==
Date:   Wed, 13 Jan 2021 16:27:30 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20210113162730.4f6dc0ac@lwn.net>
In-Reply-To: <20210113150748.1efc75aa@canb.auug.org.au>
References: <20210113150748.1efc75aa@canb.auug.org.au>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 13 Jan 2021 15:07:48 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the jc_docs tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/translations/zh_CN/mips/ingenic-tcu.rst:61: WARNING: Malformed table.
> Text in column margin in table line 6.
> 
> ===========         =====
> 时钟                drivers/clk/ingenic/tcu.c
> 中断                drivers/irqchip/irq-ingenic-tcu.c
> 定时器              drivers/clocksource/ingenic-timer.c
> OST                 drivers/clocksource/ingenic-ost.c
> 脉冲宽度调制器      drivers/pwm/pwm-jz4740.c
> 看门狗              drivers/watchdog/jz4740_wdt.c
> ===========         =====
> 
> Introduced by commit
> 
>   419b1d4ed1cb ("doc/zh_CN: add mips ingenic-tcu.rst translation")

Memo to self: you can't skip doing a new build even for simple
translations that obviously shouldn't add any new problems.  Sorry for the
noise, I've applied fixes from Lukas Bulwahn for all of this whole mess of
errors.

Yantang, *please* do not submit documentation patches without having done
a docs build to make sure things work as expected!

Thanks,

jon
