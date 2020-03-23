Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBA018F239
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 10:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbgCWJ4w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Mar 2020 05:56:52 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42299 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727793AbgCWJ4w (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Mar 2020 05:56:52 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 077E35C01CF;
        Mon, 23 Mar 2020 05:56:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 23 Mar 2020 05:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=wgbXdMR5Fy5EoV2nT9ZPQ25D44q
        Kl+2Q83gfeD4WsWA=; b=nshXgbiGIQu+izkBtG8tT/GEKL4mlWche5RCX/MlhZy
        B8ebR3mFX0SOHAXIspoWjrvDc9V3ETYadmxss3/kr/MxHGoR0uPgYv6R3mQwE3Fx
        V7URTIuMgJW9FroS5GPyXGrvhMx7INYPD3RIWbHcXiY71MA4Rmvu8uz8lgln1S6p
        vBOyOFegoaOrZD1vNwn1bMvnKHOjSBIeeaEoq/xLNYG8f7JdBlxl4o6uN9Q+xWaY
        2ugXa7fJngedIVWdwoDlPwKvgMvUgFuLdzmFjO2Khtxg9r9LIx63pkp3g6hs57xk
        5x12Qj/Rm1TkAT5/pXGyDAc3jnSK/flEIpuXwwJgSGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wgbXdM
        R5Fy5EoV2nT9ZPQ25D44qKl+2Q83gfeD4WsWA=; b=L+/GePl+SdIY0cknem8U2P
        5WTH8v4cB/yDVJ2d3Q9torbs8tVeXMPRF7xT7sC6b+2TcJBqVsEIacYv/dZMXqri
        Xb0wmnY+6z1kV+Z9jIlXAbAp+eNblFkklbx0WZxpwxKDRR88y4UkYH/MSDfG8ZYU
        4p/6EWkm7kDInYOG23T6RpJCs5U3HNti0UiCbLodb+doo/+hH2bTtTewcp4AYyH0
        4mt1mKfveFF/iOOKCVQkmNXOAOaElVpA8wEMA9sImg2zU/+nuay7v66PUPR40naK
        v2NkC0IGmKnZ303AaBQToCGrc7Tbk1fdm39JMb/zLl2HwTTX/SHsK6cTxZBkQFwA
        ==
X-ME-Sender: <xms:34d4Xi6Ytc5JcWWDM4SBt2M1VBog0H0upnvEsQHoF5okksU2LbAhQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegkedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:34d4XohrD5UDyKXTlqsKRqSJy1qBjo9Oy2HsobcoR_Vt6KiDk1CHkQ>
    <xmx:34d4Xn1erQc4iie6eRx422uUbdV-3iynpjDgLhWXJGdSBiE0M00i_A>
    <xmx:34d4XpAff2Y8txk_l3ufAqnvhrgGsA3KG4k3NKi_kxsNSf3c_57c1g>
    <xmx:4Yd4XgAC1XEAPGdfYvICAwXAbJRloID6AkatzG7ZKrOfp708bhbcKg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6F1EE328005D;
        Mon, 23 Mar 2020 05:56:47 -0400 (EDT)
Date:   Mon, 23 Mar 2020 10:56:45 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Colin Ian King <colin.king@canonical.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Chuhong Yuan <hslester96@gmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Message-ID: <20200323095645.GC425358@kroah.com>
References: <20200323151805.6a166c84@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323151805.6a166c84@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 23, 2020 at 03:18:05PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/media/allegro-dvt/allegro-core.c
> 
> between several commits from the v4l-dvb tree and commits:
> 
>   5979afa2c4d1 ("staging: Replace zero-length array with flexible-array member")
>   e3d21cbfa978 ("staging: media: allegro: align with parenthesis")
> 
> from the staging tree.
> 
> I fixed it up (see bottom and below merge fix patch) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 23 Mar 2020 15:12:50 +1100
> Subject: [PATCH] fix up for "staging: Replace zero-length array with flexible-array member"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/staging/media/allegro-dvt/allegro-mail.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
> index 1fd36f65be78..17db665f8e1e 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-mail.h
> +++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
> @@ -169,7 +169,7 @@ struct mcu_msg_push_buffers_internal_buffer {
>  struct mcu_msg_push_buffers_internal {
>  	struct mcu_msg_header header;
>  	u32 channel_id;
> -	struct mcu_msg_push_buffers_internal_buffer buffer[0];
> +	struct mcu_msg_push_buffers_internal_buffer buffer[];
>  } __attribute__ ((__packed__));
>  
>  struct mcu_msg_put_stream_buffer {
> -- 
> 2.25.0
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/staging/media/allegro-dvt/allegro-core.c
> index 34c3e55be902,1162cc38f3fc..000000000000
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@@ -2403,19 -2324,12 +2403,19 @@@ static int allegro_open(struct file *fi
>   			0, ALLEGRO_GOP_SIZE_MAX,
>   			1, channel->gop_size);
>   	v4l2_ctrl_new_std(handler,
> - 			&allegro_ctrl_ops,
> - 			V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
> - 			1, 32,
> - 			1, 1);
> + 			  &allegro_ctrl_ops,
> + 			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
> + 			  1, 32,
> + 			  1, 1);
>  +	if (handler->error != 0) {
>  +		ret = handler->error;
>  +		goto error;
>  +	}
>  +
>   	channel->fh.ctrl_handler = handler;
>   
>  +	v4l2_ctrl_cluster(3, &channel->mpeg_video_bitrate_mode);
>  +
>   	channel->mcu_channel_id = -1;
>   	channel->user_id = -1;
>   



Looks good, thanks!

greg k-h
