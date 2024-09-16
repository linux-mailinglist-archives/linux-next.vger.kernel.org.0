Return-Path: <linux-next+bounces-3866-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BA1979A48
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 06:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66AD9B20BCE
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 04:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F6722EE8;
	Mon, 16 Sep 2024 04:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bMsTXyvy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BD52744E;
	Mon, 16 Sep 2024 04:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726460132; cv=none; b=Bp0r0IKyLdZiyS2DG0nKf0++vErkPR6Yb5g30KGBx4TiDsW10tV5M77pGts/SmYih/HOp/OvrJhTyVpSDG44DD20r6Es3KgAPTlBXQ8AwXPtAuFff2kl6a2/MxGTOrwZbBMA0A1faaFKGCbgoIf5DCfKEGWK4GW8mAlGfsEe9LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726460132; c=relaxed/simple;
	bh=cWC/o0z8XuWOrHZdOiv1ekPVTkurNuZea+JPVQx1FGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GBpFfa1J2KG87sAN/eyUHe6Bf2bU7mMR2zZsm9YtUlW2uNK1kH7ZDFEE/ZR5ABB2ctPyq99trPd2Kzy0Qf7VsGXpKxBsDPGqOpj6Kl4qnokkXdFScEN/b/eEp0vXHV8wx9mpBvTMLfBKIvVfIlftJQT+Q+JWCFChiGMgCq9BvQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bMsTXyvy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726460121;
	bh=aSMGNOW8vImcRzjGRzIsVUvVAA6VLJ9IpG/L1pmcNJw=;
	h=Date:From:To:Cc:Subject:From;
	b=bMsTXyvyjD60NmFjP3DNMjJRGM2GSjWfWj9cAop6UPf1SExGyqBCSvbEeJ2oMYlpq
	 LPg/SH5Bn9C08Qc8he9wXuvpGfuJRtELI4Z+tqw2mLIQEcEWy6A89HKJLiLSV3eiKY
	 YPbnrWWDaqJHfLQSH/83RTVRAyIpKVvRH0EuTqZcHLDlPuaHvt0uPsxNvzmNhfaA4B
	 y+BzViOp3e8AcjcAx9n0M8hs5MtCbV7dvGRvmFGoqbwnUpnoeeuvwJAbxSmkuExRWw
	 eEPC3q0YfURp9q/MieKoB0XmXh5T8swsdB91ibbmwuyZJqy/8vYgLzarxrVWFNhbIP
	 X8vyLAi9jIF3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6Wm65Bglz4x8F;
	Mon, 16 Sep 2024 14:15:18 +1000 (AEST)
Date: Mon, 16 Sep 2024 14:15:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Jerry Zuo <jerry.zuo@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Sung Joon Kim <sungjoon.kim@amd.com>, Tobias
 Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20240916141517.3ef8b349@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HvdUI/1MpsauEbBmWYRX.8l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HvdUI/1MpsauEbBmWYRX.8l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c

between commit:

  e835d5144f5e ("drm/amd/display: Avoid race between dcn35_set_drr() and dc=
_state_destruct()")

from Linus' tree and commit:

  be7a6a517164 ("drm/amd/display: Check stream pointer is initialized befor=
e accessing")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
index d5e9aec52a05,a4c6decee0f8..000000000000
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@@ -1462,17 -1414,10 +1414,17 @@@ void dcn35_set_drr(struct pipe_ctx **pi
  	params.vertical_total_mid_frame_num =3D adjust.v_total_mid_frame_num;
 =20
  	for (i =3D 0; i < num_pipes; i++) {
 -		if ((pipe_ctx[i]->stream_res.tg !=3D NULL) && pipe_ctx[i]->stream_res.t=
g->funcs) {
 +		/* dc_state_destruct() might null the stream resources, so fetch tg
 +		 * here first to avoid a race condition. The lifetime of the pointee
 +		 * itself (the timing_generator object) is not a problem here.
 +		 */
 +		struct timing_generator *tg =3D pipe_ctx[i]->stream_res.tg;
 +
 +		if ((tg !=3D NULL) && tg->funcs) {
- 			struct dc_crtc_timing *timing =3D &pipe_ctx[i]->stream->timing;
- 			struct dc *dc =3D pipe_ctx[i]->stream->ctx->dc;
 +
- 			if (dc->debug.static_screen_wait_frames) {
+ 			if (pipe_ctx[i]->stream && pipe_ctx[i]->stream->ctx->dc->debug.static_=
screen_wait_frames) {
+ 				struct dc_crtc_timing *timing =3D &pipe_ctx[i]->stream->timing;
+ 				struct dc *dc =3D pipe_ctx[i]->stream->ctx->dc;
  				unsigned int frame_rate =3D timing->pix_clk_100hz / (timing->h_total =
* timing->v_total);
 =20
  				if (frame_rate >=3D 120 && dc->caps.ips_support &&

--Sig_/HvdUI/1MpsauEbBmWYRX.8l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbnsNUACgkQAVBC80lX
0GxHvQgAj60CcQjHqGW9DeZwTLnIAkTkI69oWMob4SjNdxTfMq92EvdjZosF+QCL
jGq217kLdUlrpABe0xGyswi3oGjDR1H7fFnDr7yQeVsmrSgSMuDjIL52ypLEDhJ+
P9hMXZ1q0ZKJ4loRFuPXZujaWsGz2woZvGxfG/XNBLiOtyX9k+zkSrXVZb8fiZCa
ygtyYsHb6OmXVe6+w/UMeaOKPK7HyvA6gB1Xy8kUx1SCIA2qNsgSamKvv5h3DzPt
wj+cuzzvGIHgy8TApcQ+uuyJ6/hBTVI9j4SOJfujKPr8rX1YFCKbAK9M/RwZAh2x
N6Zi4qBdaKv+WZWx6+6BlDBc7bOpkg==
=fI6z
-----END PGP SIGNATURE-----

--Sig_/HvdUI/1MpsauEbBmWYRX.8l--

