Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17EF2CCEC3
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 06:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgLCFor (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 00:44:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:59526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727937AbgLCFoq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Dec 2020 00:44:46 -0500
Date:   Wed, 2 Dec 2020 21:44:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606974246;
        bh=5jCLtc7clczpiCgbZmKWRaXdDHI/Y/DaXxhZwfpU9rA=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=MeYkysOeb1XkkM6xc0jc0b7wo8FQ7Cj4xDlXYokr85BMp7+fr4T468BEv6FLTeKJG
         RVowJIlqa1N/76kXWDzw8xJDdZwK4hYYIhHtqFGuJF4CMblJWiDFy3lLfIRtgRXCVd
         T6BA/z9po5CbNdzXGU1CSnDepO6SImrH4xoeFySav3zLuzGO/CWmyGsLqSncgerw1m
         zoPFtR7XphlMKC1ggBKyVdQ1WUZhCeWiZpOr0pMuMnCSYktexW96h9mxB3+sN0SDPN
         TSO6IzQfxODBDTOlmtTwIyUdPoz6kStiuacdO9LVHZjB/wOO2hxYV0AhO3MdeGJcY2
         DLYYcRyAVHxXw==
From:   Jaegeuk Kim <jaegeuk@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jack Qiu <jack.qiu@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the f2fs tree
Message-ID: <X8h7JPsjS/wlQDsY@google.com>
References: <20201202230159.17045522@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202230159.17045522@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/02, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   32c202c563c7 ("f2fs: init dirty_secmap incorrectly")
> 
> Fixes tag
> 
>   Fixes: da52f8ade40b ("f2fs: get the right gc victim section when section
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line.

Oh, fixed the wrong commit message. :(

> 
> -- 
> Cheers,
> Stephen Rothwell


