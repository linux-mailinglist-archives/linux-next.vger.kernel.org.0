Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06078306476
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 20:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbhA0Tu0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 14:50:26 -0500
Received: from mx2.suse.de ([195.135.220.15]:50102 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233039AbhA0Ts7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Jan 2021 14:48:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 383D8AC9B;
        Wed, 27 Jan 2021 19:48:18 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 90D93DA84C; Wed, 27 Jan 2021 20:46:30 +0100 (CET)
Date:   Wed, 27 Jan 2021 20:46:30 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Josef Bacik <josef@toxicpanda.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the btrfs tree
Message-ID: <20210127194630.GD1993@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Josef Bacik <josef@toxicpanda.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210127101831.21dde304@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127101831.21dde304@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 27, 2021 at 10:18:31AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the btrfs tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/btrfs/space-info.c:1373: warning: Function parameter or member 'start_ns' not described in 'handle_reserve_ticket'
> fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig_bytes' not described in 'handle_reserve_ticket'
> 
> Introduced by commit
> 
>   cf61ceb78394 ("btrfs: add a trace point for reserve tickets")

Will be fixed in the next snapshot, thanks.
