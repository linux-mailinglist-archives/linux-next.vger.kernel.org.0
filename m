Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C23721329E7
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 16:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbgAGPWQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 10:22:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:53600 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727944AbgAGPWQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 10:22:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 73C1DB209;
        Tue,  7 Jan 2020 15:22:14 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 7BB13DA78B; Tue,  7 Jan 2020 16:22:04 +0100 (CET)
Date:   Tue, 7 Jan 2020 16:22:04 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josef@suse.de
Subject: Re: linux-next: build failure after merge of the btrfs-fixes tree
Message-ID: <20200107152204.GX3929@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josef@suse.de
References: <20200107082431.2b83a8ac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107082431.2b83a8ac@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 07, 2020 at 08:24:31AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the btrfs-fixes tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/btrfs/inode.c: In function 'btrfs_unlink_subvol':
> fs/btrfs/inode.c:4283:16: error: 'inode' undeclared (first use in this function)
>  4283 |  if (btrfs_ino(inode) == BTRFS_EMPTY_SUBVOL_DIR_OBJECTID) {
>       |                ^~~~~
> 
> Caused by commit
> 
>   b225d1cb20cc ("btrfs: fix invalid removal of root ref")
> 
> I have reverted that commit for today.

Updated next-fixes branch pushed.
