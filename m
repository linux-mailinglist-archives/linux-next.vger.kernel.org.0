Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312B9442BC3
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 11:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhKBKqA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 06:46:00 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:58026 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhKBKp4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 06:45:56 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 373171FD4C;
        Tue,  2 Nov 2021 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1635849801;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iP9s5V68lnmmTWr/35lppAJ3NsqUjQUeGHNbsNNDic8=;
        b=mg1bPRBt6cHoKnFO/ho29dEvaq3izz1fojn5fvSu1syy1vryPVM3u49EUFn6Jzoj722swF
        vb7Qe4LVnVSV7/I/56qWaly9uhY779xtwEViaDL8liQr/Vn6neaw8QTUGbpWm9dWH2EBtx
        uha1LUoFyFmrUQmYr4Tj1XuTHqv/NZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1635849801;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iP9s5V68lnmmTWr/35lppAJ3NsqUjQUeGHNbsNNDic8=;
        b=rNE42V13llB/6+zJuJVjoxqiDp6Lrrc0jO+iMYB8eBzHuzLIwgtBg6UO7XO0T5wCD61sN5
        hF1103EsBDvnEeCw==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
        by relay2.suse.de (Postfix) with ESMTP id 2C70DA3B87;
        Tue,  2 Nov 2021 10:43:20 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 73E17DA7A9; Tue,  2 Nov 2021 11:42:44 +0100 (CET)
Date:   Tue, 2 Nov 2021 11:42:44 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Sterba <dsterba@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Qu Wenruo <wqu@suse.com>
Subject: Re: linux-next: manual merge of the btrfs tree with Linus' tree
Message-ID: <20211102104244.GH20319@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        David Sterba <dsterba@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Qu Wenruo <wqu@suse.com>
References: <20211101105341.5fde8108@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101105341.5fde8108@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 01, 2021 at 10:53:41AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the btrfs tree got a conflict in:
> 
>   fs/btrfs/lzo.c
> 
> between commit:
> 
>   ccaa66c8dd27 ("Revert "btrfs: compression: drop kmap/kunmap from lzo"")
> 
> from Linus' tree and commit:
> 
>   d4088803f511 ("btrfs: subpage: make lzo_compress_pages() compatible")
> 
> from the btrfs tree.
> 
> I fixed it up (this may be completely wrong or incomplete :-( - see below)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Thanks, it's a bit different that I did as a proposed conflict
resulution and Linus resolved it in a yet another way. I'll refresh my
for-next branch today to minimize the conflict surface.
