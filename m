Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5781936419C
	for <lists+linux-next@lfdr.de>; Mon, 19 Apr 2021 14:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239153AbhDSMYj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Apr 2021 08:24:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52005 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239071AbhDSMYh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Apr 2021 08:24:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FP5b973w3z9vDc;
        Mon, 19 Apr 2021 22:24:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1618835046;
        bh=zZp3+Qorw8JfU+RWCL9IvATK734P2yLMhkBuOspAZko=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=N3IAifGbYvjmxWVnc+5jTzFCtLjePsZZsa2jU/3dphqyToVZZHRVt/9cb85BA0tyv
         vCTMMiCZ+yM3sIJeh8zTfQ+xoxngupIRQGbMkWrqHSCVxD4lj1XfSddVpM9OV3FmDZ
         BFnN6tS/34V+ZJ8uYgWEUnJSk1vNtxgRceEnFhGrPFOf6Mphu5w5hT7NK/MJVAzy0T
         XvZL2M2eehoxjGyWcN6t0QshjxY8QluZlQF7Zf9AuRLUrfDDTYCH4DYW0QH5LRvF4g
         noTOhcg4SsKYZrJWB3nRmWe0zwLVXjfClTMm1x5EuHgf4iogJumNZqBNpSocWCu8r1
         +81UwWbXXj1Tw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Xiongwei Song <sxwjean@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the powerpc tree
In-Reply-To: <CAEVVKH905HJoJ_WVVZadXiy3LG5y+XDpMBVVtUNOwF2MtYTv8Q@mail.gmail.com>
References: <20210419191425.281dc58a@canb.auug.org.au>
 <CAEVVKH905HJoJ_WVVZadXiy3LG5y+XDpMBVVtUNOwF2MtYTv8Q@mail.gmail.com>
Date:   Mon, 19 Apr 2021 22:24:05 +1000
Message-ID: <874kg2ea3e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Xiongwei Song <sxwjean@gmail.com> writes:
> Thank you so much Stephen. Sorry for my negligence.

My fault. I forgot to run allyesconfig.

> Should I fix this myself on powerpc tree?

I'll fix it up.

cheers
