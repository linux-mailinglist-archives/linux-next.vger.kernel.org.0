Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7916445B21A
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 03:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240784AbhKXCmE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 21:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235796AbhKXCmD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 21:42:03 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E922AC061714
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 18:38:54 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id e144so1280836iof.3
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 18:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oDR6Ez54gJXjhv8//eTFCmRhSXhku16zY+9Gc+N557I=;
        b=pFO0OBcIyttQRKgPyNeBKdG5/H1+BzVpP8ajqHo9XGcMy/+TExJ2IvMLTMEVIf8JQG
         1iCIG6ZbHTlqIM0S2uQj+xRjl4Bz9Dx/cClyMjNBMUQXhS+as5MRbFwoUhKtIZHrRliY
         1j05iZhN9rrKYzNo0kiH0AzE6Unoyd7GdEgVyRVWzS8u9rdhbUuak4J+T68/DhqmhQ4+
         jZlonKL8W/RQMuRLArezi0+qdBuQ+JSNzaqbRJb9zyNchqZVyfuWyrAMVsvdPTUWxMz8
         Pjc/iw9Ubybf0/XrjNd7ZWu1baZGErh8tmGmGK9WaRBAzCwEjrANp3w0kX8lsD5eLjf4
         VFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oDR6Ez54gJXjhv8//eTFCmRhSXhku16zY+9Gc+N557I=;
        b=foczxj8Oje1RKciihmryKpqEAWFHdk52CbP4bgB5VxneGKC9vwPDg+CGrRxxeILohz
         Vnm/z1B0v9xI8VcLNWdSIfuT2pWtQ1l8kKsK3hq3+U5rgsb01wBDl1Z1X9wSrjvoiea2
         FtCwPPWHAv7l/GHQOk+JsnnRE7U+A1+U6zicR4+UIK+EP6nzlmdRyawCM3dQbqJH9eya
         NSmDI5ACVpn7sexuO3AIWl/V+Ow551A65c16EtRq1M1OvQFTeE1+/fIkALdqPkN9NDfE
         BBuL8NKAr73/NZzuCbHOlTldQdARbkOlLGGV/4tcVBGyJVmrE1T/GXh16Fd555+WNhpS
         DnTg==
X-Gm-Message-State: AOAM533yPfN65iKOJEUuz5aTX2xcce6m5tVZBgqOsS4HAjQdbJDubMpf
        UQAcIf9oJWWxj0hMdkc7ClFEpmDE+d2TTcD3
X-Google-Smtp-Source: ABdhPJzN+fTLrMjJnhN4qikGr7oBiW9zV0LGRBpibae1TjD5ULB6oIPyY2mpNHpa+DDbLg1S5C2Yng==
X-Received: by 2002:a05:6602:3314:: with SMTP id b20mr10316177ioz.214.1637721534138;
        Tue, 23 Nov 2021 18:38:54 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id y12sm9984495ill.71.2021.11.23.18.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 18:38:53 -0800 (PST)
Subject: Re: linux-next: manual merge of the tomoyo tree with the block tree
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211124113825.2d9de813@canb.auug.org.au>
 <cbeb57ae-5a87-9959-689f-d9d73baf6ee4@kernel.dk>
 <b5d2fbb7-5bc6-f0c1-0869-1c3e7096677e@i-love.sakura.ne.jp>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <353a1ef2-df1e-21f1-b27d-8ff940279299@kernel.dk>
Date:   Tue, 23 Nov 2021 19:38:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b5d2fbb7-5bc6-f0c1-0869-1c3e7096677e@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/23/21 7:25 PM, Tetsuo Handa wrote:
> On 2021/11/24 11:06, Jens Axboe wrote:
>>
>> Why does the tomoyo tree have loop commits is the question?
>>
> 
> I'm testing patches using my tree until maintainers respond.

It's a week old, please don't put patches from an unrelated tree
into a different tree.

-- 
Jens Axboe

