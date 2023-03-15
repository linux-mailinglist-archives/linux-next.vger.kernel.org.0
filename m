Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F53A6BA4E8
	for <lists+linux-next@lfdr.de>; Wed, 15 Mar 2023 02:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjCOByO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Mar 2023 21:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjCOByN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Mar 2023 21:54:13 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDCF0BDE3
        for <linux-next@vger.kernel.org>; Tue, 14 Mar 2023 18:54:11 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id i5so18526375pla.2
        for <linux-next@vger.kernel.org>; Tue, 14 Mar 2023 18:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1678845251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9x3nWBy4tBaxSkg9Su97HA6+gfPBWicU1zJD5hYG+0=;
        b=6Qg7bqqCVjvOFA/ZAA91vgkMLQEyl1IkEeFxoC3T/WZcXg/dLhd7si5wCstPzq3zmb
         /Z+el1uqWH8pOfSyB8EeHoBUzb6SV1pwDmQ2myOfRqzVYPUjQDOV1w8jnyQhah9W6WDh
         ki+5NmqlDMCctOS3WsJQZww3IwUWIJAQbYcKMbPFemy6zfT243dgZm+nqyAQekahCOtp
         lHcmq5KF3ET/qcqAh7rFOzK5tMM7FEsqkisDkz1yeennCIZEMSiZz4h8KG0ALmtWZgKK
         1zXkYeyJE+hwu/S+P5Uy9IU6dBBzXJKIG4YJXffDi1LyLJEhOKOCeLPSuPtHTJPTHYvS
         jyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678845251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9x3nWBy4tBaxSkg9Su97HA6+gfPBWicU1zJD5hYG+0=;
        b=7LEJvYsRvHN+eaTEOg0doY53cBFi3Fap9YEXbdvSPGBfi2ojnWxTreMgXvZSBA9pfe
         dcVOCT6KmVg5bxbumXHdJJ+j890ILgSfHXn4+hmjk42zXabo/NFvbguOaGQQ+diWsPv3
         htdGKjGbpYLXImha2MAPK2ertO1v9YO7JbLZ8Ymgr0YUfsaeLMZv8FGQSRPTGEay4tKv
         D7e96MjotWnarbAK8iG3Bd7Ir/DpLlbz/UF1fil5tKq5hJjyrmGXeO5dTyU1NP0+96Gy
         vym0WtnhsmQ0SZkCTbAQmCtQ+xv4c03crpNy2jvCuGBCOneKdvkPNZhxDTJLc/oO9eRT
         bjLA==
X-Gm-Message-State: AO0yUKV55FWLHJxddUzgjl8ZMzdG/NTvE7dmNVGb+5KM9UpYb694yVsi
        ATZUfhC+9HFsRL+OdwDY+UrVbOQ3EkdQL2mH8tYEoQ==
X-Google-Smtp-Source: AK7set+1O2Pq/kw2xXzXOTsgejyaxIIXcB6Xmc5X8B9FZO4ISNBBCXYh0IV3Xzs9NK+Lxd/IJOXrgw==
X-Received: by 2002:a17:902:cf4e:b0:19a:a815:2877 with SMTP id e14-20020a170902cf4e00b0019aa8152877mr14755466plg.6.1678845251190;
        Tue, 14 Mar 2023 18:54:11 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id km15-20020a17090327cf00b00194c2f78581sm2345537plb.199.2023.03.14.18.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 18:54:10 -0700 (PDT)
Message-ID: <ae41fa86-35e2-58c0-5dd5-0fba9146e803@kernel.dk>
Date:   Tue, 14 Mar 2023 19:54:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230315124830.1c2bd002@canb.auug.org.au>
Content-Language: en-US
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230315124830.1c2bd002@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/14/23 7:48 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> include/linux/pipe_fs_i.h:214: warning: Function parameter or member 'nonblock' not described in 'pipe_buf_confirm'
> 
> Introduced by commit
> 
>   342a048d7390 ("fs: add 'nonblock' parameter to pipe_buf_confirm() and fops method")

Thanks, I'll fix that up.

-- 
Jens Axboe


