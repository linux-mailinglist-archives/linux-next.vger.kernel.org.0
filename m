Return-Path: <linux-next+bounces-9695-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC08D3AAA8
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 14:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6371630845BB
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 13:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA8C36C5A5;
	Mon, 19 Jan 2026 13:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opiT7b2d"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4809A36C0BB;
	Mon, 19 Jan 2026 13:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830353; cv=none; b=YsvKo3KM1TSDeP9poKUO/oO0kS3Sl3OESB5AI2f7rJwHjXGeB7wvFX2BE4bNEsZ0+9GLyjg5AbFiA3CK4c89fJtNrEshdLw/bRug1tsJuLsdpZwjXyOK7ct5PvsUoxHwUAc37PTDnr+xM1cv6DsN31WkbG4FsamP0mKtyb8bavA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830353; c=relaxed/simple;
	bh=K9F1BY9um0qWXwr+sjXH+n6tUZhyTJIAb7Gdiyo6a54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a5CSHnk2eNzWPQAOHfwRl8ixblGBwaQckyGGaX3AgjonywoMMG5VBv7t3yIB4McLhz2Cisn0ORhgngQWwMA6IhWJvsbxPLh/SSJDsxREf3/S5hIG4W4kg74Xe/7A3zbgwGxUP2zdgZhmFgpXEhuzwJHcUxTzS3N8lKHMAGyzvcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opiT7b2d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21B5C19423;
	Mon, 19 Jan 2026 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768830353;
	bh=K9F1BY9um0qWXwr+sjXH+n6tUZhyTJIAb7Gdiyo6a54=;
	h=Date:From:To:Cc:Subject:From;
	b=opiT7b2d4zvz4D3yChe17JSo1zPPcm6QkvasoFdygY1kinwi4vikCcz2/6i7JurYI
	 vqXFnrN/ubSa0So3C9w4DC4Obe4lmRKuhXhXOoP7qfzQmFh41dLo11+NawfCgELN2E
	 gZeEE0Ok8bWix9vTh2SQSzgiq8Sd1YcZ17/EwnJMH40aK7lvDJsGGbOs3IiguW+ogm
	 Y54+Kit9UK+2YXQrzd99kvX27xng+68tIaayq13Te4qBgwF48ui3mPXbPcF4cGc4Xw
	 sET2qTYyMiP9bYH3auNLlJmvtUul22jErBAZZ9X5JZJoleBAsCKqTG3Zf5iVVW54im
	 Vun/c6aCuisOw==
Date: Mon, 19 Jan 2026 13:45:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <aW41jU88O4Hfnt9i@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  Documentation/filesystems/porting.rst

between commit:

  2b10994be716b ("filelock: default to returning -EINVAL when ->setlease operation is NULL")

from the vfs-brauner tree and commit:

  e6d50234ccb9f ("non-consuming variant of do_renameat2()")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/filesystems/porting.rst
index ed3ac56e3c768,909c7d0232f97..0000000000000
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@@ -1336,7 -1339,9 +1336,18 @@@ in-tree filesystems have done)
  
  **mandatory**
  
 +The ->setlease() file_operation must now be explicitly set in order to provide
 +support for leases. When set to NULL, the kernel will now return -EINVAL to
 +attempts to set a lease. Filesystems that wish to use the kernel-internal lease
 +implementation should set it to generic_setlease().
++
++---
++
++**mandatory**
++
+ fs/namei.c primitives that consume filesystem references (do_renameat2(),
+ do_linkat(), do_symlinkat(), do_mkdirat(), do_mknodat(), do_unlinkat()
+ and do_rmdir()) are gone; they are replaced with non-consuming analogues
+ (filename_renameat2(), etc.)
+ Callers are adjusted - responsibility for dropping the filenames belongs
+ to them now.

