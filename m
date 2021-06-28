Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A2B3B6AE3
	for <lists+linux-next@lfdr.de>; Tue, 29 Jun 2021 00:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbhF1WSV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 18:18:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:55928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235319AbhF1WSR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Jun 2021 18:18:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 143D861CA2;
        Mon, 28 Jun 2021 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624918551;
        bh=gDFowWm32t0VS1mEoFVoT/aTkLBvV2SGACaxjbKWklk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Wwk/uH8lsM7cQjRGStNyOPANG2zWOeH96uD+S1KJ7Zw16JPcCrFdQgF02jQKVw8W3
         NtDuSy8lYLOWo1YNZXVDI2l9/KCCvRp4KwGTpx7DBaalS3+p5rtOwPOFce8RTBhplv
         SwdoEqFI7r5eO3sxU3DI1UWKTMCCkwL7CkFm2aCwbLzb1ByOgSEjbsR0dgq1iegauN
         rhDXj+hlOIiywuNntcxENeBCgKOK+WjBnYtNvZddv4+lTF7S/Rozj74g2yrT/MrqUK
         LxIQeBn5ezCZvo6yHapxiohGallYin0nV4TT9u+gwZ7w+a+CUUPMuK6PoixhMGfhbs
         pS+QekIsgsTeA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id DA71E5C097F; Mon, 28 Jun 2021 15:15:50 -0700 (PDT)
Date:   Mon, 28 Jun 2021 15:15:50 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     liuyixian@huawei.com, liweihang@huawei.com, sfr@canb.auug.org.au,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Lockdep splat in -next
Message-ID: <20210628221550.GJ4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210628153746.GA2237462@paulmck-ThinkPad-P17-Gen-1>
 <20210628160841.GD4459@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628160841.GD4459@nvidia.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 28, 2021 at 01:08:41PM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 28, 2021 at 08:37:46AM -0700, Paul E. McKenney wrote:
> > Hello, Yixian Liu,
> > 
> > The following -next commit results in a lockdep splat:
> > 
> > 591f762b2750 ("RDMA/hns: Remove the condition of light load for posting DWQE")
> > 
> > The repeat-by is as follows:
> > 
> > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --trust-make --duration 1 --configs TASKS01
> > 
> > The resulting splat is as shown below.  This appears to have been either
> > fixed or obscured by a later commit, but it does affect bisectability.
> > Which I found out about the hard way.  ;-)
> 
> I'm confused, the hns driver is causing this, and you are able to test
> with the hns hardware???

Apparently I am as well, apologies for the noise.  I incorrectly assumed
that v5.13-rc1 was clean, but this deadlock really is present in v5.13-rc.

And here I thought I was handling the heat relatively well...

							Thanx, Paul
