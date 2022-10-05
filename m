Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E0B5F5AF1
	for <lists+linux-next@lfdr.de>; Wed,  5 Oct 2022 22:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiJEUZn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Oct 2022 16:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiJEUZX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Oct 2022 16:25:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3E77F27B
        for <linux-next@vger.kernel.org>; Wed,  5 Oct 2022 13:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665001515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=86WWmb1vJeLs9Ctv4ANh4WOz2rPIK6lvoWUYd8tv0OA=;
        b=AQrlhsW9bRNbW29xs8kFC/csk5e76rz1iftghepgoGvy/jbwZbWbzM6EWHXnmZ15Ue6Fva
        +QwMbIZkkTF0Aw8wMar1xhq9tPQbgw15/kXiGp4s/XhWcfUqiPZbsHGi4KTTWPBu67lU9S
        KS0Ia/0UJx7oelc0FHzSTWwkqG7q/qQ=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-300-xYWBLNWIPhipc_gwdT8yHw-1; Wed, 05 Oct 2022 16:25:14 -0400
X-MC-Unique: xYWBLNWIPhipc_gwdT8yHw-1
Received: by mail-io1-f72.google.com with SMTP id o2-20020a6b5a02000000b006ad1ff1dbd6so6429616iob.13
        for <linux-next@vger.kernel.org>; Wed, 05 Oct 2022 13:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=86WWmb1vJeLs9Ctv4ANh4WOz2rPIK6lvoWUYd8tv0OA=;
        b=4br3NGf/yR1zvNCHwbFaI3CbSfWf6s2ljGY2peavgJkxM36bx6eWi52x5Z6r++8JVz
         yQ+Mo22LbzqjRwIcR2EKGcMMhpzxn91d8zUh3/HTDLkw3gx1ZiE8dVWj+sYY8IDhxAet
         H3K98Ue3YM3TqqIp1UAOCv+r2Vm0jHcYat1SQ50PBZYG2qWntaz9Y84EhtmvigywQw/Z
         nBc2GGRxXTbNpgx7jiZ7FJ9vE+hrKyoAmEEFLMmqgwjPsEeB8MRMmhx2vwJTPEM47Ajl
         A28dygqWapwsuUOH7s03rit4fpxE3sBqrUaMF7VDhSEzSXC3bqT/RbPP84JkcLlK78jt
         D/pw==
X-Gm-Message-State: ACrzQf3LcRw998qEItBsPUvIW5NrghBjVijO1UEzy6raDITgPaoO6K7i
        gqsqEh+djjCBx597rsBc2J0vdjyDYyO5330uPTtlDvZzQ1xr9nsNVN/gD/bLLX4Lm3DVXvfcFnd
        MTyFFzexYBP/+lJQxIMOziA==
X-Received: by 2002:a05:6638:1135:b0:362:bcba:6fff with SMTP id f21-20020a056638113500b00362bcba6fffmr707436jar.129.1665001513208;
        Wed, 05 Oct 2022 13:25:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zMQ8nZBstQ8/VZUmu7G1LF5iy09Gr1MWJLuQFjO/chMV4an7kCrwy4dVvl9VBSVUH7mrGwg==
X-Received: by 2002:a05:6638:1135:b0:362:bcba:6fff with SMTP id f21-20020a056638113500b00362bcba6fffmr707427jar.129.1665001513003;
        Wed, 05 Oct 2022 13:25:13 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id h14-20020a056602154e00b006a175fe334dsm7161320iow.1.2022.10.05.13.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 13:25:11 -0700 (PDT)
Date:   Wed, 5 Oct 2022 14:25:10 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the vfio tree
Message-ID: <20221005142510.199debc2.alex.williamson@redhat.com>
In-Reply-To: <20221004073151.2d4f778d@canb.auug.org.au>
References: <20221004073151.2d4f778d@canb.auug.org.au>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 4 Oct 2022 07:31:51 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   66c6b7dbbda3 ("drm/i915/gvt: fix a memory leak in intel_gvt_init_vgpu_types")
> 
> Fixes tag
> 
>   Fixes: c90d097ae144 ("drm/i915/gvt: define weight according to vGPU type")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: bc90d097ae14 ("drm/i915/gvt: define weight according to vGPU type")

Yes, I agree.  I've fixed this in my tree and forced the update to my
next branch.  Thanks!

Alex

