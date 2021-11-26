Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B1D45E768
	for <lists+linux-next@lfdr.de>; Fri, 26 Nov 2021 06:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234410AbhKZFfy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Nov 2021 00:35:54 -0500
Received: from verein.lst.de ([213.95.11.211]:44672 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235633AbhKZFdy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Nov 2021 00:33:54 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 61A1B68AFE; Fri, 26 Nov 2021 06:30:38 +0100 (CET)
Date:   Fri, 26 Nov 2021 06:30:38 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Ming Lei <ming.lei@redhat.com>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20211126053038.GA21893@lst.de>
References: <20211126103857.50628410@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126103857.50628410@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 26, 2021 at 10:38:57AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   block/bdev.c
> 
> between commit:
> 
>   efcf5932230b ("block: avoid to touch unloaded module instance when opening bdev")
> 
> from Linus' tree and commit:
> 
>   a1525fbf1d76 ("block: remove the GENHD_FL_HIDDEN check in blkdev_get_no_open")
> 

The merge looks good, thanks.
