Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C371C1B4F68
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 23:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgDVVaT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 17:30:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:49920 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726066AbgDVVaS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Apr 2020 17:30:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 744BFAE8C;
        Wed, 22 Apr 2020 21:30:16 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 132BFDA704; Wed, 22 Apr 2020 23:29:34 +0200 (CEST)
Date:   Wed, 22 Apr 2020 23:29:33 +0200
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qu Wenruo <wqu@suse.com>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20200422212933.GS18421@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qu Wenruo <wqu@suse.com>
References: <20200421102520.53623f09@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421102520.53623f09@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 21, 2020 at 10:25:20AM +1000, Stephen Rothwell wrote:
> After merging the btrfs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

> Caused by commit
> 
>   8d80a063d508 ("btrfs: move on-disk structure definitions to btrfs_tree.h")
> 
> They should probably all be __u8 ...
> 
> I have applied the following patch for today.

I've removed the patch from the for-next branch.
