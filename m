Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D854F2A3CE2
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 07:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgKCGj0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 01:39:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:36466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbgKCGj0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Nov 2020 01:39:26 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 514F822277;
        Tue,  3 Nov 2020 06:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604385566;
        bh=K/tj3pjX1SLmjcVKFkAl5fISAxCEUQ78S5ytQLqSsKs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YOnSfiTknI0nX+5wWVTR7jI7wx6UbLsxXCtx1WjThFJkN5Lz4YWA0vuxqFyMWLpOG
         6O5gV6+Dx3Q8kX5X1H3lJAH1aci6cURAxXbrfx9yHotaDaJKXzVtGxUfAf6fEDyZks
         MMOg2aRrt54JIxI1VLZEewjAQ8Dtra/czJsVkbtY=
Date:   Tue, 3 Nov 2020 14:39:21 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Qinglang Miao <miaoqinglang@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the imx-mxs tree
Message-ID: <20201103063920.GB31601@dragon>
References: <20201103120008.3f869d74@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103120008.3f869d74@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 03, 2020 at 12:00:08PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the imx-mxs tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arch/arm/mach-imx/mmdc.c: In function 'imx_mmdc_remove':
> arch/arm/mach-imx/mmdc.c:465:24: error: 'mmdc_ipg_clk' undeclared (first use in this function)
>   465 |  clk_disable_unprepare(mmdc_ipg_clk);
>       |                        ^~~~~~~~~~~~
> 
> Caused by commit
> 
>   52172fdbc3a3 ("ARM: imx: add missing clk_disable_unprepare() when remove imx_mmdc")
> 
> I have reverted that commit for today.

Sorry for the breakage, Stephen.  I dropped the commit from my branch.

Shawn
