Return-Path: <linux-next+bounces-2465-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2058FBB9E
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 20:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EB531F25F05
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 18:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0A014A60E;
	Tue,  4 Jun 2024 18:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAUaTl+e"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6089E14A09E;
	Tue,  4 Jun 2024 18:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717525582; cv=none; b=TIO2BhoL6s9/ESWA8wByfdCRfz/3bZOeOTZ6dxbfo4ugwRi1I3jEdqWX+NUnGav4pQV+1C0BdOJ3dzgFy7snsMz7eRNbj9H1y0e+9Q69GofzgjDNufDFVj1kcYDN1JNExUvTA7x2bEZIqoKcTnBhrPQD7AE21I8l3r1eo5rb7NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717525582; c=relaxed/simple;
	bh=ruqGMaBNSQZpXI9X6iV3j8S6zlZTrpYXraDZ+xtI7h0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZzspqMPSlZGTwuWpiRVjpwn+5HgZAVHadT9q3Znaf5GI7MGFihTTQRVs/3CmGT9P1AxF7uPG0cTuMzk3g6AhET1k33yo2WIhI0zEb1sVvuc4v89vcw8l35hgh/IW/rOxzC8L8GXOaccaQDqqaUhLJDkLjPd2uF1TxtX2YLk9kOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAUaTl+e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912AAC2BBFC;
	Tue,  4 Jun 2024 18:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717525581;
	bh=ruqGMaBNSQZpXI9X6iV3j8S6zlZTrpYXraDZ+xtI7h0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uAUaTl+erwuCiM7x8LBLUQ/EolTsqWUtnPnyAsgltSJvGpqiMZAyGXDi5JfpW5QXM
	 zl0GeyVyYmWNVWh6gnLbf/v6IidZ+xQnmYfoSL5VRZej2TSQQBc+tkUUhlvp1rOS/G
	 BCO6XdX3s+V6I9W3Ew3OmDWVOU6KVpQXsQpscyjGRsa1mIesy2BsA9/jfVkj6RyiuK
	 1zzNE8ICiLUl1y1H0I8+/Rv7cdQE332Bn5jJKRxn/8UfQDRbmW/VMh9hdjj48IFa6o
	 bmUxlKpr6NRzRov+S2S8w5+qlc0bofP/WVM0Gi17LiRoSeiyZDVplsLQ1x59Wt/LX1
	 X9J/wuM70gfoQ==
Date: Tue, 4 Jun 2024 11:26:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>, "David S . Miller"
 <davem@davemloft.net>, "Paolo Abeni" <pabeni@redhat.com>, Netdev
 <netdev@vger.kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240604112620.193adc6b@kernel.org>
In-Reply-To: <1bf553b0-bc37-4922-b480-41d965ce5224@app.fastmail.com>
References: <20240531152223.25591c8e@canb.auug.org.au>
	<20240604100207.226f3ac3@canb.auug.org.au>
	<20240603171957.11cb069f@kernel.org>
	<1bf553b0-bc37-4922-b480-41d965ce5224@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 04 Jun 2024 07:08:21 +0200 Arnd Bergmann wrote:
> >> Any fix for this yet?  
> >
> > Arnd, do you have cycles to take a look? I don't unfortunately, if you
> > don't either perhaps revert for now?  
> 
> Let's revert it for now. I tried reproducing it when I got the
> first report but failed, and have not had a chance to look again
> so far.

Reverted!

