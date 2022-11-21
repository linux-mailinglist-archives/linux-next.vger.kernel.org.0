Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E261632715
	for <lists+linux-next@lfdr.de>; Mon, 21 Nov 2022 15:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiKUO5r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Nov 2022 09:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbiKUO4g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Nov 2022 09:56:36 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357AFC80D7
        for <linux-next@vger.kernel.org>; Mon, 21 Nov 2022 06:47:06 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id n17so11345089pgh.9
        for <linux-next@vger.kernel.org>; Mon, 21 Nov 2022 06:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbZPRNpoAWt1IZGcY49DzzglCHjZBY03LNM09f4ELBI=;
        b=78bGYVUwHETe3/dcUe6FqXkjxt9rOLzz22KlOHsa1gf8adgJ6KaMXt2KaqeS5pBVfE
         LzT/SShXZs3UpwtOoYPr2U6GxSDTfxMHrH14+lEOxIY9OTpkgQLqUSTciG11G4abAgSn
         2oiF2UQNYw/5L+ScB+eTDNf6+n2tssdiqIKfDrDiVZY6UGMQT3d7XBFqWIu+zbDuZGTX
         32tmFCvYfTs4rCgohU5C7g7jaxvLlRNFC9erDZ04E13CD70Qc1Jo5FjA13iPJ4OxLPB+
         SxnI3mqBz8D2FlCuDFIP9SKTFuAwIoHQ+BhdNDVuM9o+mX9jGH65pHmRZgq9lgfR+3n1
         aKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbZPRNpoAWt1IZGcY49DzzglCHjZBY03LNM09f4ELBI=;
        b=29t7UPqIBR4kqW7Lt7gErix7iTxU5J4jtIXDO99EdAc/8p5Zb8+pfg4PqHeQd9U+7B
         oVavWgkm2duSaZ9tkfj4tnDZN/DrfRQbK6MHyEeEa7AryWMEqoyKPva+Lur/uE1JbIU1
         VdryEIJWSa3O9Tk9+VPq3SjOz1Po2ddXqGLzmhv7TdWOZoSozGPXTVxB26peqi/qK5A7
         oPO6WiJ2J/9rxmufKTVTRx8K2kC24IL6M1kYM8INQAob7oQqZIpGRl3kir6wpSlDLMOu
         PO9oaEN/58BJQKeWOZzCVN70XI+Z1sbk8FxVAEq+m2Ld16i5el/PYEK/rj1WeKgJHkOK
         deNQ==
X-Gm-Message-State: ANoB5pnbosh6RvccrniJnZgbsVBH8gnvBGowjcZIZAx4b7ZM+RTJHRC0
        T+EQqzGsohwAqPF0uSgadUSP4w==
X-Google-Smtp-Source: AA0mqf7v8wRzkyZ2rcky/TNccaCgGth3QclvkJCiae8Dg3TG+V3g+W7As53yqxX6yWfJNcbAkm8nQA==
X-Received: by 2002:a62:b501:0:b0:563:771d:417f with SMTP id y1-20020a62b501000000b00563771d417fmr920818pfe.45.1669042025491;
        Mon, 21 Nov 2022 06:47:05 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id g16-20020a1709029f9000b00186da904da0sm9856932plq.154.2022.11.21.06.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 06:47:05 -0800 (PST)
Message-ID: <da89f6e8-31b6-70bd-f0af-6cf49fb08c56@kernel.dk>
Date:   Mon, 21 Nov 2022 07:47:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dylan Yudaken <dylany@meta.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
References: <20221121134617.7eec695a@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20221121134617.7eec695a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/20/22 7:46 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   io_uring/net.c
> 
> between commit:
> 
>   91482864768a ("io_uring: fix multishot accept request leaks")
> 
> from Linus' tree and commits:
> 
>   01661287389d ("io_uring: revert "io_uring fix multishot accept ordering"")
>   6488182c989a ("io_uring: remove allow_overflow parameter")
> 
> from the block tree.
> 
> I fixed it up (I just used the latter version where they conflicted) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

I fixed up the 6.2 io_uring branch and for-next, so you should not be
seeing this one again.

-- 
Jens Axboe
