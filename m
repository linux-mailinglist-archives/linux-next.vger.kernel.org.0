Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6291DAF9E
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 12:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgETKEk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 06:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgETKEk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2020 06:04:40 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E0AC061A0F
        for <linux-next@vger.kernel.org>; Wed, 20 May 2020 03:04:40 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e1so2516676wrt.5
        for <linux-next@vger.kernel.org>; Wed, 20 May 2020 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=inIn2ONjibCnSjCghxYnKq2rJ8+ESmy4DRNsddh+5yQ=;
        b=hsxRs5C5YKYa0yGhhIMT8XTt4BoSeJuvqv1ep1IHg83tnHnWPY4qC0Ary05LJN/ytf
         MK+6DkmMTO9O0cs/6rjB0kxORhU0VilWrccz3QYeTs8o6uBYGgvisL5HVrzJNsF0M0Cm
         khtyZ8qYv/5VG54vdTkCJbphGw5c5EMeKbH8Ro+648vM+QF8RiY0AgPDyr7AgfxuCYYJ
         iNFQpZnN2WnqBrOWTtdai6yvUPzCjS+38ty6JN2Nw/wWgvgVcVxN43DCqKbos6f6w2Un
         EHqpC/elSDJHwrCkFAHHxsWWXCKf/owGUskeqyzFrGaTxyYkV1bHxnKz/elmGJiVfDEj
         DjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=inIn2ONjibCnSjCghxYnKq2rJ8+ESmy4DRNsddh+5yQ=;
        b=FgB2rFr+xPxEIj1pMbH9NzUaH/ryKfhsrFA/YvdQ50UPie9zm7SRPXcoAGwt0t0GQf
         gfkd+mzqIueUZklj2E/NSfJZZuNRqpTIJjBhBX1Kpg2cnChxzEL9YjYDKEhDgI4RMs2K
         fAyyYOG6d3pezV+L2I2XqRlb9moEr0sKhTVmFhsAfX1g0S4KseHmYqpFzXT621k1ljFf
         3AEA7zOZNh9eFilDYP4ES9Gjz8uxTGp5tVEyy7e25pXtrN7R1rNiyDX3O23CuXz2038q
         g1vVGxBkzIonDu1kcWNIhH5+sjUG5mz7YjeRcOEg/wBddX3dsNhwT7nSNI9XKosWOAeX
         bG2w==
X-Gm-Message-State: AOAM531dWAJg4e3xfq9MQBHGqnSDnCVRm29Emq/BTU5IsCSuB3x3f1jM
        bwyj3sXRHdgSl39IZGz2Z54Hqn7urkpZuRkjAVQd
X-Google-Smtp-Source: ABdhPJwVhiOqJ6pZXZNbYxT2v3Gmlpbge7+a6xMaVWYDFGQk3afXhXJbIz+s1l5P0HUngJK5K88CcaSWqMTubKH3ZVc=
X-Received: by 2002:a5d:6705:: with SMTP id o5mr3608109wru.426.1589969078863;
 Wed, 20 May 2020 03:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200519112936.928185-1-danil.kipnis@cloud.ionos.com>
 <76b6b987-4f63-2487-7fbe-a1d9c2f06b76@acm.org> <20200519233847.GC12656@ziepe.ca>
In-Reply-To: <20200519233847.GC12656@ziepe.ca>
From:   Danil Kipnis <danil.kipnis@cloud.ionos.com>
Date:   Wed, 20 May 2020 12:04:28 +0200
Message-ID: <CAHg0Huy3JmK=iFSrEFhbv==KFJusNr6Z+=H7Xwf+fHEZU2pYmQ@mail.gmail.com>
Subject: Re: [PATCH v2] rtrs-clt: silence kbuild test inconsistent intenting
 smatch warning
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org,
        linux-rdma@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>,
        Doug Ledford <dledford@redhat.com>,
        Leon Romanovsky <leon@kernel.org>,
        Jinpu Wang <jinpu.wang@cloud.ionos.com>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 20, 2020 at 1:38 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, May 19, 2020 at 07:29:15AM -0700, Bart Van Assche wrote:
> > diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > index 468fdd0d8713..8dfa56dc32bc 100644
> > +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > @@ -727,18 +727,13 @@ struct path_it {
> >       struct rtrs_clt_sess *(*next_path)(struct path_it *it);
> >  };
> >
> > -#define do_each_path(path, clt, it) {                                        \
> > -     path_it_init(it, clt);                                          \
> > -     rcu_read_lock();                                                \
> > -     for ((it)->i = 0; ((path) = ((it)->next_path)(it)) &&           \
> > -                       (it)->i < (it)->clt->paths_num;               \
> > +#define for_each_path(path, clt, it)                                 \
> > +     for (path_it_init((it), (clt)), rcu_read_lock(), (it)->i = 0;   \
> > +          (((path) = ((it)->next_path)(it)) &&                       \
> > +           (it)->i < (it)->clt->paths_num) ||                        \
> > +                  (path_it_deinit(it), rcu_read_unlock(), 0);        \
> >            (it)->i++)
>
> That is nicer, even better to write it with some inlines..

You mean pass a callback to an inline function that would iterate?
>
> Jason
