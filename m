Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D9716A881
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2020 15:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbgBXOhl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Feb 2020 09:37:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:47296 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727090AbgBXOhk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Feb 2020 09:37:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 8930AAC15;
        Mon, 24 Feb 2020 14:37:39 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 72DEADA727; Mon, 24 Feb 2020 15:37:20 +0100 (CET)
Date:   Mon, 24 Feb 2020 15:37:20 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qu Wenruo <wqu@suse.com>
Subject: Re: linux-next: Fixes tag needs some work in the btrfs tree
Message-ID: <20200224143720.GS2902@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qu Wenruo <wqu@suse.com>
References: <20200223133659.47fe9684@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200223133659.47fe9684@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Feb 23, 2020 at 01:36:59PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   d461d8be723f ("btrfs: qgroup: Ensure qgroup_rescan_running is only set when the worker is at least queued")
> 
> Fixes tag
> 
>   Fixes: 8d9eddad194 (Btrfs: fix qgroup rescan worker initialization)
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Patch with correct Fixes: tag has been merged as
81f7eb00ff5bb8326e82503a32809421d14abb8a, there was some duplication
with to-be-pulled branch and the development one, the latter with
the wrong formatting. Fixed in the next update.
