Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E89D1DB794
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 16:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgETO6r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 10:58:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:45668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgETO6r (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 May 2020 10:58:47 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B3962072C;
        Wed, 20 May 2020 14:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589986726;
        bh=Qpny8o0lc7Mp2YhXM/sWaZyeS1tB/MGC4Nfns6hApNI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tU+T7PWyla3XoePm+yF4LKSCA1bIgebJsCbhS0H4IBIhtnBPnljXsszffSkIvX8a/
         eLFkaGpV9u2B5mH1YEakcj39jNXQSJgM4Z2tWnxr5I0jrs+6mZeM4H2Z7OwdY6XHtU
         q6nwwdTusnT3nYwNqBQ8tJazwIbzLvXvJo6G6gVQ=
Date:   Wed, 20 May 2020 22:58:43 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20200520145842.GA9249@dragon>
References: <20200520202115.5409186e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520202115.5409186e@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 20, 2020 at 08:21:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   089795766399 ("arm64: dts: ls1028a: sl28: keep switch port names consistent")
> 
> is missing a Signed-off-by from its committer.

Fixed.  Thanks Stephen!

Shawn
