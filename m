Return-Path: <linux-next+bounces-9697-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48734D3AE5E
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 781BC304B3E3
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 14:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B97379992;
	Mon, 19 Jan 2026 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4IBuGnd"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C08378D73;
	Mon, 19 Jan 2026 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768834627; cv=none; b=UxPVaw9jZryFDV7QPyejnao4tqd55/lzSSHI5aZc8ONBhWorOdj8AwExuVXLnP/xc+4IRNlnL3n0j0PVm8G/gMCWIj+527kVo0IEn5AzAtf80V1ABS3Zb+nQdID8YTym1PrljOPH/sP9oHWtvryoxb34drkwzv6aI61XxKETfl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768834627; c=relaxed/simple;
	bh=p82gfNDCwACK5T3yS6JKSTpgzk/ho8Nib8GZcPf3o60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mC8dAk3wczUU60NRLUiaLwQ84nyAhGBmqauloLQMJ2DmfMyHtTq63khtmCmdzKHA+l1CBi3zQEULXKZCjCMXp+ba2oKOvoHl50ecYMYmQyHNyjx1fOgGTYSPvvQbRxOPEBezeUQsMcOW6yuPEGg5Y2mzd6/U2MNtQjxYxoV1CMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4IBuGnd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0418BC116C6;
	Mon, 19 Jan 2026 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768834627;
	bh=p82gfNDCwACK5T3yS6JKSTpgzk/ho8Nib8GZcPf3o60=;
	h=Date:From:To:Cc:Subject:From;
	b=U4IBuGndLsjOSn58g6bPpdW5jfCn7MfUA//j4nV3z6rTXcl1CRCkudotsXeTDTKsf
	 KP12cWn93I/D8OFP1sdsJxLCu5gDkMOJPCxv8fndYLn/FrbNFWy8Qb8FghRMOCTLWp
	 G8B+FB6Pl8c9pnMSC6t2mR6Q3zy9F+9ANdvzX5nxL264qveNaUq5xf/9LECvkMV5J5
	 R0Uvxk3ddQAjssBlinkug8DcBQmpq0I37k0/94GNdpy79wETcpNkpUnqNocr8KiLpi
	 Z/AN2LPOxIWVdqUbfw41WCXVX/SrftT1bgJRigw9UlJrAzEbzQ8iSJpX1nogfdc7MY
	 JYYG6PdZYqfIg==
Date: Mon, 19 Jan 2026 14:57:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>
Subject: linux-next: manual merge of the rust-pin-init tree with the
 rust-fixes tree
Message-ID: <aW5GPwfJPrQjm-wC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the rust-pin-init tree got a conflict in:

  scripts/generate_rust_analyzer.py

between commit:

  74e15ac34b098 ("scripts: generate_rust_analyzer: Add pin_init_internal deps")

from the rust-fixes tree and commit:

  514e4ed2c9da9 ("rust: pin-init: add `syn` dependency and remove `proc-macro[2]` and `quote` workarounds")

from the rust-pin-init tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc scripts/generate_rust_analyzer.py
index 3b645da90092c,d31d938886589..0000000000000
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py

