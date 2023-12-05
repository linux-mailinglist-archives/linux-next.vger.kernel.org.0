Return-Path: <linux-next+bounces-231-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B28051E9
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 12:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 899901C20B79
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 11:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D6056770;
	Tue,  5 Dec 2023 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXTy5Kqk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2600ED302
	for <linux-next@vger.kernel.org>; Tue,  5 Dec 2023 11:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADA7C433C7;
	Tue,  5 Dec 2023 11:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701775159;
	bh=HngDu/p59rjdS/91Op5BdJMB1YFj7ZFV64bQJ7lv26I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WXTy5Kqk8hzIuq16V6wBk7inNMvLwLJV2YnB2e50QBI+9TgHlCVOkaL0Jsl8Mj6sZ
	 mol8h7uIknWFDEVrS9lcbtbOYh7pXd+U6iPWYCnBpglzl/nMZ6QvJfzR9DY2q65BBq
	 xmIXhUYpkWr1M19cWvTlZjAYcnyZDekvxg/owuRuOA0sj86GxZTyZMeISiwYAb+bii
	 T3oj51aeaoqtXbzyERhyN4LlDHv1axOSDy8qG7epqhYmgT6tE/ETusBtrk4kTdJa0p
	 FRkCz9tf3ubTxy1GKPyQO/knm7WoNAyWy9SCWJKy9eSAzXhWwVEin3hgchZO5kXg0+
	 BoEk1jTW/X8Og==
Date: Tue, 5 Dec 2023 12:19:15 +0100
From: Christian Brauner <brauner@kernel.org>
To: Lukas Schauer <lukas@schauer.dev>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20231205-subjekt-lapidar-24f945980970@brauner>
References: <20231204090139.03f0ddcc@canb.auug.org.au>
 <5b43d427-f24e-4625-95eb-87ef21452025@schauer.dev>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5b43d427-f24e-4625-95eb-87ef21452025@schauer.dev>

On Sun, Dec 03, 2023 at 11:40:41PM +0100, Lukas Schauer wrote:
> Hey there,
> 
> I'm not sure on how to proceed here since I've never submitted patches to
> the kernel.
> Does this require additional input by me?

Nothing needed from you. I've fixed this up now.

