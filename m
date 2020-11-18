Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945742B755D
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 05:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgKREYD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Nov 2020 23:24:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:38560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgKREYD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Nov 2020 23:24:03 -0500
Received: from localhost (unknown [122.171.203.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46580206B6;
        Wed, 18 Nov 2020 04:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605673443;
        bh=EE4RE2vUaW+LMJCvm5ivbId3HhZ8VlGzj64e+W8E+Fs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OgxK86tvrvvi5i9SQzVB1ZedFCzHOUU5NLhZZ2Y2LP9NjckicT2w9S3a2UriJWvvq
         UFj5YNDI+3TuMMGcLXtxwXTzq+Wi3vo5TFMr2TPJstzW26tE9amawY9ToEQcn8XEJ1
         gLT7mLQtq91C1YR9G6ttIM+rftltl8yQWqIxjokM=
Date:   Wed, 18 Nov 2020 09:53:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Yejune Deng <yejune.deng@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the phy-next tree
Message-ID: <20201118042358.GJ50232@vkoul-mobl>
References: <20201117134046.569d58b8@canb.auug.org.au>
 <20201117100056.GF50232@vkoul-mobl>
 <20201118135619.4a4bf4c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118135619.4a4bf4c5@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 18-11-20, 13:56, Stephen Rothwell wrote:
> Hi Vinod,
> 
> On Tue, 17 Nov 2020 15:30:56 +0530 Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 17-11-20, 13:40, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the phy-next tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > > 
> > > drivers/soc/amlogic/meson-ee-pwrc.c: In function 'meson_ee_pwrc_init_domain':
> > > drivers/soc/amlogic/meson-ee-pwrc.c:416:65: error: expected ';' before 'if'
> > >   416 |   dom->rstc = devm_reset_control_array_get_exclusive(&pdev->dev)
> > >       |                                                                 ^
> > >       |                                                                 ;
> > >   417 |   if (IS_ERR(dom->rstc))
> > >       |   ~~                                                             
> > > 
> > > Caused by commit
> > > 
> > >   3cc8e86721ad ("phy: amlogic: Replace devm_reset_control_array_get()")
> > > 
> > > I have used the phy-next tree from next-20201116 for today.  
> > 
> > I have reverted this commit
> 
> Thanks, but forgot to push out?

Precisely :( Fixed now, sorry for the trouble

-- 
~Vinod
