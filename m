Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC8753AF44
	for <lists+linux-next@lfdr.de>; Thu,  2 Jun 2022 00:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbiFAV5Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Jun 2022 17:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbiFAV5W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Jun 2022 17:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E9DA263F
        for <linux-next@vger.kernel.org>; Wed,  1 Jun 2022 14:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654120639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pfsPPlObmxBUf8zfBnAcZpTwKCgsSglvrSC1O4IlG2A=;
        b=SYQWeG3+GQNmdEjUWh6Zj0nDQMOBNnLucm/atv64xohIbysu1NgZ85LMc4lUGmFyhXgDAj
        L37MgDd5f182REjJnGvg7edlsw7Zaa8cTPKzL9l8X9wxoOVAxDaJFbZ2Zl/pqMC60R7mzW
        3d2TPnnRuvMwNxXZofaM3wX3EHLOFQg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-l34ttP48NFW26GPNmFsrEQ-1; Wed, 01 Jun 2022 17:57:18 -0400
X-MC-Unique: l34ttP48NFW26GPNmFsrEQ-1
Received: by mail-wm1-f71.google.com with SMTP id k5-20020a05600c0b4500b003941ca130f9so1547569wmr.0
        for <linux-next@vger.kernel.org>; Wed, 01 Jun 2022 14:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pfsPPlObmxBUf8zfBnAcZpTwKCgsSglvrSC1O4IlG2A=;
        b=hZX72ntRTR6G3dzFrslP5Va/YUx8HPWT4szMa/11QQRKFZvz3p0nmrDwgqQ74C5Tkn
         Cs2DIO0Qlwc1yx0t1kf/k5RbG6+CLlHYRGLpQCaC0gZS/lvvrDnszW7lS5ZTfnB0lm9w
         1gQZu58bdHr0DyaW14oM+7SKPO85BYNnhBoKrAXJ+MB/bxHSujySGCOzbWsqGESZQOe8
         hGGnwY6JRuRkGX1wVCIE9wWWwo0HXPOzYGUDFvyWDqOQTZ+y3+F9Eh9bkdXrzJuwb73r
         hM7i+HTSGbHbB+Y5nM8P31tSDc111+AgEk3bhSCAtirw/jUqY7zR9qgmUMHP9DT9mRuA
         XKog==
X-Gm-Message-State: AOAM5308lJqmOYkHrRfuwysdU3cb0gIsouydD6nxDQutj79ygyN+44/j
        I2aB5KUi8MiaitN9TNUK9PERZIxp6SQswmAviGwrC3Kl4CR1XiXrHwGRJ7xHxPsNit6YYivTAou
        zOFxE1h9Xb20MG0t9GXYP2A==
X-Received: by 2002:adf:d1c4:0:b0:210:1935:3dd8 with SMTP id b4-20020adfd1c4000000b0021019353dd8mr1140101wrd.229.1654120636667;
        Wed, 01 Jun 2022 14:57:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT3n1+KA+gV0gXkaj3TTcR2XZ+MnWa9sLLa5MfPFZ5jWN3hEtO0yBntP8BfueuRIZdsK9GVA==
X-Received: by 2002:adf:d1c4:0:b0:210:1935:3dd8 with SMTP id b4-20020adfd1c4000000b0021019353dd8mr1140093wrd.229.1654120636417;
        Wed, 01 Jun 2022 14:57:16 -0700 (PDT)
Received: from redhat.com ([2.52.157.68])
        by smtp.gmail.com with ESMTPSA id a5-20020adffac5000000b0021023877ac5sm2432596wrs.107.2022.06.01.14.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 14:57:15 -0700 (PDT)
Date:   Wed, 1 Jun 2022 17:57:12 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bo Liu <liubo03@inspur.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20220601060641-mutt-send-email-mst@kernel.org>
References: <20220601114240.1dafefc6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601114240.1dafefc6@canb.auug.org.au>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 01, 2022 at 11:42:40AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vhost tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/virtio/virtio_ring.c: In function 'virtqueue_add':
> drivers/virtio/virtio_ring.c:1783:16: error: 'vq' undeclared (first use in this function); did you mean '_vq'?
>  1783 |         return vq->packed_ring ? virtqueue_add_packed(_vq, sgs, total_sg,
>       |                ^~
>       |                _vq
> drivers/virtio/virtio_ring.c:1783:16: note: each undeclared identifier is reported only once for each function it appears in
> drivers/virtio/virtio_ring.c:1787:1: error: control reaches end of non-void function [-Werror=return-type]
>  1787 | }
>       | ^
> 
> Caused by commit
> 
>   a50f09346a34 ("virtio_ring: remove unused variable in virtqueue_add()")
> 
> I am sorry, but I expect better review and build testing than this :-(
> 
> I have used the vhost tree from next-20220531 for today.

Indeed, pushed a wrong tree :( 
I hope I pushed the correct one now, pls let me know whether this is now fixed.
Thanks!

-- 
MST

