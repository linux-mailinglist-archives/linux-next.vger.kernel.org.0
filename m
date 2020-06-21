Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29572202B79
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 17:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730380AbgFUPx6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 11:53:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:37808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729210AbgFUPx5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Jun 2020 11:53:57 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BEFB2491E;
        Sun, 21 Jun 2020 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592754837;
        bh=wwri0GkSmRmBfUj/zzz6KpMT0eTwDFQ/mkSieKNNp2E=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=eHaOHaGmJoAW74iu13Q4q2vrRVQSYxorSbBxmkH/yjQnVeTjfUMLNQZ0RulZWH7A+
         BrEHeyeV3zJq664geF5YBe4/Ur5GeEOg9geifZFOwNLbQwW7D1l7DGuHYdUKhQEmiT
         GWNCJyjLzBsb8WKCbBQP0EsnFMtYdGZT4CSeFhFs=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 6B2703522659; Sun, 21 Jun 2020 08:53:57 -0700 (PDT)
Date:   Sun, 21 Jun 2020 08:53:57 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the rcu tree
Message-ID: <20200621155357.GD9247@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200621080632.0819a404@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621080632.0819a404@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Jun 21, 2020 at 08:06:32AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   aa56127d9ac5 ("rcu/trace: Use gp_seq_req in acceleration's rcu_grace_period tracepoint")
>   63222f379b92 ("rcu/trace: Print negative GP numbers correctly")
> 
> are missing a Signed-off-by from their committer.

Ah, fixed, thank you!

							Thanx, Paul
