Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B3937BF34
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 16:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbhELOFW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 10:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbhELOFU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 May 2021 10:05:20 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE5BC061574;
        Wed, 12 May 2021 07:04:11 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id r13so12050826qvm.7;
        Wed, 12 May 2021 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yA2uAJ2HmrP0JQYIMPBbtRW9pr6LSVlxxaesD5stbv0=;
        b=fkWpYJa927FDQ8RBV/k0T+6cMgco+LSm3eA2N4f5FzHUEQsEvQ7hX+PYvN9J+kfdCA
         dmN60AV/ghy4JyFKUrgdnIowiVdJFzAKsfyLcA0EFn+9hrwTtM5OW/0Y+N5YmDYKywnc
         Pmt7vFiYOWig42T10RVDXDqCAya1k+H1q9rGOzRlB+CQsSeXNuBmc6CxFo7NRACV3jAu
         kB5h+WDdkIG5M3+0eNBlDYya1RGakn/fMq4GSglvZJ6Ii/Yp+QydRSexlYnxWybURBMC
         o3fSHnZcfP9f61k9J+6v7tgrrfLCO87JRKG21TFVvCKslf7pv/1jx6RstZGMLjg1XVjg
         sTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yA2uAJ2HmrP0JQYIMPBbtRW9pr6LSVlxxaesD5stbv0=;
        b=Hj+0cfEqtWSiuVTbUwcFZKQxwkQRgt9+NbzWamdPI1i/qRpj7J5WX/zuReSFWwEipj
         5KQzYY1KXWD1COIH/cZ0YQTnreOCYK1kTtA/rbZWDtyTGJCr0oBKXCOJw8Qgr9uWH3Oe
         dvZhwLP8MGzALL24ZmHvNGzfvWhvb7nsF2IctHYRA05UVFn/m5D6H7gnvwGQnp9hg9yc
         lYGSPnzK106VisOBSWAEEKIFy8ZV9HinOWaGo6rluY7Dx35J6MF1wE1/I/QZNEsaH5rR
         HJg3FcgWsr5/K/1rM/hvCv+U+IYi5m/qkLhosUqQ7XOLZoNeSKOxdw2owvd9/dUf5lRF
         adfQ==
X-Gm-Message-State: AOAM532u2iXaTUb9nPYMWw9LGoeiyUoJjO3FDXvgWjxaQMEPo34/Vzpe
        /ZxS/d5FUFEZ4kZHEyvgdnDdvvHsd6c=
X-Google-Smtp-Source: ABdhPJwaJlwbvbWY29iZv/l1yMkTrMLR2Q0km3nmVaxJoqw9kO36xEV0WIj+WZTGUtwJgRJDLnQ4YA==
X-Received: by 2002:a0c:cd10:: with SMTP id b16mr35672881qvm.0.1620828250476;
        Wed, 12 May 2021 07:04:10 -0700 (PDT)
Received: from localhost ([207.98.216.60])
        by smtp.gmail.com with ESMTPSA id f19sm86181qkg.70.2021.05.12.07.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:04:09 -0700 (PDT)
Date:   Wed, 12 May 2021 07:04:08 -0700
From:   Yury Norov <yury.norov@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the rcu
 tree
Message-ID: <YJvgWHRNbLAKd7DW@yury-ThinkPad>
References: <20210512150448.05728739@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512150448.05728739@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 12, 2021 at 03:04:48PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   Documentation/admin-guide/kernel-parameters.rst
> 
> between commit:
> 
>   b18def121f07 ("bitmap_parse: Support 'all' semantics")
> 
> from the rcu tree and commit:
> 
>   458a0b70b496 ("bitmap_parse: support 'all' semantics")
> 
> from the akpm-current tree.
> 
> I fixed it up (I just use the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

The difference is that Paul's version replaced 'isolcpus=all' with
'rcu_nocb=all' in documentation, which is more correct in general.

Could you please stick with the Paul's version, and sorry for
confusion?

Thanks,
Yury
