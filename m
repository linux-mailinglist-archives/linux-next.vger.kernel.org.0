Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B96B669EBF
	for <lists+linux-next@lfdr.de>; Fri, 13 Jan 2023 17:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjAMQws (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Jan 2023 11:52:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbjAMQwY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Jan 2023 11:52:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55CCA8D5C0
        for <linux-next@vger.kernel.org>; Fri, 13 Jan 2023 08:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673628514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=V7kHcZok2JboWt/NUnzQQm3ugGQ47nBsRs2mV8W7iXk=;
        b=gJ4uEg//T8P/yvsyPAwdD086lD5Qw2hdC1i70xIyhaswHMDJ2NVTY1owKflSj1TS64yvZS
        uIuS1mA2hmqEQOHZxgbBUp3K6OuMCi1oBp9pSL9jE1ul9L7HyE2tZJTARrpVcMg/volBJ6
        kRaNqkS76o1piWA1iV2/QUACUe8zoaI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-RLGvLuFWNJWLJ1sYBn-C4w-1; Fri, 13 Jan 2023 11:48:33 -0500
X-MC-Unique: RLGvLuFWNJWLJ1sYBn-C4w-1
Received: by mail-wr1-f71.google.com with SMTP id d27-20020adfa35b000000b002bc813ba677so3194866wrb.6
        for <linux-next@vger.kernel.org>; Fri, 13 Jan 2023 08:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7kHcZok2JboWt/NUnzQQm3ugGQ47nBsRs2mV8W7iXk=;
        b=q854ac+zvgBmwiDeCXBc5J84Q24dAAMusT3BylnKIc+kFQwTyin6KwxgeZA5lYiQTX
         quKBLfUJXScgqzN47qfPpK2jGb2S0T228yNR/uwzmgJz5X4aQmR39kZoNdluX3IzL1ZV
         /sNw0EMj42xdI82nIJqIpsYWHNKujvfpuPQ9Nqz5Iy8AeBMzOjxr80dD8ZrOhOupMKlx
         +1cjavGvZKAZDPxeZMaNwfVgpJy3eegHI5RtslK2ihBOec0RDlJHCBsMnsvFwdKAili3
         DEz4w/+nrQKISZkSCVxr29+6wHU9aPEfdtEq3ktAHOS3Py9J+vDJUlGPi7g0uy+Un4/6
         PJVA==
X-Gm-Message-State: AFqh2kqakxniyLFA8v8cHLr1+PMK0vah46Aq8MdDgiARwioIdoXTyv3F
        KCkGZCI/fNWiY6xkoGnCbqjGJQrPehGMua5KqFqV2cBmY1ZK2PRBKwqIaRjgRTi4gXrtPOT//Y/
        UlpqzUAy+u3hImxk9jJzhpsRUPskIDPILA6yR46c+bJSQzlvPTJMbKHZoIBVmaFCMuGUEdviRAw
        ==
X-Received: by 2002:adf:ffcd:0:b0:2bd:db3b:33f5 with SMTP id x13-20020adfffcd000000b002bddb3b33f5mr3973282wrs.3.1673628511678;
        Fri, 13 Jan 2023 08:48:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXthCwxe2HyQAUqAMUletX/WOKSF5DYScC+JbVyGBLWFTQa9J69Fx8M71m+IJhFtjV5yqkIAdg==
X-Received: by 2002:adf:ffcd:0:b0:2bd:db3b:33f5 with SMTP id x13-20020adfffcd000000b002bddb3b33f5mr3973270wrs.3.1673628511448;
        Fri, 13 Jan 2023 08:48:31 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d5182000000b00236545edc91sm19630130wrv.76.2023.01.13.08.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 08:48:30 -0800 (PST)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the workqueues tree
In-Reply-To: <xhsmhzgamidp8.mognet@vschneid.remote.csb>
References: <20230113143102.2e94d74f@canb.auug.org.au>
 <Y8GHXUcXYJcHPkOY@slm.duckdns.org>
 <xhsmhzgamidp8.mognet@vschneid.remote.csb>
Date:   Fri, 13 Jan 2023 16:48:29 +0000
Message-ID: <xhsmhwn5qidnm.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 13/01/23 16:47, Valentin Schneider wrote:
> On 13/01/23 06:31, Tejun Heo wrote:
>> On Fri, Jan 13, 2023 at 02:31:02PM +1100, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the workqueues tree, today's linux-next build (x86_64
>>> allnoconfig and several others) produced this warning:
>>>
>>> kernel/workqueue.c:1993:13: warning: 'rebind_worker' defined but not used [-Wunused-function]
>>>  1993 | static void rebind_worker(struct worker *worker, struct worker_pool *pool)
>>>       |             ^~~~~~~~~~~~~
>>>
>>> Introduced by commit
>>>
>>>   793777bc193b ("workqueue: Factorize unbind/rebind_workers() logic")
>>
>> Valentin, this is caused by rebind_worker() being only used by
>> rebind_workers() which is inside CONFIG_SMP. I don't see any other uses of
>> rebind_worker(). Just fold it back into rebind_workers()?
>>
>
> Woops! Yes I only did it to keep things aligned with unbind_workers(), let
> me resend with that folded back in. Sorry!
>

Unless you'd prefer a fixup patch on top of those you've already picked up?

>> Thanks.
>>
>> --
>> tejun

