Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B170357DB0
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 09:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhDHH4b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 03:56:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:59034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbhDHH4b (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Apr 2021 03:56:31 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A888F61157;
        Thu,  8 Apr 2021 07:56:20 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lUPWU-006FTf-NC; Thu, 08 Apr 2021 08:56:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Apr 2021 08:56:18 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the irqchip tree
In-Reply-To: <20210408163528.180240af@canb.auug.org.au>
References: <20210408163528.180240af@canb.auug.org.au>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8171969ffe92eed0013fe3900ba0526f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sfr@canb.auug.org.au, j.neuschaefer@gmx.net, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 2021-04-08 07:35, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the irqchip tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/irqchip/irq-wpcm450-aic.c:9:10: fatal error: asm/exception.h:
> No such file or directory
>     9 | #include <asm/exception.h>
>       |          ^~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   fead4dd49663 ("irqchip: Add driver for WPCM450 interrupt controller")
> 
> I have used the irqchip tree from next-20210407 for today.

Thanks for the heads up. I guess that's the effect of COMPILE_TEST
which was apparently not very well tested... I'll drop it from Kconfig.

Jonathan, feel free to submit something re-enabling COMPILE_TEST once
you've worked out the missing dependencies.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
