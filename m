Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28ED4312BA
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 11:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbhJRJKN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 05:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbhJRJKM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 05:10:12 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9B5C061745
        for <linux-next@vger.kernel.org>; Mon, 18 Oct 2021 02:08:01 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id o11so7706451ljg.10
        for <linux-next@vger.kernel.org>; Mon, 18 Oct 2021 02:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FA9zkt3TRCoLZEtoi5DA7JBeuBmLeLzb666axnIkoUg=;
        b=VNn2U114+hk6nRmOivu3Hv4vcO48jtV8cWK0GEHFllOfu+ZOnAXCYQRqIjfTa2i4+g
         jzTx3HoYefSoMh9U3xcqeMKmWEIwGZmovmDOUAb0O4wScj862eSrct4PomI+UyND92UY
         6/MoM9IRA6qf4BaRjQRJvxObPCrTJ62fj+UaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FA9zkt3TRCoLZEtoi5DA7JBeuBmLeLzb666axnIkoUg=;
        b=heF4NM0FjbciG2EvGCmxzXHL3nUSO+q3WfsXH1BrAWzp0Zb/yxt/F6OI4DQNd6DaDm
         g01hNxnStAI3oTgyhCZtmWL51jDFP2UoPsw4jlpij0JEWfc1kDJ2ePSUdWkhoiDjT8Zg
         IbD1Ipsf5nseXKZoMADnM5yaZ1XVtwb1F6RXAHDEmWCsGi6bdGu8abcEcDZmXchrBXXl
         RG2IQXEnAROEo91ix9P9bHjN3pnTuNzcYmgqXCmq6xVlgTIuRjj4q8463eyGMmSYJWXu
         vmbf6Kzo6bN9r+5/bU3QIzR6JMGa0bjZeH/1drH85AAHkkSelHBFB5udNIn7aC2wVzq0
         FJMg==
X-Gm-Message-State: AOAM531FJF4LvZuwD7EipfpPzc6zEUjiglPQZ9H7GD6W1Eps6OX2odc9
        KjhVt2Rkmz8uiDAL6jHZ0R1tD9YJQiTRkn0v
X-Google-Smtp-Source: ABdhPJxZRjygPEv5V7JiCxqCgKp8PxPH5shz7BERIf3PY4aUGbBNSdsMghWoXsxDpCEErYGIVHtIQQ==
X-Received: by 2002:a05:651c:158a:: with SMTP id h10mr32588819ljq.455.1634548079309;
        Mon, 18 Oct 2021 02:07:59 -0700 (PDT)
Received: from [172.16.11.1] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id bf20sm1262944ljb.137.2021.10.18.02.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 02:07:58 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211015202908.1c417ae2@canb.auug.org.au>
 <YWl+0PFixaNqgIxb@smile.fi.intel.com>
 <20211018133538.2a0dec43@canb.auug.org.au>
 <CAHp75VcDwBkwL4+cFmeJt7b-p6V0w283ai9T9K02y0Sej0WLxg@mail.gmail.com>
 <20211018194533.7af364fa@canb.auug.org.au>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <e262286b-ce0d-d46f-17be-2b59d9d42cd0@rasmusvillemoes.dk>
Date:   Mon, 18 Oct 2021 11:07:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018194533.7af364fa@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 18/10/2021 10.45, Stephen Rothwell wrote:
> Hi Andy,
> 
> On Mon, 18 Oct 2021 11:01:18 +0300 Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>>
>> On Mon, Oct 18, 2021 at 6:49 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> On Fri, 15 Oct 2021 16:14:56 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
>>>>
>>>> Thanks! As a quick fix looks good, but I think we need a separate header for
>>>> those _*_IP_ macros.  
>>>
>>> Like this (on top of my previous fix - which I assume Andrew will
>>> squash out of existence)?  
>>
>> Yep, thanks!
>> I thought that it makes sense to have STACK_MAGIC also in this header. Thoughts?
> 
> You might want to think of a different name for the header file then.

Eh, it seems more reasonable to leave it in kernel.h, then figure out
how to get rid of it completely. AFAICT it's only used in one single
place under arch/ (and I can't figure out how that magic value is
supposed to get there in the first place... that arch was thrown out in
2013 and resurrected in 2015, but that particular line doesn't make
sense), and then in some i915 code which might as well define their own
cookie.

Rasmus
