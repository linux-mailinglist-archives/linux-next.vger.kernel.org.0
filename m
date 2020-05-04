Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0951C350A
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 10:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgEDI4N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 May 2020 04:56:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:50726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727951AbgEDI4M (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 May 2020 04:56:12 -0400
Received: from localhost (unknown [171.76.84.84])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C571820735;
        Mon,  4 May 2020 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588582572;
        bh=MhFLYRO7XaP7fMKVc1tvDLu2Kr7aT3LU5gaPh+z5200=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=saOSuDr9/mx+Wr6MWKtfutLUlLljmHWSE99JOGgqzenvNEpSLx0hWLk+xYpEQDatG
         8otGDo/cbdSrpAg7caQnSlwkDznnkBDxfiWl+xgn3dfJ6uAvB3CaGBGljwQCeX6Bht
         M1wkULb2HL2AOPg0+4qt//9PIOTsKMXWzw+PDyVA=
Date:   Mon, 4 May 2020 14:26:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the slave-dma-fixes tree
Message-ID: <20200504085608.GR1375924@vkoul-mobl>
References: <20200504185326.6c50e387@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504185326.6c50e387@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 04-05-20, 18:53, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   c76d6569de67 ("dmaengine: owl: Use correct lock in owl_dma_get_pchan()")
> 
> Fixes tag
> 
>   Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line.
> 
> Also, please keep all the commit message tags together at the end of
> the commit message.

Updated and pushed out, thanks for notifying

-- 
~Vinod
