Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A28268413
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 07:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgINFaN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Sep 2020 01:30:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:57554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbgINFaN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Sep 2020 01:30:13 -0400
Received: from localhost (unknown [122.171.195.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E114321655;
        Mon, 14 Sep 2020 05:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600061412;
        bh=Pbo/wlz0PpYd2RZzAinnyFBZ4TgKRYzWTOtkLrncjMk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qCtAw/Eu/cE2V4vxOvz0CZ8ZrJI5utsmA47Cah7SkSbqQuCCNY7sU7Krs6rVqgzZ9
         AHUTdc1thpX7zHmNVQkIb1R6NFXXsorHxL6kxkHe09gQXYjBxZrhZOKNeNdMnsMjAX
         PUPoZAPfL7epnk2oM9xddcfEVDzms7DvKM7R8W0s=
Date:   Mon, 14 Sep 2020 11:00:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Brad Kim <brad.kim@sifive.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the dmaengine tree
Message-ID: <20200914053004.GB2968@vkoul-mobl>
References: <20200914142951.66cd3498@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914142951.66cd3498@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 14-09-20, 14:29, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the dmaengine tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/dma/sf-pdma/sf-pdma.c: In function 'sf_pdma_donebh_tasklet':
> drivers/dma/sf-pdma/sf-pdma.c:287:23: warning: unused variable 'desc' [-Wunused-variable]
>   287 |  struct sf_pdma_desc *desc = chan->desc;
>       |                       ^~~~
> 
> Introduced by commit
> 
>   8f6b6d060602 ("dmaengine: sf-pdma: Fix an error that calls callback twice")

Thanks for the report. The function directly uses chan->desc, so yes
this can be removed, Sending patch shortly

Thanks
-- 
~Vinod
