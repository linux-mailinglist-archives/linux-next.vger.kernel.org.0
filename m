Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84262644F8B
	for <lists+linux-next@lfdr.de>; Wed,  7 Dec 2022 00:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiLFXYX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Dec 2022 18:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiLFXYV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2022 18:24:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5BA30570
        for <linux-next@vger.kernel.org>; Tue,  6 Dec 2022 15:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670369004;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qHVwCR9dXgT4rn48btgKYly0tc+kiTHkQV2npU7J1+I=;
        b=AmyybaiMXnDhM2daNTu7CX8eGokhGLVfEBBvCJ/eaWSnfs082dnplepvyBfACkIfsEj+TY
        zgtR8jW83Y/r1C1FP0YmDTClLXyhuKjJEZMRuB7ybdoEXBdCohO+x5b4feE5hbj+OFdtP1
        G+b3zMD5BBzvXMSc7NRgJUgq5MsYeD4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-e-PFiqW2MDSeUvx1eFKoGw-1; Tue, 06 Dec 2022 18:23:23 -0500
X-MC-Unique: e-PFiqW2MDSeUvx1eFKoGw-1
Received: by mail-il1-f199.google.com with SMTP id j20-20020a056e02219400b00300a22a7fe0so15529249ila.3
        for <linux-next@vger.kernel.org>; Tue, 06 Dec 2022 15:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHVwCR9dXgT4rn48btgKYly0tc+kiTHkQV2npU7J1+I=;
        b=2q/3mr/lGXm/eJ0GGD4VKopnA91gYOv9YIv7bE/Hagqaq4ryp8BqN+EuyCj73DYO97
         WjPRRRnv+wVq++e/EVaJgiR2nPFuIkz9e5V/c9LBCE34sNc9lY7mDYvi+SqDCz/cyT2M
         p2QtwP0IxtzMz1Sm7QWchajLfbKtAiUkNVTZMQu7lZQb+meuq6o4uv0yUEVYPyZ9xTmU
         fDoseBAT5n+QkKosBV8uL732ClZA2QXzNLNb+RJA3S7FhJyXH8lSMysWh5B9ibLf3g2D
         CtetT9LaC/guXrC6aTrvfS9V2QC/oUWCiTfX98PdN4u3mID1U1Tk3rLSL71yuW9xlE62
         YIKA==
X-Gm-Message-State: ANoB5plM74SmjILJ4cbbTrTGjBLUFPrRkoDJBnh2Es9gL89C90G2cXzj
        g6IKMppc37htYunVHNspDYP2qqAZ6S4URIr0bjJ+qv0Wl/4MpUdjSWj6AGQxoWJ29NXv5zklym/
        Em1p2TFh+hSBuJFZfLGW9sQ==
X-Received: by 2002:a05:6638:3387:b0:375:3be7:2908 with SMTP id h7-20020a056638338700b003753be72908mr42850171jav.275.1670369002852;
        Tue, 06 Dec 2022 15:23:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6SbUj9DQD4p2LUzlEY1+B7GH3nRiQqYzu6t19cZlVFdTZhm14tUnflnfLbyYzPyPHCEnCABA==
X-Received: by 2002:a05:6638:3387:b0:375:3be7:2908 with SMTP id h7-20020a056638338700b003753be72908mr42850163jav.275.1670369002588;
        Tue, 06 Dec 2022 15:23:22 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id b41-20020a0295ac000000b00363f8e0ab41sm7144239jai.152.2022.12.06.15.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 15:23:21 -0800 (PST)
Date:   Tue, 6 Dec 2022 16:23:19 -0700
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jason Gunthorpe <jgg@nvidia.com>, Greg KH <greg@kroah.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yi Liu <yi.l.liu@intel.com>
Subject: Re: linux-next: manual merge of the iommufd tree with the
 driver-core, vfio trees
Message-ID: <20221206162319.7902bbf8.alex.williamson@redhat.com>
In-Reply-To: <20221206132153.074fff0c@canb.auug.org.au>
References: <20221206132153.074fff0c@canb.auug.org.au>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 6 Dec 2022 13:21:53 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the iommufd tree got a conflict in:
> 
>   drivers/vfio/vfio_main.c
> 
> between commits:
> 
>   ff62b8e6588f ("driver core: make struct class.devnode() take a const *")
>   e2d55709398e ("vfio: Fold vfio_virqfd.ko into vfio.ko")
> 
> from the driver-core, vfio trees and commits:
> 
>   c2849d718d26 ("vfio: Move vfio group specific code into group.c")
>   f96dc03a8368 ("vfio: Wrap vfio group module init/clean code into helpers")
> 
> from the iommufd tree.
> 
> I fixed it up (I think - see below and I had to add the fix up patch as
> well) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 6 Dec 2022 13:17:41 +1100
> Subject: [PATCH] vfio: fix up for "driver core: make struct class.devnode() take a const *"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/vfio/group.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index c5d8bf10495e..bb24b2f0271e 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -827,7 +827,7 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device)
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_has_dev);
>  
> -static char *vfio_devnode(struct device *dev, umode_t *mode)
> +static char *vfio_devnode(const struct device *dev, umode_t *mode)
>  {
>  	return kasprintf(GFP_KERNEL, "vfio/%s", dev_name(dev));
>  }
> 

Looks good, thank you,

Alex

