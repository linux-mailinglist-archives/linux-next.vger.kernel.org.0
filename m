Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF6D2C191D
	for <lists+linux-next@lfdr.de>; Tue, 24 Nov 2020 00:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388103AbgKWXDI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 18:03:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733244AbgKWXDI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Nov 2020 18:03:08 -0500
Received: from kernel.org (83-245-197-237.elisa-laajakaista.fi [83.245.197.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7BB2204FD;
        Mon, 23 Nov 2020 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606172587;
        bh=ZhmGo0oSk5XXd1LXAD+u/c2dVEFHzErGV2v5+UbM/lw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CjRci32eiIy8WSlYvCUZ2prJcaZZn3lYIH+Oh0G4V/Mxmx1xWzb92WA60C9FTrC2F
         DkfQUd3WWAtQtrtx7Yv0XjrrY0TWQ/U5CKuYm0NwqGfQD7o/PJbLxrEB2OXzE2zSOx
         b4Hf8gO9QeX2a+8GEnEvPwd62QPlTWeOEstsdu3k=
Date:   Tue, 24 Nov 2020 01:03:02 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the tip tree
Message-ID: <20201123230302.GD19839@kernel.org>
References: <20201123181922.0c009406@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123181922.0c009406@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 23, 2020 at 06:19:22PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (htmldocs) produced
> these warnings:
> 
> arch/x86/kernel/cpu/sgx/ioctl.c:666: warning: Function parameter or member 'encl' not described in 'sgx_ioc_enclave_provision'
> arch/x86/kernel/cpu/sgx/ioctl.c:666: warning: Excess function parameter 'enclave' description in 'sgx_ioc_enclave_provision'
> 
> Introduced by commit
> 
>   c82c61865024 ("x86/sgx: Add SGX_IOC_ENCLAVE_PROVISION")
> 
> -- 
> Cheers,
> Stephen Rothwell

Thanks, was about sending a fix but saw that Boris put already one out,
when adding "Link: https://lore.kernel.org/linux-next/20201123101334.GC29678@zn.tnic/"

/Jarkko
