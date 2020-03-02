Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A44A4175E18
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 16:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgCBPXw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 10:23:52 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33534 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbgCBPXw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2020 10:23:52 -0500
Received: by mail-lj1-f193.google.com with SMTP id f13so3354144ljp.0;
        Mon, 02 Mar 2020 07:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MaY5BjX4U0fw7Jc2pnXPLi9P/wkj0pbZKNkb4xe1iTs=;
        b=bk5FPeMujjrQIxwztnaeLzsDAZ8hSzf0Ur2Sd5Rw1+OOI8XgxcXlq+757qMIi2IAfI
         nmWvRjOLNdTo33+iN/ChsCkkrQdanwlIaGkYx8eybYWlJWGveRI++Cxj8sLMItESn5FW
         Aid01MknW03NDPOT0aeQqJ2W6WcMzHp/ynkNO2ZqXvWbkIkLhL0iH9vm5yzFhhJgXXvI
         Nmf6l9jp6250rlbm9i3TC0VZXV42/oqMink55w8ULqAtaoC3AJ/FoB60CaC7rPA0Ec6Y
         JHHFePn4gf5db2aVw6txSwhuLb2pDvcBwqz8u8wlkQHiTYtVR75nzBWIGN175nT0LM01
         0eMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MaY5BjX4U0fw7Jc2pnXPLi9P/wkj0pbZKNkb4xe1iTs=;
        b=lNsszS4WJu7Fw7VHBYI3F5uQke8iN9aaG3txDbSTUdipvfkPWjCMQZIbWTF2WhAIXK
         TBp1YL1mkEngsIRQZ1NEa7btyWNfUWTwLg0wbt9FgxewaZwR6F4vT7x8APmmI2GHLZGw
         CA05huwFKM9cGDbWpuNLMR6PXnZT7hXKY1d9LYY24MLrJHgBK3JwjGE+rU3/tcQUEO/h
         anAsAPjhmJ0AdaI8EgaXfLUkPjvCnzWAUrI7LI1n4DVizRnkCS8LlZ/SFW43H4FsBhEg
         zYxE3GVef5KKdy4dbhX66+hMhLILl9YyS9+uJ6DLvSAMfYDicloKsnz+mwaUHWT4XFgL
         eqYg==
X-Gm-Message-State: ANhLgQ3svJ3J/RzOzBYQVeskrToesslpe1p/w6mJhhBoC4sm4RjW5cpq
        kYTUsaqMvd4eYI7k2xuizBY36WRdSvI=
X-Google-Smtp-Source: ADFU+vui28YnTdYfhFBZf4D3JtQhqKy7pmfetRgJ6cQjX3HFesG9cY/4EccMZdh/OEVowcaEndAbtQ==
X-Received: by 2002:a2e:b54a:: with SMTP id a10mr12277954ljn.47.1583162627814;
        Mon, 02 Mar 2020 07:23:47 -0800 (PST)
Received: from [172.31.190.83] ([86.57.146.226])
        by smtp.gmail.com with ESMTPSA id z9sm10226873lfq.48.2020.03.02.07.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 07:23:47 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the keys tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Howells <dhowells@redhat.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200302113737.7c3fdee0@canb.auug.org.au>
From:   Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <4bbc60e7-ae6e-fc83-4cc1-6229e8dc01ac@gmail.com>
Date:   Mon, 2 Mar 2020 18:23:46 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302113737.7c3fdee0@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/2/2020 3:37 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the keys tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:

Acked-by: Pavel Begunkov <asml.silence@gmail.com>
Thanks

> fs/io_uring.c: In function 'io_splice_punt':
> fs/io_uring.c:2473:6: error: too few arguments to function 'get_pipe_info'
>  2473 |  if (get_pipe_info(file))
>       |      ^~~~~~~~~~~~~
> In file included from include/linux/splice.h:12,
>                  from include/linux/skbuff.h:36,
>                  from include/linux/if_ether.h:19,
>                  from include/uapi/linux/ethtool.h:19,
>                  from include/linux/ethtool.h:18,
>                  from include/linux/netdevice.h:37,
>                  from include/net/sock.h:46,
>                  from fs/io_uring.c:64:
> include/linux/pipe_fs_i.h:267:25: note: declared here
>   267 | struct pipe_inode_info *get_pipe_info(struct file *file, bool for_splice);
>       |                         ^~~~~~~~~~~~~
> 
> Caused by commit
> 
>   549d46d3827d ("pipe: Add general notification queue support")
> 
> interacting with commit
> 
>   52b31bc9aabc ("io_uring: add splice(2) support")
> 
> from the block tree.
> 
> I have added the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 2 Mar 2020 11:27:27 +1100
> Subject: [PATCH] io_uring: fix up for get_pipe_info() API change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index fb8fe0bd5e18..8cdd3870cd4e 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -2470,7 +2470,7 @@ static int io_splice_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
>  
>  static bool io_splice_punt(struct file *file)
>  {
> -	if (get_pipe_info(file))
> +	if (get_pipe_info(file, true))
>  		return false;
>  	if (!io_file_supports_async(file))
>  		return true;
> 

-- 
Pavel Begunkov
