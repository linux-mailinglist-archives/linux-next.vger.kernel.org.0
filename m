Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205E132DD50
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 23:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhCDWrX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 17:47:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbhCDWrW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Mar 2021 17:47:22 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8B6C061756
        for <linux-next@vger.kernel.org>; Thu,  4 Mar 2021 14:47:22 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id fu20so184200pjb.2
        for <linux-next@vger.kernel.org>; Thu, 04 Mar 2021 14:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HFfwnn5BGnj6lZefXJEkfr7vPyB8Dkp7abcc6SdDlYI=;
        b=WgxwJExOIn6eugkg/pZg+incPPZLBJfb/Y4pa/OhsUMLDZHd1D+EwBni/AtbCojRru
         GuuG7p/7zBe4ca6nbwEYrVyldVy7osuitSlS4KILQwAqaxZusYVd3t60YBq4LYt648tn
         NhJyzg6cQepWy0fvSqk0KthugasTCgRlARJHTgKQahxIED6Qhwt1yqHtfjFSc95ZdJWb
         ZKf2mx4+Y+UKYUbl7Eg7VQz9jF2DIO0W5ivroSbeDqKdFXcWIHLbpAPAhyVDMFk1NApK
         0mEOkwMi/cr3MmdqIabQcVW9NQQcONF0c1WibKnTt1ZepYaem8jW3ST5SqXvhuWbsz1r
         PzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HFfwnn5BGnj6lZefXJEkfr7vPyB8Dkp7abcc6SdDlYI=;
        b=BiBVjg2J3x0epWQwEPgK168ZoPM7IMLktp3lP80XLa1YCsLYaqOSiaPwSneiaVoeHX
         t53GRQ/yDXUvDdFmhpv1xXmAIORjo+G2U3JIQvOG/QvrVM0nauLIThI/OduZ1RsyyULF
         YIxQ2O/JjPfFUAl5GzH0wbxgEwE93SpteKU0DomP9SGwSAfsaOEPs8WT0fuA2+2v0fsd
         dsbhceXxCN5miZtIS7U3GnNDRrKGBK7DmXG4fDX9NzYoEKOSSc5Ua9sjmHwOzCy87V8B
         YQ80+7h+BHS6gE0wo2j2cHdT7lUZpCCHQRvWm1BVCgGndVWhYcOgFdBWjVHnTQmhCbZt
         xIKw==
X-Gm-Message-State: AOAM533aQet/IpWXek9B3U+Rv9mSEf9GHU9MJeg7nW7+aIKv6kL4GF50
        AOiiQXnHvcs/bvJLTG9i6Qfam4DuplwUww==
X-Google-Smtp-Source: ABdhPJxSrdbS7FGzExZA10eJ89/F7b1iiJEmvNOWpbxQyL7eUbONZgemK7U2guCsf+5XFa8SXZegUw==
X-Received: by 2002:a17:902:7887:b029:e3:8ef0:9a9d with SMTP id q7-20020a1709027887b02900e38ef09a9dmr6023162pll.2.1614898041454;
        Thu, 04 Mar 2021 14:47:21 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id b17sm371469pfp.136.2021.03.04.14.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 14:47:20 -0800 (PST)
Subject: Re: linux-next: Signed-off-by missing for commits in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210305081954.2cfe52b5@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <14a25035-02ee-aa0f-5bc3-6b791e5e9aac@kernel.dk>
Date:   Thu, 4 Mar 2021 15:47:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305081954.2cfe52b5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/4/21 2:19 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   1b40fa66ac2b ("io_uring: reliably cancel linked timeouts")
>   42699d33e969 ("io_uring: cancel-match based on flags")
> 
> are missing a Signed-off-by from their committer.

Fixed up, thanks.

-- 
Jens Axboe

