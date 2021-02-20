Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E13E3203B5
	for <lists+linux-next@lfdr.de>; Sat, 20 Feb 2021 05:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhBTE6j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Feb 2021 23:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbhBTE6h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 Feb 2021 23:58:37 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6421FC06178A
        for <linux-next@vger.kernel.org>; Fri, 19 Feb 2021 20:57:57 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id q20so3214227pfu.8
        for <linux-next@vger.kernel.org>; Fri, 19 Feb 2021 20:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r74lReab8L6uDtW72KN0mZaNUmKgZAWV3ibkdpZJZVI=;
        b=V8PHBkS2UPu1wK5+96DwTaRf76hBwCntJMtSdYDsagQglfQVtG+qs8714yXjSK9Vye
         b1Z3ofLfztxDkdMeCIrTfcpZn59/NAiWfOvQKPQrzwqwIYmbBBbosUIvAoHQMGUphIIH
         yYBw00opk0X3/Wa/M+fAWT7ITQglRhTuW+TW1KSsusAYAtG3u1aqgGid7NsaYWQFKnes
         G766ja39QJf0tbmCgUAATUdkbBgwRIr4ektpj7Uz1GuKUDOXesVI5TKU5QFVSJeyZfh8
         r050czDCpIPh5hvam1YAOvXqNbwVujFYP9XEKbVbI5cC4GbkbFmdRO7eKHPOGm1GRcJZ
         k1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r74lReab8L6uDtW72KN0mZaNUmKgZAWV3ibkdpZJZVI=;
        b=cX40H0aqC56EaDb7uKDJh1N2aYum0LOH1FLi1iPwDMksg5vLOxutDlLpjWrqy5nzlD
         ppfewxTEFiBJxCJwCzcRYYnAOHotSHf3mbc6nPAEWwwWx1amzBA1KkFNbF3iPD8U67pb
         C0ewONw7MtAmLrbp+74fTFEin9HMVSjfttpuJOZhO7lX/LsKepBP7qGjBW1a5mgp5jQo
         3aC1ZjalaufbXQ2p8erh+YO1zXP1+8wn45cSB25yWri3YbAH6fs+HenaE/BytVWP75nX
         0wIecVui1Y5zPF6Jyx6Vv6/j6YKi77WP2z0i0vEYgBjiS7e4Y9Uy403Tbbbe1wBx8sC7
         QUBg==
X-Gm-Message-State: AOAM531MDMRB4h1LWAE2+O3pKdH3tJ2nMTX8dt+4Tcvm4p3LYigEKeAT
        j0dikfEtjtXBQkjj3Znbaej0qRmVyRrZXA==
X-Google-Smtp-Source: ABdhPJwo9MsDbxnjC8+IaTGrIUmrYdvQbJZTabNx24zpnuxpi+Whv0XITSS4m3j1j9HP7przt+cvjg==
X-Received: by 2002:a05:6a00:80e:b029:1b6:39dd:8b2a with SMTP id m14-20020a056a00080eb02901b639dd8b2amr5056218pfk.23.1613797075790;
        Fri, 19 Feb 2021 20:57:55 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id k24sm10936825pfg.40.2021.02.19.20.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 20:57:55 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Pavel Begunkov <asml.silence@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210220155124.4bffc798@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <cd8430b8-6f82-056a-d9a9-ff04dcf7c749@kernel.dk>
Date:   Fri, 19 Feb 2021 21:57:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210220155124.4bffc798@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/19/21 9:51 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   76676c992506 ("io_uring: fix io_rsrc_ref_quiesce races")
> 
> Fixes tag
> 
>   Fixes: 0ce4a72632317 ("io_uring: don't hold uring_lock when calling io_run_task_work*")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: a4f2225d1cb2 ("io_uring: don't hold uring_lock when calling io_run_task_work*")

Fixed it up, thanks Stephen.

-- 
Jens Axboe

