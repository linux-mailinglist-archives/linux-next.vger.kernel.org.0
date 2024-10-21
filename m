Return-Path: <linux-next+bounces-4350-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC79A5E84
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 10:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 979E7B20E63
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 08:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748041E1C10;
	Mon, 21 Oct 2024 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McDQQ8+c"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4229E1E1044;
	Mon, 21 Oct 2024 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729498972; cv=none; b=uCRMUaD92rH0txQgiBnD+VGIlSXFxjdi+kyOGEiZEA3bbNyWhhqudYT4hz6MXc0/KMimGMVSwqm7xl3k5UUNVG3kfcO41s3ZhOFOuZ47FYsQmz9CLmI+Sq29klDT3gXytTVTCfzqU33+9TE1Xwo23sZUANoRCLGMzSWw5aTwWmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729498972; c=relaxed/simple;
	bh=JMLTd3LHSJpA40ojW5pYjmprxReOuzJv01jAYW8D2LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yr8QWoifQC7B9OlnFmpDF7sW9ICMgxPMI0QzQqPEEpJGqv4z0bkf5cI8c8f7c8Yv8XEFvdaiSJZAH1aIu9OQp2QA0uDQWqDntDjW9WKJS2C8NMHsvy1riFTcfkb8VP644t/8s/jJP2q1To2xVUjOcERGL8+FinZ3Zql66Dhfp8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McDQQ8+c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8116CC4CEC7;
	Mon, 21 Oct 2024 08:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729498971;
	bh=JMLTd3LHSJpA40ojW5pYjmprxReOuzJv01jAYW8D2LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McDQQ8+c3gYNG379npH9WpSjFd02/FOuZvPl2iKeTlx2NdDZP1Eicme4Yrh2+GnvX
	 SiUoVMjMP6hYDSwZtQdg5na4wZApHUxurRf6gHCyHjPXWaw41LJMtfJ6K5NQLV/3Mx
	 tQqkOqEWIlkkirS6f/nBYfMVzMNezMQAwXmQ+WnjtLSzOjEzw5zcVkcZA7+T42rbXa
	 Os8t5DnX5e8nvZ1SQ96jsjl8DsgbrxdmRws0H0vLcNlZqDHKhelBQ9OCak4de3Xf2S
	 cquYOVDrlI22/zMKuzc6IWwp5VZ9juf60INCyZAvTE0pN2GHpCHduEIjdDSjVtBBVb
	 0zg0IMWZ8NCUA==
Date: Mon, 21 Oct 2024 10:22:47 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the vfs-brauner tree
Message-ID: <20241021-ansagen-ziehen-5264c9413277@brauner>
References: <20241020220839.03e0329a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241020220839.03e0329a@canb.auug.org.au>

On Sun, Oct 20, 2024 at 10:08:39PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):

Will drop later today. Thanks, Stephen!

