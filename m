Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C623722F377
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 17:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbgG0PHr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 11:07:47 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:56166 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728479AbgG0PHr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 11:07:47 -0400
From:   John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1595862465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4pOSX1epu0HvXZEnbpnKHZUVViDKAKmQYZtWlXKabDc=;
        b=JNwO1qkyNdDq2Ct+8O+QGOToYvb3IbEl17eZ9qUpXnFrnRfTqLRPPsXLzODFqeRvl5BHYL
        QNYKc+IjZAufKjHxbxXKDWnyD5cYLgRXyI2yP9R2ESiPJT9zHGd3Fp8r9gELGucTstQwi1
        m3dyNuN0IUXGQxu3He8fgiK4BTW2RH956lLTf13QXLYN3yfiTvigixIBw+pCoxPOMM0+kt
        IZMWytQJVQIUeA9oT2vNs387zdWy4FY1fdax5InuqKs/CGmEAwMutsBG8hGnKItG1EZl2V
        7hoVs8WmLuuKbATh8zhwPCl6h4XhA3f6HOWfg2eu+FNxaQ6gyx7lELzu4GmFWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1595862465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4pOSX1epu0HvXZEnbpnKHZUVViDKAKmQYZtWlXKabDc=;
        b=YBJl2VRdXTnJg+6j4SK+TR/s4k/rbpTxIqItP9eLBd3p8kXRBhZ3vN2yp/7CKTznSIjYDh
        4nIYC5/BH3SZvLAQ==
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the printk tree
In-Reply-To: <20200727234612.3037c4a5@canb.auug.org.au>
References: <20200727234612.3037c4a5@canb.auug.org.au>
Date:   Mon, 27 Jul 2020 17:13:44 +0206
Message-ID: <87tuxt3sjj.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020-07-27, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> In commit
>
>   96b917f8e9ec ("printk: ringbuffer: support dataless records")
>
> Fixes tag
>
>   Fixes: ("printk: use the lockless ringbuffer")
>
> has these problem(s):
>
>   - No SHA1 recognised
>
> Maybe you meant
>
> Fixes: 896fbe20b4e2 ("printk: use the lockless ringbuffer")

Yes, sorry. I did not think linux-next SHA1 hashes were used in commit
logs.

John Ogness
