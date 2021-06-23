Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075563B1AF1
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 15:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhFWNUH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 09:20:07 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:45892 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbhFWNUG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 09:20:06 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 979021FD66;
        Wed, 23 Jun 2021 13:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1624454267;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dfMFKHsJyGe6s9j3AqCisKZpKc5CSt1HEdHK/3NyuME=;
        b=woyana/IiU5yttk+2vl/QvcSpKjkgFGg/Fb0XKyTObiC0WX/5kGgh6pdPSBuVRaspBPJYU
        7e10+GpRXkBUIPIGvQ36kc9QuSyoOKY/zRl78g6mILgwelkjw89NBtnxtbqonAtOV2piFS
        iF78aA17EAsgVUqiZJHkXmAHQ6XdsPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1624454267;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dfMFKHsJyGe6s9j3AqCisKZpKc5CSt1HEdHK/3NyuME=;
        b=XqqwpdxeUJurOnzzfnldw/wN6bNAgU9OGyANMCusLZtpwx4SMh8dEvm7/ESDBkAiBAR8ht
        8g/PC4Ex3/42d0Aw==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
        by relay2.suse.de (Postfix) with ESMTP id 6F656A3BAE;
        Wed, 23 Jun 2021 13:17:47 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 0D0EEDA8D6; Wed, 23 Jun 2021 15:14:55 +0200 (CEST)
Date:   Wed, 23 Jun 2021 15:14:55 +0200
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kspp-gustavo tree
Message-ID: <20210623131455.GM28158@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210623083901.1d49d19d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623083901.1d49d19d@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 23, 2021 at 08:39:01AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp-gustavo tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_get_token_16':
> fs/btrfs/struct-funcs.c:80:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>    80 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~

The warning is correct, on powerpc and 64k pages the array has only 1
item, ie. only index 0 is valid. The overflow won't happen in practice
though because of previous branch that would happen in 100% cases. The
code handles when some bytes cross 2 pages but on 64k pages it's all
just one page.

To allow the warning to be enabled globally we'll fix it, I'll let
Gustavo know once it's done.
