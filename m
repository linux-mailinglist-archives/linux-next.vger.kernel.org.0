Return-Path: <linux-next+bounces-2409-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D548D2825
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 00:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3040E1C21841
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 22:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56C913E041;
	Tue, 28 May 2024 22:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6mbKYIX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED721A0C;
	Tue, 28 May 2024 22:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716936067; cv=none; b=mOmKb5drnBgTtyAbA2unBGe7bAZ7ZSjr6vmFpYECFe+lYxF+4jvjxCcarAT1QZk0V6RzNMU/XpGNh7kZohqUDV20n4R3FL5tVD8lPHuiFpFG9+10z2qIxWle0HYRaTW4WKCBswhKH2Hb5MxKLYLxqQHanLE8Ut1jrXt7SoWwY3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716936067; c=relaxed/simple;
	bh=MS8NOsIPDBnLUHEk05DzHLUTAFFihTqttJxUe3JaflE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=IkRt6B/X2/g8pVuYtMxmJLUA4WDaDKXIP7jpCL8sClbS5Vyvy3PMRa4L735cAcV4Qmwcqh3LK6Izp0rgNHYJem8137/rEyj6sL3Bm/gofQIB9DTRhRtDigNql7g1noIPYf8qI5B/q5V8r13mRG8MC+Rtf3j6EZKDZjTneE4FZ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6mbKYIX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665C6C3277B;
	Tue, 28 May 2024 22:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716936067;
	bh=MS8NOsIPDBnLUHEk05DzHLUTAFFihTqttJxUe3JaflE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=i6mbKYIXSC7uQ+eYu+Xg+MM/FSr13iNExxytSOxegRBVThp3m6tOjGiXl36/n8j6p
	 odnK5HgbuQoSzBtctLOMIsHWVFCWclCY7Ypy0QYJsJ5F4MiEkyxMYT5DXVVi9L+jQ3
	 oOd1i+SV/JXjYDIZWTzEU3M9Rqxk7ifhheJTPngNdl9MWeheYBLYA6cHcqCL59jrrq
	 ctDTrfMzYEJx3DlLHvwP1Njvito02r4A1S9aLuS3OwCOHEWaIN1lvqKPx7Mg2mrEKU
	 m6krkMjhidr0WLhJsHQf8Ul7XFqTDert5I6gGWmPv6QHQUOXk9br04XBNhPqfXB2vo
	 s1c+8Hl089n+w==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 May 2024 01:41:04 +0300
Message-Id: <D1LN1FCKDWHR.2VZQY8BBBCSIJ@kernel.org>
Subject: Re: linux-next: duplicate patch in the tpmdd tree
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240529081930.487f7290@canb.auug.org.au>
In-Reply-To: <20240529081930.487f7290@canb.auug.org.au>

On Wed May 29, 2024 at 1:19 AM EEST, Stephen Rothwell wrote:
> Hi all,
>
> The following commit is also in Linus Torvalds' tree as a different
> commit (but the same patch):
>
>   7df9ef4f7b1e ("tpm_tis_spi: Account for SPI header when allocating TPM =
SPI xfer buffer")

Sorry it was my fault forgot to update 'next'.

Now it should be fixed.

I verified this also by rebasing Linus' tree, which went cleanly
and git push origin next did not require '-f', so hopefully now
all is good...

BR, Jarkko

