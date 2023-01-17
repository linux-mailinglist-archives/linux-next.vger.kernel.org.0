Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C11366DF80
	for <lists+linux-next@lfdr.de>; Tue, 17 Jan 2023 14:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjAQNxx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Jan 2023 08:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbjAQNxo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Jan 2023 08:53:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952BB3C3E
        for <linux-next@vger.kernel.org>; Tue, 17 Jan 2023 05:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673963548;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zCNIOWyp6BvkZ2wh9MfUHSp5MAA9j0ACgJb6RoOlUO0=;
        b=KcGMPKmADbLtkrQxiHf00SJE9n9GZK4kIgU6a+BtHOtoPsDQ3GFgl3wSZa/w6s+1ogFKIf
        yar99T6NX8Emlx3U6qbvpq6mWxmvZVihwHJKBpbKYblE4q52e25SOO65bKQwB+syV8wH5D
        SFkDrOM52LMHoqmjxZPcp6/UwtIXJUk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-WSOIl5Z1MFuhd8i6atRSVA-1; Tue, 17 Jan 2023 08:52:25 -0500
X-MC-Unique: WSOIl5Z1MFuhd8i6atRSVA-1
Received: by mail-lj1-f198.google.com with SMTP id y8-20020a2e9d48000000b0027f1feabc75so8194810ljj.16
        for <linux-next@vger.kernel.org>; Tue, 17 Jan 2023 05:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCNIOWyp6BvkZ2wh9MfUHSp5MAA9j0ACgJb6RoOlUO0=;
        b=O0ChVA0+VWuW4PlVW4ZCHR4WX/jvHZ8YWuFF8C0VTP8BifgnswvKbhJZheJLaMUKqq
         HCTG1ec/AVt1nmyt2c/fuvOMFoDDSWHbfq9bDbfJqufV7t8SrLsYmHI+q4eAeeayX14g
         wzlLEsJx4B5F4VkaMMwsFKZGy3SsrUL7qQ3gtBhcyGeTJQeBR9QIxoI4gcmsO4PhMJe2
         TaXiMi43RSej9eEAIorTkX3X3n67ZM9oLnt6A925me97pU2HKUNoTIQnv1lFQaRwtOtL
         Nx2Yqy62wAjAT0Ismt2egb3/ci4WaLmYD72d06ch/AbjghF37MjfZgfozx9bCg++/6i7
         uQhg==
X-Gm-Message-State: AFqh2ko+llySmQKu468pVJfN6IvBafy2NRhkWOiarS4hVd9LoHOfroMA
        Y+DH4hdIFQYzHGQ56cQQvPjd744w+DA8JJs81dgrxRfuYcYoLhxUSAQTmfhR4KxFgPW4njrpnWn
        sjgfTOl1Nw0AeGMNupoyt6h0TGBPh9LeWfp5Wng==
X-Received: by 2002:ac2:4ade:0:b0:4d0:7b7:65dc with SMTP id m30-20020ac24ade000000b004d007b765dcmr133418lfp.122.1673963544334;
        Tue, 17 Jan 2023 05:52:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9jCpstio+iSjdAor3NZ75bz+2Dnozw/p6Ykmo64gLJfiYXc3udp+wH4Z3eIPBKX1dEiSO07P7nXfvqprRwdo=
X-Received: by 2002:ac2:4ade:0:b0:4d0:7b7:65dc with SMTP id
 m30-20020ac24ade000000b004d007b765dcmr133416lfp.122.1673963544131; Tue, 17
 Jan 2023 05:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20230117150212.3d8ee843@canb.auug.org.au>
In-Reply-To: <20230117150212.3d8ee843@canb.auug.org.au>
From:   Karol Herbst <kherbst@redhat.com>
Date:   Tue, 17 Jan 2023 14:52:12 +0100
Message-ID: <CACO55ttvqwnmGS=4gig-AOy+67bDesdj2S9HDJ3hS=uyN0NGOQ@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the kspp tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 17, 2023 at 5:02 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> The following commit is also in the drm-misc tree as a different commit
> (but the same patch):
>
>   06b19f46455c ("drm/nouveau/fb/ga102: Replace zero-length array of trailing structs with flex-array")
>

which branch? Because I just fetched the remote and don't have this
commit in my local repo

> This is commit
>
>   54d47689c6e3 ("drm/nouveau/fb/ga102: Replace zero-length array of trailing structs with flex-array")
>
> in the drm-misc tree.
>
> --
> Cheers,
> Stephen Rothwell

