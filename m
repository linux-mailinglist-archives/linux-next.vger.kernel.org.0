Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C642411051
	for <lists+linux-next@lfdr.de>; Mon, 20 Sep 2021 09:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhITHlS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 03:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbhITHlS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Sep 2021 03:41:18 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C3EC061574;
        Mon, 20 Sep 2021 00:39:51 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E7B46C6485; Mon, 20 Sep 2021 08:39:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1632123588; bh=0/bhxtZxU94hLRQGcSSApdgRehdLhbjF12BTsZCILuI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cy4foTVuXQ0ebjygGeqVZNBfCSCQ/GXe4nwNCXLc7adWQvJxHq0S6czgOWh/jC+VO
         g4HMFhuF3ck/MDqOPxjNyJITxafXGQaUP/6l1h57T6u6WUOKRQrla4wL3OXvGl9f71
         0ivTpGfHlmov9O77bz5qvJMs+msluI1ekzqF9zJdoWQ5Z2L6mKvdyJ6hrvIN43Fvzz
         +3hKWpPQFOVYvmwg5ZvbopQzwp8O6wX4ZX+NRjVlvdzpZTIiFwfTqoG9pmakop/ccd
         0YhOY8Le8fVcpwghC32gBDVf2DlmHWrKizd3gFkGx4+rZ75Fxl+I/AIcaoU/dsQivD
         Po5EscDEVE0xg==
Date:   Mon, 20 Sep 2021 08:39:48 +0100
From:   Sean Young <sean@mess.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb-next tree
Message-ID: <20210920073948.GA8800@gofer.mess.org>
References: <20210920101948.34a93713@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920101948.34a93713@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mauro,

On Mon, Sep 20, 2021 at 10:19:48AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the v4l-dvb-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/media/rc/ir_toy.c: In function 'irtoy_tx':
> drivers/media/rc/ir_toy.c:332:36: error: 'STATE_RESET' undeclared (first use in this function)
>   332 |        sizeof(COMMAND_SMODE_EXIT), STATE_RESET);
>       |                                    ^~~~~~~~~~~
> drivers/media/rc/ir_toy.c:332:36: note: each undeclared identifier is reported only once for each function it appears in
> 
> Caused by commit
> 
>   6a014f20734d ("media: ir_toy: allow tx carrier to be set")

This commit renames STATE_RESET to STATE_COMMAND_NO_RESP.
 
> interacting with commit
> 
>   f0c15b360fb6 ("media: ir_toy: prevent device from hanging during transmit")

This commit uses STATE_RESET.

> from the v4l-vdb-fixes tree.
> 
> I have applied the following merge fix patch for today.

I'm not sure what the best solution is here. Once commit f0c15b360fb6 makes
it into Linus' tree and then is merged back into mediastage, commit
6a014f20734d can be rebased.

Thanks
Sean

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 20 Sep 2021 10:14:37 +1000
> Subject: [PATCH] fix for "media: ir_toy: allow tx carrier to be set"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/media/rc/ir_toy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
> index 9ea91d418635..71aced52248f 100644
> --- a/drivers/media/rc/ir_toy.c
> +++ b/drivers/media/rc/ir_toy.c
> @@ -329,7 +329,7 @@ static int irtoy_tx(struct rc_dev *rc, uint *txbuf, uint count)
>  	// with its led on. It does not respond to any command when this
>  	// happens. To work around this, re-enter sample mode.
>  	err = irtoy_command(irtoy, COMMAND_SMODE_EXIT,
> -			    sizeof(COMMAND_SMODE_EXIT), STATE_RESET);
> +			    sizeof(COMMAND_SMODE_EXIT), STATE_COMMAND_NO_RESP);
>  	if (err) {
>  		dev_err(irtoy->dev, "exit sample mode: %d\n", err);
>  		return err;
> -- 
> 2.32.0
> 
> -- 
> Cheers,
> Stephen Rothwell


