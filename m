Return-Path: <linux-next+bounces-3515-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02C9662B8
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 15:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 328291F23EA2
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 13:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE491A7ACD;
	Fri, 30 Aug 2024 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJHasRCb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8831A4AB5;
	Fri, 30 Aug 2024 13:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725023694; cv=none; b=pVk7Prn3dGbAQLiqxGrvjQ3FasE9GKrZPewXcRafRNqbDeOteY7ElAgZqtOQkCscF2MrAn/WUSv1wFwV64v8mcPv0Yu4f3kDeThRzR7Ztssd87iqDjZEX901pYt5FUNIyzFDf3KOsaRIFLFr/S8PB7GDlDgPta00uLO3nhCTWbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725023694; c=relaxed/simple;
	bh=CK4I1SUidOAF6Lk50sbgZ71MDac53lmplEyhBhzOwsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9Ya3fAI8zb7y/RDzXAnXeO7JemmQHN6wB3pJPIZUDUp94F4xmMXDQZN4u+UHPgch6jWGJjQ4Qyb/vbW1cx7kOt9x85rKIMvLspKZ/IRIODbVR82oQPpQvZqhfTwDATvegUiiAWKg3OTXXzf17vxCFlHTMnY25rFoUBGtCB/vQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJHasRCb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE4CC4CEC5;
	Fri, 30 Aug 2024 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725023694;
	bh=CK4I1SUidOAF6Lk50sbgZ71MDac53lmplEyhBhzOwsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BJHasRCbk/9DZUHzTjzTYWFY1lxbmDIbEUuXVYw0mY9oafgzh3f71LJ7VQvvnAfoO
	 tFOeVTYwgs2Fvq90MOXBdShdvRWkzUNWYfuTxrKoNSMKbqOyH2TAzwrjsvwS5AUUmE
	 gVEPKler+9YTZcq+ZZWAYpRI9HO/+3bXq+Ebo2r7zMb67MfhtuQz1ouku5G5McsjEI
	 epH0FbURyF2sCRkyqCejOyI1xLDeGPLtwR3diLIW7x7I5n+Wi4RJeeHZp0F2PB8//v
	 mlyqeMXbCsvZzbIM6xh9qboPe7CWjWKnsltPB2+CbDvJheegKiG+kyxBbRMLi+6Ycv
	 /KV4R0O5NPgQg==
From: Christian Brauner <brauner@kernel.org>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-next@vger.kernel.org,
	mcgrof@kernel.org,
	willy@infradead.org,
	linux-fsdevel@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>,
	sfr@canb.auug.org.au
Subject: Re: [PATCH] filemap: fix htmldoc warning for mapping_align_index()
Date: Fri, 30 Aug 2024 15:14:46 +0200
Message-ID: <20240830-gepard-wirbt-8d57a90531cf@brauner>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827084206.106347-2-kernel@pankajraghav.com>
References: <20240827084206.106347-2-kernel@pankajraghav.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054; i=brauner@kernel.org; h=from:subject:message-id; bh=CK4I1SUidOAF6Lk50sbgZ71MDac53lmplEyhBhzOwsI=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaRdPHr86PEz3iulHt+2+D5N85Nd60up/qzjNhWXQt9Nz z0xXX/rqo5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJiCcwMnTc0xTNCy/gcrQL 9Stc9z0mhf8tn1pukH3Iprm3Ws0ntDL8Zhf6K//QQUj6YrZ+XqNSq/uiNaF1dl81Q/j/LVpc95G VFQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit

On Tue, 27 Aug 2024 10:42:07 +0200, Pankaj Raghav (Samsung) wrote:
> Stephen reported that there is a kernel build warning due to a missing
> description of a parameter in mapping_align_index().
> 
> Add the missing index parameter in the comment description.
> 
> 

Applied to the vfs.blocksize branch of the vfs/vfs.git tree.
Patches in the vfs.blocksize branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.blocksize

[1/1] filemap: fix htmldoc warning for mapping_align_index()
      https://git.kernel.org/vfs/vfs/c/18b184171112

