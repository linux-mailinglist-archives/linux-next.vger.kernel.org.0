Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34057597B5D
	for <lists+linux-next@lfdr.de>; Thu, 18 Aug 2022 04:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242673AbiHRCJd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Aug 2022 22:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242672AbiHRCJc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Aug 2022 22:09:32 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3F96CF47;
        Wed, 17 Aug 2022 19:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=OSvVOdfA6FOAs8kDqxv//qJumZqVNEgMpVWHYd6sYHE=; b=ys1VzU4EM8SGT6HcPcATTxTCBz
        YhGNIaQuwsVtux+02LwQJ/ONRdIWcjxqbhHsZnXNkUYHiHeWn6xuTfqAi7a138FzBqBGJNXsOYVkM
        5+xI3dUvYbZkXDnDkqMkIm0KmCG1M9hmg4ckZ5uSEs0euHB1SyEHVKvNGUHXSrH1m/diER7q9Es0E
        9oBnFdFbT78A2q9ZPvgQaNcuNy5cgi9ObJIkMW5Lc/palxBvc7GZ1MV5ugbLwZZJVYWkxOcsdz+IM
        LNMbfnGN06rM+MEEUGTWUnOv7Eu5db00otKav1YD6eWbQuGZlnlF/kBK40DoSO9RJeu7X1+L4umRk
        ASA7BsYw==;
Received: from [2601:1c0:6280:3f0::a6b3]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oOUyN-00AzBi-GK; Thu, 18 Aug 2022 02:09:27 +0000
Message-ID: <5638aaf1-b808-bdc6-d84a-820f24facea6@infradead.org>
Date:   Wed, 17 Aug 2022 19:09:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: build failure of next-20220817 for amdgpu
Content-Language: en-US
To:     Alex Deucher <alexdeucher@gmail.com>,
        "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-next@vger.kernel.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <Yv1lepjhg/6QKyQl@debian>
 <CADnq5_Od9W1iuzYpsmODOB=Xem97ogeH_t0JrjWC-S8h0XM9fA@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CADnq5_Od9W1iuzYpsmODOB=Xem97ogeH_t0JrjWC-S8h0XM9fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 8/17/22 19:01, Alex Deucher wrote:
> On Wed, Aug 17, 2022 at 6:03 PM Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
>>
>> Hi All,
>>
>> Not sure if it has been reported, build of next-20220817 fails with the
>> error:
>>
>> ERROR: modpost: "cpu_smallcore_map" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>>
>> Trying to do a git bisect to find out the offending commit.
>>
> 
> Thanks.  I don't see that symbol in the driver at all.  Not sure where
> it is coming from.
> 

It's powerpc only.

Sudip, is it non-CONFIG_SMP by any chance?

> 
> 
>> I will be happy to test any patch or provide any extra log if needed.
>>
>>
>> --
>> Regards
>> Sudip

-- 
~Randy
