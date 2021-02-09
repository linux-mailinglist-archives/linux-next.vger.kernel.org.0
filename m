Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897E031535E
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 17:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbhBIQFJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 11:05:09 -0500
Received: from mga04.intel.com ([192.55.52.120]:21364 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232658AbhBIQFH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 11:05:07 -0500
IronPort-SDR: uKFrfQy7tykSJ8gFmA7IXBiJulPa3Whs0TFpMG1KjZpMsi4Jz1qVMbeEj5LKwSpa0uxzOHL6lN
 +6McP9Af3dlw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="179345506"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="179345506"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 08:04:07 -0800
IronPort-SDR: 5QOZUHYWgVW4FWaJoqSbcCyj9CopCHrLKKg2MX7LFPsJxJzSt0oSVwdaA5eqcLtbAulHcPj/ws
 melkR84hTkWQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="436219055"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 08:04:06 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1l9VUh-003Fgw-Eq; Tue, 09 Feb 2021 18:04:03 +0200
Date:   Tue, 9 Feb 2021 18:04:03 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pm tree
Message-ID: <YCKycybX+8L9zzCw@smile.fi.intel.com>
References: <20210205115153.799dc024@canb.auug.org.au>
 <CAHp75VfiyAtxg+wqZ30kSzCfFFsLndLjzrUc1njZG0x6vQeyBQ@mail.gmail.com>
 <CAHp75Vdrnmnu3vfmtEmnU=dH9tjoZtSZUtgDNXp29E90tT+j7A@mail.gmail.com>
 <3936997.7vkU7uULjK@kreacher>
 <CAHp75VcUP1475T_jWQkZkjhZrfNEZ6UaOopm5v1WBOPoriTE3Q@mail.gmail.com>
 <CAHp75VfS=LgZfY6KTZeM7B+PgKpV3x_4zytszdaS=43A7BJEZQ@mail.gmail.com>
 <CAJZ5v0jbg8KWmmiAV0YrvndcbaY3CApUbPsTYVgxH-0HspZW3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jbg8KWmmiAV0YrvndcbaY3CApUbPsTYVgxH-0HspZW3A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 09, 2021 at 03:32:38PM +0100, Rafael J. Wysocki wrote:
> On Mon, Feb 8, 2021 at 8:48 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Feb 8, 2021 at 9:47 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Feb 8, 2021 at 9:30 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> > > > On Friday, February 5, 2021 12:15:22 PM CET Andy Shevchenko wrote:
> > > > > On Fri, Feb 5, 2021 at 11:14 AM Andy Shevchenko
> > > > > <andy.shevchenko@gmail.com> wrote:
> > > > > > On Friday, February 5, 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > > > > >> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> > > > > >> failed like this:
> > > > > >>
> > > > > >
> > > > > > Rafael, maybe I was unclear when explaining to you the dependencies with the series of series, but all three parts should go ordered. In any case it’s easy to fix. I will send you a PR late today of the immutable tag (part 1) that needs to be included in order to avoid the above.
> > > > >
> > > > > PR had just been sent to linux-acpi@ and Rafael in Cc.
> > > >
> > > > I haven't seen that PR, though, in any of my inboxes etc.
> > > >
> > > > Can you please point me to an archive or similar where I can find it?
> > >
> > > Sure, lore has it
> > >
> > > https://lore.kernel.org/linux-acpi/YB0mPPgpIpQzhNXS@smile.fi.intel.com/T/#u
> >
> > If it is possible, please pull that PR and on top of that (re-)apply
> > the MFD related series.
> 
> Done (merged into the bleeding-edge branch).

Looks perfect, thanks! I will send a last part soon (tomorrow at last).

> I was confused by it apparently asking Linus to pull. :-)

Ah, sorry, it looks like I forgot to update the text when sending it again...

-- 
With Best Regards,
Andy Shevchenko


