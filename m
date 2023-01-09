Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10186661DF0
	for <lists+linux-next@lfdr.de>; Mon,  9 Jan 2023 05:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236288AbjAIEju (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Jan 2023 23:39:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236744AbjAIEjI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Jan 2023 23:39:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D70C5D;
        Sun,  8 Jan 2023 20:36:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA68860C38;
        Mon,  9 Jan 2023 04:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436EDC433D2;
        Mon,  9 Jan 2023 04:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673238975;
        bh=kORTp7sSIvwNFhB8RnFt6vgr9+pZ7Ib2ehPiDVlCZMo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=L9GlDnmDrCk+EdWJXtEM8VrfYsl5wczl3klMeRJaypj10I9ptsje4CBMLJEOj1gSo
         d1bdS8pu88jZjvNBkVStpTWsTrGo1UQbcH4CE5HiUJSB69A2tm1pqQO8DSV3lUTHrO
         SJvss1ggD5c9hGsB57SBUh6KuBNRvwULF4KvRUFtcpyAwMpm320ALSU9oURar8pzOq
         4l6P6hK1B6cs4hfgsnJFKfp38NbHAnun7rKB9B9BoBSP7gNldnBolPq+ithUCDUwaZ
         vuVEK8zPwuviw552SGdaDT9IHFbBcpsU2WP0a2wgCZrMrbN/nnzPM2imIOxSqH6LTm
         uETl14/ckDCiQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id E271C5C09C7; Sun,  8 Jan 2023 20:36:14 -0800 (PST)
Date:   Sun, 8 Jan 2023 20:36:14 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Teigland <teigland@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the rcu tree
Message-ID: <20230109043614.GJ4028633@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230109101117.2a55e070@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109101117.2a55e070@canb.auug.org.au>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 09, 2023 at 10:11:17AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the dlm tree as a different commit
> (but the same patch):
> 
>   2674cc2403f8 ("fs/dlm: Remove "select SRCU"")

Thank you!  I will drop it on my next rebase.

							Thanx, Paul
