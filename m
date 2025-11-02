Return-Path: <linux-next+bounces-8786-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 994C2C296CB
	for <lists+linux-next@lfdr.de>; Sun, 02 Nov 2025 21:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B1574E2282
	for <lists+linux-next@lfdr.de>; Sun,  2 Nov 2025 20:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F040B20C463;
	Sun,  2 Nov 2025 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="j2sEcZVD"
X-Original-To: linux-next@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4C7AD4B;
	Sun,  2 Nov 2025 20:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762117061; cv=none; b=Zx2KWL76jn2qk3DIcT84s/btuchUD6DoRMcPyenbPxUgC/5huF+eQWaRU6XnqYjJSj+dEt8+wLnEv1yVUDj8UXC0oDF7mfiqoKS7wX6oIzV9Bg0+0t0PL9JAriTiCF7xzC5xZF5ros66fNQmLmT/EZRweVv6E0jXymFHXaKhwk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762117061; c=relaxed/simple;
	bh=djlZanuVYSZM/3+cLDM+ODcgfU7z7/WqZIkLabq5W6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UiPM+4daJTCUBDccY+13ZG/8lNgWCLQNW8VKBUrADawl/XW/RQqAIwYzYWk58tirDibHewnbPHHGDa4cZg7zXdKalGjvFqr9Wty5aPzcbNPhyqFFZxNwfE+u47BmvMUVmVm8pLpsIdYhMmlsqvvf9IcOUWsE3KVZIaz0GWdXS7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=j2sEcZVD; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1762117055; bh=EhLVMofbsREQpNqhEhKXw/Vwyu+SkvY/qLa3eSjVnYw=;
	h=From:Message-ID:From;
	b=j2sEcZVD0nFuHJ9Jr9uXEiSdm5U5Iv32+7OanhkaEbOan7/8YuJYvfZdgOXf0T8Rc
	 S0/koAYfz+zxvCuy79QPz0VUgTvksVZs4hTvNV3y4p+Fh5Qty0HyUDUrA68nR5zpZr
	 MKXvPrfKtbidkJHb8UtGgbNr+PWSJ9MJCNdLQu38=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id E44D0C06F2;
	Sun, 02 Nov 2025 21:57:35 +0100 (CET)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 5A2KvZ51027555;
	Sun, 2 Nov 2025 21:57:35 +0100
Date: Sun, 2 Nov 2025 21:57:35 +0100
From: Willy Tarreau <w@1wt.eu>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nolibc tree
Message-ID: <20251102205735.GA27552@1wt.eu>
References: <20251103075200.7961a782@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103075200.7961a782@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Nov 03, 2025 at 07:52:00AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   926b414bee07 ("tools/nolibc: clean up outdated comments in generic arch.h")
> 
> is missing a Signed-off-by from its author.

Oops, sorry for this, you're right! Thomas, I can prepend my s-o-b and
push-force it if that's fine by you.

Thanks,
Willy

