Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5234E3C9D67
	for <lists+linux-next@lfdr.de>; Thu, 15 Jul 2021 13:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235517AbhGOLGH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Jul 2021 07:06:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232800AbhGOLGH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jul 2021 07:06:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB8EE613BA;
        Thu, 15 Jul 2021 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626346994;
        bh=JIiw9vFEIJpeByFolkXMMePhi51g6oGU+zmLij732fg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gZSowf0ND9co8apT09hwh25WX5c7AklI/0drd4aJSebp19n7JijeiuQEQfBpYkWN3
         18anOw0ilv8HOfCFAT8UGJY20Gu1o0DXyIycCb5s2n2xaYmsKfbZX1tpW+FXD5CVF5
         xI17iakij4OGfylyPbCZ7VOWahF2iYEx260x8jjwzlDitv9746iYVneheVWKzjTp7q
         /jECLIgItCr5Y4T2KiY64FcCHyyol4GEET8Fks/Qu1x75fk2kacniJ1oLv2Y8SHOKN
         w86CPUbVpjdDvbBvVwMpSeGTKhpMehazXJjCWDuu0wMoKYifZLGDDPId21ZlKtz//8
         9eotZtaHP5f+Q==
Date:   Thu, 15 Jul 2021 19:03:10 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the imx-mxs tree
Message-ID: <20210715110309.GB11388@dragon>
References: <20210715080403.0431c489@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715080403.0431c489@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 15, 2021 at 08:04:03AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   f5adb50e9aa3 ("Revert "soc: imx8m: change to use platform driver"")
> 
> Fixes tag
> 
>   Fixes: 7d981405d0fd ("soc: imx8m: change to use platform driver"")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Fixed, thanks!

Shawn
