Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA46412901
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 00:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbhITWuI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 18:50:08 -0400
Received: from gloria.sntech.de ([185.11.138.130]:58590 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232557AbhITWsH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Sep 2021 18:48:07 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mSS3a-0007Vh-OZ; Tue, 21 Sep 2021 00:46:38 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rockchip tree
Date:   Tue, 21 Sep 2021 00:46:38 +0200
Message-ID: <21766876.gqI7n6q7uW@diego>
In-Reply-To: <20210921082701.462128c6@canb.auug.org.au>
References: <20210921082701.462128c6@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Am Dienstag, 21. September 2021, 00:27:01 CEST schrieb Stephen Rothwell:
> Hi all,
> 
> Commit
> 
>   bb232c4c2a4b ("clk: rockchip: use module_platform_driver_probe")
> 
> is missing a Signed-off-by from its committer.

thanks for catching this.

I've amended the still new commit with the needed Signed-off-line

Thanks a lot for your work
Heiko


