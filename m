Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411F53C217F
	for <lists+linux-next@lfdr.de>; Fri,  9 Jul 2021 11:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhGIJ11 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 9 Jul 2021 05:27:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:56674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231494AbhGIJ10 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Jul 2021 05:27:26 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D749F613D1;
        Fri,  9 Jul 2021 09:24:43 +0000 (UTC)
Received: from host31-54-148-101.range31-54.btcentralplus.com ([31.54.148.101] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1m1mkT-00CE3D-LT; Fri, 09 Jul 2021 10:24:41 +0100
Date:   Fri, 09 Jul 2021 10:24:40 +0100
Message-ID: <87czrr3kmf.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "kernelci.org bot" <bot@kernelci.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the irqchip-fixes tree
In-Reply-To: <20210709164326.18053838@canb.auug.org.au>
References: <20210709164326.18053838@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-SA-Exim-Connect-IP: 31.54.148.101
X-SA-Exim-Rcpt-To: sfr@canb.auug.org.au, bot@kernelci.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 09 Jul 2021 07:43:26 +0100,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> Hi all,
> 
> After merging the irqchip-fixes tree, today's linux-next build
> (jmr3927_defconfig) failed like this:
> 
> arch/mips/kernel/irq.c:118:9: error: implicit declaration of function ‘irq_resolve_mapping’; did you mean ‘irq_dispose_mapping’? [-Werror=implicit-function-declaration]
> arch/mips/kernel/irq.c:118:7: error: assignment to ‘struct irq_desc *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
> 
> Caused by commit
> 
>   f333d6bc4a8b ("irqchip/mips: Fix RCU violation when using irqdomain lookup on interrupt entry")
> 
> Reported by the Kernelci.org bot.
> 
> Not all mips platforms select CONFIG_IRQ_DOMAIN.

Indeed. Thanks for the heads up, now fixed and branch updated.

Cheers,

	M.

-- 
Without deviation from the norm, progress is not possible.
