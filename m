Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6ECF27DFA6
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 06:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgI3Enx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 00:43:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:58512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725385AbgI3Enx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 00:43:53 -0400
Received: from paulmck-ThinkPad-P72.home (unknown [50.45.173.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B3D1207C3;
        Wed, 30 Sep 2020 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601441033;
        bh=h58pJFcKP4r8aT6h57Ez4737D/9ar4XMTYyKKr2cRac=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=A6guEv9oRYoozKMxCXy0DH03Ja9rtrFTWxWGHLEDPLQtAwILKw6qbK5g7DRAuq4G7
         zr6DJak+xAZUZtWMyhMQZMN04Cd1yBgSP8gJlAk6N/X94q2OhizoDBWCODU0dOUTfV
         hmJouBs2OqfLEN6/vXwk515tm3HqiiZLcuDHtqiI=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 073E03523039; Tue, 29 Sep 2020 21:43:53 -0700 (PDT)
Date:   Tue, 29 Sep 2020 21:43:52 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20200930044352.GY29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200930083717.0b8e7139@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930083717.0b8e7139@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 30, 2020 at 08:37:17AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   5f5f44ca646f ("EXP Revert "KVM: Check the allocation of pv cpu mask"")
> 
> is missing a Signed-off-by from its committer.

Good catch, fixed in current rcu/next, and apologies for the bother!

							Thanx, Paul
