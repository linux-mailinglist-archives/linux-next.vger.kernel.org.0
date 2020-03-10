Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49977180088
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 15:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgCJOqf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 10:46:35 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:44589 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726466AbgCJOqf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 10:46:35 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-105.corp.google.com [104.133.0.105] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 02AEkIkW029721
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Mar 2020 10:46:20 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 42D2B42045B; Tue, 10 Mar 2020 10:46:18 -0400 (EDT)
Date:   Tue, 10 Mar 2020 10:46:18 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the random tree
Message-ID: <20200310144618.GC58231@mit.edu>
References: <20200302144452.6a7c4907@canb.auug.org.au>
 <20200306155348.7bdc9622@canb.auug.org.au>
 <20200310121747.GA49602@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310121747.GA49602@lakrids.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 10, 2020 at 12:17:47PM +0000, Mark Rutland wrote:
> On Fri, Mar 06, 2020 at 03:53:48PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Mon, 2 Mar 2020 14:44:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the random tree, today's linux-next build (x86_64
> > > allnoconfig) produced this warning:
> > > 
> > > drivers/char/random.c:820:13: warning: 'crng_initialize_secondary' defined but not used [-Wunused-function]
> > >   820 | static void crng_initialize_secondary(struct crng_state *crng)
> > >       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > Introduced by commit
> > > 
> > >   5cbe0f13b51a ("random: split primary/secondary crng init paths")
> > 
> > I am still getting this warning.
> 
> Sorry, this is my bad.
> 
> We only call crng_initialize_secondary() in do_numa_crng_init(), which
> is only built for CONFIG_NUMA. We can either drop both
> crng_initialize_secondary() and crng_init_try_arch() under the
> CONFIG_NUMA ifdef, or add __maybe_unused to crng_initialize_secondary().
> 
> Ted, does the below look ok to you? Or would you prefer moving things
> under the ifdeffery?

Yes, that looks fine.  Reordering the functions to move them under the
#ifdefs will make the code less readable, and adding extra
#ifdef/#endif would also make things less readable.

Thanks for the patch, will apply.

						- Ted
