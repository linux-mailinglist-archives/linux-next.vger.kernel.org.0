Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAEAC6772A9
	for <lists+linux-next@lfdr.de>; Sun, 22 Jan 2023 22:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjAVVaS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Jan 2023 16:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjAVVaS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 Jan 2023 16:30:18 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3311315C84
        for <linux-next@vger.kernel.org>; Sun, 22 Jan 2023 13:30:17 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so9477301pjl.0
        for <linux-next@vger.kernel.org>; Sun, 22 Jan 2023 13:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6suFEBiFDBF7/CgF8yysN0WnMM/zeevTLOn21QRMh5g=;
        b=U3fFjDYd3i5BTixCoy3mHhFVdE84HIxh2ZvHx24pGbEEM4cQEd3uO8HDLNjxuHaUKA
         kFBY64M+HsxGxEew3fiXjZ92Fme1kq9EaHBH63GBfJRRWjBpDETftQ+Xa56pY/tRtlI3
         Cr15urd2k/9JUky0lwhnSOOqorjOoYY0fdusoupEh1+qiduFDnKBDKN6Wcl+tmMr/wWc
         RwIe34sn5mTLh2Nuo1och99U9TPzvYX4A3BR2bU8KUM1nsicKkbrKdiTWAQb+jeE+qSN
         aJLJuS+oNG4IkshelVm+jAg25wDLNg4V9J0T46HYHK3ztgnVahVhr4bDrtDU3UzXbKXJ
         v/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6suFEBiFDBF7/CgF8yysN0WnMM/zeevTLOn21QRMh5g=;
        b=PrKiZIUOk8ZlFtZVpnVifiXaujapA2CMoiVCT75oWm4iCSPQpzCGm04u05TA19wjUk
         oAoijjy2RUZb/yQMtE3y7EfZAF0+Fm3rmxuMXCleETZdCuBgFoBG0sAwCMwyf9JnoUR1
         ZZAgy2DjpAafX6CFIrGw69eDmtItRdSqVh5+u4UjXlB69+ktitjCqahCJJKhj2XVn4+1
         2BClmzaNQD82+UgeJG6oUHRwBs4As1EbHqr/+KphELbiOfPwFaGr7VhLJZMZpb5GbVr/
         Q9qXlHqkCVIv11bNViPkuz1eLBt+eS5Th98DucP1nkwf6+g+8d0zbkZeznzmvCI3dmQC
         3U1A==
X-Gm-Message-State: AFqh2kqjTjE3hrY9fEOiEIAqa+okplRmpfOqzN+55Cw6k0ibNyDjgY0d
        y92BBc4STTeOFG1/Tg3BdyIzMw==
X-Google-Smtp-Source: AMrXdXtFAqDQScp/WucJuxYs0KLE3WhgT6lq/XT8dORGasu7uK9h74fpyhMz4sPX3sseoSA0/DxpHw==
X-Received: by 2002:a05:6a21:c00f:b0:b9:5fc3:6441 with SMTP id bm15-20020a056a21c00f00b000b95fc36441mr3070423pzc.0.1674423016663;
        Sun, 22 Jan 2023 13:30:16 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090aca8900b0022bb3ee9b68sm4290655pjt.13.2023.01.22.13.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 13:30:16 -0800 (PST)
Message-ID: <61a0120a-4cff-90c0-6f87-4957aaee7a0b@kernel.dk>
Date:   Sun, 22 Jan 2023 14:30:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230123080830.7d50fccd@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230123080830.7d50fccd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/22/23 2:08 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   24337ddf1ff4 ("io_uring: Enable KASAN for request cache")
> 
> is missing a Signed-off-by from its committer.

Fixed up, thanks.

-- 
Jens Axboe


