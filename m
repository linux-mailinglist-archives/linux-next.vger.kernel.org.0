Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B49C9651EC5
	for <lists+linux-next@lfdr.de>; Tue, 20 Dec 2022 11:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbiLTKZ7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Dec 2022 05:25:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbiLTKZ4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Dec 2022 05:25:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C992CA187
        for <linux-next@vger.kernel.org>; Tue, 20 Dec 2022 02:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671531912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sFprmyhyXtWWl/GWswLwnRk9bAltqimW1rgZ5muozxA=;
        b=eWymMlDNyS2cwMbV44K2X8X7rabeSf+urDbglyNnES0eZnQTbyp4PyE2yGjxFU5CSzNBnK
        39XPgSCPeaoQSJTAfKJbuL9PMLwMiNgd5J6EDhBlmT8NG53qWXe69eU9FrZOMGsWsmlUWv
        eMxzjWdtty2m1DuG9o5wp2W6aOlBly8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-ITDSOSI0PIWIoFrXNELlvg-1; Tue, 20 Dec 2022 05:25:11 -0500
X-MC-Unique: ITDSOSI0PIWIoFrXNELlvg-1
Received: by mail-qv1-f71.google.com with SMTP id y5-20020a0cec05000000b004f98514e3fcso6888407qvo.18
        for <linux-next@vger.kernel.org>; Tue, 20 Dec 2022 02:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFprmyhyXtWWl/GWswLwnRk9bAltqimW1rgZ5muozxA=;
        b=g4VSxec3ejF0UDcn7V9tUwQ66j95YjYvt/CLdmyp2JqfUgjOHVjWGmpdmuMxQV8PmD
         txGKuv3tT4mPiA4vv7C7EW1OUC3bTOt7NQsPy7lMpO74U4cjXYjX/hJf6/GiAruo+d8n
         ssq5VQc6Qm6UHfGP8tCmgDLMohweQ3RtQrbYcJVb4Us+TQk5FnFBRj5fLnY6hJ6ABGb3
         FMZvHSbzI7SZ3aB+lMKkKTFyayAgbauC3WnyTp4yPHQC0oqs89HXepqsFdiPfW6evn9z
         ryWfYV3gU0Jt1tSgnHoD2OGW1zQ4LD9uptmeqN+YTw2F89fZ9Ysa/mhF5VhH5VIHyym7
         DKvw==
X-Gm-Message-State: ANoB5pkHrD5pf3hEE7uWkWGxdNQp2y2vdw6/tzABfO9phuzOvu74mSDA
        eB0PTGJA6XfJQAtZlBb3oMFPIaHREYBT0/QoKPKsBXHW9YrM8OraBNeE7pRMqt8Q6zyWedCUWBj
        PUzJdlAJ6Nab9xq6BflM2ig==
X-Received: by 2002:ac8:5196:0:b0:3a8:2ccb:f55d with SMTP id c22-20020ac85196000000b003a82ccbf55dmr31369907qtn.33.1671531910849;
        Tue, 20 Dec 2022 02:25:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5s5r8ee0zNepl2yTpSZkf9vUEHeFz4DqkBlyrZAPziMRft+VMGYHoUlkzApghdDwESVdTexw==
X-Received: by 2002:ac8:5196:0:b0:3a8:2ccb:f55d with SMTP id c22-20020ac85196000000b003a82ccbf55dmr31369889qtn.33.1671531910547;
        Tue, 20 Dec 2022 02:25:10 -0800 (PST)
Received: from redhat.com ([37.19.199.118])
        by smtp.gmail.com with ESMTPSA id a12-20020ac84d8c000000b003434d3b5938sm7346943qtw.2.2022.12.20.02.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 02:25:10 -0800 (PST)
Date:   Tue, 20 Dec 2022 05:25:04 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>, sfr@canb.auug.org.au,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        virtualization@lists.linux-foundation.org, kernel@collabora.com
Subject: Re: [PATCH] virtio: fix virtio_config_ops kerneldocs
Message-ID: <20221220052333-mutt-send-email-mst@kernel.org>
References: <20221220073709.2687151-1-ricardo.canuelo@collabora.com>
 <Y6F8dlRQbOzIvJff@debian.me>
 <bf9bd0ba-c703-1903-7df2-ac95dea0f3e8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf9bd0ba-c703-1903-7df2-ac95dea0f3e8@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 20, 2022 at 10:54:17AM +0100, Ricardo Cañuelo wrote:
> Hi Bagas,
> 
> Thanks for the review, some comments below:
> 
> On 20/12/22 10:12, Bagas Sanjaya wrote:> On Tue, Dec 20, 2022 at 08:37:09AM +0100, Ricardo Cañuelo wrote:
> > Describe the steps needed to fix both warnings above. I see in the diff that:
> > 
> >    * move vq_callback_t() declaration above;
> >    * match entity type of virtio_config_ops; and
> >    * reformat @finalize_features description.
> 
> I wouldn't like to add redundant info in the commit message for
> such a trivial patch. The commit message describes _what_ the
> patch does. The _how_ is just as clear in the patch itself as in
> this description, IMO.

Yea it's overkill for this patch.

> > 
> > > Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> > 
> > You need to add appropriate tags:
> > 
> > Link: https://lore.kernel.org/linux-next/20221220105956.4786852d@canb.auug.org.au/
> > Fixes: 333723e8bc393d ("docs: driver-api: virtio: virtio on Linux")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> Thanks for the tip although, actually, it's not that commit that
> needs to be fixed but the kerneldoc itself.

This doesn't matter I think, what Fixes tag does is tell tools
if you have commit A you want this one on top.

> The warnings were
> made visible after that commit but not introduced by it. I'll add
> the Reported-by tag in v2.
> 
> Cheers,
> Ricardo

