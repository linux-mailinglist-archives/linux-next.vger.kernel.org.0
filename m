Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA3742E4FE
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 02:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234553AbhJOAFc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 20:05:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:60738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231305AbhJOAFc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Oct 2021 20:05:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BDE8610FF;
        Fri, 15 Oct 2021 00:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634256207;
        bh=4LQ20uG1krTlY6LZA4iRtePdasxtekH4VH2cgg20BEc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OK30nTk2jdkPaUdHDPD4BoP/VOHz81bCbGtaefq0oU7i5HrMoFiyMZvXf7FKt95xm
         tHVINp5IFifea9gdZQ0z0G7TmrUaK/SazdDftlPlguhh8/u6us6/UYOEEUKM/k5Fpo
         Vlu0D0iToFcVRxKtele6TALPSAmL5hMgb5+fSN+gOHtJ4LN6eGQlHgiLZ1Iw+Uj7ZL
         L9TevWzROt5FS0whCr05W6K2dIkfV86JpHh9mMfFaY1+n0h3sDcpNXVvGTNHWGTmE3
         4aQP9FDmsEZ8Y7cOI1QRYA9fwzVlytukB+nXsr8okmdjuNal8R8iJpduljeT5PeCBK
         Ef4QjUcU8+Hvw==
Date:   Thu, 14 Oct 2021 19:07:52 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211015000752.GA1159064@embeddedor>
References: <20211015104840.4e1ceb89@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015104840.4e1ceb89@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,

On Fri, Oct 15, 2021 at 10:48:40AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp-gustavo tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/bpf_verifier.h:9,
>                  from kernel/bpf/verifier.c:12:
> kernel/bpf/verifier.c: In function 'jit_subprogs':
> include/linux/filter.h:366:4: error: cast between incompatible function types from 'unsigned int (*)(const void *, const struct bpf_insn *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Werror=cast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
[..]
> 
>   21078041965e ("Makefile: Enable -Wcast-function-type")
> 
> I have used the kspp-gustavo tree from next-20211013 for today.

Please, merge my -next tree. All the warnings above are already fixed in
bpf-next by commit:

	3d717fad5081 ("bpf: Replace "want address" users of BPF_CAST_CALL with BPF_CALL_IMM")

So, once you merge bpf-next, those warnings will go away.

Thanks
--
Gustavo
