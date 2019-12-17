Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAF6B122CC0
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 14:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbfLQNTm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 08:19:42 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35840 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfLQNTm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Dec 2019 08:19:42 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so3146413wma.1
        for <linux-next@vger.kernel.org>; Tue, 17 Dec 2019 05:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H37dVUR9kItBvLUhcmZ+2qSu16q4UES9ihUAcWiQsd4=;
        b=lWK6Tmlb4CiC9XzLfvUIj8N5I8DLeA+H1Y7mjuOk755VqB9iDzMMLxdGwdLFY85lVw
         4sqlcrnt3Az8PoDhFaiD36oyNuhg5c54qQM3qcCNlFI3OkXedhTO/ufNX/oRgkPlyvFo
         PqZBPbGE42+XNecHMEWm3VvJY/RrrIL0uLgko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=H37dVUR9kItBvLUhcmZ+2qSu16q4UES9ihUAcWiQsd4=;
        b=IzXipLcwiUh5Z4eJ02awnsvA9mXIGCzYQZ6hbcR12kIiwKN23cC6yHnkb9ucOoO9Gc
         jUI/5fJ/nEytFSGaEUuUuqV1hS2N9tAXBbX1++64AvVm5k8duDMliXw36UpzWCG8wok8
         xB84jXcjJr2Bcc9J0rbT66O49UAp76/tUY4wu+Uxqwkf0+SEIl7ivot9r89iIaAkA5se
         1le+rRb+TLqJakucg3aCP7iFC5k6O3QTtHHSuI9NLHyYsNY+enJjz+1QI2GuQbDU4i25
         6FuXpYMU1OOo6x/22jFqczy+pwBpiAseLLw72yYHyOcFaOz32a5ydtAYHttYYhfeMK6a
         9iZQ==
X-Gm-Message-State: APjAAAWrOH0t74OU3wSjlW4pCaK6bf/JXJLqddOhgjkA0DiyxQm3thav
        efF8m0g25jifrWcLvbwbAkt9ig==
X-Google-Smtp-Source: APXvYqzliw8g7eRzBJ1o76RhQOcEfDchV4RUR+NMlKni9Ot6SqnYzUe0jGJN/na2F7kQol/nHxfaqw==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr5421444wml.103.1576588780369;
        Tue, 17 Dec 2019 05:19:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
        by smtp.gmail.com with ESMTPSA id f1sm25264661wru.6.2019.12.17.05.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 05:19:39 -0800 (PST)
Date:   Tue, 17 Dec 2019 14:19:37 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20191217131937.GZ624164@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>
References: <20191216122331.43c766f1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216122331.43c766f1@canb.auug.org.au>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 16, 2019 at 12:23:31PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/bridge/analogix/analogix-anx6345.c: In function 'anx6345_i2c_probe':
> drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:30: error: implicit declaration of function 'i2c_new_dummy' [-Werror=implicit-function-declaration]
>   738 |    anx6345->i2c_clients[i] = i2c_new_dummy(client->adapter,
>       |                              ^~~~~~~~~~~~~
> drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:28: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   738 |    anx6345->i2c_clients[i] = i2c_new_dummy(client->adapter,
>       |                            ^
> 
> Caused by commit
> 
>   6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> 
> interacting with commit
> 
>   2c2f00ab1641 ("i2c: remove i2c_new_dummy() API")
> 
> From Linus' tree.
> 
> I have applied the following fix up patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 16 Dec 2019 12:11:19 +1100
> Subject: [PATCH] drm/bridge: fix up for removal of i2c_new_dummy()
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks pulled into drm-next since I just processed the first drm-misc-next
pull.
-Daniel

> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index 9917ce0d86a0..56f55c53abfd 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -735,13 +735,13 @@ static int anx6345_i2c_probe(struct i2c_client *client,
>  	/* Map slave addresses of ANX6345 */
>  	for (i = 0; i < I2C_NUM_ADDRESSES; i++) {
>  		if (anx6345_i2c_addresses[i] >> 1 != client->addr)
> -			anx6345->i2c_clients[i] = i2c_new_dummy(client->adapter,
> +			anx6345->i2c_clients[i] = i2c_new_dummy_device(client->adapter,
>  						anx6345_i2c_addresses[i] >> 1);
>  		else
>  			anx6345->i2c_clients[i] = client;
>  
> -		if (!anx6345->i2c_clients[i]) {
> -			err = -ENOMEM;
> +		if (IS_ERR(anx6345->i2c_clients[i])) {
> +			err = PTR_ERR(anx6345->i2c_clients[i]);
>  			DRM_ERROR("Failed to reserve I2C bus %02x\n",
>  				  anx6345_i2c_addresses[i]);
>  			goto err_unregister_i2c;
> -- 
> 2.24.0
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
