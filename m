Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085231DF376
	for <lists+linux-next@lfdr.de>; Sat, 23 May 2020 02:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731211AbgEWAY6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 20:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731169AbgEWAY6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2020 20:24:58 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE843C05BD43
        for <linux-next@vger.kernel.org>; Fri, 22 May 2020 17:24:57 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id g20so5561036qvb.9
        for <linux-next@vger.kernel.org>; Fri, 22 May 2020 17:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mDfFc75sDDtwBZ/uqNakKrJId/ZguX7g2hGxTq1lsgw=;
        b=ndFRfkW+UVWd402BkSqR2tPWtzIY+uzl9pPRC7BsX8lKsZw/j3+0yHvtc4O2CMbW97
         H+n+qgYDLxUBknuKdDE0f1TuzcBjPFITotx5Io3/y/u+1oQURn1k3QtNyEh0PKZPsTVz
         LaZRm4kHOKHeybQoaCtY4yq8cDvuJkQPYygCpgp3YJCjd8U+ChphPk7SsdnrrhEvkYBw
         M5+yq+Xvt2BFfrPHusTKMSczLZfuKOIU8GkLdlhlbm+qTYnMRa8W7LlNGXJkc4/a4ZDh
         vt9p7HXjFANbtFdyUwPAegYUVkOcQLUP8ucBqA4b8qzx73YS+ZC2Ee/fD5aEAAa+cW4Z
         XN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mDfFc75sDDtwBZ/uqNakKrJId/ZguX7g2hGxTq1lsgw=;
        b=ftO/X0gOl/uBuZITT4JcQpKQBnoaGpLN4HWWOR1zb/HLHk6gXCvQpuC89lKpRUJirk
         lV8GqJiJbKb/Wztr9xfLm7C9TBc/CBeqoEzvAa2oSJ+hfVPwKu9DNttIVp+xBxd61eLp
         wvG5w5kr1ss04IuuOSlS8Oh2gFeY6RAPYtimMfVMcMI+hKkL1fRfX2lKp1SQbbXA9tKP
         NzR/jzdozacurFCgACW9c1aU//fEQPBH5tHBOTvYnx7Tud5Kc3ZxaXb0Q6E1LEf36MBG
         vWqZIMNBrHhcqDceIfP0vYnEVLyj51yz8f+A0lgdu0oFRBHWQhY2St8gqgCu6eWw59bb
         hm4A==
X-Gm-Message-State: AOAM530aLsrSUz27OwdBGdi/OIkPkbi9TXDHwUzDoaRxyAhyluXolEZ5
        TDciFSzvgqDowfi0mxePR2krpg==
X-Google-Smtp-Source: ABdhPJwuCk5GLW1hGu/4YSRsK4CT5gffdiyTNILlyjPzeYizgnAuYaXuUJnzHN2b/0P+jPdRQuFSVw==
X-Received: by 2002:a05:6214:506:: with SMTP id v6mr6445844qvw.70.1590193497112;
        Fri, 22 May 2020 17:24:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id x4sm1971826qtj.43.2020.05.22.17.24.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 17:24:56 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jcHyC-0002Q6-9t; Fri, 22 May 2020 21:24:56 -0300
Date:   Fri, 22 May 2020 21:24:56 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Danil Kipnis <danil.kipnis@cloud.ionos.com>
Cc:     linux-block@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-next@vger.kernel.org, bvanassche@acm.org,
        dledford@redhat.com, axboe@kernel.dk, lkp@intel.com,
        jinpu.wang@cloud.ionos.com
Subject: Re: [PATCH] RDMA/rtrs: get rid of the do_next_path while_next_path
 macros
Message-ID: <20200523002456.GB9180@ziepe.ca>
References: <20200520191105.GK31189@ziepe.ca>
 <20200522053924.528980-1-danil.kipnis@cloud.ionos.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522053924.528980-1-danil.kipnis@cloud.ionos.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 22, 2020 at 07:39:24AM +0200, Danil Kipnis wrote:
> The macros do_each_path/while_each_path lead to a smatch warning:
> drivers/infiniband/ulp/rtrs/rtrs-clt.c:1196 rtrs_clt_failover_req() warn: inconsistent indenting
> drivers/infiniband/ulp/rtrs/rtrs-clt.c:2890 rtrs_clt_request() warn: inconsistent indenting
> 
> Also checkpatch complains:
> ERROR: Macros with multiple statements should be enclosed in a do - while loop
> 
> The macros are used only in two places: for a normal IO path and for the
> failover path triggered after errors.
> 
> Get rid of the macros and just use a for loop iterating over the list
> of paths in both places. It is easier to read and also less lines of code.
> 
> Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 29 ++++++++++++--------------
>  1 file changed, 13 insertions(+), 16 deletions(-)

Applied to for-next, thanks

Jason
