Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6616C23B8
	for <lists+linux-next@lfdr.de>; Mon, 20 Mar 2023 22:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbjCTVc1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Mar 2023 17:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbjCTVcZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Mar 2023 17:32:25 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540BC301B7
        for <linux-next@vger.kernel.org>; Mon, 20 Mar 2023 14:31:37 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id q6so6113626iot.2
        for <linux-next@vger.kernel.org>; Mon, 20 Mar 2023 14:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679347857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFl6RMvoZ1o/0fkcBGL9q9oP4iImAYwQZJB7vl9W6go=;
        b=SgViGczq8oVLiTbEQosMBSfkjsTE6pcKCyIpGh7CPyjwFgQMxtgD/7i3AjWprNwTuH
         D3YMm71PqNeVJ/36zfy6XsKX3hGBS0/51zmXKR1+K3u/4Bh5Y5eUrEz6umuF8O8cB5Ea
         cHGnNPw/K+lgWEbvHijEd3ONdwlB/jax8Z9A23PJVv67LNage0wnmY0UX13u1lGMV/i7
         iaBMWoQS8LRyqEQJAe6BKytOPQUyFJ4uzu/bqVmetfnV5Edyu2YPSAt00sQNhE5QNtMT
         HFPlI6n2OsiFicFX2umGFsNb7CZpbMNpBvgstANjOfHC2jaCqUK2FvTDPi17yt0vLcqi
         unVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679347857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFl6RMvoZ1o/0fkcBGL9q9oP4iImAYwQZJB7vl9W6go=;
        b=cHH/y7pggJT8df7BQJpgvMy7bHz8BZs1qAExBpFv6x7pc8NnLT0GMBlS9ZCXybrLZs
         emCD8VWDSCW6Zls1Q9EtOrRrDYzagJmux05VFxLhNvCrlVU4HDQPCSSlvvNZZDd00wTe
         OFl28APmk1fZf5Zoi9pycp/61RQaeZNDMwBVS9lmAHAn0kBzOxT2mNljwNWgKKLlT6zs
         8mpc4tbqUrKsk9phstR93XWUmLo6jwGZ8ky54B09SzS6VuleDEQUVm1hgj8yPerhv69n
         O1/eMMspsvekOihRdVDObdA3/9XuAFpHP/pgNKWBEUs+xmiODrQSatx0pA1FqCAhx+wF
         Dxvw==
X-Gm-Message-State: AO0yUKUiW3qBL0/URBzrZOkZiY7MPQ+qNUUyyzYCUxWBelVIqDWGzIXx
        EVv5Pcsdl8dbVhEgKrzs4MwA06cPeZk72qaD6RDfXg==
X-Google-Smtp-Source: AK7set+RLeI2Na9krLh1MuCMBL4O+d8K+aErBKkkVd3FFd38/+GqfFZCG9rE4ZGf5usBW64PAidtyw==
X-Received: by 2002:a05:6602:2c96:b0:74c:99e8:7f44 with SMTP id i22-20020a0566022c9600b0074c99e87f44mr591794iow.2.1679347856831;
        Mon, 20 Mar 2023 14:30:56 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id a190-20020a0216c7000000b0040644c4a7a1sm3399122jaa.129.2023.03.20.14.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 14:30:56 -0700 (PDT)
Message-ID: <da44d68e-34d7-40a0-d941-3951be1e56d3@kernel.dk>
Date:   Mon, 20 Mar 2023 15:30:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Keith Busch <kbusch@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230321082848.25cfe9a1@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230321082848.25cfe9a1@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/20/23 3:28 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   aa939e415c6c ("blk-mq: remove hybrid polling")
> 
> Fixes tags
> 
>   Fixes: 9650b453a3d4b1, "block: ignore RWF_HIPRI hint for sync dio"
>   Fixes: d729cf9acb93119, "io_uring: don't sleep when polling for I/O"

Oops, too much copying. Fixed them up.

-- 
Jens Axboe


