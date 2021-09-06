Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED4040151B
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 04:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239115AbhIFC5T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Sep 2021 22:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239102AbhIFC5R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Sep 2021 22:57:17 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A9DC061575
        for <linux-next@vger.kernel.org>; Sun,  5 Sep 2021 19:56:13 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id mf2so10460620ejb.9
        for <linux-next@vger.kernel.org>; Sun, 05 Sep 2021 19:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xydTELVR03F9tNIX3znu9/l3opgVjN88wKbMkJ2pBWc=;
        b=mc7XwRV4yCqZumKavNPxeFi83P8NsgpgvvJDzVTcs9Z5yXGO/Vw1sVK4ZJtvDRyj7T
         fQhfqT3vmOy/ZhUZyNk16b756D71A0XikEhgNYbCNJ0NpwhV2cUmZ6jHIzcljk2D/Lco
         j/Vp9xSzttiCMrrnLPxl+a65f9Ff+pMRV/50ahiGHlL9oWz+BkFWEk0VgrralmKUfv5p
         dCpMGPWvjRUQPLtHCIpbCmh49wW/lQlFEItmC/HhxNG6JawQfkdh7xkdjyyXBI8+L42F
         h8X/mlZ2rq/WdUM6tF0kWcr9UeamosVqFn4ZG35WYHqY29aMoeMAyYU1NXWYuSeCTt3H
         Txgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xydTELVR03F9tNIX3znu9/l3opgVjN88wKbMkJ2pBWc=;
        b=bsGu4lu0QCcJb46V/gdQ3GkVZbRS/RIHUqUPpvnqxQDWS9unGe6JJ3fq20Z0EpKn8+
         LPY5PgAHAvCDBDKDmgIdImq5uti7GRimSzEldymBat5XUuUCPIsuhyDa3dA/In3GH4gm
         /xzNqzAsrX1YKM88Tq+zMO+/p3x16fvSgDKqWP4RLQShQkgD1OvLvi2g+R+kiz2be7Ik
         4SICRDstG7rveQHQr98ZiG+u8rGLNlfbkHYRV/SXKE2THO3QfmSKWYLLbHMBhUdoy2oS
         Ru8It+zJ5ay9cjkcUWaC3nT+Mlvs1ATzJY0mm3EDuGjbVk/q2KqaMqvRNUMjsedubGU3
         3mhw==
X-Gm-Message-State: AOAM530bnMqLGdmqgaq2OkYoLKS3nY8uMXk58Bs/lgnUGXhGfhJN3ANT
        lzOosz6ou+sVUaHfTjVp2+7lwyWJ2CjFeagWfN+Aa4kGajNZ
X-Google-Smtp-Source: ABdhPJw9x3aDTVS//sOMbtlZpo1q7ugoS/hhYsH1jXghmXtpak3tQCvrftpkW10JUbbk5PmlDcqgWKP0//lRo1giuOE=
X-Received: by 2002:a17:906:cecd:: with SMTP id si13mr11577549ejb.93.1630896972285;
 Sun, 05 Sep 2021 19:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210906122806.2ca7e715@canb.auug.org.au>
In-Reply-To: <20210906122806.2ca7e715@canb.auug.org.au>
From:   Yongji Xie <xieyongji@bytedance.com>
Date:   Mon, 6 Sep 2021 10:56:01 +0800
Message-ID: <CACycT3viMCxcsg1GXDA1kmcv3n56nDj3a3OpHb3sF40SD9tSEg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the vhost tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 6, 2021 at 10:28 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the vhost tree got a conflict in:
>
>   fs/eventfd.c
>
> between commit:
>
>   b542e383d8c0 ("eventfd: Make signal recursion protection a task bit")
>
> from Linus' tree and commit:
>
>   0afdb2abbff3 ("eventfd: Export eventfd_wake_count to modules")
>
> from the vhost tree.
>
> I fixed it up (I removed eventfd_wake_count as I could not see any added
> use for it) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
>

Yes, I think we can safely remove the commit 0afdb2abbff3 ("eventfd:
Export eventfd_wake_count to modules") after the commit b542e383d8c0
applied.

Thanks,
Yongji
