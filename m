Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF77E16A867
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2020 15:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbgBXOev (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Feb 2020 09:34:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:46350 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727498AbgBXOeu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Feb 2020 09:34:50 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0E1D3AD2B;
        Mon, 24 Feb 2020 14:34:49 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id C05C5DA727; Mon, 24 Feb 2020 15:34:29 +0100 (CET)
Date:   Mon, 24 Feb 2020 15:34:29 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: Re: linux-next: build warning after merge of the btrfs tree
Message-ID: <20200224143429.GR2902@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>
References: <20200224095735.179fe582@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224095735.179fe582@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 24, 2020 at 09:57:35AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the btrfs tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> fs/btrfs/check-integrity.c: In function 'btrfsic_process_superblock_dev_mirror':
> fs/btrfs/check-integrity.c:916:9: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   916 |  return ret;
>       |         ^~~
> 
> Introduced by commit
> 
>   5a03d907a555 ("btrfs: remove buffer_heads form super block mirror integrity checking")
> 
> I think this is not a false positive since ret is only assigned is a
> "goto out" is executed.

Yes that sounds correct, will be fixed in next update, thanks.
