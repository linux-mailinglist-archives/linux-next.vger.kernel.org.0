Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C6A5906B7
	for <lists+linux-next@lfdr.de>; Thu, 11 Aug 2022 21:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbiHKSuU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Aug 2022 14:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235933AbiHKSuT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Aug 2022 14:50:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8821C25C60
        for <linux-next@vger.kernel.org>; Thu, 11 Aug 2022 11:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660243817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZCkYKX+YocCFfhSB40Lllh1ri1NcE9eoUatp18CalQU=;
        b=hPcy44jQlNf8ncXtzwgVh2Q1vpNLxF8zDAQVhwbv3/BR9cU8BtKyG142TJyZgSCpyHNNiE
        YPBGPjh6Fgy4YwXO9HO318thMulyYdUgfCe8bZ3E97tzj+WXFg6GlNz27kr9jbecYQZ0PM
        cZKPEAZjELHlMrkHOEOagaSKpkRBsdE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-SemK3JEJNx25WZe_iNFLdw-1; Thu, 11 Aug 2022 14:50:16 -0400
X-MC-Unique: SemK3JEJNx25WZe_iNFLdw-1
Received: by mail-wm1-f69.google.com with SMTP id i132-20020a1c3b8a000000b003a537064611so1731041wma.4
        for <linux-next@vger.kernel.org>; Thu, 11 Aug 2022 11:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ZCkYKX+YocCFfhSB40Lllh1ri1NcE9eoUatp18CalQU=;
        b=ObkubbfPC0r8NrRCwETAd5gkLfM3c3DUXtl7Kza0JobxpAK8/fvRTpBYXbbaYjxAxg
         7+9wkSTegfnVV/P3srzARDV2VaeA5KDOin3JGPoTgWLKGbXvYkewXrCjqiJVKfIcYqbm
         3l3QSyUFz3mQoL9rnROyzZ/pvY09b9HTXq803jhgI63EqcDkSXqnrQdMWZL7p4rjRN/N
         PABzU0g79YV66o2MVemCvMk9KCGl3IVP1vo4TWk0uHfSR8VCYJZjBxQVzfaDm2/DG2IG
         AB3hBCaNbv03nUyhynauLtgad5tE99viW04oiC29lfP3COdOMGAILXCNBcSu9dcSeRHT
         FagA==
X-Gm-Message-State: ACgBeo1PlDpkRTubYqr/fcVAavmdURqnP9kECRqWWFN6pp+8tEZx0HKB
        OY0XSKJYiOZJoA3YfQ4c8W4PC+WZ/3ccetVgAKTTVaGjBlfaoUbjvEFEMU5F0ajKcpyBsFOrrKh
        PWb9zFuMQBziMqQUXdBgcpQ==
X-Received: by 2002:a05:6000:1a87:b0:222:2c85:2f5b with SMTP id f7-20020a0560001a8700b002222c852f5bmr195954wry.654.1660243815348;
        Thu, 11 Aug 2022 11:50:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6LBiM5dQ9y7fRQHZ7uhmIZyZmCby6c7ic+mJTmauceGDSlYOfL1ZVjf7Fmwgdj57rpPaPTwQ==
X-Received: by 2002:a05:6000:1a87:b0:222:2c85:2f5b with SMTP id f7-20020a0560001a8700b002222c852f5bmr195948wry.654.1660243815164;
        Thu, 11 Aug 2022 11:50:15 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-178.retail.telecomitalia.it. [79.46.200.178])
        by smtp.gmail.com with ESMTPSA id 189-20020a1c02c6000000b003a545ff43c5sm172878wmc.45.2022.08.11.11.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 11:50:14 -0700 (PDT)
Date:   Thu, 11 Aug 2022 20:50:08 +0200
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        clang-built-linux <llvm@lists.linux.dev>,
        linux-next@vger.kernel.org
Subject: Re: build failure of next-20220811 due to d79b32c2e4a4
 ("vdpa_sim_blk: add support for discard and write-zeroes")
Message-ID: <20220811185008.jiqcv4ovv4sglsap@sgarzare-redhat>
References: <YvU67iF4z5gB4ZYk@debian>
 <YvVK+ZqO75QAYYnB@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YvVK+ZqO75QAYYnB@dev-arch.thelio-3990X>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 11, 2022 at 11:31:21AM -0700, Nathan Chancellor wrote:
>On Thu, Aug 11, 2022 at 06:22:54PM +0100, Sudip Mukherjee (Codethink) wrote:
>> Hi All,
>>
>> Not sure if it has been reported, builds of arm64 with clang failed to
>> build next-20220811 with the error:
>>
>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:201:3: error: expected expression
>>                 struct virtio_blk_discard_write_zeroes range;
>>                 ^
>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:204:25: error: use of undeclared identifier 'range'
>>                 if (to_pull != sizeof(range)) {
>>                                       ^
>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:207:21: error: use of undeclared identifier 'range'
>>                                 to_pull, sizeof(range));
>>                                                 ^
>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:212:60: error: use of undeclared identifier 'range'
>>                 bytes = vringh_iov_pull_iotlb(&vq->vring, &vq->out_iov, &range,
>>                                                                          ^
>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:222:38: error: use of undeclared identifier 'range'
>>                 sector = vdpasim64_to_cpu(vdpasim, range.sector);
>>                                                    ^
>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:224:43: error: use of undeclared identifier 'range'
>>                 num_sectors = vdpasim32_to_cpu(vdpasim, range.num_sectors);
>>                                                         ^
>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:225:37: error: use of undeclared identifier 'range'
>>                 flags = vdpasim32_to_cpu(vdpasim, range.flags);
>>                                                   ^
>> drivers/vdpa/vdpa_sim/vdpa_sim_blk.c:202:7: error: mixing declarations and code is incompatible with standards before C99 [-Werror,-Wdeclaration-after-statement]
>>                 u32 num_sectors, flags;
>>                     ^
>> 8 errors generated.
>>
>>
>> git bisect pointed to d79b32c2e4a4 ("vdpa_sim_blk: add support for discard and write-zeroes").
>> And, reverting that commit has fixed the build failure.
>>
>> I will be happy to test any patch or provide any extra log if needed.
>
>I am very surprised GCC does not error out in the same way, since as far
>as I understand it, labeled statements have to be followed by a
>statement and a declaration is not a statement in C so braces are
>needed. In fact, it seems like something changed (regressed?) between
>GCC 10.x and 11.x?
>
>https://godbolt.org/z/EYaGa1eE3

Interesting, I confirm that also gcc 12 does not warns/error.
This is my version:

     $ gcc --version
     gcc (GCC) 12.1.1 20220507 (Red Hat 12.1.1-1)

>
>I am going to bisect GCC to find out whether or not that was
>intentional. At any rate, isn't this the proper fix? I can send it as a
>formal patch if desired.

Yep, that was the fix and I already re-sent a new series with the patch
fixed:
https://lore.kernel.org/virtualization/20220811083632.77525-1-sgarzare@redhat.com/T/#t

Michael already queued the new version in his tree:
https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next

Thanks,
Stefano

