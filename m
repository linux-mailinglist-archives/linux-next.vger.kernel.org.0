Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA89A434FE6
	for <lists+linux-next@lfdr.de>; Wed, 20 Oct 2021 18:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhJTQQ1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 12:16:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:50266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230257AbhJTQQ0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Oct 2021 12:16:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2EFA6138F;
        Wed, 20 Oct 2021 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634746452;
        bh=UE2y6PQk7kS/8h9pP68LC8H7MYKrGzt9Qpc+opHvz4w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qVTNIOr8cRcoqC2q18mxNa3IBdgCqkP2WKUtGPuranlglR/M0b4yooOnH1Bk1Ny2g
         dYLNOIFlsFsG+tEEuZK1tpxK+U3lAbscpWlvCbqKA1X734L5pyHybnQcixEvdJR2A/
         9H5e3U2FxD6nAIMYImoO12eEXvMZn7eb+e3sgILYx7E/4bgG4gK+lFz3JwRX59kGu6
         XmCYRI94GOj5VHKyzorE7Zr+xGUj29RZQRuvBCG8Czm11kDMP4b5E3qDcGyWEOloVS
         vfZN0P1kQz+rMuyDl25yzV2Zgyky2gGhNt5TdFlam9CwOsB2UGwfII9ucrqiCJ2mG8
         PNL2zXZugvhlA==
Date:   Wed, 20 Oct 2021 11:18:51 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211020161851.GA1297326@embeddedor>
References: <20211018193048.14517460@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018193048.14517460@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Oct 18, 2021 at 07:30:48PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp-gustavo tree, today's linux-next build (sparc64
> defconfig) failed like this:
> 
> sparc64-linux-gcc: error: unrecognized command line option '-Wcast-function-type'; did you mean '-Wbad-function-cast'?
> 
> $ sparc64-linux-gcc --version
> sparc64-linux-gcc (Custom f51944395b6aa154) 7.3.1 20180130

I think this should work just fine with GCC 8.x

Thanks
--
Gustavo

> 
> Caused by commit
> 
>   21078041965e ("Makefile: Enable -Wcast-function-type")
> 
> I have reverted that commit for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


