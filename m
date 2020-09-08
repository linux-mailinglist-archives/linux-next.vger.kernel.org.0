Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA47A261631
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 19:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731831AbgIHRF0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 13:05:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:59008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731830AbgIHQTi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Sep 2020 12:19:38 -0400
Received: from paulmck-ThinkPad-P72.home (unknown [50.45.173.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 218AA23C2E;
        Tue,  8 Sep 2020 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599573264;
        bh=vLaUN9zRc4TCVPRchoos4WMZYnabeJYrgfEpXzOtFxk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=0ZFAritFLs9rFGY7zAgtDNSztLI6xOA5Fn52R4tYSrj9HW7UwtNYznmOGLjvyvoOO
         y2UqdowraycAeL++ZM3YqjsHdlmGroa/Jdsgk7lH425/ftxV+X3YpEtlw0k8In0jxE
         sDOkBoSJLesPs0O47vpOljPp1Rjz0hNl8s7acMVY=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id D2C2E352162B; Tue,  8 Sep 2020 06:54:23 -0700 (PDT)
Date:   Tue, 8 Sep 2020 06:54:23 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20200908135423.GD29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200908153830.0a23e401@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908153830.0a23e401@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 08, 2020 at 03:38:30PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: modpost: "resched_cpu" [kernel/scftorture.ko] undefined!
> 
> Caused by commit
> 
>   20c881d0592c ("scftorture: Add an alternative IPI vector")
> 
> I have reverted that commit for today.

Good catch, (crudely) fixed by 007d16a07735 ("scftorture: Add an
alternative IPI vector") in the new rcu/next branch.

							Thanx, Paul
