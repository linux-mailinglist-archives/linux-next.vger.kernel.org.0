Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A96A40151F
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 04:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239098AbhIFC6a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Sep 2021 22:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbhIFC6a (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Sep 2021 22:58:30 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3DFC061575
        for <linux-next@vger.kernel.org>; Sun,  5 Sep 2021 19:57:26 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id ia27so10473943ejc.10
        for <linux-next@vger.kernel.org>; Sun, 05 Sep 2021 19:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5YTZ2RkafZfVjiJtTzGEZcR88e29Lqe/N2xb8mNlQS4=;
        b=sEJX2bQFIIJYlR2IOutmw3yJDu4xHrI34I4rcrVOvXAOiX1F4jQX5NmfwyWZWH+QvL
         PM3Q4cZQc4Q764WA5QiOtGsoKPs1k861QMx0y2tPqLmLRaeX/d1rJQC1D25R9Y/P716q
         aHcVhTy3zkr5Cvl0S7pCiR8WGTvVTfWaRqRnxTPZdloMgL87B40Nb0xBKRRY82Q2JouJ
         yR64fgfHj7inGb9pmBogAgsyqe7tCT2JS+tGobU+aw+lauXtv+lHPQa4cgsuNs64/a3k
         A7Fi2a1vvrVb1OAQ1raRsmTo0OSBLstckl5kn3pw6P7I17PDBa50j8c0DbFQ4/aedgen
         PObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5YTZ2RkafZfVjiJtTzGEZcR88e29Lqe/N2xb8mNlQS4=;
        b=QLN6/Ru5nY6VR3cfgIPB13ZOHDN7IKgchVm8c7IEkQNkXyqqG9r/TeTmqN/7KadW4r
         74h2h4fN93a5tSypSjSHFaEQ2lLClR2930Pv2sigt1Y/MRLzmOei/q0xahF+Os7byP8t
         g4lU0Kw6/s/ezgf8z9IkoE4t88PWrfdfPRMPDfrcmeUDVAAVvQgOUDmxaOX+ST+hmyCO
         ya5Kk5V6TmvAhiqdrIvBbMXZ5bkMh5v7LbGGTpubezSm8Yg3jPL5VackrQjt4WVDaSoa
         wwMFEsdln4W2KEjpND6hDIv5Mvdh5qNfp4tqx9wYV68CaxHm/0GgtUIhffzSSetsk3ZI
         JFBw==
X-Gm-Message-State: AOAM530RGw2eC1ThilQT1GTimoat4t+jLGSVsGHLB1qIrAsu7uGUcYZK
        Qd+G/AC1xhYSQRKc92L+GLnM0XosCuPCBFqiA/Ka
X-Google-Smtp-Source: ABdhPJwbFN1NkmsO8ACKX/jAOjIwGdI9FTX9FJt+/KE1sGoN0dyB1YYxU3cmTNPo3gv+zWwAcC3B6Sg6hRNRAVfVZYo=
X-Received: by 2002:a17:907:1c01:: with SMTP id nc1mr11417929ejc.504.1630897044884;
 Sun, 05 Sep 2021 19:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210906124954.55ece6e8@canb.auug.org.au>
In-Reply-To: <20210906124954.55ece6e8@canb.auug.org.au>
From:   Yongji Xie <xieyongji@bytedance.com>
Date:   Mon, 6 Sep 2021 10:57:14 +0800
Message-ID: <CACycT3u6aOwgPhcKUhnDOL5JxkBt3=k69hHPUASZSr3iU8GXVw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the vhost tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 6, 2021 at 10:50 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the vhost tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/vdpa/vdpa_user/vduse_dev.c: In function 'vduse_vdpa_kick_vq':
> drivers/vdpa/vdpa_user/vduse_dev.c:489:6: error: implicit declaration of function 'eventfd_signal_count'; did you mean 'eventfd_signal_allowed'? [-Werror=implicit-function-declaration]
>   489 |  if (eventfd_signal_count()) {
>       |      ^~~~~~~~~~~~~~~~~~~~
>       |      eventfd_signal_allowed
>
> Caused by commit
>
>   b66219796563 ("vduse: Introduce VDUSE - vDPA Device in Userspace")
>
> interacting with commit
>
>   b542e383d8c0 ("eventfd: Make signal recursion protection a task bit")
>
> from Linus' tree.
>
> I have applied the following merge fix patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 6 Sep 2021 12:43:32 +1000
> Subject: [PATCH] fix up for "eventfd: Make signal recursion protection a task bit"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/vdpa/vdpa_user/vduse_dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> index 59a93e5b967a..5c25ff6483ad 100644
> --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> @@ -486,7 +486,7 @@ static void vduse_vdpa_kick_vq(struct vdpa_device *vdpa, u16 idx)
>         struct vduse_dev *dev = vdpa_to_vduse(vdpa);
>         struct vduse_virtqueue *vq = &dev->vqs[idx];
>
> -       if (eventfd_signal_count()) {
> +       if (eventfd_signal_allowed()) {
>                 schedule_work(&vq->kick);
>                 return;
>         }
> --

LGTM! Thank you for the fix!

Thanks,
Yongji
