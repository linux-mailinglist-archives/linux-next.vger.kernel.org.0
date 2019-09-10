Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3CADAED03
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 16:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388516AbfIJOcI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 10:32:08 -0400
Received: from muru.com ([72.249.23.125]:60488 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388484AbfIJOcI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 10:32:08 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 824BA8027;
        Tue, 10 Sep 2019 14:32:38 +0000 (UTC)
Date:   Tue, 10 Sep 2019 07:32:04 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the omap-fixes tree
Message-ID: <20190910143204.GR52127@atomide.com>
References: <20190911000818.6539fd35@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911000818.6539fd35@canb.auug.org.au>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

* Stephen Rothwell <sfr@canb.auug.org.au> [190910 14:25]:
> Hi all,
> 
> In commit
> 
>   a932b77b4d19 ("ARM: dts: logicpd-som-lv: Fix i2c2 and i2c3 Pin mux")
> 
> Fixes tag
> 
>   Fixes: 5fe3c0fa0d54 ("ARM: dts: Add pinmuxing for i2c2 and i2c3
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line (and also just
> keep them with all the other tags).

Oops sorry I missed that again, will try to be more careful
the next time. I really should have some automated checks
in place for that..

Regards,

Tony
