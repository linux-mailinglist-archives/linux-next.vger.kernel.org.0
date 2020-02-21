Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC52B167C22
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2020 12:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgBULaU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Feb 2020 06:30:20 -0500
Received: from mx2.suse.de ([195.135.220.15]:53814 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727046AbgBULaU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Feb 2020 06:30:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 05511AC66;
        Fri, 21 Feb 2020 11:30:18 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id BF10DDA70E; Fri, 21 Feb 2020 12:30:00 +0100 (CET)
Date:   Fri, 21 Feb 2020 12:30:00 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Sterba <dsterba@suse.cz>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josef Bacik <josef@toxicpanda.com>,
        Nikolay Borisov <nborisov@suse.com>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20200221113000.GC2902@twin.jikos.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josef Bacik <josef@toxicpanda.com>,
        Nikolay Borisov <nborisov@suse.com>
References: <20200220092344.2a738574@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220092344.2a738574@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 20, 2020 at 09:23:44AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the btrfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/btrfs/extent-tree.c: In function 'btrfs_alloc_logged_file_extent':
> fs/btrfs/extent-tree.c:4425:20: error: passing argument 1 of 'btrfs_pin_extent' from incompatible pointer type [-Werror=incompatible-pointer-types]
>  4425 |   btrfs_pin_extent(fs_info, ins->objectid, ins->offset, 1);
>       |                    ^~~~~~~
>       |                    |
>       |                    struct btrfs_fs_info *
> fs/btrfs/extent-tree.c:2609:49: note: expected 'struct btrfs_trans_handle *' but argument is of type 'struct btrfs_fs_info *'
>  2609 | int btrfs_pin_extent(struct btrfs_trans_handle *trans,
>       |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
> 
> Caused by commit
> 
>   4e2c2f96e6a3 ("btrfs: Make btrfs_pin_extent take trans handle")
> 
> interacting with commit
> 
>   bd727173e443 ("btrfs: handle logged extent failure properly")
> 
> from the btrfs-fixes tree.
> 
> I have applied the following merge fix patch for today.

Sorry, I'll fix the branch in the next for-next snapshot.
