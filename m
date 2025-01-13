Return-Path: <linux-next+bounces-5176-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F0BA0AEB2
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 06:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A48F1887219
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 05:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE3518CC1D;
	Mon, 13 Jan 2025 05:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="EGhVZVCo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z1zaHWqx"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02F14B950;
	Mon, 13 Jan 2025 05:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736745667; cv=none; b=lRT51WPn0LbwDFm9i2BAfgQy29j58KlOCNDpb3Kw8sDfVidji6q4bddOZp4JfPOVzP1tg3cs3bpeXu19x9cjWJ2iSwDZpT6nKt0oYg/cRtk2QotPYsftBatYSDm84lBfkGCjO5NK0iH6whus+PNyWDJteXNxzoh9GSIUurgDFGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736745667; c=relaxed/simple;
	bh=xmpJcmw1B4X5JpGrB/rqw28o/owcXI+ZQqBT85teLzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6v/Vt4UbHtN9/ptHYenFzdEGK83UawvBOj6YwwX6mOJKmx0EOi+WmD9fHu8RA24bB4K7xulx5iLfyEK0t9QBn1GnMsywt0ifFccTmidYBBqpheSgjjuU5rULY8Fv+4hN1lGkDvGSidRBd1RvcpJgI+LYV9h6kcx0+OTsXdn6MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=EGhVZVCo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z1zaHWqx; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6D34611400DA;
	Mon, 13 Jan 2025 00:21:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 13 Jan 2025 00:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1736745663; x=1736832063; bh=/Fm7wm1RTQ
	TpfDHNGM/pNgAx+ZEjBRl6yg47GVVemaE=; b=EGhVZVCoTXUgr3ce5Ns3xHuSAX
	+y8Qoge691zMJKTxCRf5pe2DwthZk6iyEpaFqj5zaWVz070axfjVv9HNdHBVO8bH
	2ukYF51bCTpOxylETeI9LCVSpDFNYiaTWXttwqK/BdPzJD6Q5EpWe+yw16rNUuCQ
	0QxaRZAxi8AA+VoVzcvbCZi+qbeWF/zqI1oz4UK4kvwixNgvwuX5FqIR7NjfQO7O
	bC1wNuDjVuol/ifi4/itoyZnJr9xWq6144WYgMUQ8AjdQI8myghCFfpiJHx8a/8w
	rc1uKlJUFhkoSki17PGyiITzVqkkGvez60JmMhho4kaZ+Mvca7eMKNEwYofQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736745663; x=1736832063; bh=/Fm7wm1RTQTpfDHNGM/pNgAx+ZEjBRl6yg4
	7GVVemaE=; b=Z1zaHWqxLvGOcMCgH5TjEgazb6UxDqrm7yZDKY+ize+QCtD/nrA
	8rQYPOY3cyjMn5lFyEF9iPky5WEVL7ePB2p3Cw8uDr+eeEkurJNIOHv6JWVmsrWG
	hZlf/L1za0+IxZ3dZE8xXxPetIdfC17/4fV7U85AQ2m+2o3mz4WZKDwcXBw3a/1S
	P2hV/gELa7qjp4RReZGebD/FEL1CJNRqQzeqEuZoppO+EVUmmNLIS5lb5J7kCHHx
	XtH1YeBI06HJk4HB6oxDi/uuwe0YWbxFYSYutnvmM9Hh2iYSXOts6XlKX0/d/7gR
	J8EvjDDvXZQjpbwxlHNlEjjtw/5+aZkzqVA==
X-ME-Sender: <xms:v6KEZ50QHJOXbsUp2Wng7N_fZNXmauI7LlJcB_pJIf2l7CDmvQHzfA>
    <xme:v6KEZwE9kpgJJPynS0PeXoEbPa51Du7ivELRoxpBR_oIilu7BqQl8ridsgM34-aYy
    U8IyNwwCdkbbg>
X-ME-Received: <xmr:v6KEZ543X2vI98z48y0NDX9IqlTtADyNk9HOCIZ_ahpzOgZzeN7wa1MHM1MU24Pob3E4DWaVB89_tcG-hAElJb_7_BT-7YvJ2fG4Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehfedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtohepshhkhhgrnheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgt
    phhtthhopegsrhgvnhgurghnhhhighhgihhnshesghhoohhglhgvrdgtohhmpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:v6KEZ20ODtKePbD_0590LCjWD1Ax03eKBzcRub9M3zrSgkZSNUTBPA>
    <xmx:v6KEZ8HWsR-gKdlwffdiPfIxe7wGIazKm4uPYGdEgJTKhPtKflHVXg>
    <xmx:v6KEZ39yfB6koueiVW-T2TcnhhkGol5w94RKK10SUpASuy5-TBWSGg>
    <xmx:v6KEZ5lrjOt86mVYYpBh9ToywHwPHpBa3ITj-H4L2EeFnJfxy-lNjA>
    <xmx:v6KEZ0-br6_Kc1HNOoB3jJUEsMfbgVom7HSgOEzblb379ZNBNl87Sl1Z>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jan 2025 00:21:02 -0500 (EST)
Date: Mon, 13 Jan 2025 06:21:00 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Brendan Higgins <brendanhiggins@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the kunit-next tree
Message-ID: <2025011331-chef-unwired-e143@gregkh>
References: <20250113152511.4f7f382b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113152511.4f7f382b@canb.auug.org.au>

On Mon, Jan 13, 2025 at 03:25:11PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the driver-core tree as a different commit
> (but the same patch):
> 
>   875aec2357cd ("kunit: platform: Resolve 'struct completion' warning")
> 
> This is commit
> 
>   7687c66c18c6 ("kunit: platform: Resolve 'struct completion' warning")
> 
> in the driver-core tree.

Thanks for letting me know.  Ugh, so many duplicates this development
cycle, probably due to delays in the holiday season...

sorry,

greg k-h

