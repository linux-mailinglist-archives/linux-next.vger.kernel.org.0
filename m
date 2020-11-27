Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9BE2C6BEB
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 20:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730151AbgK0TSi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 14:18:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730256AbgK0TPB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2020 14:15:01 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803E3C0613D1;
        Fri, 27 Nov 2020 11:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=4JovlIohpzI+qwWZKvcpd23jikqjpizs8G1o7wuvprc=; b=eVZaVWlwSlNEPqlsoJWlfWR4iQ
        wcA9+AMlnBhSHcVa8o14Bca5/tSGBuYi1tX4/0I8RdDsvvKXpZh2V7VfovVlk6f+mMKWWj9hTXjq4
        8lBRgf+KBWZm4Gn9z5KUpcG3L70sc4mez1dLxcnwAOh5GS0aiW+3xgSycYwqMIZ6a/GAE1bU06XyU
        ogWGRSmjmUcjxodcoueyGu0/5GduHnoLgq+wFzCxr4Li/TPAz7KOMsElEDQpdfo2xjX9tPl4Ps6CO
        24LjjPdPwcxZBYxuyTlUAAR+P4QiTXlGENKfzHwWCe6sAt3ObVb/7EjJFCi9Vto2GR1a882WdMTYv
        5NwI1fvg==;
Received: from [2601:1c0:6280:3f0::cc1f]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kijAF-0002fj-Ip; Fri, 27 Nov 2020 19:12:16 +0000
Subject: Re: linux-next: Tree for Nov 27 (parisc: signal flags)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        "Eric W. Biederman" <ebiederm@xmission.com>
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
 <155a20fd-09c4-df35-9cc6-8526a89c2933@infradead.org>
Message-ID: <377a18ac-ca0d-75ba-7a50-0876dabfc1ed@infradead.org>
Date:   Fri, 27 Nov 2020 11:12:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <155a20fd-09c4-df35-9cc6-8526a89c2933@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[adding Eric]

On 11/27/20 10:43 AM, Randy Dunlap wrote:
> On 11/27/20 1:04 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20201126:
>>
> 
> on parisc, _SA_SIGGFAULT is undefined and causing build errors.
> 
> commit 23acdc76f1798b090bb9dcc90671cd29d929834e
> Author: Peter Collingbourne <pcc@google.com>
> Date:   Thu Nov 12 18:53:34 2020 -0800
> 
>     signal: clear non-uapi flag bits when passing/returning sa_flags
> 
> 
> 
> _SA_SIGGFAULT is not used or defined anywhere else in the
> kernel source tree.


Here is the build error (although it should be obvious):

../kernel/signal.c: In function 'do_sigaction':
../arch/parisc/include/asm/signal.h:24:30: error: '_SA_SIGGFAULT' undeclared (first use in this function)
   24 | #define __ARCH_UAPI_SA_FLAGS _SA_SIGGFAULT
      |                              ^~~~~~~~~~~~~



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
