Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1F15691FE2
	for <lists+linux-next@lfdr.de>; Fri, 10 Feb 2023 14:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbjBJNif (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Feb 2023 08:38:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbjBJNie (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Feb 2023 08:38:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E19A360AA
        for <linux-next@vger.kernel.org>; Fri, 10 Feb 2023 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676036261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KVz0PICEKJnJhWjfxZa80vyYxDmjBOx8Ts16NJkVpFM=;
        b=fd2+929qAmiRaHWTQKlwrrIMObQ9Pxw+TMPixuEgULL1ArontMBgNaxh9zedtR6qYxZWBW
        HAuGrzwCbu3AWUaT5mCfPaJbGAAA/jkviF6wDsKRpE/6UCgLEduxEc1BEz5erXXI/RdfSS
        3jRKZGxiOmxNFdDvzj78y9U+Nj/eNEU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-478-qXWu2DAKPLWU7JYO7UUGSg-1; Fri, 10 Feb 2023 08:37:40 -0500
X-MC-Unique: qXWu2DAKPLWU7JYO7UUGSg-1
Received: by mail-yb1-f199.google.com with SMTP id v63-20020a254842000000b008f257b16d71so1239513yba.15
        for <linux-next@vger.kernel.org>; Fri, 10 Feb 2023 05:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVz0PICEKJnJhWjfxZa80vyYxDmjBOx8Ts16NJkVpFM=;
        b=jkk60fITWGCRakU7zi1/GcVnrfIMlEX3mkWuil+L7+Of0DFepUenK58M34m09QUZIP
         0owa6ZDVtekm9Avm8R1NprKfCroelMo4zmpueNgBxK2XQ/65joYs0VdrwxhHhOcwrQlh
         3i3taB4qtQlC1YtrEguYY+qlMfvKv8BfXLiEPOc9WzhdJMQW3x3YDJlzB43Y2UqajJ/3
         hMFmMZ0F6321z8qcYMhQawOolkrODIH8A8VWD3B7THI6s1z6vkOjh8YkX8pigM5S7KPn
         MYJLv9JCFEy+c/MmkiCKx1yInKBnV187uYOLxhmN+0ZAUDS+M17W85KVhbwOSE11PLB6
         tBbg==
X-Gm-Message-State: AO0yUKWvezab3y2mO2H++lHIJ4LX5+cBr+AG/DhSOnf5bCOpC/bTBJkh
        wRxaXv8TzFH4DNHIcw0PeNfoFzg1WGHhNvws8O9diyXn18QOI+UyUDHsZ70xPkpeAcasUOin0h9
        wzcM1vM6QuKTG1GmgRNA2lWyt85k+57ewI2jUXA==
X-Received: by 2002:a0d:ea10:0:b0:52e:cacd:493e with SMTP id t16-20020a0dea10000000b0052ecacd493emr247561ywe.0.1676036259732;
        Fri, 10 Feb 2023 05:37:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+OUEmSJAeQqMYvYLshQbWJegojHEsZWSRaumbRsmQh/xQFtMrIaRRMW2XSA758xlVhssD3nMpCpGr42HDRKeE=
X-Received: by 2002:a0d:ea10:0:b0:52e:cacd:493e with SMTP id
 t16-20020a0dea10000000b0052ecacd493emr247560ywe.0.1676036259519; Fri, 10 Feb
 2023 05:37:39 -0800 (PST)
MIME-Version: 1.0
References: <20230210084207.4d02d107@canb.auug.org.au>
In-Reply-To: <20230210084207.4d02d107@canb.auug.org.au>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 10 Feb 2023 14:37:28 +0100
Message-ID: <CAO-hwJJcXj7QT-N3Nmaua9C4gw=kqt0qMz_RBTskrZxgHqF-AA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the hid tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Walt Holman <waltholman09@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, Feb 9, 2023 at 10:42 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   f1fc9fbc8394 ("HID: Add support for Logitech G923 Xbox Edition steering wheel")
>
> is missing a Signed-off-by from its author.
>
> This is just a typo - "Signed-of-by".

Alright, force pushed an update of the whole for-6.3/logitech branch
with both this typo fix and the missing-12-chars-for-fixes-tag that
was in that branch too.

Also force pushed for-next, which cleans a little bit everything, with
a check that the old for-next branch and the new one have the exact
same content.

Cheers,
Benjamin

>
> --
> Cheers,
> Stephen Rothwell

