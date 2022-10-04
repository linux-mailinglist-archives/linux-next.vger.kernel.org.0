Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1D7E5F3B60
	for <lists+linux-next@lfdr.de>; Tue,  4 Oct 2022 04:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiJDC0x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Oct 2022 22:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJDC0w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Oct 2022 22:26:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A9F1006C
        for <linux-next@vger.kernel.org>; Mon,  3 Oct 2022 19:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664850292;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fVkcg9C8JIxqxOQDwg0gOT0h8GaFXdcY7F7efzgxrAg=;
        b=cgbmSpn4p5uSEgWa0MVRXOuFVfqkRl0LQvUUrWaqVhHibC1bMibP2SIA6rwbvfzXo9DRx7
        JcVJGJVbCn5JZ6h5y4gw4RBmvKkF+k7mRiSGHFfA5mhK0mUKpOCw95Ut+j4FIhfpJSdODW
        Ykdp36u/wMkOa/nsH5WjkgRB/1y5BeE=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-OENb7rIhOy6iZEbtcz-FHw-1; Mon, 03 Oct 2022 22:24:50 -0400
X-MC-Unique: OENb7rIhOy6iZEbtcz-FHw-1
Received: by mail-lj1-f198.google.com with SMTP id w11-20020a05651c102b00b0026dde7ed4caso1342487ljm.8
        for <linux-next@vger.kernel.org>; Mon, 03 Oct 2022 19:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=fVkcg9C8JIxqxOQDwg0gOT0h8GaFXdcY7F7efzgxrAg=;
        b=6/TT4nCmrtHOapAWK5EHMNHj01hSwqbC1n6CIFc27zC7ylEKvdUiyITezQ3iqJVYU2
         620a/NKAxWbMwxpMATulFV2JQPy7UsUS6dLcatHx7hRnyp1sd+L8nMM8o6UgErGhhEFx
         x/arEsK5vwPmaHr8bmtD5mBtrLVEj4xzTAoYMLkNRcpMczPNhT83LcrRaAygp/1YO6+3
         cujixfZ0Np21XOmH8AcBUZI3JcDoPkf5DK0b5QqbqAlhQP+vcUeZjp4QmbbpD7gI1Y/a
         iYNa4u/b+7UqF5koz7L3RMM6KDslAmQBbCis45ovza91/8hk/9eoSaTXIvYAFXpIr/nK
         G61w==
X-Gm-Message-State: ACrzQf23TGAXQtQt9OctbDwwBxnig1Wg9Ir6/zVyJNezaHqgsGBAHRJh
        2ZrFuiGU0kJ4OTYlniHV3sioQoJ36PM5JN1tz21VN/HEhWgmbR/8NPmhwXkUtZM78Dm6CylFLa2
        hhGDGmpdL3cqrkp0p/g9wk5O5YdIMQcnr81kF8w==
X-Received: by 2002:a05:6512:3d9f:b0:4a2:4986:281 with SMTP id k31-20020a0565123d9f00b004a249860281mr1516692lfv.123.1664850288950;
        Mon, 03 Oct 2022 19:24:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43JpG4+HkP34BMh00KTDXXzJi6U2FMyVKrOOV9rwvThgPq3E1KX8F6iiYpkGCS/29GDwP66I2XdKeeelgNxP8=
X-Received: by 2002:a05:6512:3d9f:b0:4a2:4986:281 with SMTP id
 k31-20020a0565123d9f00b004a249860281mr1516681lfv.123.1664850288711; Mon, 03
 Oct 2022 19:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220930105434.111407-1-broonie@kernel.org> <20221004132047.435d42db@canb.auug.org.au>
In-Reply-To: <20221004132047.435d42db@canb.auug.org.au>
From:   David Airlie <airlied@redhat.com>
Date:   Tue, 4 Oct 2022 12:24:37 +1000
Message-ID: <CAMwc25oshRcJBoCT70B+b42bh5sPqgyoHuBx6K6ZLrwBMHnJzw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     broonie@kernel.org, Lucas Stach <l.stach@pengutronix.de>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        Hamza Mahfooz <hamza.mahfooz@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 4, 2022 at 12:21 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi broonie@kernel.org,
>
> On Fri, 30 Sep 2022 11:54:34 +0100 broonie@kernel.org wrote:
> >
> > After merging the drm tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
> > /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
> >   527 |     stream->writeback_info[j] = stream->writeback_info[i];
> >       |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
> > cc1: all warnings being treated as errors
> >
> > Caused by
> >
> >     5d8c3e836fc224 ("drm/amd/display: fix array-bounds error in dc_stream_remove_writeback()")
> >
> > I have reverted that commit for today.
>
> I am still getting this failure.  The full error is:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
>       |                                                             ~~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing 'writeback_info'
>   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
>       |                                  ^~~~~~~~~~~~~~

I'm not seeing it here, what gcc is this with?

Dave.

