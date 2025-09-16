Return-Path: <linux-next+bounces-8331-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8315AB596D1
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 15:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B75C3256B6
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 13:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682032D4B40;
	Tue, 16 Sep 2025 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXMo6MS6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CED454673;
	Tue, 16 Sep 2025 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758027660; cv=none; b=kBPPqCwP1IiMih1GEBF0LHna1H0rqJaJ/qdfHXxNY/GcNH7LegmvrC1Wj58142c/PsO9zKFfeYCIDwxl6LnB21YsWWBxs130N6KhzvcwDHucwd5w96AvXA9qQeqcUx5EesvByLGlWJ6vfUU5C+emmNRgCJv/spjdr4R7jIE3les=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758027660; c=relaxed/simple;
	bh=lSgyMxAS+36zDZcORWgxFv6OvxYx7thu+9ZAQlwDFq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MOh4GKpPAixSKjS1u1c/zt9ZkpH9I8jmzFF+KZEN7RX+8EdP8Bim3cJfaeLH6o99h94h87xGDQaaYr304X5T4p7z/DOyT0CmQvFPY9c9nrYC9+P3JA44Xn/tkcsMg2kEtxlhcYRh+9uAvKvlPbJuxafJG7dG1j9kfPQz8QzVkq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXMo6MS6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DECC4CEF0;
	Tue, 16 Sep 2025 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758027660;
	bh=lSgyMxAS+36zDZcORWgxFv6OvxYx7thu+9ZAQlwDFq0=;
	h=Date:From:To:Cc:Subject:From;
	b=YXMo6MS6Wvcf6lKzmIowKcLA16DVV+9rpqSbWeDsozi67C4OoXyrnIT4VW2yux3fT
	 TDxZyLXi9bfzZPk//7+OAUDe+0CkxHLOZOQRjTvYbYMnyRe2MbEG5J12ExUnMfqR9C
	 yzedXVGvtGTLFR+WZBSZV6d99+IrXh9UAYSOWq4Qg50d1sado2bLOdo3xvJEgAkCDc
	 3Og+Yu+AFZko66It7o7IpNp4VyPCxqBPTnD3iybnv678eKy4ssjiz6qYbvPctrFnGB
	 vEETd9V+FX1hEeedfh9QKdZ0NoBHgcH8TS6Ab/tOLyvL7XgpcTOjXhsGZS5FIu3eha
	 nBDK8xmg5Ndng==
Date: Tue, 16 Sep 2025 14:00:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the drm-rust tree
Message-ID: <aMlfiBynRQrbW3BT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="achBNh6NbvOstfpJ"
Content-Disposition: inline


--achBNh6NbvOstfpJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  drivers/gpu/nova-core/gpu.rs

between commits:

  b345c917d7c1e ("gpu: nova-core: add Chipset::name() method")
  e7c96980ea4d9 ("gpu: nova-core: move GSP boot code to its own module")

=66rom the drm-rust tree and commit:

  4b4d06a7630e1 ("gpu: nova-core: use `kernel::{fmt,prelude::fmt!}`")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/nova-core/gpu.rs
index 5da9ad7264834,600cc90b5fabe..0000000000000
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@@ -1,14 -1,17 +1,15 @@@
  // SPDX-License-Identifier: GPL-2.0
 =20
- use kernel::{device, devres::Devres, error::code::*, pci, prelude::*, syn=
c::Arc};
+ use kernel::{device, devres::Devres, error::code::*, fmt, pci, prelude::*=
, sync::Arc};
 =20
  use crate::driver::Bar0;
 -use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 -use crate::fb::FbLayout;
 +use crate::falcon::{gsp::Gsp as GspFalcon, sec2::Sec2 as Sec2Falcon, Falc=
on};
  use crate::fb::SysmemFlush;
 -use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 -use crate::firmware::{Firmware, FIRMWARE_VERSION};
  use crate::gfw;
 +use crate::gsp::Gsp;
  use crate::regs;
- use core::fmt;
+ use crate::util;
+ use crate::vbios::Vbios;
 =20
  macro_rules! define_chipset {
      ({ $($variant:ident =3D $value:expr),* $(,)* }) =3D>

--achBNh6NbvOstfpJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJX4cACgkQJNaLcl1U
h9DQlgf/fTYG/DhOIsp/6vPN4sZTT7jvBEliX1GET+hKiDoIBJPQzb23vSlLTqa0
IIkO+EwE4+8qAiL+QzROlnhp1YTNSAIg0Knbx806PvXvxovWSUDt85hAOa3VENPo
jcXGFfQWqa+RA6xcEiS16DfPYt3A5vvw8rO7GzQOug7aSYPYmevsZwAkDPYVNvxc
dM1rCH2f1029mqrPTtJy79w9arBWMEGsvrApOU52HYvt2ArSjX3JKpGRmb62TtoU
K/+GRE9wskyI3AI7FsndYxQnSE2aHSQ5Dd/WCUds+3XEdqzbYDwYwQia9fB21Ik8
MpWQKj7AAQEE0HslHDF/gpzaOKV2kQ==
=Uy/a
-----END PGP SIGNATURE-----

--achBNh6NbvOstfpJ--

