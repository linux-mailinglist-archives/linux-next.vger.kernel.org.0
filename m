Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B29626DA08
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 13:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgIQLWL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 07:22:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:45844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726740AbgIQLWG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Sep 2020 07:22:06 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E7F321734;
        Thu, 17 Sep 2020 11:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600341723;
        bh=8w6Tvx68elEiJkuBEkujJkv8dBiQZZY/bKRQawd7ILw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fRUwGw4oKriPclhX3W+jgcowOKAEB1kN62GfJQ4sAgyPsj9DiJUnbnbwRmOfoLjGC
         7rFs4mjczuuoTms19fx69wloxx1H5sb1J54+/Fs7MfUBa8gjq2C4BsU86uvlhNLNWL
         hMwdMMma87rtItatCIz9ImyfGnJqZL2lglURXTrY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kIrzF-00CcFx-F7; Thu, 17 Sep 2020 12:22:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Sep 2020 12:22:01 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the irqchip tree
In-Reply-To: <20200917211017.1d1216b7@canb.auug.org.au>
References: <20200917211017.1d1216b7@canb.auug.org.au>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <8724b99b88daa62c8efa99918eebe38f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020-09-17 12:10, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   e86085c6e2fb ("irqchip/irq-pruss-intc: Add support for ICSSG INTC on 
> K3 SoCs")
>   1c46bcaed207 ("irqchip/irq-pruss-intc: Implement irq_{get,
> set}_irqchip_state ops")
>   7d1ca43a7c14 ("irqchip/irq-pruss-intc: Add logic for handling
> reserved interrupts")
>   7a141591acde ("irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
> for PRUSS interrupts")
>   309f1f85f7b0 ("dt-bindings: irqchip: Add PRU-ICSS interrupt
> controller bindings")
> 
> are missing a Signed-off-by from their committer.

Now fixed. Thanks for the heads up.

         M.
-- 
Jazz is not dead. It just smells funny...
