Return-Path: <linux-next+bounces-8995-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E574C5DB90
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 16:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5233235214F
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC93E317702;
	Fri, 14 Nov 2025 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdhGazUU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A41265CDD;
	Fri, 14 Nov 2025 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131895; cv=none; b=H6slyROCfidL5ql/hkMCWGKAy3EAXdO9Fdpj6LObV5PLhHLFdt+VTCbXkCxhsGvCEnj2zblBzFrJCoZRJBjCX+OoXhbxzHYooGXq7n3rQ42kJ3yizj/sTzIYE/G3bb7kLUJGtXJGnjN2+oB/SRb5FmrclmGbgtCq/wvfBEXNm0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131895; c=relaxed/simple;
	bh=8c+mjANGBZmTTvPYjYFOxgUGb0hYcU1VZLSNLhXpbiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qmc4oIbxjwSuBEe3wf05xwurZt69d7Pu14qjDk1O15VYCfriLDVZvozbbz/dWRgmoBrXkRrwUe/0mrhLJi2hMQrGqRa7J8fAhZ+08j8s3upFqjdI2vwFK/gjGvQVRTEREs/pRgwj/17TIk+aD8TeHa51jr3EIh3+57KWfKuv6/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdhGazUU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51DFC4CEFB;
	Fri, 14 Nov 2025 14:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131895;
	bh=8c+mjANGBZmTTvPYjYFOxgUGb0hYcU1VZLSNLhXpbiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdhGazUUheK/g0saMvEvIcXHL4WyP6Y+OWpIKfJSO6Ujg+WUXP9yTlSiAI11074Wy
	 RMdQPjlP34Nhapi8XRwPWr3TRdPEQuWI+8fW5HD2p7/SLE+4x/ew3P8m0O2oT9NFDa
	 pxBNlrzhJSYHGyI2UnTMRw3jt6unvYDpyeZI8/2Cnxb9Eiu29ZiN7TuV1idTIATuLx
	 vNdCQSrPz+mkXiBgizNRai1j+tXCVsirZGyGZzmdoNGC2FhwmZ83bboAvjB6YkzNb7
	 oTwsIDsN2cyhw3IDkOvwyi8r37nN83xsCgTBwuL61IVirf6fdDNbd1z/ehplotoQUH
	 E7tg1SZhNywXw==
Date: Fri, 14 Nov 2025 15:51:32 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <aRdB9JVSqrnt39bG@localhost.localdomain>
References: <20251114085932.18e76047@canb.auug.org.au>
 <56daa042-9d2f-483f-9b10-8a26635b17b9@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56daa042-9d2f-483f-9b10-8a26635b17b9@paulmck-laptop>

Le Thu, Nov 13, 2025 at 02:28:02PM -0800, Paul E. McKenney a écrit :
> On Fri, Nov 14, 2025 at 08:59:32AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   35587dbc58dd ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")
> > 
> > is missing a Signed-off-by from its committer.
> 
> Plus it needs to be see by git as being authored by Steven Rostedt,
> apologies, my mistake.  Forgot that --author command-line argument.  :-/

My bad, I forgot to check all these details.
And yet I knew that the sleep-deprived yesterday was not the best time
to apply a patch :-)

I zapped the commit for now since Steve has complains to discuss.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

