Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F9B32EF67
	for <lists+linux-next@lfdr.de>; Fri,  5 Mar 2021 16:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCEPy3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Mar 2021 10:54:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhCEPyB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Mar 2021 10:54:01 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04B4C061756
        for <linux-next@vger.kernel.org>; Fri,  5 Mar 2021 07:54:01 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id h18so2428552ils.2
        for <linux-next@vger.kernel.org>; Fri, 05 Mar 2021 07:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pa+8neL6qSANAIiMx7PXvJHjUeR7PaH8wLreJl5B1T8=;
        b=u0q+bi6FE1FMODIJ9OTd0TkOqyoJx42mCm5fQrVuNgcIBJgMzIHpXK0VHjAXqUv7B+
         gzdTkWGyNYlHs65QBkfu1WhxHj/PwO88EJiU4gpgRpQFb9OTFBYnctd5WWltmeHLs8H0
         5k0M5GhXktMimoc5L7UZluJQMLdm11sDi1v/uQhXPZz1uEVrr/Z546MxC+sKqnmDwxnG
         d1yhlP/ZWxR1BqT5j+LgfSvIJ6w7poAVc3jdhFAy/dXP0Rbxt6mwIj9OdYU0URUicVqx
         /ICGVIrH8fDoV8jkAR5bD6/cjhO06sQ+vNJ8r48/+QFVOyLioMg0E7YW7lGGRuwHLinL
         oHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pa+8neL6qSANAIiMx7PXvJHjUeR7PaH8wLreJl5B1T8=;
        b=N9KlstD9oo4eZ1oeELgzJsxwushwhx/Q9m1pCYHC9a8nkVm61S6AfGpGcvOnDQYSbG
         JakEPHPmu4V/aDFpycLgBtAeNauqfLs3iVElYiBVqDrIuYl5Ts5XmA1DIAOvflhJwfWY
         lSCk3v2iMi2aiIlPOwtcKGK1KMmhb41FJkw/Nf9i789iBW8edwApqHKjNLvFpUIWm/jS
         VVvpzgG7yjxBMN4ptxSiY4NsGXg5FTi0gOor3FDzs8+KcZ2zgYf9I3qYDEBKOfDd7hiq
         MyLGH/pJgGFvgYx6FnLmrHZcjdF15zyLdib5l5pj5FE5q8gHfW01eNePywgMc3TyXAnh
         VTmw==
X-Gm-Message-State: AOAM532WjCvvOJlAFi4z3dy6xLxn3yWQaEriyrkr6/xeidpKqB31mUrJ
        2zTIsqT3two7Gbc2kGiL/jIHzqTNzbsdJw==
X-Google-Smtp-Source: ABdhPJwdLtwER3yvQibUxk/mMBxwrMuhzLUxS+UaM7Z59Ec3DDW95Oq7+hzBKsi/AqcJIuedR2BSgg==
X-Received: by 2002:a05:6e02:194a:: with SMTP id x10mr9564009ilu.165.1614959640590;
        Fri, 05 Mar 2021 07:54:00 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id w2sm1462150ioa.46.2021.03.05.07.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 07:54:00 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Wagner <dwagner@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210305105239.377577b5@canb.auug.org.au>
 <726a90e9-7139-8d0c-6e05-fcf8c15ac6ca@kernel.dk>
 <20210305074629.GB17414@lst.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <0472d90b-2286-b135-e2bf-11461768dc36@kernel.dk>
Date:   Fri, 5 Mar 2021 08:53:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305074629.GB17414@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/5/21 12:46 AM, Christoph Hellwig wrote:
> On Thu, Mar 04, 2021 at 05:26:42PM -0700, Jens Axboe wrote:
>> Christoph, since there's multiple commits with issues, mind resending
>> a fixed branch? Then I'll drop the one I pulled today.
> 
> I've fixed the commit id and dropped the patch without the author
> signoff, but your branch still has the current patches.

Killed it this morning, please resend it. Plan on shipping to Linus
today so we ensure we hit -rc2.

-- 
Jens Axboe

