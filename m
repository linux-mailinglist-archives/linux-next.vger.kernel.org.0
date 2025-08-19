Return-Path: <linux-next+bounces-8007-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE85B2B8CC
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 07:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E92C7A22DC
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 05:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98D627B34B;
	Tue, 19 Aug 2025 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+G4qTqf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B8B20B80D;
	Tue, 19 Aug 2025 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755581969; cv=none; b=aBuhsY7rqt2rfSMg9JbJAxfm1FgTtu0SnCHMDO2GG6WcX1UBLYKf+W1d8gwECUqavUf5UKl467BAb7uym+8XNxqd9RXQjQdmK+Dpy2r2qvNuNxRPMNJxx9ZM46a6JOjPVFAuNtRMXvTMLsQxGn3JSha+F7LoDuneRozMGQqg2m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755581969; c=relaxed/simple;
	bh=xdWQ4b8rvo+MH2ay5pky1rY7PB7c2WduGalB2eQ6Y2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c2aj1MfMAaYQ+C/7YWopeKHKTt4nhG5UTmna2yvarCfjEjivplEDNlA3FufBw3AHtEUihaqTxyeaJLsHuYKnqEMYWxYrBKldLuMuMVOr1jzYFJznEloXKeqBzbRbg0afj6fFdt0V2MO9mDZbRcAFfDHNF3txEZpNlhRObks34is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+G4qTqf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80E1C4CEF4;
	Tue, 19 Aug 2025 05:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755581969;
	bh=xdWQ4b8rvo+MH2ay5pky1rY7PB7c2WduGalB2eQ6Y2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H+G4qTqfeQ9H46k+Cctc0tPZeDk5QD/X6+d2rtfJXwF17E+Eh+SvXYIbyBpeO6Aia
	 kMKRlQPMKNToT98oetzGhNRC7ZJ/D8CgrFCq46Ddy2oYs87kPy1HkBW8d3e+ac4RqY
	 9hVz/1QQo+QZFnmPIFaWzl6934pqFZyw/vm7XU7Zy2BheER3uE3atUYJvH1HYRE3GI
	 x8K0MtNuJWupeKhLBitAmB39dwY9t0WbwSVn8/Qa4rOhDbn9Wyw53fjLJIfNQVUj0u
	 +761MvQnJGwZX5ew/pW8IxiQzyBjT5+vjwt5tiZRMNQNibRtuT7k/ejc5C18tmke33
	 M88qIrXs+yaWg==
From: SeongJae Park <sj@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the mm-unstable tree
Date: Mon, 18 Aug 2025 22:39:26 -0700
Message-Id: <20250819053926.38696-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CABFDxMFpzS9ynd7OsJWdKwZD-kW0-nu9=HhoFUmiOm5Jkz_QzQ@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 19 Aug 2025 10:55:13 +0900 Sang-Heon Jeon <ekffu200098@gmail.com> wrote:

> On Tue, Aug 19, 2025 at 10:14 AM Andrew Morton
> <akpm@linux-foundation.org> wrote:
> >
> > On Tue, 19 Aug 2025 09:59:20 +0900 Sang-Heon Jeon <ekffu200098@gmail.com> wrote:
> >
> > > > has these problem(s):
> > > >
> > > >   - Target SHA1 does not exist
> > > >
> > > > Maybe you meant
> > > >
> > > > Fixes: a0b60d083fb6 ("selftests/damon: test no-op commit broke DAMON status")
> > >
> > > You're right. I think it might be changed at the point rc1 -> rc2 on
> > > the mm tree.
> > > Is there anything I can do? Or maybe Andrew can help?
> > >
> > > I didn't mean to bother you guys.  Also, original patch is from here [1]
> > >
> > > [1] https://lore.kernel.org/all/20250816014033.190451-1-ekffu200098@gmail.com/
> >
> > I deleted the Fixes: tag.  The quilt filename
> > selftests-damon-test-no-op-commit-broke-damon-status-fix.patch means
> > "this will be folded into
> > selftests-damon-test-no-op-commit-broke-damon-status.patch"
> 
> Thank you, andrew

Thank you for Cc-ing me, Sang-Heon.  Thank you for fixing this, Andrew.

I actually suggested Sang-Heon to add the Fixes: tag, to help Andrew easily
understand the context.  It didn't make noises before, but everything changes.
Anyway I'm also responsible for this noise, sorry about that.

Another common way to send followup fixes for commits in mm tree is, sending
the fixup patches as a reply to the broken patch mail thread, with a brief
explanation of the context for Andrew, like my recent one[1].  I think using
this way without Fixes: tag in the patch can still help Andrew easily
understand the context while not making noises.  Sang-Heon, please consider
using that way if you get similar cases in future.

[1] https://lore.kernel.org/20250709182843.35812-1-sj@kernel.org/


Thanks,
SJ

[...]

