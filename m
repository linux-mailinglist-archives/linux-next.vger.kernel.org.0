Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571F7644F8E
	for <lists+linux-next@lfdr.de>; Wed,  7 Dec 2022 00:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbiLFXYq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Dec 2022 18:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiLFXYf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2022 18:24:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAC042F4B
        for <linux-next@vger.kernel.org>; Tue,  6 Dec 2022 15:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670369012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dIT+IhbrhdzO0SgdkPdvyfPRZXCHERs/Yxrz5ukRMiU=;
        b=CuG7f105IY0PTNtDC0XNEAqUTc5b8c3nwDtyugIfpt+huOac5KSOGrV6Ofu+KTVx7cXrIv
        IOQd7dUUDGCslYVnMHij4xTYwDG/Dim91IEZWchG02QUEmbzZwGJ4BuFdqgtYBUkKNaEkY
        uuRxnu28VFRYcTXFR5ztDnv1vwDxtjM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-iixGfeDnOYeo8xs73qOQYg-1; Tue, 06 Dec 2022 18:23:28 -0500
X-MC-Unique: iixGfeDnOYeo8xs73qOQYg-1
Received: by mail-il1-f197.google.com with SMTP id x10-20020a056e021bca00b00302b6c0a683so15800232ilv.23
        for <linux-next@vger.kernel.org>; Tue, 06 Dec 2022 15:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIT+IhbrhdzO0SgdkPdvyfPRZXCHERs/Yxrz5ukRMiU=;
        b=Ve+giPvoOguLSQWMbBbEAUISka0zEginHyLz/eBNOVwJprTsThMTaSovh4Bwhyd4L/
         0A+Av8/gqFZ7dn5gAGdWn45FQN06LBrJTr3n3alGltjKXJZa/aUEMOXRbf8N3WACc0Zg
         JB74mmfN/TM0V0cEl1bJZMmZ/rxGypigDdzZaigNzRzHvo8ViPJchkqVxtoBexjrgsBs
         F7CYGBY+SjNaiNtElw5EaoJyXZeInk1FeV9t2/y3E3WnvJWddC8zWWVtWJbu/XdsRn7h
         NOxRxfZXFt/0dpxEGOagN0TG9xk39WsTiS7FQKHNLFscLalW3MLtIbQbZiL8k7Zs7kjw
         eG7A==
X-Gm-Message-State: ANoB5pnWyc6nuj1eno7uFzNeL4XjvU7FMHvOI/jL4XDFV56XV+zMatgi
        HQmyOVS59haLLhMp0RKPLxDnXK7vlgacgPZVBsbUUX2RCsNJXfkQ9zfumYiD1qQbEGgVBNriBZQ
        /DkaWmlD6K9kGfKm092fu5g==
X-Received: by 2002:a6b:8e84:0:b0:6e0:34aa:4548 with SMTP id q126-20020a6b8e84000000b006e034aa4548mr955807iod.72.1670369008212;
        Tue, 06 Dec 2022 15:23:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf530+WYbRmxE0/7/iKzg+do/NfyBJnHrKsBJPekEOm6tgcPN5pQRTCdPQ2CDy6QsFVxD1wKKg==
X-Received: by 2002:a6b:8e84:0:b0:6e0:34aa:4548 with SMTP id q126-20020a6b8e84000000b006e034aa4548mr955798iod.72.1670369008010;
        Tue, 06 Dec 2022 15:23:28 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id i44-20020a023b6c000000b00389e1142967sm7144835jaf.57.2022.12.06.15.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 15:23:27 -0800 (PST)
Date:   Tue, 6 Dec 2022 16:23:21 -0700
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yi Liu <yi.l.liu@intel.com>
Subject: Re: linux-next: manual merge of the iommufd tree with the vfio tree
Message-ID: <20221206162321.33b41f1d.alex.williamson@redhat.com>
In-Reply-To: <20221206125542.52ea97a7@canb.auug.org.au>
References: <20221206125542.52ea97a7@canb.auug.org.au>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 6 Dec 2022 12:55:42 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the iommufd tree got conflicts in:
> 
>   drivers/vfio/Kconfig
>   drivers/vfio/Makefile
> 
> between commits:
> 
>   20601c45a0fa ("vfio: Remove CONFIG_VFIO_SPAPR_EEH")
>   e2d55709398e ("vfio: Fold vfio_virqfd.ko into vfio.ko")
> 
> from the vfio tree and commits:
> 
>   a4d1f91db502 ("vfio-iommufd: Support iommufd for physical VFIO devices")
>   e5a9ec7e096a ("vfio: Make vfio_container optionally compiled")
>   c2849d718d26 ("vfio: Move vfio group specific code into group.c")
> 
> from the iommufd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Looks good, thank you,

Alex

