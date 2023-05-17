Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D59B706F09
	for <lists+linux-next@lfdr.de>; Wed, 17 May 2023 19:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjEQRHw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 May 2023 13:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjEQRHv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 May 2023 13:07:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE2A198E;
        Wed, 17 May 2023 10:07:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2AFF564977;
        Wed, 17 May 2023 17:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859B4C433EF;
        Wed, 17 May 2023 17:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684343269;
        bh=jlpULr56z9pfFP7Yb088Wjr+4EMYWoKXtPTLZijI+ag=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=H2be7qw2VyAmj3KaqG3LUIXAxQH5bnBIptZnYpEmoOevxhypMhcG6+oS2ihu7RZxP
         j3vn5e5jQaJPoWGYosX8znZ1LoSAQ8M9TBDHWFFzSTF6VrpY61BZ1kEd/fx6swaT8j
         AlWhdmsMDnwi7HYeK7k2CokBDNRYMTO0ICpfzdqevtaLJ8r9I9D//hPRAlXs6hLeJU
         HlrAoDjK4tRYJPS6m/GNGutXExn8MTfyqIl9RdhOmaLqB8yHcDlIBaEMtqCzQ9MTI7
         e1WfmpKOP5EdTTHvK0KsvKq7+oihJGlp3Vz8ukI8XD03lmhasoTcAKs2/IrUKIbu6d
         6yjLaxV265KVg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 14A20CE107D; Wed, 17 May 2023 10:07:49 -0700 (PDT)
Date:   Wed, 17 May 2023 10:07:49 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the rcu tree
Message-ID: <1c450a26-c85a-4c6e-8b1f-cda8b04bd174@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230511090010.2916e9d7@canb.auug.org.au>
 <59c2fd36-6920-47d8-a79c-9ff3fcf7c7ae@paulmck-laptop>
 <96c6fdf7-e589-ca56-9314-1d437b8082ac@linuxfoundation.org>
 <62cabd2d-124f-4bc3-8eb8-36773c10b4f2@paulmck-laptop>
 <427a54c6-f097-f64d-29fb-b90eee504c4b@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <427a54c6-f097-f64d-29fb-b90eee504c4b@linuxfoundation.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 17, 2023 at 10:12:49AM -0600, Shuah Khan wrote:
> On 5/16/23 06:19, Paul E. McKenney wrote:
> > On Mon, May 15, 2023 at 01:28:23PM -0600, Shuah Khan wrote:
> > > On 5/11/23 10:52, Paul E. McKenney wrote:
> > > > On Thu, May 11, 2023 at 09:00:10AM +1000, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > > 
> > > > > The following commit is also in the kselftest-fixes tree as a different
> > > > > commit (but the same patch):
> > > > > 
> > > > >     6d9ed63d8bc3 ("tools/nolibc: Fix build of stdio.h due to header ordering")
> > > > > 
> > > > > This is commit
> > > > > 
> > > > >     d7eafa64a158 ("tools/nolibc: Fix build of stdio.h due to header ordering")
> > > > > 
> > > > > in the kselftest-fixes tree.
> > > > 
> > > > I can currently cleanly remove this commit from the rest of the nolibc
> > > > commits in -rcu.
> > > > 
> > > > However, I might need to re-introduce it in some way or another, for
> > > > example, if there are dependencies on it by future nolibc patches.
> > > > (I expect another batch in a few days.)
> > > > 
> > > > So how would you like to proceed?
> > > 
> > > Paul,
> > > 
> > > I can drop this from linux-kselftest fixes if that is the easier path.
> > > Just let me know.
> > 
> > That would work better for me, less need to keep track of different
> > commits in different trees.  So could you please drop this one?
> 
> Done. Dropped d7eafa64a158 from linux-kselftest fixes.

Thank you, Shuah!

							Thanx, Paul
