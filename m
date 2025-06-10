Return-Path: <linux-next+bounces-7121-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF2AD2F5B
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 10:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B009B1893B3A
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 08:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041D3280006;
	Tue, 10 Jun 2025 08:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbNFjJFW"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBBF27FD7A;
	Tue, 10 Jun 2025 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542399; cv=none; b=SKAEqp+fJePO1UGWoMeHvSO/lQRJQka9LRo+JLiKD3t23Fj0jWQ7Zklrjp724THz+mwVy+B92cDt9XxeXJN2a/kcfqecaPZNrYT28BxknA43dGuELs/MiSZMluLk/3NplDLkfhFxCY7i+Ll8nxEQkR/21StLj+KbRsuTXMMZnm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542399; c=relaxed/simple;
	bh=mAhFVWLEMgDZKaAL05+abSfzwluo3v333Ey6WSEusc0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=B4Eabne4jryV6Pft2UwTp/y7L9xz9eVpXbg8mBJAXytllrWgOIc+PnS0ORUC5uxO8EwPJaDPRi1icnr1k1LCP4O5rZxZJXVfv2PAXgCHfPetrkEOz6iNvsojdwpPgpHERM97El1dDFATqxwPXSgwoE84d9XCpNc3O1NOKN76pko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbNFjJFW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398DAC4CEEF;
	Tue, 10 Jun 2025 07:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749542399;
	bh=mAhFVWLEMgDZKaAL05+abSfzwluo3v333Ey6WSEusc0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=XbNFjJFWsBZveuDA1BgCWvQqEyEncjk5Gr8cwp3JLf0gcGpWEBmlcC2p4a2aUagS3
	 ryUaVuB9elSVrYC5b4vu11XfF6Q0HkmYD34HGGLyj7LEVhINkuW0dPay0sZEDOmkmy
	 ALPsRGfr29y0eJ1/bFLfYcJTi08G5fdVq5rH0ryP3/6lc0LJkF+lbThhuM4JPlroni
	 /K1t2ztq20/oZ2/e9UIl8V19g4VMtZ91HbnyWsO14m1EIO6SLYSlxUhcBLE6LOHjte
	 HXluxz4C+T8/XDigeU4O+IiWFVy42Dj2XEyvdsrosYtMyUfv+NkxA+Ir6V5GE10G++
	 yCOW9uf6s09SA==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 09:59:52 +0200
Message-Id: <DAIP0NGMMM90.11JRFL5O1NAW9@kernel.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-pin-init tree
From: "Benno Lossin" <lossin@kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
X-Mailer: aerc 0.20.1
References: <20250610142230.001af1d3@canb.auug.org.au>
In-Reply-To: <20250610142230.001af1d3@canb.auug.org.au>

On Tue Jun 10, 2025 at 6:22 AM CEST, Stephen Rothwell wrote:
> Hi all,
>
> After merging the rust-pin-init tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> error[E0282]: type annotations needed
>    --> rust/kernel/configfs.rs:154:26
>     |
> 154 |             subsystem <- pin_init::zeroed().chain(
>     |                          ^^^^^^^^^^^^^^^^ cannot infer type of the =
type parameter `T` declared on the function `zeroed`
>     |
> help: consider specifying the generic argument
>     |
> 154 |             subsystem <- pin_init::zeroed::<T>().chain(
>     |                                          +++++
>
> error[E0282]: type annotations needed
>    --> rust/kernel/configfs.rs:264:22
>     |
> 264 |             group <- pin_init::zeroed().chain(|v: &mut Opaque<bindi=
ngs::config_group>| {
>     |                      ^^^^^^^^^^^^^^^^ cannot infer type of the type=
 parameter `T` declared on the function `zeroed`
>     |
> help: consider specifying the generic argument
>     |
> 264 |             group <- pin_init::zeroed::<T>().chain(|v: &mut Opaque<=
bindings::config_group>| {
>     |                                      +++++
>
> error: aborting due to 2 previous errors
>
> For more information about this error, try `rustc --explain E0282`.
>
> Caused by commit
>
>   0bcaea04244b ("rust: pin-init: rename `zeroed` to `init_zeroed`")
>
> I have used the rust-pin-init tree from next-20250606 for today.

Thanks for catching this! I didn't test with `CONFIG_CONFIGFS=3Dy`, so the
code was cfg'd out... I'll add it to my tests.

@Andreas I'll send a new version of the commit above with configfs
changed.

---
Cheers,
Benno

