Return-Path: <linux-next+bounces-6288-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418B5A91420
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 08:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACF2F5A0142
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 06:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8234A1E0DE8;
	Thu, 17 Apr 2025 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qqyXu3Cc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2331DE889;
	Thu, 17 Apr 2025 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871736; cv=none; b=miF2Gi25hDakgO975oYwLsJfmhNxDusb6/7iEuZ388tDSd96XRvSm/zWrqVoDbrXM70GHTaWC2Lb7l9eg2w913CBg2zc5YghF97gHR6GtqVL/QlS1sAxNbXnihm76epyZMu4im87FCPg5RAIhmQR+V/FGGGUzp7KzKAFMdK0mOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871736; c=relaxed/simple;
	bh=PWikLGaVX8/yQxjCYzWW272GzojKLr2olJk6ak1jMjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6Be4MApr5zPzk80YcpDozJ8N7YvC5eMO0qWnaHTSnjBTsNVwBqkQ+pAZwT3sSQ3I/mnjybIp+9OhTinPJ+eCv4RdrJcX/DAcDs0XmJHugh8ooUyJUf2Uh+W2RvkGXrnAqsabaZkrRZBZz470BgaikpgmH338hEjN/55kkWix+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qqyXu3Cc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744871732;
	bh=zJD8GlbD9AWQDOo7uaLdb6Fx5Qk0tAP5YmUamcIzfok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qqyXu3Ccl7+2fHEhcLlrSbDOUBH2yKV29Jg0RNNlxj7mxu6x0LhktEmYkQb0w0/Bz
	 v/U1CqFCXViGXFa89mUdtkwsXobIXc5z3GI691ULSa73/JVxXdrORoiwCXdOYHUXSu
	 D0ZWzv//Ga0kAReMzDwtAJT5xuTF9WTWMP9+71EixP48hgZekgUYLaps+blJYlqf+u
	 4ejb1K8SBhkNx4pyeHggfcqyYuEwHrsrPAzdX27rCc1q4+W00jg3/xM273h+K1EU6B
	 pNdTrXHclyJMEWnYtr9QGCXmRqoqAA4Pe4p0Ivxdbmkonf+sBN6mrYTc2B2mq6DZD1
	 uvoYxTOrL0G9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdSnb4L78z4xQq;
	Thu, 17 Apr 2025 16:35:31 +1000 (AEST)
Date: Thu, 17 Apr 2025 16:35:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, helpdesk@kernel.org
Subject: Re: linux-next: build failure after merge of the workqueues tree
Message-ID: <20250417163530.3beb3e65@canb.auug.org.au>
In-Reply-To: <aACcc6VmbON_fy3J@slm.duckdns.org>
References: <20250415140116.13544ac6@canb.auug.org.au>
	<CAJ-ks9kUBCX6PjOeOSVQNXYGcy9gkYw++BEmHZ0eFbsyZeBZcQ@mail.gmail.com>
	<Z_50QbWczACrwL5f@slm.duckdns.org>
	<20250417142636.0e73728a@canb.auug.org.au>
	<aACcc6VmbON_fy3J@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t/BH7uuADyb6F/xW72Gj79H";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/t/BH7uuADyb6F/xW72Gj79H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Wed, 16 Apr 2025 20:15:15 -1000 Tejun Heo <tj@kernel.org> wrote:
>
> On Thu, Apr 17, 2025 at 02:26:36PM +1000, Stephen Rothwell wrote:
> ...
> > I am still seeing this failure.  Forgot to push out? =20
>=20
> Hah, we might be seeing some caching problem.
>=20
>   htejun@slm ~/o/wq (for-next)> git rev-list for-next \^master --oneline
>   24cdab5787a0 workqueue: Better document teardown for delayed_work
>   htejun@slm ~/o/wq (for-next)> git push git@gitolite.kernel.org:pub/scm/=
linux/kernel/git/tj/wq.git for-next:for-next
>   Everything up-to-date
>   htejun@slm ~/o/wq (for-next)> git fetch -f git@gitolite.kernel.org:pub/=
scm/linux/kernel/git/tj/wq.git for-next:tmp=20
>   htejun@slm ~/o/wq (for-next)> git rev-list tmp \^master --oneline
>   24cdab5787a0 workqueue: Better document teardown for delayed_work
>   htejun@slm ~/o/wq (for-next)> git fetch https://git.kernel.org/pub/scm/=
linux/kernel/git/tj/wq.git for-next:tmp2                                   =
                =20
>   From https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq
>    * [new branch]                for-next   -> tmp2
>   htejun@slm ~/o/wq (for-next)> git rev-list tmp2 \^master --oneline
>   2762750ac5c6 workqueue: Better document teardown for delayed_work
>   345e029b561e rust: workqueue: remove HasWork::OFFSET
>=20
> Cc'ing helpdesk@kernel.org. Imma leave the tree as-is for debugging. The
> tree only has a documentation patch, so it's fine to skip for linux-next =
for
> now. I'll wait a couple days and if the problem doesn't get resolved, I'll
> try to update the branch and see whether the stale cache clears.

Thanks for checking.  I have a few days off now, so I guess we will see
what it is like on (my) Tuesday.

--=20
Cheers,
Stephen Rothwell

--Sig_/t/BH7uuADyb6F/xW72Gj79H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAoTIACgkQAVBC80lX
0GxDXQf/XdI+UZ8cT+MDMfFDShJw9ozJ35RF+fd8FrUQauQ/UvUJToh8u9wV/yiC
wYlKDaj7CIbymcOVvjJT4RR7tlV5aLRHZ758EINePQc1/ManFmNSWdXkZo24rGhc
sV+rOMpw7RZvYFcP6rKyRKo6Kb9ULVXV+JeKxxWTW9uI7/LsSlNhGAMrP4O/TfWW
WxpfqZv7gOIzqdJpF1mKqsJS244gK0ecldYaRLjkNny8w5Rs6eKM72x/EhJkAPTn
9MOo6JbJTFl8gUxZIPBUavP86wJjBkEiC9suuoT5ITPV+u/EjUOid1ABmKdl+6Fd
Zf6fiPxqfem7xGcBeC3oG8Yor68w9A==
=48yS
-----END PGP SIGNATURE-----

--Sig_/t/BH7uuADyb6F/xW72Gj79H--

