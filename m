Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 766A04E4A9D
	for <lists+linux-next@lfdr.de>; Wed, 23 Mar 2022 02:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240250AbiCWBr3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Mar 2022 21:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiCWBr2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Mar 2022 21:47:28 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2967A6FF58
        for <linux-next@vger.kernel.org>; Tue, 22 Mar 2022 18:46:00 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id q5so222366plg.3
        for <linux-next@vger.kernel.org>; Tue, 22 Mar 2022 18:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KqfEw4Ajc2umoSsEyMC9bwp+tt5nSd/kMf9EMGWLoi4=;
        b=4vaApsLfR6zf1IrbRvVkpy9wfc2EULWHx9WmPyQGkaVB2vcw9V4owbJsmrC7i3pint
         UJwGct/pLgQeEVM/my/QhKOsgLv8tt121osIxl/A8MOZzEehua9/LSQamVW/O9uM+HCj
         tBNnTURY1hLpLxQhYZLsuQ+d2UOwyqa2xtOlx8+vz0LJp8jbuA4nvcX1GMQn3DrzmGtx
         43o98itP8HT0uGr3+JC9JNUu+LbQhMYv6awtTP3Ahm3zTsRHLhzrN8NteaGzOCgMhENo
         MSeToJ1V3jQYeAWcrgPKcqlcvog059xfYukstY96WRci6bE0N+npQRjJQ5gUGDX9fMw3
         ztUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KqfEw4Ajc2umoSsEyMC9bwp+tt5nSd/kMf9EMGWLoi4=;
        b=kQx+ogOzcRjaSyI6VWpAovkyI01NfhtQuXsYfPoQzknnvpB8D3cp4QfUHEpUJfpxmT
         ZZQzGol1XCMNcZ/rK/wZZXDxSKMkztedBJi+3BrjeNYXK3GoeCJtet68jBg6saLm32Pj
         Zrnt/BU4KcAvlkdRoU0A6HMZWct1MtnJC8m2GfOL07iCzeCydO6t+n7GvqefO5uyZuj6
         g2ECg/kobgqlKp89iGMOMirIllKpbCXtP1PQH0qT6KD2Y26KP1poDFxSKrq6UCX+W45s
         dmnB4i108nr1/ICfF6mq/bsQ0S29Jrn1fHeBTziuDPhQIQ9Vz9E9U+6+a7Ars51Pge4J
         mBBg==
X-Gm-Message-State: AOAM533hottpmCnd1Vtygh4cWqp7HmKJeeekp8sWpUAsGsFgCNqFrWqN
        Dvi8zlr3AaMQoG3piWV3fOMclQ==
X-Google-Smtp-Source: ABdhPJwQyyxMLbL7zJAzXkcfXqCH9nvzSf+WzVN+f+JHID7ZeShvkkjsIKsOErIzxLBL0DI2Wvl1og==
X-Received: by 2002:a17:90b:1642:b0:1c6:c6d0:fbfa with SMTP id il2-20020a17090b164200b001c6c6d0fbfamr8416339pjb.218.1647999959543;
        Tue, 22 Mar 2022 18:45:59 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e19-20020a637453000000b003821bdb8103sm14768089pgn.83.2022.03.22.18.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 18:45:59 -0700 (PDT)
Message-ID: <26108737-fe0a-f3e6-f7ab-872427ca7b6b@kernel.dk>
Date:   Tue, 22 Mar 2022 19:45:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Keith Busch <kbusch@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220323074915.7cfb312d@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220323074915.7cfb312d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/22/22 2:49 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   c30cf83999ad ("crytpo: fix crc64 testmgr digest byte order")
> 
> Fixes tag
> 
>   Fixes: commit f3813f4b287e4 ("crypto: add rocksoft 64b crc guard tag framework")
> 
> has these problem(s):
> 
>   - leading word 'commit' unexpected

And misspelled commit title - I fixed both up, thanks Stephen.

-- 
Jens Axboe

