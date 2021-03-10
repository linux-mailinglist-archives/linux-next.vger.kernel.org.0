Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A2B333CD9
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 13:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbhCJMrU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 07:47:20 -0500
Received: from mga02.intel.com ([134.134.136.20]:25217 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232073AbhCJMrO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Mar 2021 07:47:14 -0500
IronPort-SDR: ZygM77M6tVaV4KF5TQlhn8AHI1hcW48v76llp/r+iMb+otX465XWiw4HS+bSQC+x/VUUlrIhaY
 Fow1K+B4Lchw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="175561587"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="175561587"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 04:47:13 -0800
IronPort-SDR: mkZd9NPhZV8mqinPhj/J5qulMfCqbHh9mLaLKOvFG+uASkZzyVGHPpGwBHstCrFpNu4n67FBeR
 CXrpk42Aux8w==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="410172155"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 04:47:12 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJyF3-00BK7V-SC; Wed, 10 Mar 2021 14:47:09 +0200
Date:   Wed, 10 Mar 2021 14:47:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 gpio-brgl-fixes tree
Message-ID: <YEi/zYdmQFViE/Va@smile.fi.intel.com>
References: <20210309072620.656e8078@canb.auug.org.au>
 <20210309073211.392a838d@canb.auug.org.au>
 <CAHp75Ve2qGd5fFC9ztaEk9d+YBa-aTu-gMn_9dRUbpkWGY9YTw@mail.gmail.com>
 <YEdCeICFjpbgD4UT@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEdCeICFjpbgD4UT@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 09, 2021 at 11:40:08AM +0200, Andy Shevchenko wrote:
> On Mon, Mar 08, 2021 at 11:01:44PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 8, 2021 at 10:34 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > On Tue, 9 Mar 2021 07:26:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > Commits
> > > >
> > > >   eb441337c714 ("gpio: pca953x: Set IRQ type when handle Intel Galileo Gen 2")
> > > >   809390219fb9 ("gpiolib: acpi: Allow to find GpioInt() resource by name and index")
> > > >   62d5247d239d ("gpiolib: acpi: Add ACPI_GPIO_QUIRK_ABSOLUTE_NUMBER quirk")
> > > >   6e5d5791730b ("gpiolib: acpi: Add missing IRQF_ONESHOT")
> > > >
> > > > are missing a Signed-off-by from their committers.
> > >
> > > This also applies to the gpio-intel-fixes tree (since it is now headed
> > > by the same commit as the gpio-brgl-fixes tree).
> > 
> > I rebased my branch according to Linus, but I have decided to take
> > directly Bart's tree.
> > So when original will be fixed I'll fix mine.
> > 
> > Thanks!
> > 
> > P.S. Bart, you may simply merge my tag even on top of v5.12-rc2. It
> > will save you time and keep the original SHA IDs.
> 
> I think I have to elaborate.
> 1/ you need to drop those commits from your tree (yeah, rebase :-(, nut you may
>    do it interactively and inject the merge in the same location in the
>    history)
> 2/ instead of cherry-picking them run something like
>   git fetch git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git intel-gpio-v5.12-2
>   git merge FETCH_HEAD

Linus applied as is.
Problem solved :-)

-- 
With Best Regards,
Andy Shevchenko


