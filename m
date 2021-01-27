Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173F830543C
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 08:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233462AbhA0HQb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 02:16:31 -0500
Received: from verein.lst.de ([213.95.11.211]:51665 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233278AbhA0HNK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Jan 2021 02:13:10 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id CEF9868AFE; Wed, 27 Jan 2021 08:12:25 +0100 (CET)
Date:   Wed, 27 Jan 2021 08:12:25 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Brauner <christian@brauner.io>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pidfd tree
Message-ID: <20210127071225.GB21133@lst.de>
References: <20210127094101.2100177b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127094101.2100177b@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 27, 2021 at 09:41:01AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pidfd tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/xfs/xfs_ioctl32.c: In function 'xfs_file_compat_ioctl':
> fs/xfs/xfs_ioctl32.c:441:20: warning: unused variable 'mp' [-Wunused-variable]
>   441 |  struct xfs_mount *mp = ip->i_mount;
>       |                    ^~

So this is only used in an x86-specific section of the function.
Let me think what we can do about this.
