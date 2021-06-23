Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70EBA3B239B
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 00:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFWWce (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 18:32:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:60316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229688AbhFWWce (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Jun 2021 18:32:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFB1C611C1;
        Wed, 23 Jun 2021 22:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624487416;
        bh=DhcHWMyjMVjNVHNhiFtI532fMsfdsNNY2V6a4zXHM+M=;
        h=Date:From:To:Cc:Subject:Reply-To:From;
        b=nZnhPuzcl63ZvhrCRydY4ZN7qmXjTsEzw4AlE7ZNZioNN/n28hh9idGLsqv9nWYSL
         1rFdrLPR4Sk7CMPVxuz3rYiv3mm7Qp6nSpvwWO80Qh7g+n9RHZQwf1Y/txr0iH79/j
         ZwiTYSyMowQS9jPzI6ED/GxNvT1ZeWBwReF6LFqxHIUI04+SM79eFTSMgUyfsUpWkT
         Ke2Mmi9wOepE3owm4QxKbIuoTSmsdgjgziXNhG9f77ht1SbDw/47XjWcZ5MYPf+YBL
         aUc+RKHRyOLrfIFJICj/ZsqnHAsyTvMkH18JoCr8n4c2L7F/v2SLl4xCDfOzInysAB
         PIWkR80jSndvA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 6359E5C08D8; Wed, 23 Jun 2021 15:30:15 -0700 (PDT)
Date:   Wed, 23 Jun 2021 15:30:15 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     aneesh.kumar@linux.ibm.com
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, elver@google.com, ndesaulniers@google.com
Subject: Build failure in -next
Message-ID: <20210623223015.GA315292@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello, Aneesh!

Yesterday evening's next-20210622 testing gave me the following
kernel-build error:

ld: mm/mremap.o: in function `move_huge_pud':
/home/git/linux-next/mm/mremap.c:372: undefined reference to `__compiletime_assert_395'

Bisection landed on this commit:

257121c5aabe ("mm/mremap: convert huge PUD move to separate helper")

I have no idea how this commit relates to that error message, but
reverting this commit on top of next-20210622 really does get rid of
the problem.

The following reproducer provokes this error:

tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --torture lock --configs LOCK07 --build-only --kconfig "CONFIG_DEBUG_LOCK_ALLOC=y CONFIG_PROVE_LOCKING=y" --kmake-arg "CC=clang-11"

Run the above command in the top-level directory of your -next source
tree, and using this compiler:

$ clang-11 -v
Ubuntu clang version 11.1.0-++20210428103817+1fdec59bffc1-1~exp1~20210428204431.166
Target: x86_64-pc-linux-gnu

Thoughts?

							Thanx, Paul
