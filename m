Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABC12C9000
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 22:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388619AbgK3V0D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 16:26:03 -0500
Received: from gloria.sntech.de ([185.11.138.130]:50986 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388607AbgK3V0C (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 16:26:02 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kjqfg-0005JR-9F; Mon, 30 Nov 2020 22:25:20 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rockchip tree
Date:   Mon, 30 Nov 2020 22:25:16 +0100
Message-ID: <3588365.4JeHj4c4j5@diego>
In-Reply-To: <20201201082107.5f3658be@canb.auug.org.au>
References: <20201201082107.5f3658be@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Am Montag, 30. November 2020, 22:21:07 CET schrieb Stephen Rothwell:
> Hi all,
> 
> Commit
> 
>   f166ed782080 ("arm64: defconfig: Enable RTC_DRV_HYM8563")
> 
> is missing a Signed-off-by from its committer.

thanks for catching this.

I've addy the Signed-off-by and re-created the for-next branch.


Thanks
Heiko



