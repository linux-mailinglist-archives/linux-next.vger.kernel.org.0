Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32EF928F4FA
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 16:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730736AbgJOOnn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 10:43:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:51082 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730674AbgJOOnn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 10:43:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 45F8BAC24;
        Thu, 15 Oct 2020 14:43:41 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id A7717DA7C3; Thu, 15 Oct 2020 16:42:13 +0200 (CEST)
Date:   Thu, 15 Oct 2020 16:42:13 +0200
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Sterba <dsterba@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the btrfs tree with Linus' tree
Message-ID: <20201015144213.GP6756@twin.jikos.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20201015113530.115e0361@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015113530.115e0361@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 15, 2020 at 11:35:30AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Please do *not* rebase/rewrite your linux-next included tree and then
> immediately send it to Linus.  Or if you do, the please also update
> what you have in linux-next (so you can sneak it past me :-().
> (mutter, mutter, unnecessary conflicts :-().
> 
> I have dropped the brtfs tree from linux-next today.

I've pushed updated for-next and next-fixes to k.org, sorry for
inconvenience.
