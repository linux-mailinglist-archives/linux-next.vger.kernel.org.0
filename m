Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F6D2CACC7
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 20:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730433AbgLATxP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 14:53:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgLATwv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 14:52:51 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 556F1C0617A7;
        Tue,  1 Dec 2020 11:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=ZJ1ardHcatepNBsfLnaYVi97n6BfoLo8U9ZtxlwYIjk=; b=zDBAtap96eWtUXl/e+cY/s4CMr
        fANfy8YaiuruxRhAnRoaoavd0lgfyr+h7fZcnKUM/WeTP7nMMFwbIu+vAAHa8ITAQ7Ni/rRhP/Sv1
        Q/DJE0N7IlOAOKnCyNJkVUZCG02veQq03bZ36su51kQO73uP0Dmc9TxT8tjijSJbEzTVT5NeljlJH
        i1+nuwcu6ZrkHWSnkhC56VtUG0xIcV4e61fqSa4dmL4hPsNvupqSKn3K9Xg1y8FTbjxYhLqyISocW
        dsYqhB9YOrLg/+KUYq0z8L8jX/kKBwMB4ohoQGCTzipOjT+ghCyGB/2PvfXiJGgCCIbJcFd7rYyG5
        /U3dkanw==;
Received: from [2601:1c0:6280:3f0::1494]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkBh3-0001hd-29; Tue, 01 Dec 2020 19:52:09 +0000
Subject: Re: linux-next: Tree for Dec 1 [crypto/aegis128.ko]
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ondrej Mosnacek <omosnacek@gmail.com>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
References: <20201201210349.7f617c65@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6a11bb20-2e3b-e106-8030-019580d176b1@infradead.org>
Date:   Tue, 1 Dec 2020 11:52:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201210349.7f617c65@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/1/20 2:03 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20201130:
> 

on i386 or x86_64:

CONFIG_CRYPTO_AEGIS128=m
CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y


ERROR: modpost: "crypto_aegis128_update_simd" [crypto/aegis128.ko] undefined!


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
