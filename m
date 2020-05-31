Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D426F1E9A3E
	for <lists+linux-next@lfdr.de>; Sun, 31 May 2020 21:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgEaTti (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 31 May 2020 15:49:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:34894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725991AbgEaTti (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 31 May 2020 15:49:38 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 38AC1206A1;
        Sun, 31 May 2020 19:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590954578;
        bh=pZ0I41ZiZTSzzAiSwQGoWuETv9UMGqQWUo092Vj1ogw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=abiZfBA4KvEG0RrbSTIwOPv9tHMVJzguzEQQmMNsM9o7ARA3jXDpVcdXWALKdFCLp
         cnO6mpcQGUpOHqnhb7uNZRI0PueBgywO6tGEOvmkDuWFoIiI16oDToDEPjQVtA95ba
         GBX8Tf+4vCR1DkU+VhxmdRFggelw8fDU+m4CiB9M=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jfTxg-00GkMF-Py; Sun, 31 May 2020 20:49:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 31 May 2020 20:49:36 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: linux-next: Fixes tag needs some work in the irqchip tree
In-Reply-To: <20200601040615.34394a6a@canb.auug.org.au>
References: <20200601040615.34394a6a@canb.auug.org.au>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <9843e4cf24fe0198e77ddd2eb3fba2d0@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jiaxun.yang@flygoat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 2020-05-31 19:06, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   8abfb9b77d87 ("irqchip/loongson-pci-msi: Fix a typo in Kconfig")
> 
> Fixes tag
> 
>   Fixes: cca8fbff2585 ("irqchip: Add Loongson PCH MSI controller")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 632dcc2c75ef ("irqchip: Add Loongson PCH MSI controller")

My bad, I should have checked it instead of blindly applying
the patch...

Now updated and pushed out.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
