Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03EF114AD4A
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 01:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgA1AkS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 19:40:18 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39506 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgA1AkR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jan 2020 19:40:17 -0500
Received: by mail-pg1-f193.google.com with SMTP id 4so6034266pgd.6
        for <linux-next@vger.kernel.org>; Mon, 27 Jan 2020 16:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+On2tA/f8+YdYPWTvyMv08OUAQi3vZn4p7ABbJv61Bs=;
        b=yGh81KlDw0d7lEqifSeG0JkuzitPcS3k3L8txM1JudaN1u5W977obyNTj4DSzVkQAV
         d8veFrIhKya6w37e79V5fegku6Rz2ivJV7KA8ZCCY4cy3aQSA0tOtCvukKddz97RSqP5
         otrQb66lp5X97kb9xUipxQQvtLO2qE8UG30eH5M+nnOQeGcqMxHvjl0zgMik6EbwCGDo
         imz9wO3N5v7MhqMzvRYRdU5TSmlkCwj1tJyIRzrvW+0jO0mbUImx1rYbf1/ljS5m0X5c
         jeFvtTy3mc06oNvQIX4Q5oyf67ekNQ30DI2eJ8c1Ru5b66FjN+1rqRIjRldKOUKSZyMg
         36cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+On2tA/f8+YdYPWTvyMv08OUAQi3vZn4p7ABbJv61Bs=;
        b=NNe5YvgQ1Y6/ykF7hY2P6+cCOJFvvLnFlq3OhZS8jqsy6MbW1AQxkQe42gbXzxE9Zs
         9T+49yqGI8aJzcxFIoZwbR7YYuBz4uneS9bAbGxhVJAEsUx2tOt0xjnUcilMEhM7fgcO
         yAMmEzNst/bVziE0clGQ6HJKAlR9YVse6Q0hCSr5OX+jHhgYSKmij/3y4BD+tSpR3PNH
         BVv+wVU40yvhsdJgdCFHPyJqaiOUHxm7HXjsStwKSLe3NW4D/cucySaSBp0fhF4tgxV7
         K9R3lZagv5NOw6lJtqtWi78rIgp3acRgH7S9p/AbPvzVWwxzdJp2YG6joyoHJqo3Gzoq
         Uhnw==
X-Gm-Message-State: APjAAAWb/u/glFmjFrxWH1IIgmqfZlnoULnX5dIUVcy961ZQOfywdRKq
        9kmUXsZzYO0UrejM0CdABcORDAEHXfQ=
X-Google-Smtp-Source: APXvYqw/DMu1v7VrWyJz1LLZdBZ0TeXl4k1M2PToZKF1Y53WiM9U9r5NXJ6Qk/ekjAP74F9ERPfSAQ==
X-Received: by 2002:a63:1346:: with SMTP id 6mr22263434pgt.111.1580172017306;
        Mon, 27 Jan 2020 16:40:17 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id a19sm266073pju.11.2020.01.27.16.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 16:40:16 -0800 (PST)
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
References: <20200128113851.50161614@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <c8ab123b-b984-0024-2727-53d900a0f5ed@kernel.dk>
Date:   Mon, 27 Jan 2020 17:40:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128113851.50161614@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/27/20 5:38 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   fs/io_uring.c
> 
> between commit:
> 
>   73e08e711d9c ("Revert "io_uring: only allow submit from owning task"")
> 
> from Linus' tree and commit:
> 
>   9ef4f124894b ("io_uring: clamp to_submit in io_submit_sqes()")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, looks good to me. I'll try cooperating better with myself ;-)

-- 
Jens Axboe

