Return-Path: <linux-next+bounces-1380-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE4868B0A
	for <lists+linux-next@lfdr.de>; Tue, 27 Feb 2024 09:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DD5B1C20D08
	for <lists+linux-next@lfdr.de>; Tue, 27 Feb 2024 08:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97606130AE4;
	Tue, 27 Feb 2024 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBJkNZwO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B4012FF96;
	Tue, 27 Feb 2024 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709023481; cv=none; b=nQfMnuEnGaTMViFwJ+KEmBs62UuiY5GNU4CEhWM2A0nLja4O1UZ1MuolyXjVJSzqo6UAWYkgiEhE2kT5cHX/WVHv0HmVtAeNLGRzFh/gbmnewBq22NPYXlHf0280N+bxcBnkNH4g9yGCFzedUN0iRPq2MrpX2jhWUmRM0lzdzXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709023481; c=relaxed/simple;
	bh=a+VjVdkI+y+r54z7Rzx7n/1mu+d3oTctW5X/n1/51Ik=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=dYCX2NIaMkp00FccHNUPpwqQ2enfN2c7OE7Db+zb/7A7qYLBeNSowbEHGkhhs7+W8WRpFPi06xcPPY8gNnTfE/UoPsb7go1URsFFigC0Rw7w8KWy7bUOks9xBjOuY7JfCcGtGK5mCYNOcXLZbzgZ6XmrYZ5Y70FyNeMTnSYdwww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBJkNZwO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7784DC43390;
	Tue, 27 Feb 2024 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709023481;
	bh=a+VjVdkI+y+r54z7Rzx7n/1mu+d3oTctW5X/n1/51Ik=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=tBJkNZwOC3fVeFfMocdY3TuBMY1jMqdFoOXjMfpKH+XvxCBXCWJoLgkkEW8LcBzD4
	 nlQHH23HVtEBCjlKj2nMr20hd+kristV1roU6pG4+JAMUeX2WNt3ZnnSo77SUs4g8N
	 /atRBwvgiYSRRwPl1fU5bQnScSDA3bGXRwc7TuP+n85mp4wkFL0kEY93oUD8pYSqFD
	 nucSYrzBm4AKFAA2U5LMnjVJmSDhERmPGVyhybOJ8Q8wu+sl5awYEcCKdvZGJff6bY
	 6cfQq66TNQGpIyTHhVnBomXlQ+Oxp3F/5i/FjCjtG44+C041wQB9GwxXfloGdQhOjg
	 T+wsR1QY/huXg==
References: <20240227102827.313113cd@canb.auug.org.au>
User-agent: mu4e 1.10.8; emacs 27.1
From: Chandan Babu R <chandanbabu@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, "Darrick J. Wong"
 <djwong@kernel.org>, David Chinner <david@fromorbit.com>,
 linux-xfs@vger.kernel.org, Dave Chinner <dchinner@redhat.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing
 List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the xfs tree
Date: Tue, 27 Feb 2024 14:14:08 +0530
In-reply-to: <20240227102827.313113cd@canb.auug.org.au>
Message-ID: <878r36l2iz.fsf@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 27, 2024 at 10:28:27 AM +1100, Stephen Rothwell wrote:
> [[PGP Signed Part:No public key for 015042F34957D06C created at 2024-02-27T04:58:27+0530 using RSA]]
> Hi all,
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>
>   fs/xfs/xfs_buf.c
>
> between commits:
>
>   d4c75a1b40cd ("xfs: convert remaining kmem_free() to kfree()")
>   5076a6040ca1 ("xfs: support in-memory buffer cache targets")
>
> from the xfs tree and commit:
>
>   1b9e2d90141c ("xfs: port block device access to files")
>
> from the vfs-brauner tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks good to me. Thanks for fixing it up.

-- 
Chandan

