Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6641A74CA4C
	for <lists+linux-next@lfdr.de>; Mon, 10 Jul 2023 05:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjGJDRe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Jul 2023 23:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbjGJDRd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Jul 2023 23:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AD7F9
        for <linux-next@vger.kernel.org>; Sun,  9 Jul 2023 20:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688959007;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a62DSLSpXeASP7dYpa5HsA33PutQ3KjJO6C/G/Q8iAk=;
        b=dr6n4xf7L3ceEwNjzbqWB6Czd05OJJkNsG3bcHa2W5U9A+AgwPGMJMXIkclrMKvUTzUdG3
        DrI4OOqIyxKQKbxBK7RuH2sRXZEUEkbqamUle975UzbvqwFfg5H1101KytbTA8/o8rf6k0
        xe//nWm/daMPJNyQPOU2bfN3254lY3A=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-D_1Vd26HMqu0NwCzXmi60w-1; Sun, 09 Jul 2023 23:16:45 -0400
X-MC-Unique: D_1Vd26HMqu0NwCzXmi60w-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2b701e0bb10so33311821fa.3
        for <linux-next@vger.kernel.org>; Sun, 09 Jul 2023 20:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959004; x=1691551004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a62DSLSpXeASP7dYpa5HsA33PutQ3KjJO6C/G/Q8iAk=;
        b=gZNSsyqOkpwbSdQfJ3zpUoBaIQpWZTxkp0JM5uiz95NAbVjBWz6BgQNocM7wdlrzZV
         er+IJwL/LYKqXjg1sPBE4a1QMTaNKVrHsPKj2PMgTkzK4/dQeZEU5RtY7CSktvCO+hew
         /GpuHau7xgSQMWam0ZIAbpznRpu8cWOOH6eI4d8XkqdNA5yVYPzuPdGr9JApNiNlEnvU
         98gtcqPuDLelqNQZzruDmgLJL192g4uHu9kIcOaKaxeOx1M+sQNGx12YVHx/2HfDln0G
         izTl5EdRXF6Kl5AIZDhF3BFtEta+4M0SeWqqW2OOLWgzv093ypYtxZDVSqdIcCCHkLQ1
         ny7g==
X-Gm-Message-State: ABy/qLZw+6/d8hrLTy1hNCKFslfXoegnqtaCp+ssOhwj0xRwXdlWlXJO
        f1/uQZ1J0RqLOtYbjE62X7uPJyYo9g7T6QMhQ2PD5EgNb+PWym9MYuR/77vw3NPgKdSK40cg/kR
        SjD7YRCWZU4BOrRhXrr+TzMHSjY9AGUvy2W7NtCKpRb6w1Q==
X-Received: by 2002:a05:651c:1025:b0:2b6:a22f:9fb9 with SMTP id w5-20020a05651c102500b002b6a22f9fb9mr8375730ljm.27.1688959004008;
        Sun, 09 Jul 2023 20:16:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEnVegvrkpNt0TR6XRnujYIiNrsRYYJzxc37gJtNWKUE7a5YX0jPBMxs0gFC9cJdQNoUf+kMZdSTNMkLAa3IKo=
X-Received: by 2002:a05:651c:1025:b0:2b6:a22f:9fb9 with SMTP id
 w5-20020a05651c102500b002b6a22f9fb9mr8375700ljm.27.1688959002988; Sun, 09 Jul
 2023 20:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230706231718.54198-1-shannon.nelson@amd.com>
In-Reply-To: <20230706231718.54198-1-shannon.nelson@amd.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Mon, 10 Jul 2023 11:16:32 +0800
Message-ID: <CACGkMEuD9DgK7CEp0cW-he3FAbzDVsvnhvouLWAMv9bUrq+ATA@mail.gmail.com>
Subject: Re: [PATCH virtio] pds_vdpa: protect Makefile from unconfigured debugfs
To:     Shannon Nelson <shannon.nelson@amd.com>
Cc:     rdunlap@infradead.org, mst@redhat.com,
        virtualization@lists.linux-foundation.org, brett.creeley@amd.com,
        netdev@vger.kernel.org, drivers@pensando.io, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 7, 2023 at 7:17=E2=80=AFAM Shannon Nelson <shannon.nelson@amd.c=
om> wrote:
>
> debugfs.h protects itself from an undefined DEBUG_FS, so it is
> not necessary to check it in the driver code or the Makefile.
> The driver code had been updated for this, but the Makefile had
> missed the update.
>
> Link: https://lore.kernel.org/linux-next/fec68c3c-8249-7af4-5390-0495386a=
76f9@infradead.org/
> Fixes: a16291b5bcbb ("pds_vdpa: Add new vDPA driver for AMD/Pensando DSC"=
)
> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  drivers/vdpa/pds/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/vdpa/pds/Makefile b/drivers/vdpa/pds/Makefile
> index 2e22418e3ab3..c2d314d4614d 100644
> --- a/drivers/vdpa/pds/Makefile
> +++ b/drivers/vdpa/pds/Makefile
> @@ -5,6 +5,5 @@ obj-$(CONFIG_PDS_VDPA) :=3D pds_vdpa.o
>
>  pds_vdpa-y :=3D aux_drv.o \
>               cmds.o \
> +             debugfs.o \
>               vdpa_dev.o
> -
> -pds_vdpa-$(CONFIG_DEBUG_FS) +=3D debugfs.o
> --
> 2.17.1
>

