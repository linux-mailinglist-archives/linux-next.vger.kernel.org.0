Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBACF42654D
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 09:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhJHHjM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 03:39:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:47306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229693AbhJHHjL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 Oct 2021 03:39:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E6A060F5A;
        Fri,  8 Oct 2021 07:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633678636;
        bh=MOfNnsk3PodJ7qtIC+vaHsfkw5aXIYHeojc2Bjb9pzI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G9IV1ybvJ7Jj02QBgXiMXP3dCgu8bh0/D+pFDRx2Jc+wibASU1MZTQKf1T+8d+CHI
         Ktm/4BP4sPQmqWURl1KE6cbdUT89dBX+8oQwI5anUOrdjeZNDsv3Qew3aCjyTB2waI
         2dCHn89pRzJFUD/k0K35P20b1kW5nnBXgKFpAtcDC6f7PfpMg5qhGgwUj4Yhfpxz7G
         9mtjxvP+q8vxvfFQAxudg26JD8En1jRkECB4EoEucy4iqi6lPAgpsj9UGhT2u/gGYc
         PrO8EADbi46nBw4LNeRXdCQZMY6k0qoUgrPBS/V6B0BOFWmGzry87kDYziT5gXAY05
         E10Olvrex7BUA==
Date:   Fri, 8 Oct 2021 08:37:12 +0100
From:   Will Deacon <will@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Message-ID: <20211008073711.GC32625@willie-the-truck>
References: <20211008170420.4044df3a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008170420.4044df3a@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 08, 2021 at 05:04:20PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   arch/arm64/kernel/mte.c
>   mm/kasan/kasan.h
>   mm/kasan/hw_tags.c
> 
> between commit:
> 
>   ec0288369f0c ("arm64: mte: Add asymmetric mode support")
> 
> from the arm64 tree and commit:
> 
>   7f3c6cb1e524 ("arm64: mte: add asymmetric mode support")
> 
> from the akpm-current tree.
> 
> I am assuming that the arm64 tree commit (and surrounding commits) is
> a newer version of the same change in the akpm-current tree, so I have
> dropped the following patches from the akpm-current tree.

Thanks, that's the right thing to do.

Will
