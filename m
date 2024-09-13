Return-Path: <linux-next+bounces-3837-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BE8978763
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 20:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5A31F23052
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 18:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1005BBA50;
	Fri, 13 Sep 2024 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOz/eLtb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC18D22338;
	Fri, 13 Sep 2024 18:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250442; cv=none; b=GmsEmZFlo+TVwMcCB/ju4ibFW9WBGfsCj/ZgzTnNsX8EPzt+D7/DllrZGOkZtsqa2vH5u9/1BmNabjg3ttmZp6VJnzZFR4YRk9x+43MIfwJHBHuHczZDqzNkD7bc+Q1bkAycc8UsQjfBdVDfxrcEELiY64EyocnYL/5TRqgxn3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250442; c=relaxed/simple;
	bh=29aFl9piFehCw9up+AP5hiQi8NH9/QrQ7icDqk+Mb9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkCu9GnmHAzXiRJhXPjact+Tkv47rCsV9unJh4MiFVuhhGv4hkACdLVRKsxcjhRpeXa0vn+PXRKAvs3lFJsBHRgKQl0YlDeu1vpNlyNazxum6kqx8OnvuA2CsvYdhxFqZ4JxMGgx9fCzmz8GimzWn661jlgOok1eAyOLWCMy41w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOz/eLtb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D64C4CEC0;
	Fri, 13 Sep 2024 18:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726250441;
	bh=29aFl9piFehCw9up+AP5hiQi8NH9/QrQ7icDqk+Mb9c=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=NOz/eLtb+79AkFSgZY4q8TCNWaDUaygKxy076aHYLabAn+3eQ0MD/3W3NePsyC7xF
	 74PlTpPgYIAF99gpjMQc5amVjfrc1O8nqU/Bx4uQRIdz04WZGOEdLg/pZ8hLN8MVqw
	 N79bWscaxJA6M4SI5mF1oViibH2k6MveFlegm+/zeZiBIr71KK7A2eLpvf5EPxJhPm
	 aJGjYn1TvNHPY3f2k2Sxxfnm7cBJCQPJNqqDA5lnaSiEOJNPtibg1REgNeT9D57wQ4
	 UlmLzI0zhHmLKbH/CNoBgZDgXQC3fIYTPxPxy4AKlR4Atw58n7JixuMjncgxMg67fH
	 +9pWtmNawXvgA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 42156CE1494; Fri, 13 Sep 2024 11:00:39 -0700 (PDT)
Date: Fri, 13 Sep 2024 11:00:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <ac93f995-09bc-4d2c-8159-6afbfbac0598@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <xhsmh7cc0ogza.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <5ea3658b-5aec-4969-92c5-49a2d23171c3@paulmck-laptop>
 <xhsmh4j74o6l9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <8094db32-5c81-4537-8809-ddfe92a0ac6c@paulmck-laptop>
 <4b93e5cf-c71e-4c64-9369-4ab3f43d9693@paulmck-laptop>
 <xhsmh1q27o2us.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <cc537207-68a3-4dda-a8ec-6dda2fc1985d@paulmck-laptop>
 <250cde11-650f-4689-9c36-816406f1b9b8@paulmck-laptop>
 <182ef9c6-63a4-4608-98de-22ef4d35be07@paulmck-laptop>
 <xhsmh34m38pdl.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmh34m38pdl.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Fri, Sep 13, 2024 at 06:55:34PM +0200, Valentin Schneider wrote:
> On 13/09/24 07:08, Paul E. McKenney wrote:
> > On Sun, Sep 08, 2024 at 09:32:18AM -0700, Paul E. McKenney wrote:
> >>
> >> Just following up...
> >>
> >> For whatever it is worth, on last night's run of next-20240906, I got
> >> nine failures out of 100 6-hour runs of rcutorture’s TREE03 scenario.
> >> These failures were often, but not always, shortly followed by a hard hang.
> >>
> >> The warning at line 1995 is the WARN_ON_ONCE(on_dl_rq(dl_se))
> >> in enqueue_dl_entity() and the warning at line 1971 is the
> >> WARN_ON_ONCE(!RB_EMPTY_NODE(&dl_se->rb_node)) in __enqueue_dl_entity().
> >>
> >> The pair of splats is shown below, in case it helps.
> >
> > Again following up...
> >
> > I am still seeing this on next-20240912, with six failures out of 100
> > 6-hour runs of rcutorture’s TREE03 scenario.  Statistics suggests that
> > we not read much into the change in frequency.
> >
> > Please let me know if there are any diagnostic patches or options that
> > I should apply.
> 
> Hey, sorry I haven't forgotten about this, I've just spread myself a bit
> too thin and also apparently I'm supposed to prepare some slides for next
> week, I'll get back to this soonish.

I know that feeling!  Just didn't want it to get lost.

							Thanx, Paul

