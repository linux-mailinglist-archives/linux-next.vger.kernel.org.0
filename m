Return-Path: <linux-next+bounces-7219-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E06AE5DC3
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 09:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52FE43A6C64
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 07:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF161B0402;
	Tue, 24 Jun 2025 07:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bCV2Ksfi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3CBAD5A;
	Tue, 24 Jun 2025 07:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750284; cv=none; b=LeVcjGTU3rFjs5QFDD/12tGlI1BjlI2T9U7QmBe2wG1f+U3Wckl4YV+wzhexdwUTJS7YHe6CxNvcByBvUrJaGLtryPvj6RBM2SAPZAPHDE8gl93Uj1iA0cqJmBG+XCQqptbEjwuLy/oyxaTMgJfLBqeSOCd7/p7MUyTvTycpH5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750284; c=relaxed/simple;
	bh=ml18t6uOLppOb/T9Wi5piFDZwOvTLDV5uNU8t851M30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WrBlCayINavhUyNA3AmA93Z7N5pPpH0J7KtgVcVC6YLe1m8zs+ZjPPL88QpcqkiAS0L8s3kDF1bRJSdVFxE5igwI5JbObcW1nctPZsLvCah9HgCI2FMp5pTyy0zuOZ5p8seDNpmlfTnUop3yabRutWTxNhY9hqfqp7YCm7FZRaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bCV2Ksfi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750750275;
	bh=BTSeIPX0ClzCe1GbpYvZyHcshIJEAn1AQpg+OqO3B48=;
	h=Date:From:To:Cc:Subject:From;
	b=bCV2KsfiFM8QHhwnrjuU7LFY/eXUoYNq3d7YoJeqxy/pUpvLjjKZLFnnBwQ8rzHyG
	 lweCjfDkgCKvuBuPbrGrwT53V0PnqS6YdULsCghGiaxFUvgicg41//RArfHXXWzwAE
	 6EIBE/E4BYmwKASaiWWjbIZHZEkS52E1jVEzoqxuTlnK+aifQjp0/87BDfnMeE9Xyu
	 WI8f/yomNzXoCK/Az/XUPRMT+Vj/Mw0nAR+Y/evd5HAhl5+0lKDeieP2ESUOJXHFUB
	 B+4PqF+Z4XqjAwlqirSLElu+yHEnPRfGTCx06lmxPdiTNHg2apK0nUIArbnB2bzTWL
	 cRnAQGLjwkDpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bRGpW0mH0z4wy6;
	Tue, 24 Jun 2025 17:31:15 +1000 (AEST)
Date: Tue, 24 Jun 2025 17:31:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust tree
Message-ID: <20250624173114.3be38990@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=iU8QdlMhWp+BOLrOtpWHbI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=iU8QdlMhWp+BOLrOtpWHbI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0277]: the trait bound `u32: From<DmaTrfCmdSize>` is not satisfied
   --> drivers/gpu/nova-core/regs/macros.rs:310:26
    |
310 |               let value =3D (u32::from(value) << SHIFT) & MASK;
    |                            ^^^ the trait `From<DmaTrfCmdSize>` is not=
 implemented for `u32`
    |
   ::: drivers/gpu/nova-core/regs.rs:240:1
    |
240 | / register!(NV_PFALCON_FALCON_DMATRFCMD @ +0x00000118 {
241 | |     0:0     full as bool;
242 | |     1:1     idle as bool;
243 | |     3:2     sec as u8;
...   |
248 | |     16:16   set_dmtag as u8;
249 | | });
    | |__- in this macro invocation
    |
    =3D help: the following other types implement trait `From<T>`:
              `u32` implements `From<Char>`
              `u32` implements `From<CpuId>`
              `u32` implements `From<Ipv4Addr>`
              `u32` implements `From<NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION>`
              `u32` implements `From<NV_PBUS_SW_SCRATCH_0E>`
              `u32` implements `From<NV_PDISP_VGA_WORKSPACE_BASE>`
            and 41 others
    =3D note: this error originates in the macro `register` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)

error[E0277]: the trait bound `u32: From<FalconCoreRev>` is not satisfied
   --> drivers/gpu/nova-core/regs/macros.rs:310:26
    |
310 |               let value =3D (u32::from(value) << SHIFT) & MASK;
    |                            ^^^ the trait `From<FalconCoreRev>` is not=
 implemented for `u32`
    |
   ::: drivers/gpu/nova-core/regs.rs:259:1
    |
259 | / register!(NV_PFALCON_FALCON_HWCFG1 @ +0x0000012c {
260 | |     3:0     core_rev as u8 ?=3D> FalconCoreRev, "Core revision";
261 | |     5:4     security_model as u8 ?=3D> FalconSecurityModel, "Securi=
ty model";
262 | |     7:6     core_rev_subversion as u8 ?=3D> FalconCoreRevSubversion=
, "Core revision subversion";
263 | | });
    | |__- in this macro invocation
    |
    =3D help: the following other types implement trait `From<T>`:
              `u32` implements `From<Char>`
              `u32` implements `From<CpuId>`
              `u32` implements `From<Ipv4Addr>`
              `u32` implements `From<NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION>`
              `u32` implements `From<NV_PBUS_SW_SCRATCH_0E>`
              `u32` implements `From<NV_PDISP_VGA_WORKSPACE_BASE>`
            and 41 others
    =3D note: this error originates in the macro `register` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)

