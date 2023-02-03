Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC796893EC
	for <lists+linux-next@lfdr.de>; Fri,  3 Feb 2023 10:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjBCJfr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Feb 2023 04:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbjBCJfm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Feb 2023 04:35:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310CE10A83
        for <linux-next@vger.kernel.org>; Fri,  3 Feb 2023 01:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675416898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s/ArePDBe9fA6hX2Xbg6u19DGsOzAxJ4bWXlXPkV5R8=;
        b=SaMycmA7HUfs21GXj0aNtPOkbcBN4RuUaAsdW9FPcEyQfMi5rNr6POkwX/wBIMMybNXcZ7
        xl24nTQkbnOxms6EZ1MW0LnPm6dHKykzO6SdNeA9LNZVw9acVHcjotbwCTxnORWVgeEcA+
        HPoCdGuWJiOU6tqLfPlx90nuMIe1nYg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206--OzX3-RLN6it8AVk1WY_FA-1; Fri, 03 Feb 2023 04:34:26 -0500
X-MC-Unique: -OzX3-RLN6it8AVk1WY_FA-1
Received: by mail-ed1-f70.google.com with SMTP id d21-20020aa7c1d5000000b004a6e1efa7d0so2980542edp.19
        for <linux-next@vger.kernel.org>; Fri, 03 Feb 2023 01:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/ArePDBe9fA6hX2Xbg6u19DGsOzAxJ4bWXlXPkV5R8=;
        b=QVe2p1xJRV8O6pfTaVdH9KrFSRX9hE98HyXT8sn4dVmQj69i2ykgIa9NR2aFFv9seM
         rr/07QD7RKpRDN37M5C9QvYVAALLUbe+Rw8CK16/NBUnCb+BRM1fG6ZdJ7xLo9S7HTlK
         5ghgW8Yz65VlaU6JmPQArGYe7m1iX6rjbN2KNtIaAcIqsYy37KDv2iZk0lJF4hBwxl7F
         cC9XnMFPrxQpmltW1ptjqu44hbpLwYJkfWAZyzTaDeFoQ/uIsurRj+N5CoEIeQxqSfw9
         SNSKcCFul0c8PMcUA2I1tArsR/Hg8NVtej5AUAt0hGaKWBM8Fe21Hzbzo0uRnG+kxiZ7
         xIPw==
X-Gm-Message-State: AO0yUKWsVcO1PLpc8KlkZz61WZzbfoZ7Ljv6NHfsCm6iXcTihc2p+KWs
        sB9v3CtEevYE0PJ3qJXh42nKTxfVs60+Zrkp0YNxCasFFbcfUWtt8dBSLD9sowl2LeQiBvlc2DN
        u+JWSwC2SKJFLCuTNp3FMsA==
X-Received: by 2002:a05:6402:34cd:b0:4a3:43c1:842f with SMTP id w13-20020a05640234cd00b004a343c1842fmr6059312edc.3.1675416865185;
        Fri, 03 Feb 2023 01:34:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8fPiBPyymxXvRsz+X2l9LTm8jgA1M5+3SkglNsycNaWE/90eTB4Wt5BoP0sVycITXkRU6hgw==
X-Received: by 2002:a05:6402:34cd:b0:4a3:43c1:842f with SMTP id w13-20020a05640234cd00b004a343c1842fmr6059298edc.3.1675416865035;
        Fri, 03 Feb 2023 01:34:25 -0800 (PST)
Received: from redhat.com ([2.52.156.122])
        by smtp.gmail.com with ESMTPSA id u2-20020a509502000000b0049e08f781e3sm879926eda.3.2023.02.03.01.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 01:34:24 -0800 (PST)
Date:   Fri, 3 Feb 2023 04:34:21 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Laurent Vivier <lvivier@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the vhost tree
Message-ID: <20230203043406-mutt-send-email-mst@kernel.org>
References: <20230203132629.30cf161c@canb.auug.org.au>
 <20230203133303.5cf19f41@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203133303.5cf19f41@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 03, 2023 at 01:33:03PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 3 Feb 2023 13:26:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > The following commits are also in Linus Torvalds' tree as different
>                                     ^^^^^^^^^^^^^^^
> Actually not in Linus' tree, just the net-next tree (semi-automation
> sometimes fails :-)).

Dropped from my tree thanks for the heads up!


> > commits (but the same patches):
> > 
> >   022659ee3363 ("virtio_net: notify MAC address change on device initialization")
> >   d0aa1f8e8d63 ("virtio_net: disable VIRTIO_NET_F_STANDBY if VIRTIO_NET_F_MAC is not set")
> > 
> > These are commits
> > 
> >   9f62d221a4b0 ("virtio_net: notify MAC address change on device initialization")
> >   7c06458c102e ("virtio_net: disable VIRTIO_NET_F_STANDBY if VIRTIO_NET_F_MAC is not set")
> > 
> > in the net-next tree.
> 
> -- 
> Cheers,
> Stephen Rothwell


