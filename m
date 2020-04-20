Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59BD51B0FC7
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 17:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgDTPSq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 11:18:46 -0400
Received: from muru.com ([72.249.23.125]:50466 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbgDTPSq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 11:18:46 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2DC9F8027;
        Mon, 20 Apr 2020 15:19:34 +0000 (UTC)
Date:   Mon, 20 Apr 2020 08:18:43 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20200420151843.GS37466@atomide.com>
References: <20200420081154.597ffa59@canb.auug.org.au>
 <20200420081323.4fb9889b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420081323.4fb9889b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [200419 22:14]:
> Hi all,
> 
> On Mon, 20 Apr 2020 08:11:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > 
> > Commit
> > 
> >   512e8d40f91d ("ARM: dts: OMAP3: disable RNG on N950/N9")
> > 
> > is missing a Signed-off-by from its committer.
> 
> Sorry, that is in the arm-soc-fixes tree.

Hmm so the commit I sent a pull request [0] for does have Signed-off-by
for commit 07bdc492cff6 ("ARM: dts: OMAP3: disable RNG on N950/N9").

Seems like some commits in arm-soc-fixes accidentally got rebased?

Regards,

Tony


[0] https://www.spinics.net/lists/arm-kernel/msg795589.html
