Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C9C43FC19
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 14:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhJ2MRO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Oct 2021 08:17:14 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:55758 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbhJ2MRN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Oct 2021 08:17:13 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 67061217BA;
        Fri, 29 Oct 2021 12:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1635509684;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fOqJfV+Aey4e3tvNIeU6bJo2ZmdcFDdbpKccfiZf5ZU=;
        b=vDqR5zNQvrHRU2VfsOVH9icjtoK0aeIgCmZPHpzt9gPy64fK+qcGbDlj0YkJGXd2YykPkB
        CuCizXk9OQLbWSQsEuoqtE2YlbvAoZx8Xdx97iWOz26ZIqB/YkZtHfZ7mmzatdyiH7FENu
        XeTq98mq73sbV0Jdm6KTdqgDWk7blqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1635509684;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fOqJfV+Aey4e3tvNIeU6bJo2ZmdcFDdbpKccfiZf5ZU=;
        b=Z8Z9VsJGgrw2dyn88IfmCfPIAHxI6V+mMNFInq0Lzv02uiRXdAurNJMp4cYn6tY5UtNFog
        hMTb/kdd8mCTIoAA==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
        by relay2.suse.de (Postfix) with ESMTP id 57706A3B88;
        Fri, 29 Oct 2021 12:14:44 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id BB779DA7A9; Fri, 29 Oct 2021 14:14:10 +0200 (CEST)
Date:   Fri, 29 Oct 2021 14:14:09 +0200
From:   David Sterba <dsterba@suse.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20211029121409.GX20319@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20211027210924.22ef5881@canb.auug.org.au>
 <20211029095226.GV20319@suse.cz>
 <20211029105052.GW20319@suse.cz>
 <CAHp75VdXJEuY86pFC+bLoGbAYuGsA+KqEV-g4Dca25HHD-njHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdXJEuY86pFC+bLoGbAYuGsA+KqEV-g4Dca25HHD-njHA@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 29, 2021 at 01:58:53PM +0300, Andy Shevchenko wrote:
> On Friday, October 29, 2021, David Sterba <dsterba@suse.cz> wrote:
> 
> > On Fri, Oct 29, 2021 at 11:52:26AM +0200, David Sterba wrote:
> > > On Wed, Oct 27, 2021 at 09:09:24PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > [I am not sure why this error only popped up after I merged Andrew's
> > > > patch set ...]
> >
> >
> 
> 
> 
> > Also I think that next time you can use some older version of the
> > for-next branch instead of making the whole subsystem depend on BROKEN.
> > This causes much more harm in the testing setups that suddenly can't
> > work at all, compared to testing a few days older branch.
> 
> The Linux Next reflects current state of affairs and marking something
> which is definitely broken as BROCKEN is what I expect as a developer who
> tests some other stuff on top of broken code.

I'd argue against using the big 'depdends BROKEN' hammer as much as
possible, surely not for linux-next. Normaly the BROKEN status is earned
after known unfixed breakage for subsystems where nobody cares. If code
is buggy and causes crashes when testing linux-next, that's something we
want to see, not "no test results at all".

Can you imagine all compilation breakages in linux-next get resolved by
BROKEN? I know Stephen is capable of fixing various compilation problems
by himself and given the whole-tree scope it's heroic efforts, leaving
the shortcuts for the rest. In this case the fix may not be obvious so
I'd understand not merging my for-next branch at all or merging a stub
like the latest rc instead, ie. resolving that on the integration level
and not touching the config or code itself.
