Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A88BBB33E
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2019 13:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729656AbfIWL7W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Sep 2019 07:59:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:33436 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728928AbfIWL7W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Sep 2019 07:59:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A4759AEAE;
        Mon, 23 Sep 2019 11:59:20 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id E5E90DA7DA; Mon, 23 Sep 2019 13:59:38 +0200 (CEST)
Date:   Mon, 23 Sep 2019 13:59:38 +0200
From:   David Sterba <dsterba@suse.cz>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Message-ID: <20190923115938.GR2850@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190919113106.GC3642@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919113106.GC3642@sirena.co.uk>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 19, 2019 at 12:31:06PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the btrfs-kdave tree got conflicts in:
> 
>   fs/btrfs/block-group.c
>   fs/btrfs/ctree.h
>   fs/btrfs/extent-tree.c
>   fs/btrfs/send.c
>   fs/btrfs/space-info.c
>   include/uapi/linux/btrfs_tree.h
> 
> between a number of commits in Linus' tree and a number of commits in
> the btrfs-kdave tree.  I don't feel comfortable that I can resolve these
> safely and the btrfs-kdave tree hasn't changed since August with the
> last non-merge commit in June so I've dropped the tree for today.

Dropping the tree temporarily is ok. I'm going to refresh the source
branch today so it should be in a good shape for next linux-next
snapshot.
