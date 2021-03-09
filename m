Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A975332236
	for <lists+linux-next@lfdr.de>; Tue,  9 Mar 2021 10:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhCIJkm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Mar 2021 04:40:42 -0500
Received: from mga14.intel.com ([192.55.52.115]:45678 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230086AbhCIJkN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Mar 2021 04:40:13 -0500
IronPort-SDR: 7KoT38ZETIFdBVMGA/JftHNzfIqZK3tHmPh/RGAPVehG5rfnbYvCRpxG6PAGvDJW3RoXiaxi62
 H/Xu0kwTDQRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="187560158"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="187560158"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 01:40:12 -0800
IronPort-SDR: m4YDkeyC8C+m9+YqilzStlL5v2gkAVAYdUJrroqHVRncPx3oKA7kpZiKcRziIGOTj1S/ogDrxJ
 kwjIQb3aNpGg==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="509232945"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 01:40:11 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJYqW-00B1kz-VQ; Tue, 09 Mar 2021 11:40:08 +0200
Date:   Tue, 9 Mar 2021 11:40:08 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 gpio-brgl-fixes tree
Message-ID: <YEdCeICFjpbgD4UT@smile.fi.intel.com>
References: <20210309072620.656e8078@canb.auug.org.au>
 <20210309073211.392a838d@canb.auug.org.au>
 <CAHp75Ve2qGd5fFC9ztaEk9d+YBa-aTu-gMn_9dRUbpkWGY9YTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve2qGd5fFC9ztaEk9d+YBa-aTu-gMn_9dRUbpkWGY9YTw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 08, 2021 at 11:01:44PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 8, 2021 at 10:34 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > On Tue, 9 Mar 2021 07:26:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Commits
> > >
> > >   eb441337c714 ("gpio: pca953x: Set IRQ type when handle Intel Galileo Gen 2")
> > >   809390219fb9 ("gpiolib: acpi: Allow to find GpioInt() resource by name and index")
> > >   62d5247d239d ("gpiolib: acpi: Add ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER quirk")
> > >   6e5d5791730b ("gpiolib: acpi: Add missing IRQF_ONESHOT")
> > >
> > > are missing a Signed-off-by from their committers.
> >
> > This also applies to the gpio-intel-fixes tree (since it is now headed
> > by the same commit as the gpio-brgl-fixes tree).
> 
> I rebased my branch according to Linus, but I have decided to take
> directly Bart's tree.
> So when original will be fixed I'll fix mine.
> 
> Thanks!
> 
> P.S. Bart, you may simply merge my tag even on top of v5.12-rc2. It
> will save you time and keep the original SHA IDs.

I think I have to elaborate.
1/ you need to drop those commits from your tree (yeah, rebase :-(, nut you may
   do it interactively and inject the merge in the same location in the
   history)
2/ instead of cherry-picking them run something like
  git fetch git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git intel-gpio-v5.12-2
  git merge FETCH_HEAD

-- 
With Best Regards,
Andy Shevchenko