error[E0277]: the trait bound `u32: From<FalconSecurityModel>` is not satis=
fied
   --> drivers/gpu/nova-core/regs/macros.rs:310:26
    |
310 |               let value =3D (u32::from(value) << SHIFT) & MASK;
    |                            ^^^ the trait `From<FalconSecurityModel>` =
is not implemented for `u32`
    |
   ::: drivers/gpu/nova-core/regs.rs:259:1
    |
259 | / register!(NV_PFALCON_FALCON_HWCFG1 @ +0x0000012c {
260 | |     3:0     core_rev as u8 ?=3D> FalconCoreRev, "Core revision";
261 | |     5:4     security_model as u8 ?=3D> FalconSecurityModel, "Securi=
ty model";
262 | |     7:6     core_rev_subversion as u8 ?=3D> FalconCoreRevSubversion=
, "Core revision subversion";
263 | | });
    | |__- in this macro invocation
    |
    =3D help: the following other types implement trait `From<T>`:
              `u32` implements `From<Char>`
              `u32` implements `From<CpuId>`
              `u32` implements `From<Ipv4Addr>`
              `u32` implements `From<NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION>`
              `u32` implements `From<NV_PBUS_SW_SCRATCH_0E>`
              `u32` implements `From<NV_PDISP_VGA_WORKSPACE_BASE>`
            and 41 others
    =3D note: this error originates in the macro `register` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)

error[E0277]: the trait bound `u32: From<FalconCoreRevSubversion>` is not s=
atisfied
   --> drivers/gpu/nova-core/regs/macros.rs:310:26
    |
310 |               let value =3D (u32::from(value) << SHIFT) & MASK;
    |                            ^^^ the trait `From<FalconCoreRevSubversio=
n>` is not implemented for `u32`
    |
   ::: drivers/gpu/nova-core/regs.rs:259:1
    |
259 | / register!(NV_PFALCON_FALCON_HWCFG1 @ +0x0000012c {
260 | |     3:0     core_rev as u8 ?=3D> FalconCoreRev, "Core revision";
261 | |     5:4     security_model as u8 ?=3D> FalconSecurityModel, "Securi=
ty model";
262 | |     7:6     core_rev_subversion as u8 ?=3D> FalconCoreRevSubversion=
, "Core revision subversion";
263 | | });
    | |__- in this macro invocation
    |
    =3D help: the following other types implement trait `From<T>`:
              `u32` implements `From<Char>`
              `u32` implements `From<CpuId>`
              `u32` implements `From<Ipv4Addr>`
              `u32` implements `From<NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION>`
              `u32` implements `From<NV_PBUS_SW_SCRATCH_0E>`
              `u32` implements `From<NV_PDISP_VGA_WORKSPACE_BASE>`
            and 41 others
    =3D note: this error originates in the macro `register` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)

error[E0277]: the trait bound `u32: From<FalconFbifTarget>` is not satisfied
   --> drivers/gpu/nova-core/regs/macros.rs:310:26
    |
310 |               let value =3D (u32::from(value) << SHIFT) & MASK;
    |                            ^^^ the trait `From<FalconFbifTarget>` is =
not implemented for `u32`
    |
   ::: drivers/gpu/nova-core/regs.rs:276:1
    |
276 | / register!(NV_PFALCON_FBIF_TRANSCFG @ +0x00000600 {
277 | |     1:0     target as u8 ?=3D> FalconFbifTarget;
278 | |     2:2     mem_type as bool =3D> FalconFbifMemType;
279 | | });
    | |__- in this macro invocation
    |
    =3D help: the following other types implement trait `From<T>`:
              `u32` implements `From<Char>`
              `u32` implements `From<CpuId>`
              `u32` implements `From<Ipv4Addr>`
              `u32` implements `From<NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION>`
              `u32` implements `From<NV_PBUS_SW_SCRATCH_0E>`
              `u32` implements `From<NV_PDISP_VGA_WORKSPACE_BASE>`
            and 41 others
    =3D note: this error originates in the macro `register` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)

error[E0277]: the trait bound `u32: From<FalconFbifMemType>` is not satisfi=
ed
   --> drivers/gpu/nova-core/regs/macros.rs:310:26
    |
310 |               let value =3D (u32::from(value) << SHIFT) & MASK;
    |                            ^^^ the trait `From<FalconFbifMemType>` is=
 not implemented for `u32`
    |
   ::: drivers/gpu/nova-core/regs.rs:276:1
    |
