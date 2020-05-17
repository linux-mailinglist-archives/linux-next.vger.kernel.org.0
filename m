Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959D51D6D85
	for <lists+linux-next@lfdr.de>; Sun, 17 May 2020 23:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgEQVrR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 May 2020 17:47:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:40924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726297AbgEQVrR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 May 2020 17:47:17 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D3B1320671;
        Sun, 17 May 2020 21:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589752036;
        bh=PNWctZk9pMdFlRDTenYl+JHp5npRYe1kEdnmws7kakU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=0pYJcjwjUWt2iMR1Fzx4eiXRxNMJtNzQN1ic9wt17ujnkd86ZbwOxWEtwOpiFJZ50
         ayFOa3Nl1r6SLO58+RA0zxc2hA3GMTOurtjhW4G6e7CxkE/R9IMd1CX1Jq3Z0HACuI
         f4zL2mj4RGhLcQdUiBUPhIsdeKHNvboalXxNRnwA=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id B93DB35233BC; Sun, 17 May 2020 14:47:16 -0700 (PDT)
Date:   Sun, 17 May 2020 14:47:16 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Qian Cai <cai@lca.pw>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Amol Grover <frextrite@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>, philip.li@intel.com,
        lkp@intel.com, fengguang.wu@intel.com, rong.a.chen@intel.com
Subject: Re: Default enable RCU list lockdep debugging with PROVE_RCU
Message-ID: <20200517214716.GT2869@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200514181305.GT2869@paulmck-ThinkPad-P72>
 <CA610F47-290E-4826-B1D9-7CE09D7CEA6D@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA610F47-290E-4826-B1D9-7CE09D7CEA6D@lca.pw>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 15, 2020 at 02:36:26PM -0400, Qian Cai wrote:
> 
> 
> > On May 14, 2020, at 2:13 PM, Paul E. McKenney <paulmck@kernel.org> wrote:
> > 
> > Fair enough!  And yes, the Linux kernel is quite large, so I certainly am
> > not asking you to test the whole thing yourself.
> 
> Ok, I saw 0day bot also started to report those which is good. For example,
> 
> lkml.org/lkml/2020/5/12/1358
> 
> which so far is nit blocking 0day on linux-next since it does not use panic_on_warn yet (while syzbot does).
> 
> Thus, I am more convinced that we should not revert the commit just for syzbot until someone could also convince 0day to select RCU_EXPERT and then DEBUG_RCU_LIST?

Let's ask the 0day people, now CCed, if they would be willing to
build with CONFIG_RCU_EXPERT=y and CONFIG_DEBUG_RCU_LIST=y on some
fraction of their testing.  ;-)

							Thanx, Paul
