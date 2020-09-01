Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45565258D09
	for <lists+linux-next@lfdr.de>; Tue,  1 Sep 2020 12:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgIAKwW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Sep 2020 06:52:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:41784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725949AbgIAKwU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Sep 2020 06:52:20 -0400
Received: from coco.lan (ip5f5ad5cf.dynamic.kabel-deutschland.de [95.90.213.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F398D206C0;
        Tue,  1 Sep 2020 10:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598957540;
        bh=bWvYKwlpWZO5Zw1aWUwfX5i8uZ3+gv1jjP96lc2FIvU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ajCANOr80wiHcf/hz3lTLyY6Z7Ly9mYNkjIKiEh6+J3DrAPJc7EkPgOowRlAumh7i
         s0lPEGM8kAQm4+kV44O+jlbTJSVNGEmw6gP7wxjLjgcIRgDAvwrmn9Js8jcr8/jzmW
         q6QWwaPRSxAsaOuiq/6/yXe4FxrqlOjf62c+uO18=
Date:   Tue, 1 Sep 2020 12:52:16 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: linux-next: Signed-off-by missing for commits in the v4l-dvb
 tree
Message-ID: <20200901125216.5ae2ecbf@coco.lan>
In-Reply-To: <alpine.DEB.2.22.394.2009011205090.2533@hadrien>
References: <20200901190354.38b0d16c@canb.auug.org.au>
        <alpine.DEB.2.22.394.2009011205090.2533@hadrien>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Julia,

Em Tue, 1 Sep 2020 12:05:51 +0200 (CEST)
Julia Lawall <julia.lawall@inria.fr> escreveu:

> On Tue, 1 Sep 2020, Stephen Rothwell wrote:
> 
> > Hi all,
> >
> > Commits
> >
> >   063a27cb9820 ("media: tm6000: drop unnecessary list_empty")
> >   1c047c859965 ("media: saa7134: drop unnecessary list_empty")
> >   3fdcea7c763a ("media: cx231xx: drop unnecessary list_empty")
> >
> > are missing a Signed-off-by from their author.  
> 
> My record of these patches all have their Signed-off-bys.  Mauro, do you
> want me to send them again?

No need. Yeah, I received them with your SoB, at least on my e-mail.

The one I applied came from this pull request:

	https://patchwork.linuxtv.org/project/linux-media/patch/87327e52-44cc-a2b8-c3fe-619bd6022264@xs4all.nl/

Unfortunately, it sounds that Hans already dropped the original tag:

	https://git.linuxtv.org/hverkuil/media_tree.git/refs/tags

So, hard to know where the SoB got dropped. It could be due to some
bug on my scripts - or it can be due to some issue when Hans picked
them.

In any case, I'll rewrite the git history with your SoB properly
added.

Thanks,
Mauro
