Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43923B4561
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 16:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhFYOUh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 10:20:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:44208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229653AbhFYOUh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Jun 2021 10:20:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC6956162F;
        Fri, 25 Jun 2021 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624630696;
        bh=LSdeyXiFoE3OXeWs86ZxNRD8nrKgnMYz0WptQuMdPWU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ER3qOtf15njO4d4mAqvqJQ6QBupd4fpuOJ8aoFrUh7aDKPUGO4/KP6yj0GgK85uDw
         QoEiufnOikvrMSHI/ZeyJeDtV/1i0XyI5bX+AORCrFUQ8bsUgNLrX1EpsSLg6QjU4e
         rFOSvqApcz2SVRlxT5FXQ5S+I5lwFZRhftL6hKYaxtsLIdiyOggZRuqILci67WKlBz
         MT5gFWLFdjuUN2HlAjEs3dD2Au9oe0adS7b04jvYkkUrhjE/GMh/03zhVhZTojBg+W
         uS7CnwaBmpCTWZ0YUbuc2eCQjTQ+NFSaOd6IRazXlvIDtus37MW41PETsQKX9E2mTH
         YP9CITTNU9+vg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id ADEA85C065A; Fri, 25 Jun 2021 07:18:16 -0700 (PDT)
Date:   Fri, 25 Jun 2021 07:18:16 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the rcu tree
Message-ID: <20210625141816.GA4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210625141844.2f196aeb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625141844.2f196aeb@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 25, 2021 at 02:18:44PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   c6f5e7e1ac95 ("tools/nolibc: Implement msleep()")
>   d7c47ea32af0 ("tools: include: nolibc: Fix a typo occured to occurred in the file nolibc.h")
> 
> are missing a Signed-off-by from their committer.

Fixed, and apologies for the hassle!

							Thanx, Paul