276 | / register!(NV_PFALCON_FBIF_TRANSCFG @ +0x00000600 {
277 | |     1:0     target as u8 ?=3D> FalconFbifTarget;
278 | |     2:2     mem_type as bool =3D> FalconFbifMemType;
279 | | });
    | |__- in this macro invocation
    |
    =3D help: the following other types implement trait `From<T>`:
              `u32` implements `From<Char>`
              `u32` implements `From<CpuId>`
              `u32` implements `From<Ipv4Addr>`
              `u32` implements `From<NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION>`
              `u32` implements `From<NV_PBUS_SW_SCRATCH_0E>`
              `u32` implements `From<NV_PDISP_VGA_WORKSPACE_BASE>`
            and 41 others
    =3D note: this error originates in the macro `register` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)

error[E0277]: the trait bound `u32: From<FalconModSelAlgo>` is not satisfied
   --> drivers/gpu/nova-core/regs/macros.rs:310:26
    |
310 |               let value =3D (u32::from(value) << SHIFT) & MASK;
    |                            ^^^ the trait `From<FalconModSelAlgo>` is =
not implemented for `u32`
    |
   ::: drivers/gpu/nova-core/regs.rs:285:1
    |
285 | / register!(NV_PFALCON2_FALCON_MOD_SEL @ +0x00001180 {
286 | |     7:0     algo as u8 ?=3D> FalconModSelAlgo;
287 | | });
    | |__- in this macro invocation
    |
    =3D help: the following other types implement trait `From<T>`:
              `u32` implements `From<Char>`
              `u32` implements `From<CpuId>`
              `u32` implements `From<Ipv4Addr>`
              `u32` implements `From<NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION>`
              `u32` implements `From<NV_PBUS_SW_SCRATCH_0E>`
              `u32` implements `From<NV_PDISP_VGA_WORKSPACE_BASE>`
            and 41 others
    =3D note: this error originates in the macro `register` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)

error[E0277]: the trait bound `u32: From<PeregrineCoreSelect>` is not satis=
fied
   --> drivers/gpu/nova-core/regs/macros.rs:310:26
    |
310 |               let value =3D (u32::from(value) << SHIFT) & MASK;
    |                            ^^^ the trait `From<PeregrineCoreSelect>` =
is not implemented for `u32`
    |
   ::: drivers/gpu/nova-core/regs.rs:304:1
    |
304 | / register!(NV_PRISCV_RISCV_BCR_CTRL @ +0x00001668 {
305 | |     0:0     valid as bool;
306 | |     4:4     core_select as bool =3D> PeregrineCoreSelect;
307 | |     8:8     br_fetch as bool;
308 | | });
    | |__- in this macro invocation
    |
    =3D help: the following other types implement trait `From<T>`:
              `u32` implements `From<Char>`
              `u32` implements `From<CpuId>`
              `u32` implements `From<Ipv4Addr>`
              `u32` implements `From<NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION>`
              `u32` implements `From<NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION>`
              `u32` implements `From<NV_PBUS_SW_SCRATCH_0E>`
              `u32` implements `From<NV_PDISP_VGA_WORKSPACE_BASE>`
            and 41 others
    =3D note: this error originates in the macro `register` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)

error[E0599]: no method named `as_nanos` found for struct `Delta` in the cu=
rrent scope
  --> drivers/gpu/nova-core/util.rs:45:33
   |
45 |         if start_time.elapsed().as_nanos() > timeout.as_nanos() as i64=
 {
   |                                 ^^^^^^^^ method not found in `Delta`

error: aborting due to 9 previous errors

Some errors have detailed explanations: E0277, E0599.
For more information about an error, try `rustc --explain E0277`.

Presumably caused by commit

  b7c8d7a8d251 ("rust: enable `clippy::cast_lossless` lint")

interacting with some changes in the drm-nova tree
(https://gitlab.freedesktop.org/drm/nova.git#nova-next).

A suggested merge resolution would be appreciated.

I have used the rust tree from next-20250620 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/=iU8QdlMhWp+BOLrOtpWHbI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhaVEIACgkQAVBC80lX
0Gy0DggAhYlIZdubZt+FXKjWGq/RJrDwZluDaO5Cr/LeN2D8/WkRfSom81g/ucTO
DN3dXtm/0tAdrCSxgMFWF2BFE5VzOooFZIeAuieZ6VML/9fS66c3QxERO6M7jAaZ
Ae8RH7VCr8YEejEk3nUuOaPq9PRX5rYxWU0iMNFLTMrqD9oY+W5EISD8AfIA7ScH
qv9J2jCrW9otbfJ9DsADeTt5elXrB9ZLKqSRj+u4obGef7OMFXPP7meTQoh+ajSN
z64kcCN6L7bdSfBwwlUM3PkAQUS7FSt/xjjK0CoQB9SmpZMxWYtJ1GsPm9/uCJx3
YIK2lpuPqo5M1LahX8VPfJIKjN5B2Q==
=bJBy
-----END PGP SIGNATURE-----

--Sig_/=iU8QdlMhWp+BOLrOtpWHbI--

