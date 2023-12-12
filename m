Return-Path: <linux-next+bounces-361-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FAE80EDC8
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 14:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 436DD1C20AB1
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 13:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4873F61FBE;
	Tue, 12 Dec 2023 13:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PM96PurB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF0861FAF
	for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 13:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0FFC433C8;
	Tue, 12 Dec 2023 13:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702388286;
	bh=QG65l3/kLhGFIU5NyryJrHOqXPwHlHohY87W+40tc3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PM96PurBR5NnkHndjaKzUrtOCrl93+SKx0FVWSx8vjIi0szY+mzHHABOnvzAYpRmr
	 Jyq2t2nnFbnNrHTwPNy8/C81tCyU+4755Fl2hU5vDgPIT1zNXmyf0DG0rES99CXzsQ
	 ok3BvX2vvAHIY6tOjRHN7jwSG+ZA1I2RVmDZLMapuwwcRp3+DSfQtfPAWDgDPHk850
	 9wvXj/Rxa6EaNviF4kK0DexTD2EK+Ol34fMzvMcmz8j/hC+cF5LBjtjeRYebRmmJ/b
	 oM2efGvqVXJn6pgYt29heicbe8BngHZac7Saxljx4aAoteVvY6ucEMgDmGtK8a1N7B
	 BC32/LlL7MwEg==
Date: Tue, 12 Dec 2023 14:38:02 +0100
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the block tree
Message-ID: <20231212-innung-zuber-2f10bcffac51@brauner>
References: <20231212130213.631140dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231212130213.631140dd@canb.auug.org.au>

On Tue, Dec 12, 2023 at 01:02:13PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the vfs-brauner tree as different
> commits (but the same patches):

Thanks, Stephen. I gave Jens a stable vfs.file branch that he can pull
into his so this shouldn't become an issue again.

