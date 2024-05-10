Return-Path: <linux-next+bounces-2260-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F648C1EED
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 09:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 695271F21B93
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 07:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D70215E81F;
	Fri, 10 May 2024 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQPMddhw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5640915279B;
	Fri, 10 May 2024 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715325746; cv=none; b=mdIb1Yuq97lPhNNwI6x4Ow8LgfgvRnLhQ5bWNJOqc9vmtFsDUL0CQBKvo/N7+LAm/+QGhule8qNtO5d5xpmCPz6KcV/4+owqh9uZ1Z9c4PBBCR+uHozR1J6U3O2isBSrgPlygBoabvup9SsP2JW0p/ampzWEXHBLuznaLly1+eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715325746; c=relaxed/simple;
	bh=EzdfZ0kpf3fhUbIFDljCEYBvplIrKON70GWCiQd1UDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VaRo/XLDdR4il2fdNXqZsc4jwpfLFF6cLyxsLEW6tJYyzXbqsD6bh987+rfZUBiEza59Gl1YyXWtjx/LSWouzRH1U8V3MasfGXpm+TOk7spqhfF+vMpW0Ysqan3sSe7t3YfBwj15ybwgKGu/fcKnveHYXMnpF3LA43ztW5QdOe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQPMddhw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4962DC113CC;
	Fri, 10 May 2024 07:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715325746;
	bh=EzdfZ0kpf3fhUbIFDljCEYBvplIrKON70GWCiQd1UDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iQPMddhweUBjd9ncDSrkcRN3oMPdHf4DboeeRHGz8m9kRzalpIecEE5K2u4Kr6CBR
	 x9HZsB/Cvuz1fw69VhodG65NIhgtGF/miuq7c5g4WoCaZVUD18fMjRI9TAofvOyOo3
	 iJSf23KyS6oZdoU/77MnMhxNbOcJJeTTQ8Tt8pCndYkk0W7yg2vnl58omSssN4zZ8X
	 wgoE8y3xFTEiFIOmFrSe2TO13uUPNH8fBKDWa/CkDu+cOHS/N9igs8yKIStmugXkw5
	 I9wHUEcxnHf8oe5XHnLN1I2lIrRYFEtrkt3fypgnjgG/F2l/c9OFa0MpvgaVxOxdxF
	 VO9LiiMR4fWtw==
Message-ID: <3f293b59-0992-4d39-8473-283a8dcbbf43@kernel.org>
Date: Fri, 10 May 2024 16:22:24 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>,
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240510131003.70f46881@canb.auug.org.au>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240510131003.70f46881@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/10/24 12:10, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> block/blk-zoned.c: In function 'blk_zone_write_plug_bio_endio':
> block/blk-zoned.c:1260:25: error: 'struct block_device' has no member named 'bd_has_submit_bio'
>  1260 |         if (bio->bi_bdev->bd_has_submit_bio)
>       |                         ^~
> block/blk-zoned.c: In function 'blk_zone_wplug_bio_work':
> block/blk-zoned.c:1329:17: error: 'struct block_device' has no member named 'bd_has_submit_bio'
>  1329 |         if (bdev->bd_has_submit_bio)
>       |                 ^~
> 
> Caused by commit
> 
>   dd291d77cc90 ("block: Introduce zone write plugging")
> 
> interacting with commit
> 
>   ac2b6f9dee8f ("bdev: move ->bd_has_subit_bio to ->__bd_flags")
> 
> from the vfs tree.
> 
> I have applied the following merge resolution patch.

Looks good to me. Thanks Stephen !

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 10 May 2024 12:59:09 +1000
> Subject: [PATCH] fix up for "bdev: move ->bd_has_subit_bio to ->__bd_flags"
> 
> interacting with "block: Introduce zone write plugging".
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  block/blk-zoned.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
> index 57d367ada1f2..03aa4eead39e 100644
> --- a/block/blk-zoned.c
> +++ b/block/blk-zoned.c
> @@ -1257,7 +1257,7 @@ void blk_zone_write_plug_bio_endio(struct bio *bio)
>  	 * is not called. So we need to schedule execution of the next
>  	 * plugged BIO here.
>  	 */
> -	if (bio->bi_bdev->bd_has_submit_bio)
> +	if (bdev_test_flag(bio->bi_bdev, BD_HAS_SUBMIT_BIO))
>  		disk_zone_wplug_unplug_bio(disk, zwplug);
>  
>  	/* Drop the reference we took when entering this function. */
> @@ -1326,7 +1326,7 @@ static void blk_zone_wplug_bio_work(struct work_struct *work)
>  	 * path for BIO-based devices will not do that. So drop this extra
>  	 * reference here.
>  	 */
> -	if (bdev->bd_has_submit_bio)
> +	if (bdev_test_flag(bdev, BD_HAS_SUBMIT_BIO))
>  		blk_queue_exit(bdev->bd_disk->queue);
>  
>  put_zwplug:

-- 
Damien Le Moal
Western Digital Research


