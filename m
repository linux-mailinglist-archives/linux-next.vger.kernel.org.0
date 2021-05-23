Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720F038DA88
	for <lists+linux-next@lfdr.de>; Sun, 23 May 2021 10:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbhEWIiE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 23 May 2021 04:38:04 -0400
Received: from gofer.mess.org ([88.97.38.141]:35107 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231635AbhEWIiE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 May 2021 04:38:04 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 15F05C63B5; Sun, 23 May 2021 09:36:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1621758997; bh=vHLu0UlmqnZb6iBhGi2SBVuKUdCiHQBYYpQGkwXg6eY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NRORVQcDJo09ZKmAlwV8ErIFhsoOcY0zV/80V715WnJRe7a8AvYn19EMcCeRBpghq
         lao0i3ka4mmLkAlXt1wYyNi9S8yzEsPRImStGDZc0LmaKmk0qY6OiHbPxMplvbquwY
         kqwm5+SKJo7aJ/Qx1H7m9clrghakG6F0xAkcWl2f4i/tgK5bZmJ7956ZcAJyPjupAr
         oOLNUyd3kxhsuo4wwmqIgy8pSvaGK3Vc/3sWcOGJN/Y0/70PfqY/S9oFQZKtoZPVxd
         FH/VatFnFbUYWZdwMrwAWHjdzqYeeSiPThg2SSZy6G62rKcsxTdPBn7RURXtcnZ8Xj
         PQNnCfB1NWGZg==
Date:   Sun, 23 May 2021 09:36:36 +0100
From:   Sean Young <sean@mess.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the v4l-dvb-next tree
Message-ID: <20210523083636.GA15522@gofer.mess.org>
References: <20210523124953.7a5108b4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210523124953.7a5108b4@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mauro,

On Sun, May 23, 2021 at 12:49:53PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   7c8a36e1fb30 ("media: rc: i2c: Fix an error message")
> 
> Fixes tag
> 
>   Fixes: acaa34bf06e9 ('media: rc: implement zilog transmitter")
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing quotes
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Now that we have media-staging, can the commit message be ammended?

Thanks

Sean
