Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 407F77B5114
	for <lists+linux-next@lfdr.de>; Mon,  2 Oct 2023 13:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236632AbjJBLVs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Oct 2023 07:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236626AbjJBLVr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Oct 2023 07:21:47 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E64BF;
        Mon,  2 Oct 2023 04:21:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 02CC11F460;
        Mon,  2 Oct 2023 11:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1696245703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Jn+IPu4jUjeHXqoTk9a25cZdn5INxLAToZsVAEMdd1U=;
        b=t1o/nMvklGqtCsyNUhAwuWdrgvI4fHB/yJF16C68AZLSBJHOYdYIPGavIG188k1sDvwvAP
        oPMxtOmaUpd+oGLP8agTR+qPokroZp6/G2/n2SsUnAT8pfVuE2iZFRkMmDL/TOCTUbVqqp
        oTeZr7ycQSWuqn/KpSuNzWTPgxY1y/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1696245703;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Jn+IPu4jUjeHXqoTk9a25cZdn5INxLAToZsVAEMdd1U=;
        b=RGWUVz7J5mMRjTTq2zLv8odl2DvWnOKQwmzmUzo47qoAY+VTgSvke7/upkb4AEiegeDQ/5
        5bSklQJgPHcIs+Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E7D1713456;
        Mon,  2 Oct 2023 11:21:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 74WOOManGmXEAQAAMHmgww
        (envelope-from <jack@suse.cz>); Mon, 02 Oct 2023 11:21:42 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
        id 7D544A07C9; Mon,  2 Oct 2023 13:21:42 +0200 (CEST)
Date:   Mon, 2 Oct 2023 13:21:42 +0200
From:   Jan Kara <jack@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Brauner <brauner@kernel.org>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20231002112142.bfjj54ikijf4iwfr@quack3>
References: <20230928105443.1b1ad98c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928105443.1b1ad98c@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi!

On Thu 28-09-23 10:54:43, Stephen Rothwell wrote:
> After merging the vfs-brauner tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> fs/bcachefs/super-io.c: In function 'bch2_free_super':
> fs/bcachefs/super-io.c:166:17: error: implicit declaration of function 'blkdev_put'; did you mean 'bdi_put'? [-Werror=implicit-function-declaration]
>   166 |                 blkdev_put(sb->bdev, sb->holder);
>       |                 ^~~~~~~~~~
>       |                 bdi_put
> fs/bcachefs/super-io.c: In function 'bch2_read_super':
> fs/bcachefs/super-io.c:687:20: error: implicit declaration of function 'blkdev_get_by_path'; did you mean 'bdev_open_by_path'? [-Werror=implicit-function-declaration]
>   687 |         sb->bdev = blkdev_get_by_path(path, sb->mode, sb->holder, &bch2_sb_handle_bdev_ops);
>       |                    ^~~~~~~~~~~~~~~~~~
>       |                    bdev_open_by_path
> fs/bcachefs/super-io.c:687:18: error: assignment to 'struct block_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
>   687 |         sb->bdev = blkdev_get_by_path(path, sb->mode, sb->holder, &bch2_sb_handle_bdev_ops);
>       |                  ^
> fs/bcachefs/super-io.c:693:26: error: assignment to 'struct block_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
>   693 |                 sb->bdev = blkdev_get_by_path(path, sb->mode, sb->holder, &bch2_sb_handle_bdev_ops);
>       |                          ^
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   953863a5a2ff ("block: Remove blkdev_get_by_*() functions")
> 
> interacting with commit(s) from the bcachefs tree.
> 
> I would have reverted that commit for today, except I used the old
> vfs-brauner tree due to another build failure.  Can we just delay this
> one commit until after bcachefs has been converted (and any other
> references that may be added are fixed)?

Yeah, I guess removing the final commit is the easiest solution at this
point. It complicates a bit the series to disallow writing to mounted block
devices which bases on this - either I have to pospone that to the next
cycle after we convert bcachefs or I have to find a way for the old
blkdev_get_by_path() API and the new functionality to coexist. I'll think
about that.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
