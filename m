Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 734E96C4054
	for <lists+linux-next@lfdr.de>; Wed, 22 Mar 2023 03:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjCVCZR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Mar 2023 22:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbjCVCZP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Mar 2023 22:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8AE14222
        for <linux-next@vger.kernel.org>; Tue, 21 Mar 2023 19:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679451868;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9aQ+a+bWlAmZ+gyzUvCuCjDZKR9JiNDMnvXlPEstOV4=;
        b=FYh9lajKg1CFD6jUeO6IwLH6qLAThYi+g5naWcIA9Ibu6QgDW9LdvwWRIeuaG7srjKkjWe
        gRYsdgVwu92IE7amG1kyCxEW5GCiicvPvkUa69FEd09ibLGywcfQnhkMIgPmtlaoz0cDDw
        1xgeS+JfTZjd9NG7eUf83Pxq0QRpCF0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-PpOBOZYqNZyH0u4__XY6qw-1; Tue, 21 Mar 2023 22:24:26 -0400
X-MC-Unique: PpOBOZYqNZyH0u4__XY6qw-1
Received: by mail-wm1-f69.google.com with SMTP id k18-20020a05600c1c9200b003ed2a3f101fso10862588wms.9
        for <linux-next@vger.kernel.org>; Tue, 21 Mar 2023 19:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679451865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aQ+a+bWlAmZ+gyzUvCuCjDZKR9JiNDMnvXlPEstOV4=;
        b=SB6q69DIKUgQACMF7szT0ad0bfV8hfapfZaylyB9wf+qxfusJoNhIgf0f8n7UNAPWc
         E1UecTsi256AoOLNaQGBVxx6jRH0JPwEEl5tKT+iFQYtUmAuexwDTzaNT4RjDGg1ITKB
         gpgWnjqUid6w7PCRrDqzTijwE2Af5qbhNfHSTQEKbG61fFovVxmDmaMPtZja+zl1AW6a
         wMwp8XhzWgAxsbXr1LilM5ZBdXLsehiK2ZLXaWiko3x6VYQ38nB8uin+3wzuQzj6BkM9
         PAFbULUDf34MdOajPIli7WL2a+E1lMycvCmnk6GUD239k1zQ+GQUNHj0Gdv1pKvjdD9e
         5yAw==
X-Gm-Message-State: AO0yUKXsNEnT+SjbNyTHZT+NvmF+AGoiRr+X5hflgJM/Fo4Pf/XZDuuF
        hGadvKJUnJV0WVcAhmiPsk2u2v5XSCZpjyoKzSn7r0XSW/LulkGiN+8TMv1iOZ5AIBt+BlM1HEL
        M2qzZmyqWs2n43AD9d2nU8Q==
X-Received: by 2002:a1c:4c19:0:b0:3ee:4dc0:d4f6 with SMTP id z25-20020a1c4c19000000b003ee4dc0d4f6mr1397679wmf.17.1679451865504;
        Tue, 21 Mar 2023 19:24:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set8505dczk//oLctuEIBb3ICklPr+fVNrGO/QMzfXYO/4tDS79+1arJ8oEfQz9dOuGEkLLxLcg==
X-Received: by 2002:a1c:4c19:0:b0:3ee:4dc0:d4f6 with SMTP id z25-20020a1c4c19000000b003ee4dc0d4f6mr1397674wmf.17.1679451865192;
        Tue, 21 Mar 2023 19:24:25 -0700 (PDT)
Received: from redhat.com ([2.52.1.105])
        by smtp.gmail.com with ESMTPSA id j36-20020a05600c1c2400b003ebf73acf9asm118939wms.3.2023.03.21.19.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 19:24:24 -0700 (PDT)
Date:   Tue, 21 Mar 2023 22:24:22 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vhost tree
Message-ID: <20230321222404-mutt-send-email-mst@kernel.org>
References: <20230322123231.2c5cbce5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322123231.2c5cbce5@canb.auug.org.au>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 22, 2023 at 12:32:31PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vhost tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> drivers/virtio/virtio_ring.c:2346: warning: Excess function parameter 'vq' description in 'virtqueue_dma_dev'
> 
> Introduced by commit
> 
>   9225f75b9b80 ("virtio_ring: introduce virtqueue_dma_dev()")
> 
> -- 
> Cheers,
> Stephen Rothwell

Fixed up, thanks, no need to repost the patch.

-- 
MST

