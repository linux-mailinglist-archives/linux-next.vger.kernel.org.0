Return-Path: <linux-next+bounces-9729-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27134D3BB07
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 23:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8FCE303AE82
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 22:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22227247DE1;
	Mon, 19 Jan 2026 22:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Be6Vbjxo"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B93500972;
	Mon, 19 Jan 2026 22:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768862955; cv=none; b=CXLOSG1eYpb99X2PlV2v/dTHRwzf7W/pLz4fWFt4UNIJBUEJGuGKe4jUAvggL4o1qzfeKeEd2AfG651v2GL256ubIxxKP1qjqvz0H8FTnH+UqQRmkrCbdNGupIe9xVnrEuh5kNvsHFwOVi8+YHyqDBC9F9z4xvtM/WD3sPaXr54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768862955; c=relaxed/simple;
	bh=BqZUHr1HIxRDMpR4k8MNpV2mCB3+Ltx3zxquW/Zi9yA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=oQAx7kV5Ydt80vVNU0i6jT01oTT0Kf1GvhSAnNIOnCnuYgVF7k0Ho4tIHeDRMts3gNUSFPXn7g9hSfRSNxexz5zb9BiXsru0hvItS42IG++x92JltFtn7AoaOFUhXit0n2m6xmc2sFmKg9dLl8LTPNDhJ5HkIXbFdG3ccz+l6mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Be6Vbjxo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53EDC116C6;
	Mon, 19 Jan 2026 22:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768862954;
	bh=BqZUHr1HIxRDMpR4k8MNpV2mCB3+Ltx3zxquW/Zi9yA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Be6VbjxoNhnxqXKF/djD5mIhZDfJPAb2t2kyfiDOPeeIEnp9hbQlysPxQy9qUYto0
	 NOqVDqmJokWgFEBNFj8ZQKU7ndT/RafCKlz2LkYIf80854+sRL3MbmggYTs88Y0hOC
	 6inG53e9t1NRZlkqz4gBfoMgtDGJFWCB/fxpLgpbZ7t19TUYFUlFIonnkmJTgwl//5
	 BdtYYaPRS2aFyJZeWdpeYCus80ovh0Jwn8LC2gUfllUpuryaxHJOkLhJ4YvbYyL4y4
	 pdLgU5ZnBcmLgGAxgmJpNXxrjA5TheNR+EKGWDEQenF9HA2kmos2bYHYfWel3rThqw
	 l1Kg+ftUr3uhQ==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 23:49:10 +0100
Message-Id: <DFSXL1I12WPM.BDODUQNYLEPJ@kernel.org>
Subject: Re: linux-next: build failure in final build
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Deborah Brouwer"
 <deborah.brouwer@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next Mailing
 List" <linux-next@vger.kernel.org>, <boris.brezillon@collabora.com>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <aW6wfOjd17D5tUC5@sirena.org.uk>
In-Reply-To: <aW6wfOjd17D5tUC5@sirena.org.uk>

(Cc: Boris)

On Mon Jan 19, 2026 at 11:30 PM CET, Mark Brown wrote:
> Hi all,
>
> After merging all trees, today's final linux-next build (arm64
> allyesconfig) failed like this:
>
> error[E0560]: struct `drm_panthor_gpu_info` has no field named `pad0`
>   --> /tmp/next/build/drivers/gpu/drm/tyr/gpu.rs:75:13
>    |
> 75 |             pad0: 0,
>    |             ^^^^ `drm_panthor_gpu_info` does not have this field
>    |
>    =3D note: available fields are: `selected_coherency`
>
> Caused by commit
>
>    8304c44631c37 (drm/tyr: use generated bindings for GpuInfo)

I had a quick look and the problem is that another tree (drm-misc-next) cha=
nged
the corresponding uAPI struct in commit ea78ec982653 ("drm/panthor: Expose =
the
selected coherency protocol to the UMD") without also changing the Tyr driv=
er.

This diff in Tyr should fix the problem:

diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 3072562e36e5..0c85f03b8a7d 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -72,7 +72,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoM=
em>) -> Result<Self> {
             // TODO: Add texture_features_{1,2,3}.
             texture_features: [texture_features, 0, 0, 0],
             as_present,
-            pad0: 0,
+            selected_coherency: 0, // Some variant of `enum drm_panthor_gp=
u_coherency`.
             shader_present,
             l2_present,
             tiler_present,

