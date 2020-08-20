Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42B824B211
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 11:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgHTJXa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 05:23:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:56964 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbgHTJX3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Aug 2020 05:23:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BD95AB780;
        Thu, 20 Aug 2020 09:23:54 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id C88F2DA87C; Thu, 20 Aug 2020 11:22:21 +0200 (CEST)
Date:   Thu, 20 Aug 2020 11:22:21 +0200
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Borislav Petkov <bp@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luca Stefani <luca.stefani.ge1@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20200820092221.GU2026@twin.jikos.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Borislav Petkov <bp@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luca Stefani <luca.stefani.ge1@gmail.com>
References: <20200820161239.25a9b3f4@canb.auug.org.au>
 <20200820082149.GB17365@zn.tnic>
 <20200820191502.1df900be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820191502.1df900be@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 20, 2020 at 07:15:02PM +1000, Stephen Rothwell wrote:
> On Thu, 20 Aug 2020 10:21:49 +0200 Borislav Petkov <bp@suse.de> wrote:
> >
> > On Thu, Aug 20, 2020 at 04:12:39PM +1000, Stephen Rothwell wrote:
> > > 
> > > Fixes tag
> > > 
> > >   Fixes: 9554bfe403nd ("x86/mce: Convert the CEC to use the MCE notifier")  
> > 
> > Hmm, this came from the original patch submission:
> > 
> > https://lkml.kernel.org/r/20200805095708.83939-1-luca.stefani.ge1@gmail.com
> > 
> > the 'n' is already there.
> 
> yeah, I wish people would just generate these lines:
> 
> git log -1 --format='Fixes: %h ("%s")' <commit-id>

FWIW, I'm using a script 'git-fixesline' that git also understands as a
subcommand 'git fixesline' with:

git --no-pager show -s --abbrev-commit --abbrev=12 --pretty=format:"Fixes: %h (\"%s\")%n" "$@"

(Dunno why not an alias but it works the same way.)
