Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE1E1ECB2D
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 10:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgFCINH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 04:13:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:42752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbgFCINH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 04:13:07 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E50042067B;
        Wed,  3 Jun 2020 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591171986;
        bh=zzy/zVrSF2Dp/bJhh/n521Hso2QWb2yJ6lL75H4p9y4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mcVPfJc1UJdKlerptC9aZGjCBqIICBT/TkvDlmrX+sOZyqZijbUInD0hiEwIe0HGq
         b9kfq3dygVfgTOUQbq0ADh/51K/JqW4qXpN7RcgrrOUvNxDLZ1YThsB89onD0zY+nM
         5E0VakpXYcjTPD3QBJBt300rhO+Rc3l6n23jsv7c=
Date:   Wed, 3 Jun 2020 10:13:03 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb-next tree
Message-ID: <20200603101303.1759d782@coco.lan>
In-Reply-To: <20200603124646.4ce0ca8b@canb.auug.org.au>
References: <20200603124646.4ce0ca8b@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Wed, 3 Jun 2020 12:46:46 +1000
Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> After merging the v4l-dvb-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: In function 'atomisp_css_isr_thread':
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:4196:9: error: 'atomisp_hw_is_isp2401' undeclared (first use in this function)
>  4196 |    if (!atomisp_hw_is_isp2401)
>       |         ^~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:4196:9: note: each undeclared identifier is reported only once for each function it appears in
> 
> Caused by commit
> 
>   be1fdab273a9 ("media: atomisp: change the detection of ISP2401 at runtime")
> 
> interacting with commit
> 
>   7ef17aa55fc3 ("media: atomisp: atomisp_compat_css20.c: detect ISP at runtime")
> 
> I have used the version of the v4l-dvb-next tree from next-20200602
> for today.

Sorry for that. 

The v4l-dvb-next currently contains some atomisp patches that are
waiting for review at linux-media, while v4l-dvb contains the patches
already reviewed, ready for merging.

The PR for v4l-dvb was submitted today.

I forgot to rebase v4l-dvb-next when some of the patches there 
were moved to v4l-dvb. Hopefully, it will be OK on tomorrow's 
linux-next, as I did the needed rebase.

Thanks,
Mauro
