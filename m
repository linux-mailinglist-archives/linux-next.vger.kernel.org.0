Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4932DA2E3
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 22:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390837AbgLNV5G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 16:57:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:53014 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731377AbgLNV5G (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 16:57:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 07896AC90;
        Mon, 14 Dec 2020 21:56:25 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 3135CDA7C3; Mon, 14 Dec 2020 22:54:46 +0100 (CET)
Date:   Mon, 14 Dec 2020 22:54:46 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20201214215445.GT6430@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Naohiro Aota <naohiro.aota@wdc.com>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201202150149.42543862@canb.auug.org.au>
 <20201215070956.6852e939@canb.auug.org.au>
 <25c43226-f937-0866-9c0b-46867bd04cc7@kernel.dk>
 <20201214213612.GS6430@suse.cz>
 <20201215084300.3543c433@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215084300.3543c433@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 15, 2020 at 08:43:00AM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> On Mon, 14 Dec 2020 22:36:12 +0100 David Sterba <dsterba@suse.cz> wrote:
> >
> > On Mon, Dec 14, 2020 at 01:12:46PM -0700, Jens Axboe wrote:
> > > On 12/14/20 1:09 PM, Stephen Rothwell wrote:  
> > > > Just a reminder that I am still applying the above merge fix.  
> > > 
> > > I sent in my core changes, but they haven't been pulled yet. So I guess
> > > we're dealing with a timing situation... David, did you send in the btrfs
> > > pull yet?  
> > 
> > Yes
> > https://lore.kernel.org/lkml/cover.1607955523.git.dsterba@suse.com/
> 
> I would expect you *both* to at least mention this conflict to Linus ...

2nd paragraph in the mail

"There are no merge conflicts against current master branch, in past
 weeks some conflicts emerged in linux-next but IIRC were trivial."
