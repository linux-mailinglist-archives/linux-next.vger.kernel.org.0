Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6727338450
	for <lists+linux-next@lfdr.de>; Fri, 12 Mar 2021 04:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhCLDVH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Mar 2021 22:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbhCLDUf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Mar 2021 22:20:35 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FCDCC061761
        for <linux-next@vger.kernel.org>; Thu, 11 Mar 2021 19:20:35 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id t29so894652pfg.11
        for <linux-next@vger.kernel.org>; Thu, 11 Mar 2021 19:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DjdNOMaFcU4e2foCYh5TokMVxHNn3j89oLkPqKd3dks=;
        b=dQTkq3E2hZr897kEwjHE4FBioepjDR/GJp30imWYUpbO/d7epEPNCzEaeoPOe8Sq25
         8Bj0sqMt1zQFkagj0thE/swgzeHtc7S6jOCgfMbd6h+F56U+6tkWJLvzcsNPst18ybR4
         KNJKgQMA0VNzn1v6G/Q0WM+IQ0oDPpOT7imYOWkQEr0i7HJwbjjuUFD8WbExDE6eWTzr
         z3QwYHOiEgh0UpI+xWfGoNZ5pYVbwrDrTsSn2yci7GEFAOZvHG+umNFswx+b3Y8s3d2k
         8kYLtcf97BJaKjh1QNpA9i8UwcaTwbQuBEZNLrT60ydVVappiWLPCm4Sh+XhqSFpn01v
         8OgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DjdNOMaFcU4e2foCYh5TokMVxHNn3j89oLkPqKd3dks=;
        b=St3j5EhvXSd0dqoVdpdpW7j1xdAIm7RkIq+47kDmYHQhpX1uFBfZV7vt8BxuFk6s4F
         DGs9NJKZ2KzBfh5QNaJWyooqTSQD9OD3MIdMxqrKGEPmqaqUf90f/PHqrVikuCaf4mgw
         oOpR98XRqh3iSpx2mDtOvnzPA7ax0HdvBHHng8m8v07Lz+Hy9Xdpwo2y/rLdz/uAhTkv
         MeGp/suzIHVJPbsvMh5ubXe4vMFPUQHkt0H/M6gey3HnJfRjzMoOTK9d9bxKHITIFivJ
         ZW/JX2MC6FfVM8vaO1hFRB0udRXe5T8UgHA0T6cg8tpIQKbUOO237Vi+awzuNVu1j88d
         gI3A==
X-Gm-Message-State: AOAM532c6EGqXAAUE2YEAnuqSV+yee8wQljRttLHmUxaA4EDamIGHlVG
        jbvrCHGaiMnTBbW4/X3yObQXef8iA+SsgA==
X-Google-Smtp-Source: ABdhPJxQPggg8rqEw+UFpSTWLIJV06QXAWCnJSBaMZGDDK2QLUpzxmzKcAs5b71rutv8ot06LqOUfQ==
X-Received: by 2002:a63:695:: with SMTP id 143mr9674961pgg.314.1615519234558;
        Thu, 11 Mar 2021 19:20:34 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id n24sm3602575pgl.27.2021.03.11.19.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 19:20:33 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Douglas Gilbert <dgilbert@interlog.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210312141744.0022d5f5@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d5200097-771d-b565-dabf-0aad3fc2ea8d@kernel.dk>
Date:   Thu, 11 Mar 2021 20:20:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210312141744.0022d5f5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/11/21 8:17 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scsi-mkp tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> 
> drivers/scsi/sg.c: In function 'sg_mk_kern_bio':
> drivers/scsi/sg.c:2958:17: error: 'BIO_MAX_PAGES' undeclared (first use in this function); did you mean 'BIO_MAX_VECS'?
>  2958 |  if (bvec_cnt > BIO_MAX_PAGES)
>       |                 ^~~~~~~~~~~~~
>       |                 BIO_MAX_VECS
> 
> Caused by commit
> 
>   b32ac463cb59 ("scsi: sg: NO_DXFER move to/from kernel buffers")
> 
> interacting with commit
> 
>   a8affc03a9b3 ("block: rename BIO_MAX_PAGES to BIO_MAX_VECS")
> 
> from the block tree.
> 
> I have applied the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 12 Mar 2021 14:11:16 +1100
> Subject: [PATCH] scsi: sg: fix up for BIO_MAX_PAGES rename
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/scsi/sg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
> index 2d4bbc1a1727..6b31b2bc8f9a 100644
> --- a/drivers/scsi/sg.c
> +++ b/drivers/scsi/sg.c
> @@ -2955,7 +2955,7 @@ sg_mk_kern_bio(int bvec_cnt)
>  {
>  	struct bio *biop;
>  
> -	if (bvec_cnt > BIO_MAX_PAGES)
> +	if (bvec_cnt > BIO_MAX_VECS)
>  		return NULL;
>  	biop = bio_alloc(GFP_ATOMIC, bvec_cnt);
>  	if (!biop)

Looks good - fwiw, the block change will go into 5.12-rc3 to avoid
having this issue over a merge window prep, so maybe SCSI can pull
in -rc3 and get this resolved locally in that tree.

I'll rebase the block-5.12 branch off -rc1 after this merge.

-- 
Jens Axboe

