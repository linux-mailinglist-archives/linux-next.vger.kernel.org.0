Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A62742408B
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 16:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238226AbhJFO6P convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 6 Oct 2021 10:58:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:47212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238205AbhJFO6P (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Oct 2021 10:58:15 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 77051610FC;
        Wed,  6 Oct 2021 14:56:22 +0000 (UTC)
Date:   Wed, 6 Oct 2021 10:56:21 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Oct 5 (warnings: a. trace; b. mm/migrate)
Message-ID: <20211006105621.7219404f@gandalf.local.home>
In-Reply-To: <2216e7c0-093b-3d90-ae1c-91902147fe05@intel.com>
References: <20211005190628.1f26b13d@canb.auug.org.au>
        <c1d9e328-ad7c-920b-6c24-9e1598a6421c@infradead.org>
        <2216e7c0-093b-3d90-ae1c-91902147fe05@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 6 Oct 2021 07:52:07 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

> On 10/5/21 1:46 PM, Randy Dunlap wrote:
> > On 10/5/21 1:06 AM, Stephen Rothwell wrote:  
> >> Hi all,
> >>
> >> Changes since 20211001:  
> > 
> > on x86_64:  
> ...
> > b. randconfig: KCONFIG_SEED=0xFD1CE406
> > 
> > ../mm/migrate.c:3216:22: error: 'migrate_on_reclaim_callback' defined
> > but not used [-Werror=unused-function]
> >  static int __meminit migrate_on_reclaim_callback(struct notifier_block
> > *self,
> >                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ../mm/migrate.c:3197:13: error: 'set_migration_target_nodes' defined but
> > not used [-Werror=unused-function]
> >  static void set_migration_target_nodes(void)
> >              ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > 
> > (example usage to get the randconfig files:
> > KCONFIG_SEED=0xBFBEA13C make [ARCH=x86_64] randconfig
> > )  
> 
> Hi Randy,
> 
> I'm having a heck of a time reproducing this one.  Any chance you could
> share an exact sha1 for the tree where you're hitting this, and maybe
> even the actual .config (just in case the KCONFIG_SEED isn't working
> somehow).
> 
> I've tried a few linux-next trees as well as the mmotm, mmots and
> mainline with the culprit patch applied.  No luck reproducing this so far.

also, just sending the .config that broke would be much better than
supplying the seed you used to make it. I'm assuming if we don't use the
exact kernel image, with different configs available between versions, the
seed will produce different results.

Not to mention, I'll spend the time to look at a .config and less likely to
spend the time trying to figure out how to create that config.

-- Steve
