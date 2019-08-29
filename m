Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 392D4A1F6B
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 17:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfH2Plz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 11:41:55 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:44378 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfH2Plz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2019 11:41:55 -0400
Received: by mail-qt1-f193.google.com with SMTP id 44so4117353qtg.11;
        Thu, 29 Aug 2019 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4eHvQWz02lYfmzISh+lwZUFranhB1VYrBuGA/r6qFNk=;
        b=bxv8AfHyt8p6cieFdec+r1gud+aO2mzGeLcqwo+BPVEqDFseZurc3y7qMNE87smU7c
         U9EX1bkkMNfM0k832MQ4lIgZo3FWCtMGu7uVd8GQugS9ZVj/qb8w4fegJffU3hxasqTS
         5RQSIneeLfQ9ox/4piCmQvajFpkbzivTELG2cpPlw2qyi+JI1hEeCvd5zU1QCm13GQY3
         pD+JBijr5mXT41uKvZKNDRQS7L+9ZjecU9Acbdni59IZMGuTWFvtQerl6nYB8gZKeNZm
         OuiiVThWjPZpS+twBkJgzw79BsysSobBxYpo00hYrxgMrF0K28gPIgVZbXY4YdR+wEOr
         x8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=4eHvQWz02lYfmzISh+lwZUFranhB1VYrBuGA/r6qFNk=;
        b=efuGbnXzoOug0pbLsx8GsSSJY3mEKytAFMP7lnbPXZTLngvh9mswZbSW7hHXroyVIv
         ZBBjo0zGhm+Q/rhfBT1uJk/q1OBUneRqU7q3DeeyK5kqMk/4sCVtyGbFevZzJEBCen+I
         Uec/ZlHF5LXUGGgKtGIBp0CBdek6T/sxgf2qWVVRIlj6gM8pmsa66ArVndDOBvokg0ck
         36NE9UyXbXexyBbB9wy3jjD1Ma5tXpRzvBTkui3CplcWG9P7NyUxjCIXshJN2QVi73X1
         0cpNeZGjzOQicCZpPjIS5ZKOcR2jqov2AwZlUSbCrLDHzltJzWL6ZCD5fFYsxhmFNN2w
         d6cw==
X-Gm-Message-State: APjAAAXNfMv39URxEzryFHWEfGW5z5mCBkvjWDms4Bk2Mi9PSljFyA0U
        SL1ZkxtpME01Pm1I3i+2FhI=
X-Google-Smtp-Source: APXvYqz5RtB0jkgFRsB3RjrctiCbAuiExC3SbwAkqlDyFf4raTM6u/Y7iSn1J9AGdgm5y3MtwPrU/A==
X-Received: by 2002:ac8:43c5:: with SMTP id w5mr10384344qtn.280.1567093313809;
        Thu, 29 Aug 2019 08:41:53 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::1:7e32])
        by smtp.gmail.com with ESMTPSA id d2sm1398685qko.26.2019.08.29.08.41.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 08:41:52 -0700 (PDT)
Date:   Thu, 29 Aug 2019 08:41:50 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Message-ID: <20190829154150.GS2263813@devbig004.ftw2.facebook.com>
References: <20190829135150.4f0e533a@canb.auug.org.au>
 <20190829140828.39e05c27@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829140828.39e05c27@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 29, 2019 at 02:08:28PM +1000, Stephen Rothwell wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 29 Aug 2019 14:03:43 +1000
> Subject: [PATCH] blkcg: blk-iocost: predeclare used structs
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

> ---
>  include/trace/events/iocost.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/trace/events/iocost.h b/include/trace/events/iocost.h
> index ec2217dd57ac..7ecaa65b7106 100644
> --- a/include/trace/events/iocost.h
> +++ b/include/trace/events/iocost.h
> @@ -2,6 +2,10 @@
>  #undef TRACE_SYSTEM
>  #define TRACE_SYSTEM iocost
>  
> +struct ioc;
> +struct ioc_now;
> +struct ioc_gq;
> +
>  #if !defined(_TRACE_BLK_IOCOST_H) || defined(TRACE_HEADER_MULTI_READ)
>  #define _TRACE_BLK_IOCOST_H

-- 
tejun
