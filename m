Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4EB34CFCC0
	for <lists+linux-next@lfdr.de>; Mon,  7 Mar 2022 12:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239843AbiCGL05 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Mar 2022 06:26:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241884AbiCGL0b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Mar 2022 06:26:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B238EBAC
        for <linux-next@vger.kernel.org>; Mon,  7 Mar 2022 03:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646650835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5ifUJrV01iH90m49wDHf0jtuBJp0stIExCqgqIK+KXc=;
        b=NaAz2LRShLKNLynvtbCOnA90lJtVQt4Obw6Tt7/fRpK3G6Ro1mxNScd+4O8SEJ4tgHurwS
        94jThsQRKdjuL2chgNUK/vTfr37UtdJ+pKAn/T3dYqSiq/6LLEhkUiK+B82d2AHy7q69cu
        +fkctMkM7YLze0fpix/EuUHfP2FpfX0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-qCxQCQrbMMiOcNzWUNasiA-1; Mon, 07 Mar 2022 06:00:32 -0500
X-MC-Unique: qCxQCQrbMMiOcNzWUNasiA-1
Received: by mail-ej1-f70.google.com with SMTP id qf24-20020a1709077f1800b006ce8c140d3dso6822271ejc.18
        for <linux-next@vger.kernel.org>; Mon, 07 Mar 2022 03:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5ifUJrV01iH90m49wDHf0jtuBJp0stIExCqgqIK+KXc=;
        b=J0I7k2Dl8HqEJzxRYCKfJ0MLihnRHHVLpv2aSskxvb7e7PDDGBMXMGhZ0MztMgjwNq
         bk5chIZQGGt7Ld2aoYo/TvGuYx6qWbX3pd9oiSdoHJyN31ITuw62//1L49ywXscDij5d
         eY2BWBBFpif7gBM1U0+ZG1/3+jRZa+1J4ZmLM/0CIQRECUBXdye61BhAzp7b+6sn3CC4
         pkowv04ZiNVucXtNmj6O+uMtwM8pVFSSrayG+wWZ9i6KTA61voMH9ezi76a62oQsjERl
         hawO77bvCUw/XgZF5AmC1gXByOHQGMMC6B09984FCEmVX1n7jOEeVSF7kuSXZYTa2S3g
         KZEA==
X-Gm-Message-State: AOAM533OkEkOF5rcJ89jA81MzjfZwD/NsJ06fjDtn0++R/HNCnQhE7ch
        QH4r7RqBGTrk3uLZeYGm1bCH1vsnhpQsKmQA7Ggu5qx549G+RkZFmhyQc3mBG+FmuLFdQsCKvA1
        q6KqgeNbOJe3GCMLjWqqrDQ==
X-Received: by 2002:a17:906:3ac7:b0:6ce:c3a1:3dcf with SMTP id z7-20020a1709063ac700b006cec3a13dcfmr8720433ejd.182.1646650831504;
        Mon, 07 Mar 2022 03:00:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwR1QfhoZza7jSZTfiooWn9Uk8M32U7CpHBauCfZaIHoHBbUDtSLlSD1IXQAhUKeVJEwmtw/w==
X-Received: by 2002:a17:906:3ac7:b0:6ce:c3a1:3dcf with SMTP id z7-20020a1709063ac700b006cec3a13dcfmr8720421ejd.182.1646650831276;
        Mon, 07 Mar 2022 03:00:31 -0800 (PST)
Received: from redhat.com ([2.55.138.228])
        by smtp.gmail.com with ESMTPSA id b7-20020a056402350700b00415e035f7c6sm5975934edd.0.2022.03.07.03.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 03:00:30 -0800 (PST)
Date:   Mon, 7 Mar 2022 06:00:27 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vhost tree
Message-ID: <20220307060012-mutt-send-email-mst@kernel.org>
References: <20220307154011.6d456f28@canb.auug.org.au>
 <1646635600.9436276-1-xuanzhuo@linux.alibaba.com>
 <20220307211242.59fc0f0e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307211242.59fc0f0e@canb.auug.org.au>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 07, 2022 at 09:12:42PM +1100, Stephen Rothwell wrote:
> Hi,
> 
> On Mon, 7 Mar 2022 14:46:40 +0800 Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> >
> > Can you help me test this patch? I don't have an arm environment around me.
> > 
> > Thanks
> > 
> > 
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > index 1fa2d632a994..4d629d1ea894 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -1820,7 +1820,7 @@ static int virtnet_rx_vq_reset(struct virtnet_info *vi,
> > 
> >  err:
> >         netdev_err(vi->dev,
> > -                  "reset rx reset vq fail: rx queue index: %ld err: %d\n",
> > +                  "reset rx reset vq fail: rx queue index: %td err: %d\n",
> >                    rq - vi->rq, err);
> >         virtnet_napi_enable(rq->vq, &rq->napi);
> >         return err;
> > @@ -1870,7 +1870,7 @@ static int virtnet_tx_vq_reset(struct virtnet_info *vi,
> > 
> >  err:
> >         netdev_err(vi->dev,
> > -                  "reset tx reset vq fail: tx queue index: %ld err: %d\n",
> > +                  "reset tx reset vq fail: tx queue index: %td err: %d\n",
> >                    sq - vi->sq, err);
> >         virtnet_napi_tx_enable(vi, sq->vq, &sq->napi);
> >         return err;
> 
> I had to apply that by hand, but it does work.
> 
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

OK, I squashed this into the problematic patch. Thanks a lot!

> -- 
> Cheers,
> Stephen Rothwell


