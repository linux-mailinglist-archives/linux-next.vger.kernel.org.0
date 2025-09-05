Return-Path: <linux-next+bounces-8209-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988B9B451C6
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 10:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D45A7AA951
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 08:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E0027F727;
	Fri,  5 Sep 2025 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsGDdfvp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BF627FB35;
	Fri,  5 Sep 2025 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061627; cv=none; b=XHLYjSLE05Ku2XGYiAPoWkbJTUYBRDnniCgv8HlihDItyP1yi1fmcsYfFB6P6LTLt1gTxARnaAis67IcIHzCqrov6rQ47/SzVo3tI44BVgT8fGaoMSr15uythXrepRNBwYkw5mmU3u0Okzel4cbzS3uvnbeVIQofBouAHcgTzOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061627; c=relaxed/simple;
	bh=sZ4Ng0UyvDInIOs5cCtnGQF27HyFIz5ruvVRSYqHbHg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=at83eOYXlVdKIunkx17eYUr0Ipk8DTAXj/JTaHTbJ9xOeV6y/6fu59D0OeMGXzi7nTHpuM5GwWHBF2oxH/YlhNSGBoIe4octKsyBi6QGIFFma5IiURBFkWMI/z03t/4qSISWiz9IRCeWaLF9/BL+BQxgFOD6bQYqmNE4VsNFNB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsGDdfvp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05506C4CEF1;
	Fri,  5 Sep 2025 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757061627;
	bh=sZ4Ng0UyvDInIOs5cCtnGQF27HyFIz5ruvVRSYqHbHg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=WsGDdfvpgepk4G5aDEoyZksz7KSlKo9zUjeZpJB0TS1ef3SlqdX/zEekHeLErNpjB
	 EoedRgZjKLnITilBOwaEBjS0Pi9XhGT8tzppLJIgI+jc5wtcf0x90F8oGFwroIYIBm
	 eG6IX9UEJGdNRXeaTSWJ+zCMTz9+5j2+NHQBlDNWOhbKAUcluI8k8FtjSpt0/NV+Nc
	 zMc5lEZ63LfKvWgaBmdQoUN3uWd+DaP9XpFaauxaZbE7Wcfsy/d4yYfRz8RZETdTOR
	 eDJrqjgwtRRZ4c5+xtn8P4WIfhtsds7469K5gJX8T2pscCvQatkpvQDgiVO7wrCznb
	 kMopSxiG21zbQ==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Sep 2025 10:40:24 +0200
Message-Id: <DCKQD2XPCCN2.2LW01KJCIN3C0@kernel.org>
Subject: Re: linux-next: manual merge of the rust-alloc tree with the
 drm-rust tree
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>, "Shankari Anand" <shankari.ak0208@gmail.com>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250905144449.437ef3cf@canb.auug.org.au>
In-Reply-To: <20250905144449.437ef3cf@canb.auug.org.au>

On Fri Sep 5, 2025 at 6:44 AM CEST, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the rust-alloc tree got a conflict in:
>
>   samples/rust/rust_dma.rs
>
> between commit:
>
>   5444799d701c ("samples: rust: dma: add sample code for SGTable")
>
> from the drm-rust tree and commit:
>
>   7e25d84f460c ("rust: dma: Update ARef and AlwaysRefCounted imports from=
 sync::aref")
>
> from the rust-alloc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --=20
> Cheers,
> Stephen Rothwell
>
> diff --cc samples/rust/rust_dma.rs
> index f55c6a37ccd9,997a9c4cf2b3..000000000000
> --- a/samples/rust/rust_dma.rs
> +++ b/samples/rust/rust_dma.rs
> @@@ -5,15 -5,14 +5,15 @@@
>   //! To make this driver probe, QEMU must be run with `-device pci-testd=
ev`.
>  =20
>   use kernel::{
>  -    bindings,
>       device::Core,
>  -    dma::{CoherentAllocation, Device, DmaMask},
>  -    pci,
>  +    dma::{CoherentAllocation, DataDirection, Device, DmaMask},
>  +    page, pci,
>       prelude::*,
>  +    scatterlist::{Owned, SGTable},
> -     types::ARef,
> +     sync::aref::ARef,
>   };
>  =20
>  +#[pin_data(PinnedDrop)]
>   struct DmaSampleDriver {
>       pdev: ARef<pci::Device>,
>       ca: CoherentAllocation<MyStruct>,

Looks good, thanks!

