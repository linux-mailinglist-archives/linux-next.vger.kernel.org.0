Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557932D1A52
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 21:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgLGUKs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 15:10:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgLGUKs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 15:10:48 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFEFC061793
        for <linux-next@vger.kernel.org>; Mon,  7 Dec 2020 12:10:01 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id m19so21276368ejj.11
        for <linux-next@vger.kernel.org>; Mon, 07 Dec 2020 12:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VHkQ+nvBXFrXSg5QgxUT/Yn56AfAZWnctyqudGP7iUE=;
        b=NdkdTrrA5p42HjeOlz0rWUorqj4muvH/RFJi6l0l8OboMEXUxYIhoqM/MZcqMfKzvp
         1srKSYLbICw0sW1Fd0OTzJEwV+++qWSaXwR/mDhEns1bzJ2gUA4fOtBKsZKQQO1Ici7e
         yVDYDHeBuxEl6p6QsI6bTUH9jQ464LXMNjy9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VHkQ+nvBXFrXSg5QgxUT/Yn56AfAZWnctyqudGP7iUE=;
        b=NuyU8kNKOXwOZAkEeCIHjdO79XYsP9oiP3qiCE8zU67NdRh7rdHbZSg6MpVpSlJ67T
         r25cRfePS2Bv2PTpSI7bL1Nqt6CL7Mp6JLqy0Wx0nZswy0kSewBRj2gsjHIqxsGIP++x
         Wq9uDAp96dgq7VnPKmQtW/11C6KPxbszQSYijgJp3jgxSKNJt7aaLaJJTg5uKbxw9oMO
         BuBGAQ3slL3D27zZsnSRUuxMpP8rVPkF+CIzoSeyu11on3StN3IjqIPpFACMz+7CUTWm
         O21kIau0BtHZhnvqwuF4O5qdclShF+WSbf5RcSC4/udSNC3XgjkkkOeRr5UuMZDw5tNB
         /c7A==
X-Gm-Message-State: AOAM531lCX/0zxsgrHfD6oNY+wLTEOL4Tl0vSSZeF5G3yh30gwzr64kH
        Eq3rb/wV+Asos6PiOUzozcPFmg==
X-Google-Smtp-Source: ABdhPJx2HCFhhVuarEHcEMJ8qFlJOBz7hbByeE4q9TY68GtLeatN4Gj6Gt/PZIN2M6/ugn08HNdi0w==
X-Received: by 2002:a17:906:1393:: with SMTP id f19mr20374282ejc.431.1607371800463;
        Mon, 07 Dec 2020 12:10:00 -0800 (PST)
Received: from ?IPv6:2a04:ee41:4:1318:ea45:a00:4d43:48fc? ([2a04:ee41:4:1318:ea45:a00:4d43:48fc])
        by smtp.gmail.com with ESMTPSA id t8sm14048952eju.69.2020.12.07.12.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 12:09:59 -0800 (PST)
Message-ID: <046e725cf72ddae459cc9f5624402a1590307524.camel@chromium.org>
Subject: Re: linux-next: build failure after merge of the block tree
From:   Florent Revest <revest@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Networking <netdev@vger.kernel.org>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Florent Revest <revest@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Mon, 07 Dec 2020 21:09:59 +0100
In-Reply-To: <20201207140951.4c04f26f@canb.auug.org.au>
References: <20201207140951.4c04f26f@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2020-12-07 at 14:09 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/io_uring.c: In function 'io_shutdown':
> fs/io_uring.c:3782:9: error: too many arguments to function
> 'sock_from_file'
>  3782 |  sock = sock_from_file(req->file, &ret);
>       |         ^~~~~~~~~~~~~~
> In file included from fs/io_uring.c:63:
> include/linux/net.h:243:16: note: declared here
>   243 | struct socket *sock_from_file(struct file *file);
>       |                ^~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   36f4fa6886a8 ("io_uring: add support for shutdown(2)")
> 
> interacting with commit
> 
>   dba4a9256bb4 ("net: Remove the err argument from sock_from_file")
> 
> from the bpf-next tree.
> 
> I have applied the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 7 Dec 2020 14:04:10 +1100
> Subject: [PATCH] fixup for "net: Remove the err argument from
> sock_from_file"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/io_uring.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index cd997264dbab..91d08408f1fe 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -3779,9 +3779,9 @@ static int io_shutdown(struct io_kiocb *req,
> bool force_nonblock)
>  	if (force_nonblock)
>  		return -EAGAIN;
>  
> -	sock = sock_from_file(req->file, &ret);
> +	sock = sock_from_file(req->file);
>  	if (unlikely(!sock))
> -		return ret;
> +		return -ENOTSOCK;
>  
>  	ret = __sys_shutdown_sock(sock, req->shutdown.how);
>  	io_req_complete(req, ret);
> -- 
> 2.29.2


Thanks Stephen, this looks good to me.

