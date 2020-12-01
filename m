Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907272CA1BD
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 12:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729366AbgLALpj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 06:45:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:52190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728263AbgLALpj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Dec 2020 06:45:39 -0500
Received: from localhost (unknown [122.171.214.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8207C2084C;
        Tue,  1 Dec 2020 11:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606823098;
        bh=gS9MWi6bdd8oOA6Tei96Y/BfKSWuUlHJrbBNQ+XvtjA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J//ap6l19SfsL7GGgMuYZZwRAfg1Aw7GK7E7YXFqPP7hMjpNYWi3ofqNwv5yFDnsC
         8IEU0/0lsYDyf/H5RnuRlBL3XDA6+S9tFwbfslkuG1/ppYTqsGuSxLj27hs7303Wpn
         85h8F9v/antgIz4x3TUq3tNc8gK5/hx0Brun+jFY=
Date:   Tue, 1 Dec 2020 17:14:53 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: [PATCH v3 0/2] phy: ralink: phy-mt7621-pci: some fixes for
 COMPILE_TEST
Message-ID: <20201201114453.GC8403@vkoul-mobl>
References: <20201201112051.17463-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201112051.17463-1-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 01-12-20, 12:20, Sergio Paracuellos wrote:
> Hi Vinod,
> 
> After merging the phy-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/phy/ralink/phy-mt7621-pci.c:17:10: fatal error: mt7621.h: No such file or directory
> 17 | #include <mt7621.h>
>  |          ^~~~~~~~~~
> 
> This driver has two includes which are in
> "arch/mips/include/asm/mach-ralink" and are directly included in the
> driver:
> * mt7621.h
> * ralink_regs.h
> 
> This is because this path is directly included in 'arch/mips/ralink/Platform'
> for "ralink".
> 
> Adding the include search path to the phy ralink directory fix the problem but
> as you told me I finally end up removing COMPILE_TEST from Kconfig.
> 
> Making 'allmodconfig' in x86_64 also showed two warnings for this driver
> because of pointer size and not valid name for MODULE_DEVICE_TABLE ids.
> 
> Ids for the macro has been also included in this series.

Applied, thanks

-- 
~Vinod
