Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 765A7D8C8F
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2019 11:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389676AbfJPJdn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Oct 2019 05:33:43 -0400
Received: from mga17.intel.com ([192.55.52.151]:25194 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388426AbfJPJdm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Oct 2019 05:33:42 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Oct 2019 02:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,303,1566889200"; 
   d="scan'208";a="200006317"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 16 Oct 2019 02:33:40 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iKfgZ-0008F9-Hq; Wed, 16 Oct 2019 12:33:39 +0300
Date:   Wed, 16 Oct 2019 12:33:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the pm tree (Was:
 linux-next: build warning after merge of the pm tree)
Message-ID: <20191016093339.GU32742@smile.fi.intel.com>
References: <20191015100855.31b8a3d5@canb.auug.org.au>
 <20191015101650.2a1541af@canb.auug.org.au>
 <4823987.OjxUhv8yZC@kreacher>
 <CAMuHMdUc7unFPvb2hhy9kL6WcJGsDTpjOW=CD=0n+pw-OGH9Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUc7unFPvb2hhy9kL6WcJGsDTpjOW=CD=0n+pw-OGH9Dg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 16, 2019 at 11:15:44AM +0200, Geert Uytterhoeven wrote:
> On Tue, Oct 15, 2019 at 1:27 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> > On Tuesday, October 15, 2019 1:16:50 AM CEST Stephen Rothwell wrote:
> > > On Tue, 15 Oct 2019 10:08:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
> > > wrote:

> > > This became a build failure for the powerpc ppc64_allmodconfig build:
> > >
> > > In file included from include/linux/i2c.h:13,
> > >                  from arch/powerpc/platforms/pasemi/misc.c:14:
> > > include/linux/acpi.h:682:31: error: 'struct acpi_device' declared inside pa=
> > > rameter list will not be visible outside of this definition or declaration =
> > > [-Werror]
> > >   682 | acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, =
> > > const char *uid2)
> > >       |                               ^~~~~~~~~~~
> > > cc1: all warnings being treated as errors
> > >
> > > (and many more)
> > >
> > > I have used the pm tree from next-20191014 for today.
> >
> > So this looks weird, because there is an acpi_dev_put() stub in
> > include/linux/acpi.h too in the same #else block and it takes a
> > (struct acpi_device *) pointer too and it has not been touched by
> > the commit in question.  So why has it built successfully so far?
> 
> Looks like that never warned because acpi_dev_put() is located after
> 
>     static inline struct acpi_device *
>     acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
>     {
>             return NULL;
>     }
> 
> Moving acpi_dev_hid_uid_match() down gets rid of the warning, too.

Sounds like a compiler bug.

It thinks that struct acpi_device * is defined as function prototype?

-- 
With Best Regards,
Andy Shevchenko


