Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EF71CB2AE
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 17:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgEHPTX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 11:19:23 -0400
Received: from muru.com ([72.249.23.125]:53598 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726689AbgEHPTX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 May 2020 11:19:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0CA3C806C;
        Fri,  8 May 2020 15:20:11 +0000 (UTC)
Date:   Fri, 8 May 2020 08:19:20 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: linux-next: Fixes tags need some work in the omap tree
Message-ID: <20200508151920.GY37466@atomide.com>
References: <20200508085320.58da9ffa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508085320.58da9ffa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [200507 22:54]:
> Hi all,
> 
> In commit
> 
>   0f84d0247722 ("ARM: dts: am437x: fix networking on boards with ksz9031 phy")
> 
> Fixes tag
> 
>   Fixes: commit bcf3440c6dd7 ("net: phy: micrel: add phy-mode support for the KSZ9031 PHY")
> 
> has these problem(s):
> 
>   - leading word 'commit' unexpected
> 
> In commit
> 
>   3a78c16f67a0 ("ARM: dts: am57xx: fix networking on boards with ksz9031 phy")
> 
> Fixes tag
> 
>   Fixes: commit bcf3440c6dd7 ("net: phy: micrel: add phy-mode support for the KSZ9031 PHY")
> 
> has these problem(s):
> 
>   - leading word 'commit' unexpected

Thanks for catching these, I'll fix them.

Regards,

Tony


