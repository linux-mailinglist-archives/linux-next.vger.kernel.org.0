Return-Path: <linux-next+bounces-8316-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88638B58779
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 00:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52377207F9D
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 22:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85C02C08DC;
	Mon, 15 Sep 2025 22:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMWX32t+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FAC221FB2;
	Mon, 15 Sep 2025 22:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757975157; cv=none; b=N56lu4OM3xHMlxp53z6Q3ZT8YCJJXVnsZ1t/3cKPIT7TqLyiX3K8jGMVqOvFO81arfuSKH/k4W94FHSZGMA/onVKUxoSdZb31i82E5Ip5TQG6zyKbwFUpqXspWAJ2LWyWUZkS+7YNxlCslAfW5C5WPVyHRQHt3v1M/eTmFg2MqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757975157; c=relaxed/simple;
	bh=y0Wj48/xtxPpwAhubRkLvmghYWRpAu9ua6y3WxBmDa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gofHIwhYXmvlWWQP7JqN9PpW50s4rwxABEd+09ZWFIWrpjcIG93KoUCumlLoCeuaUYJaWcD4Kb+J1LRj2ebNf0hXUD/oz0eFroo9oBs4srcj6o28OjIXxorAL2YbZ1Vw9yCWb9PIZ8Q2W9PhUHsETm9Zcs/VcDvQdPoFSItS260=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uMWX32t+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79490C4CEF1;
	Mon, 15 Sep 2025 22:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757975157;
	bh=y0Wj48/xtxPpwAhubRkLvmghYWRpAu9ua6y3WxBmDa4=;
	h=Date:From:To:Cc:Subject:From;
	b=uMWX32t+t/9OUMSvAfg2F/pAaZIobB/ienlDatTwW4kUBxFPNT9miyUnaOEa5BWtQ
	 VAn8zKa5ED/dBnsfSeTG8ZrmJER1kRJe25HVcLFaMY36JSbIW0lHfHJ1O9I0YAgHHQ
	 NOddEr2zl9dOfmUN/a/dyB5iCvskKYCqciYk2Ckt5hqHshPulnWrs+MBZMzep1AaDb
	 R+XBYgrxoal8yxzoBx4UKt6sHm/noUSUT726C6b+3gpib/Owf4ED3uUpmnunS+IcCm
	 nbQoJsm3K7fKbQy9dTUPyCFelGIKaQcw4WBYUfClzYK3NE7oAOOUbXArQx5YYlGX/o
	 bUVYfT+eIlgKQ==
Date: Mon, 15 Sep 2025 23:25:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Jens Axboe <axboe@kernel.dk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the block tree
Message-ID: <aMiScHEWoOABPgt9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AA6Ro+XeRjQHJuVo"
Content-Disposition: inline


--AA6Ro+XeRjQHJuVo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  rust/kernel/block/mq/operations.rs

between commit:

  90d952fac8ac1 ("rust: block: add `GenDisk` private data support")

=66rom the block tree and commit:

  b6dd7b75496c5 ("rust: block: convert `block::mq` to use `Refcount`")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/block/mq/operations.rs
index d098a8a3e4340,c0f95a9419c4e..0000000000000
--- a/rust/kernel/block/mq/operations.rs
+++ b/rust/kernel/block/mq/operations.rs
@@@ -6,15 -6,15 +6,16 @@@
 =20
  use crate::{
      bindings,
 -    block::mq::request::RequestDataWrapper,
 -    block::mq::Request,
 +    block::mq::{request::RequestDataWrapper, Request},
      error::{from_result, Result},
      prelude::*,
+     sync::Refcount,
 -    types::ARef,
 +    types::{ARef, ForeignOwnable},
  };
- use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::atomic::Or=
dering};
+ use core::marker::PhantomData;
 =20
 +type ForeignBorrowed<'a, T> =3D <T as ForeignOwnable>::Borrowed<'a>;
 +
  /// Implement this trait to interface blk-mq as block devices.
  ///
  /// To implement a block device driver, implement this trait as described=
 in the

--AA6Ro+XeRjQHJuVo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIknAACgkQJNaLcl1U
h9C+Igf+JQDtrpqxBUNTepR+QMNKc24L9OOfwvzi+/DJ7I+0RPDe7q239ngPe+o3
gBlr9Pw3x23UPqskbZfI2pj9byCEZYWEb2Qgx8fzyZjaZ8rc5ewX6Z7KApFjMuFB
oAJgvwyvcLsnvFNDRYVCwlY1ktfC4SRuq3evS6gzBCzu37OH9EcnjCTRKZP5C6dL
d1j9K8j/pMsasv7ggfiPFM4VPBUbH2R1WCFqDZOMHETbpNaEQbF5LVCS6hn6Pifd
7jstauOF41Y2f2HiKsWuE1vX4e3H6f0Jcw+JeRJZMi3xtOFzofRYmCyvubxXJTPo
K8b3ym2VqYZ515G3Zfnca+eN6NRrrQ==
=PX4T
-----END PGP SIGNATURE-----

--AA6Ro+XeRjQHJuVo--

