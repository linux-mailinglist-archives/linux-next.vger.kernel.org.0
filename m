Return-Path: <linux-next+bounces-3237-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2529487F4
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 05:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E7A21C2222A
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 03:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04912EB10;
	Tue,  6 Aug 2024 03:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vczs80J+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAD7184D;
	Tue,  6 Aug 2024 03:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722915583; cv=none; b=IWiqg24PdmZ5UYUhx/j+dr5uqOoZItNHflGZhKUaXJYf54Ma1pemrDjVpBSgITQochUEZysN+ujmbWc5zQmi/JY+QOME4x3j7dCSJ5c/iMpPBr2Qyix1ka6D3PEHlLlipUw8iPQcw1kIusjJrZMyXBFOu7uEAOTnQu1Gmnc9iUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722915583; c=relaxed/simple;
	bh=aRTQhalci0d7XjikjWaAXlIVhoHJYGZEn8DRyGwihow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OkpS0Nm0e+UzdQj50/VSvBlOAXwrFCRtgPJXUmu66A/OwaklSFLAfs5dxooBGib26uY1Ql1smJHtnonqzECqhW9TpqXhHTT/qAE/clcVaqedq3fPLLvRlLfZEn+V1u3zXcrE5jbdl/Dxy1vPh8mIjxvZywQb48jkUdeTNKFxyk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vczs80J+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722915577;
	bh=+QycQ8PXsfjq7jHVjwP+zwJJzKmiEibfPTILWyYwkKU=;
	h=Date:From:To:Cc:Subject:From;
	b=Vczs80J+FKBn/LYlzlS2TiqsNYruOPEcTwex8e7z54Wy/nh038o/4z8M+zBE5QFje
	 PNIcWOs16O28Wzls6ms9+BkUic58wnbpk3D6Uyb9yOOLM7YcUpjwvXFj2Wc1UBrVIY
	 YWI+7ScMiizyXFY9S2rclbuJfVreV6lA3UdMP+UZEnJmskVkFL8QrPxJdHeAIUVC/V
	 SAg3t64S9hr3+OhmqCSY59AvFRdUhgauUBGcW1CsUYV/4THInFzYMF+tpCmN3kpjoG
	 rtJGao6gBqwk1xTLKDIPnQOJ/QidP4sxjkqt3DVTzEINZybA7NsKxxhTgIo473cWeQ
	 UgPW/ugoItFxw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WdJvs0drgz4wbp;
	Tue,  6 Aug 2024 13:39:37 +1000 (AEST)
Date: Tue, 6 Aug 2024 13:39:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the cgroup tree
Message-ID: <20240806133935.0dc8cdaf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uyAR1aBIMGEGF6v80T=6cgd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uyAR1aBIMGEGF6v80T=6cgd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the workqueues tree as a different commit
(but the same patch):

  959ab6350add ("cgroup/cpuset: fix panic caused by partcmd_update")

--=20
Cheers,
Stephen Rothwell

--Sig_/uyAR1aBIMGEGF6v80T=6cgd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaxmvcACgkQAVBC80lX
0GyFRAf+I8jb6M9DQ3hIUHKC+4eU5o/Fv2fH8xVheUW7i2V5iMcXoa98AOhvgPb1
rohkUAZsK8amayogLcPtUm7VZOUcIQqe8BKBJPbESW7wpYRLka/ZZ0SogcYa6w7Y
3TVas4JF8NSPzTAiFiTJSqDmt7jjufTDB5u1de+BPx9BV+jsWldQBFVT6aaM4tag
s/wv8sZbSyXViwOF2BiF4JJ/lDIh5jganws6WmQ31MnrXYfjSZntM2OSaPbGHK3q
/VH2EgYaq+4aLpQNkQjoD4fBV7JBFWM965oI7lAoOpBcSCNR8OOl8ABnhDOuqXEJ
8WeKbZBclURKuv05m8LIDbu2q2l2uw==
=hKU9
-----END PGP SIGNATURE-----

--Sig_/uyAR1aBIMGEGF6v80T=6cgd--

