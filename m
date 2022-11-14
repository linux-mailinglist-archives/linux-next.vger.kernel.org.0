Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 143186283FA
	for <lists+linux-next@lfdr.de>; Mon, 14 Nov 2022 16:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236826AbiKNPdZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Nov 2022 10:33:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236791AbiKNPdX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Nov 2022 10:33:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CFD2CE01
        for <linux-next@vger.kernel.org>; Mon, 14 Nov 2022 07:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668439941;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=riRMqi77jXEYSwfnt37XFg/WulJLMHf4DMWhEmN9Kr4=;
        b=Oy7iWQWpB3kjO1yVZSv7Tp/eUhl9PcRdIfsZRJrdG00ACaNXXbK6LntPQb/BfPfDM2ZzOD
        3SyavfJExXP4TOK0FV4/5b4QLEZV8n1MSlPUezT4VQwdffaWOJdVP3w7Splmnhj1tmJfFC
        5Vu+G/wj2ATEethRu2DcTadcd4WgIwY=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-396-amj5Ov4RPn6fewqgie7Apg-1; Mon, 14 Nov 2022 10:32:20 -0500
X-MC-Unique: amj5Ov4RPn6fewqgie7Apg-1
Received: by mail-io1-f69.google.com with SMTP id bx19-20020a056602419300b006bcbf3b91fdso5895390iob.13
        for <linux-next@vger.kernel.org>; Mon, 14 Nov 2022 07:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riRMqi77jXEYSwfnt37XFg/WulJLMHf4DMWhEmN9Kr4=;
        b=KBSB4p8FuaZGRUkAIjIO0ED7HnANLZrGoI1PEueTF7owrptn2OGNYHqdGomGS6eca7
         qooxVbz892KLh2smpde3N4Ke1zbnn9wVnYpmjG20Ub3cbTZfT+gSUNxzRJeOrv9kqvf0
         4hCbbdk46VgHwMNUvEY4n2eOmWioxVXCqY0pTseKOFn/7R5/n+b27oOUYuPIPSqLjz1T
         46Ca/0Avb2bx3CohffOivw/TMeEWBPwMHzTdPdMM7ojUBkJ312KizQC+1WpNxJ7Q0V6/
         rIbgCcu7q/qlpR4hBSB6wlEEq6coPH6MbjFcrBWe4Hr9DZBUlKT50EmpFXKkhPN58oA3
         zLpg==
X-Gm-Message-State: ANoB5pmnOmKt3pmKR5vMhnjF6gy9f060MJfCFdFeZOCohEXLk1OTlDSO
        NQhSdRxWpSX6C7Z4OWsFn/9Vb7P5RqkTxEZIocKH/W/S+b01brpcXa8QWuYJ4dfuMjXlXCKdGdF
        gHFv0/FkJkWt01Kq/WZuGBA==
X-Received: by 2002:a92:910:0:b0:300:d7db:639e with SMTP id y16-20020a920910000000b00300d7db639emr6700784ilg.264.1668439939173;
        Mon, 14 Nov 2022 07:32:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6CM2CxN7w5a40B6iTPwNYm9GQh8Aq0Gcp57lphosvBVmUj0l1rXR9qaKJSWIDFve4s4sKTcw==
X-Received: by 2002:a92:910:0:b0:300:d7db:639e with SMTP id y16-20020a920910000000b00300d7db639emr6700769ilg.264.1668439938905;
        Mon, 14 Nov 2022 07:32:18 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id j15-20020a0566022ccf00b006ce94d987a3sm4027515iow.30.2022.11.14.07.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 07:32:17 -0800 (PST)
Date:   Mon, 14 Nov 2022 08:32:07 -0700
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Anthony DeRossi <ajderossi@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the iommufd tree with the
 vfio-fixes tree
Message-ID: <20221114083207.49d2274f.alex.williamson@redhat.com>
In-Reply-To: <Y3JEK376qqpBcYAq@nvidia.com>
References: <20221111153735.07a2bee1@canb.auug.org.au>
        <Y3JEK376qqpBcYAq@nvidia.com>
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

On Mon, 14 Nov 2022 09:35:39 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Fri, Nov 11, 2022 at 03:37:35PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the iommufd tree got a conflict in:
> > 
> >   drivers/vfio/vfio_main.c
> > 
> > between commit:
> > 
> >   7fdba0011157 ("vfio: Fix container device registration life cycle")
> > 
> > from the vfio-fixes tree and commit:
> > 
> >   55e16a188913 ("vfio: Move vfio_device driver open/close code to a function")
> > 
> > from the iommufd tree.
> > 
> > I fixed it up (I just used the latter version since it seems to
> > incorporate the former change) and can carry the fix as necessary.   
> 
> Yes, that is right, it is as Alex and I discussed

My plan is to merge back my fixes branch after it gets pulled into
v6.1-rc so the vfio-iommufd support can be re-based to avoid this for
v6.2.  Thanks,

Alex

