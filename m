Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3F9457BAF6
	for <lists+linux-next@lfdr.de>; Wed, 20 Jul 2022 17:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234352AbiGTP6L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jul 2022 11:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbiGTP6H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jul 2022 11:58:07 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D72D4BD16
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 08:58:06 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id c17so8503072ilq.5
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UT6swPVSeMcHRK05+enKSBkos62byQoZHdG8lDo48kQ=;
        b=jyoxlAGXQp9ccWODmnsqRSLHHgOzsw+KoDnEVyhAKhZwFk+6j59bLCma24eQnvNInr
         nKauH4XJK90u8ObeWG3li7eHftlqaTxtF2vTgD1uNv6t4wPMB8Bx55BvUigjcIv8UliU
         Q3whCX1a4Rl8m7v1NIAH9Dmv7qIqGkmWEeucNPx05WKu8eWS23djQMjeOkdpCAI37VtQ
         xSYVfpxC4neSrddiaMtQoKy1cFufqTHQsNDnj+pwa6kBE6RvpHuOzygcCPA1+3Jg58Sb
         CcSmegB/WmTzxWhraXSBgKzl5L3fYCnVrcGkO44J39AsSsYYWwjyHhQi1HLSuvbmEwvr
         b2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UT6swPVSeMcHRK05+enKSBkos62byQoZHdG8lDo48kQ=;
        b=5HNj3tZK+VP3xEaY44EUpEx1F72Wpt+6waTzR/nXYgTKhP0eacgBACMSCbwIQOH1Ae
         OLnCRkZdPz3yWnMMihOwKODiDPHVaJj0onnAJKe+SE9rDhKHAPDv6J4giO++cd0u80Qo
         X8v9xfkm5JGPVC6qsxhnB2V4vAW4nU+vNOX2rMWRvlHisKHXRiCHrwwqTGosKWCNy5j4
         jfRNIm5zb2QXC47uZlkQqwP7qlqkHVzc8Qmw8E1W35FcXp2sNFpU9zyvUlWprcDoGM8Q
         yTjKvM6eT30JljcinlB/Cm0K0EPLwSH2R3kUx3kR+FO+3XedTCtJjnuSTY45NORH2tc5
         MTtw==
X-Gm-Message-State: AJIora+RgU2MDaXuWb3nAShkTH1/D4HD6JmfyPcFM9uBM9pgtm9qZCxe
        Agf9MIh8eCq7EdHXWaer2YN9PgbBKE5CHw==
X-Google-Smtp-Source: AGRyM1t6s3XZL215X7zR+DK7aJBe5zrMXNCayg0r9b5as9Fpi5Z3tXXdOjRJl1Cnp8c2gWJkUzfzTQ==
X-Received: by 2002:a05:6e02:178c:b0:2dc:2783:aac3 with SMTP id y12-20020a056e02178c00b002dc2783aac3mr19650396ilu.142.1658332685601;
        Wed, 20 Jul 2022 08:58:05 -0700 (PDT)
Received: from [192.168.1.172] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id b11-20020a92db0b000000b002dc3df1b345sm6990790iln.88.2022.07.20.08.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 08:58:04 -0700 (PDT)
Message-ID: <eefe2a4c-03b0-0cbe-cead-fe316abfea3c@kernel.dk>
Date:   Wed, 20 Jul 2022 09:58:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Song Liu <song@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220720231659.5187722d@canb.auug.org.au>
 <20220720132154.GA13957@lst.de>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220720132154.GA13957@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/20/22 7:21 AM, Christoph Hellwig wrote:
> On Wed, Jul 20, 2022 at 11:16:59PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Commit
>>
>>   32389bb813f9 ("md: stop using for_each_mddev in md_notify_reboot")
>>
>> is missing a Signed-off-by from its author.
> 
> In case this can still be fixed:
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

At least we have it documented here, I don't think we need to rebase
both repos.

-- 
Jens Axboe

