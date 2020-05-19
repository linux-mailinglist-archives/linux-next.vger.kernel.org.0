Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1142C1DA5B3
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 01:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgESXiu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 19:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgESXit (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 19:38:49 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E2CC061A0E
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 16:38:49 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id g20so503739qvb.9
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 16:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WX8zNao4hB0v73w8f5UXj9N2V1yEgSHUlRcesp4q++8=;
        b=eKrhOds602SoUWuWh+rz6Zjf86gkwodoowj8v7Ru1Zu2FN674srfU7AYTUaQrsuLPn
         a1xQB/Do514Hx1o2FOn5XiCrfX1MRNsvj3FeX0wOrqvLgHif1uAC3mNVMnjAsred6AwM
         fTTqqxxGTEu0Ted/EYPCBH9HX6n4oZkDCZQkqL62lXwAkK9FJR4778UUvGDZIRM+JNK+
         CyIXLfkWWawsQzmtNpZTp/pif28uKhCB57kf3h4wSYCyhla73TDYQpZ0e9K4Dv6TMHVS
         Z8Oz+I04grVssJ2OmCjsYSfy+2Eb4bru/N91x36154pXGLGUnpTgkDv4Z/gd295+ivMn
         7PEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WX8zNao4hB0v73w8f5UXj9N2V1yEgSHUlRcesp4q++8=;
        b=mGjrdHfe/cRbiZnV1nDF4vMJ/z+7jpImQaCexBY1kod/uyJVS7eVZXA4y5OCZaYKdq
         loSh/KwV2lAWRYfjJzoY1dnkQDzNqpNal9V2jgRIzRfqait/zvwxiC/2MSLMHrqNBpTw
         rkgy04CAVIp6eLHH8Ms7SoX+T9oW7Vaw46CjCVkesLyU3LDjO0c+kA3KuByFw47f3/NU
         5/DBTLMND6aq7ZWJ89EFODIywPriIFFFlgHrNcRVFQVaFOsm0a8Pz0cWiFLpygmNfHPs
         21TGMdCt+nExHUN2C7GbnPjnjfR42M9jBvRfGvxpxDH9MsmLKJABwD0ahEhwVIxYWUbH
         VjUA==
X-Gm-Message-State: AOAM532GcYlJ+uvA3EkEsD03mzYFL9uPMLcmtHYlKp5tR1Rzjy536RNT
        cG40vhZbvyOzOZiSrwEaTzZ8pA==
X-Google-Smtp-Source: ABdhPJxVKDooS2c8caBYCj+9YCvHhBKGb1TvQ7mIVqolG2QzHvKHbBkWsndvedK3ht5yka4Bv9t99A==
X-Received: by 2002:a05:6214:42a:: with SMTP id a10mr2142855qvy.78.1589931528308;
        Tue, 19 May 2020 16:38:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id m59sm1037279qtd.46.2020.05.19.16.38.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 16:38:47 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jbBot-0003Y7-Eu; Tue, 19 May 2020 20:38:47 -0300
Date:   Tue, 19 May 2020 20:38:47 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        linux-block@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-next@vger.kernel.org, axboe@kernel.dk, dledford@redhat.com,
        leon@kernel.org, jinpu.wang@cloud.ionos.com,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2] rtrs-clt: silence kbuild test inconsistent intenting
 smatch warning
Message-ID: <20200519233847.GC12656@ziepe.ca>
References: <20200519112936.928185-1-danil.kipnis@cloud.ionos.com>
 <76b6b987-4f63-2487-7fbe-a1d9c2f06b76@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76b6b987-4f63-2487-7fbe-a1d9c2f06b76@acm.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 19, 2020 at 07:29:15AM -0700, Bart Van Assche wrote:
> diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> index 468fdd0d8713..8dfa56dc32bc 100644
> +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> @@ -727,18 +727,13 @@ struct path_it {
>  	struct rtrs_clt_sess *(*next_path)(struct path_it *it);
>  };
> 
> -#define do_each_path(path, clt, it) {					\
> -	path_it_init(it, clt);						\
> -	rcu_read_lock();						\
> -	for ((it)->i = 0; ((path) = ((it)->next_path)(it)) &&		\
> -			  (it)->i < (it)->clt->paths_num;		\
> +#define for_each_path(path, clt, it)					\
> +	for (path_it_init((it), (clt)), rcu_read_lock(), (it)->i = 0;	\
> +	     (((path) = ((it)->next_path)(it)) &&			\
> +	      (it)->i < (it)->clt->paths_num) ||			\
> +		     (path_it_deinit(it), rcu_read_unlock(), 0);	\
>  	     (it)->i++)

That is nicer, even better to write it with some inlines..

Jason
