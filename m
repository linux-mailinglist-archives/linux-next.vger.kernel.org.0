Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AC51FF4FC
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 16:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730905AbgFROmE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Jun 2020 10:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgFROmD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2020 10:42:03 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB823C06174E
        for <linux-next@vger.kernel.org>; Thu, 18 Jun 2020 07:42:02 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d8so2510386plo.12
        for <linux-next@vger.kernel.org>; Thu, 18 Jun 2020 07:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+CwHsxmZO7al02eIsWAPOcThZHp6rfmpE6RrFb8EcPw=;
        b=fH2BztqrIj/VG/8Fx6R4BMU6mIp3/E6CMLGmQU/uhMq9bushUQaKRmtjc2Jv6li16i
         ai2HkjDikjqrO929y3PfF8UAJgLIPhzNlFOtssQW1rvMm27YMQIRPEjfv/iEY3kB2kzu
         qE0MLbvqx4DYL1d6BUSoWEsI+fMbJAN0T+bF1N79Kokc4YlMcqM/UdkpuTK4BXbq8cvD
         8qIhpehLRYycZhOttdFGbGvvWzHx4HsWXUbEQIkyYUqhJIncv3PyFS4eoVQF7sdRrr1N
         NhxbZ4sOAxaYxAuZuhrIk7Pv2J4+CnmmlNQLkN8hb9Y/+bQR0hGFz+7NquTfx2vNaPKa
         Wg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+CwHsxmZO7al02eIsWAPOcThZHp6rfmpE6RrFb8EcPw=;
        b=Scd2NxKFyCwufCNPhhFWacElY14JEW2w5nogrla7nVw2wk0wI7QiC76TCqRl4MU782
         YpF9iMcgugEgOsCmeqwSJKmaevXrSZoP6yUA3J/SHJVBxME7ts7tDQgjGKpshc0s17eU
         AgMslx5/SwfI11VlyjfumPwjximgp9W3fsBij66Qp6eMSXsNfA7Yi5k0RntcGgVpkz9s
         PAz1EYudIW17VlsKEAH+BV1P/9qhxeoEgKCWWffEPFBjh9etc1C8zzzOkra75iApFaXR
         4kvWnmkZu4l7y0lUXmnCE/oc2YTbcdMB4TudDQ0yOU02/b4BdR7IDal6MHnkCqmcIHv+
         O2Kw==
X-Gm-Message-State: AOAM530vkQRr5AqGrlA7h6MVbwbxcWNKrYElQcTvu3cVaExyi8hTSavC
        lxycBUlG6fpzSjFGYbOVJ5rEmA==
X-Google-Smtp-Source: ABdhPJycmaH/Sq6ALxmP55R4OyQZwQBY9HYoAjxXJCFGcMDHXq30eGLpBKlGwC81JM1FheQuhhv4eg==
X-Received: by 2002:a17:902:7881:: with SMTP id q1mr3907257pll.159.1592491321424;
        Thu, 18 Jun 2020 07:42:01 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id u74sm2786453pgc.58.2020.06.18.07.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 07:42:00 -0700 (PDT)
Subject: Re: linux-next: Tree for Jun 18 (fs/io_uring)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@ZenIV.linux.org.uk>
References: <20200618141530.0ca9897d@canb.auug.org.au>
 <25b48bfa-07ef-c6c8-c4c9-61c213e22f66@infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <52b64a82-34c2-268f-7aa3-4cb4f7a14e23@kernel.dk>
Date:   Thu, 18 Jun 2020 08:42:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <25b48bfa-07ef-c6c8-c4c9-61c213e22f66@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/17/20 11:38 PM, Randy Dunlap wrote:
> On 6/17/20 9:15 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> News: there will be no linux-next release tomorrow.
>>
>> Changes since 20200617:
>>
> 
> when CONFIG_BLOCK is not set/enabled:
> 
> ../fs/io_uring.c: In function 'io_async_task_func':
> ../fs/io_uring.c:4559:7: error: implicit declaration of function 'io_sq_thread_acquire_mm'; did you mean 'atomic_read_acquire'? [-Werror=implicit-function-declaration]
>    if (io_sq_thread_acquire_mm(ctx, req)) {
>        ^~~~~~~~~~~~~~~~~~~~~~~
>        atomic_read_acquire
> ../fs/io_uring.c: In function 'io_sq_thread':
> ../fs/io_uring.c:6268:4: error: implicit declaration of function 'io_sq_thread_drop_mm'; did you mean 'io_sq_thread'? [-Werror=implicit-function-declaration]
>     io_sq_thread_drop_mm(ctx);
>     ^~~~~~~~~~~~~~~~~~~~
>     io_sq_thread

Fixed it up, thanks.

-- 
Jens Axboe

