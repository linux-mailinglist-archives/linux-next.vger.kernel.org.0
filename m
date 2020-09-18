Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8019D26F76B
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 09:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgIRHwh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 03:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbgIRHwc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Sep 2020 03:52:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911CEC06174A;
        Fri, 18 Sep 2020 00:52:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n14so2916564pff.6;
        Fri, 18 Sep 2020 00:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V4OYn/8zk+E0CEL1hG/OgZr+hLyP355J5jl0t4p8ZjQ=;
        b=YnxWsHp/7uG41OYw9V8WvuZ8pDWfZmtAioUVIWA2Mg8USLqFp2jfWDTFbcf5QjFdbl
         7cPjTdfZ5rW0URXBU4Of2PpwO4ofS9p3DFQivUbW2wfNMNUwp4jQK+kumFaZdBCzgB3Q
         BIl+b1JLCxg0wVo91S1wsNalaWuYG1W1X/AVOuKWsr9JMkN87GIVuR0fDA/x7ynxeAc3
         CSOUODRJfIZYsPVT5dHHdcr2fD6t1PIoJhdHeNZ2F4A2rsPqLZQdbgQJei5UBkmKC2ke
         uCn64UMu1zF81nz7Fkl2kZ/AgHANRAYzw3Jon70fRmIX3yJ2vCU4l2dVU46zfu/XRK5q
         o/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V4OYn/8zk+E0CEL1hG/OgZr+hLyP355J5jl0t4p8ZjQ=;
        b=Avm0ckFIlcLoE16OK60BMOKHpI79vP0hqdrQPfmnpI+t1Ma42Vmm4+8rtwWZQcIvvg
         xr2aExkIscEUYXRZOaX6evjflaHJaa7IjIW/CDDzTkilYn18/5nFuN86NyBVOxhmUe74
         bVor4mVM6cbnbAf/SP/XQCMk3vLmlTZVJ7Ulc+z+vjFACRqTiw1IvttHUZAcIWrQoz5c
         wC5dt2krYl8GHwaKrsBendXcF+j/MC7GcwctKcuWQ+f7ZDXLOkvxeJ4RVPRMK8+6dhQH
         d4WUWQ57C1Qg7rweTw4d1YjDQdJ9pKYOSTmH+40SHvciJ0yxwX1/rZ0Epk+Caxafi3Md
         OtSg==
X-Gm-Message-State: AOAM5302AKETKPIIA1Shvy1t3fGuYeIMwKAjMX7qokGWMvsjzoxOc6k3
        xzgzzYyEAO74Xgr1kY1cXJWw8S7Qb4c=
X-Google-Smtp-Source: ABdhPJzR3d/Cek3Ss0qb1HLGa+ief4j67CSYrJGjjosbc0hg2g2ILRm2z8iSsNw5BVTsB9Pqj5UUfw==
X-Received: by 2002:a63:4f17:: with SMTP id d23mr7790393pgb.319.1600415552095;
        Fri, 18 Sep 2020 00:52:32 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id l9sm2204147pgg.29.2020.09.18.00.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 00:52:31 -0700 (PDT)
Date:   Fri, 18 Sep 2020 16:52:30 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb-fixes tree
Message-ID: <20200918075230.GD3049@jagdpanzerIV.localdomain>
References: <20200918172106.4a924556@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918172106.4a924556@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (20/09/18 17:21), Stephen Rothwell wrote:
> Hi all,
> 
> After merging the v4l-dvb-fixes tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/userspace-api/media/v4l/buffer.rst:692: WARNING: The "flat-table" directive is empty; content required.
> 
> .. flat-table::
>     :header-rows:  0
>     :stub-columns: 0
>     :widths:       3 1 4

Thanks. I think there is a patch for this already.
Will hit linux-next soon.

	-ss
