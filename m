Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0D61C2F83
	for <lists+linux-next@lfdr.de>; Sun,  3 May 2020 23:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbgECVlc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 May 2020 17:41:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:45120 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729109AbgECVlc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 May 2020 17:41:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 13283AEEA;
        Sun,  3 May 2020 21:41:31 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 60BA3DA70B; Sun,  3 May 2020 23:40:41 +0200 (CEST)
Date:   Sun, 3 May 2020 23:40:41 +0200
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Filipe Manana <fdmanana@suse.com>
Subject: Re: linux-next: manual merge of the btrfs tree with the btrfs-fixes
 tree
Message-ID: <20200503214040.GR18421@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Filipe Manana <fdmanana@suse.com>
References: <20200501102825.431f9cac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501102825.431f9cac@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 01, 2020 at 10:28:25AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the btrfs tree got a conflict in:
> 
>   fs/btrfs/tree-log.c
> 
> between commit:
> 
>   f135cea30de5 ("btrfs: fix partial loss of prealloc extent past i_size after fsync")
> 
> from the btrfs-fixes tree and commit:
> 
>   e94d318f12cd ("btrfs: fix partial loss of prealloc extent past i_size after fsync")

Conflicts in the above commit and "btrfs: force chunk allocation if our
global rsv is larger than metadata" should be gone now. Both patches
have been merged to master and fresh for-next branch pushed to k.org.
