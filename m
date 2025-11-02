Return-Path: <linux-next+bounces-8783-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FB8C28BF8
	for <lists+linux-next@lfdr.de>; Sun, 02 Nov 2025 09:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 199DF3A3C16
	for <lists+linux-next@lfdr.de>; Sun,  2 Nov 2025 08:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FA324A058;
	Sun,  2 Nov 2025 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVA1sznB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D087261B;
	Sun,  2 Nov 2025 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762071043; cv=none; b=DGPUuusqjvXtYCAZ7bGjz/bb2rSJifRI+pUG2Rn8xbnrStqdtrKotHh9pCRU6eFbVSQuN+kPf2FWtMlmzsqj7ws29T829rhhSUtEQ3Bp5YOhKuCb3hBr1DNWPRcQ9CJZf9KCZrcsQqBP4oAmYpdok2a96fv+FI9EFsC5zGxyHh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762071043; c=relaxed/simple;
	bh=LbVIHZXeY001OLexCBPYHivGe+soeGDuc0BP+61KQUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0xlCbIQZL38pzmJGHU1K1UR82/XFR2oKpdnRiB25BbAFRitCn7xHzxiQHai/XI59YDIj2dj3BN21fy4VMJuDrlemWP6NPGqMuuWnx70DRJVWUeSeZIjAnLAV4q2Ulc5LNnTBXOkN+Z5VQS3MOrz2DGcuI9dXPaDtMRWM0shsTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVA1sznB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE81FC4CEF7;
	Sun,  2 Nov 2025 08:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762071043;
	bh=LbVIHZXeY001OLexCBPYHivGe+soeGDuc0BP+61KQUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVA1sznByFDBJJ/aQy0Q+nB1q7TL1gSRDeYHzMnKfKFEGjyYcmhIjVf0pNw5pbPo4
	 rq8z+h0oR5UW6YjUolR1YmFJIr3sZabwP+DQdXu5SiDySITw7doMYWc/SECwFT4b5/
	 4xJw6HbrOPX5hkGWSMBRjRuG7MqTIMyeikKTMYG7Z88zwHNPINjTm/mZylMDTl9oyL
	 nzcvHPF6yVOjG3NZaF1jR0Qgbd8mHCyK85mz3rwVSXDdGtXqAI8B3v6f7sExKcb/1k
	 imEI6pax1YsAYfINyxp5bS/aUQ0Vh0O+qxpXhevf6KRslYk7CewHuOggO4nk1f58ml
	 810u1zzYk30Zg==
Date: Sun, 2 Nov 2025 09:10:37 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sysctl tree
Message-ID: <bhty55fw6j32o27p7wubvy2e3by363jzyej3hjkw7m7p2tnrdg@yg6bulgvser6>
References: <20251031094958.432f4e44@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hrc7j4zi676xym6l"
Content-Disposition: inline
In-Reply-To: <20251031094958.432f4e44@canb.auug.org.au>


--hrc7j4zi676xym6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 09:49:58AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the sysctl tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> In file included from drivers/tty/n_tty.c:38:
> include/linux/jiffies.h:614:40: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   614 | int proc_dointvec_jiffies(const struct ctl_table *table, int dir,=
 void *buffer,
>       |                                        ^~~~~~~~~
> include/linux/jiffies.h:616:50: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
> In file included from arch/powerpc/kvm/emulate_loadstore.c:10:
=2E..
>   616 | int proc_dointvec_ms_jiffies_minmax(const struct ctl_table *table=
, int dir,
>       |                                                  ^~~~~~~~~
> include/linux/jiffies.h:618:47: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   618 | int proc_dointvec_userhz_jiffies(const struct ctl_table *table, i=
nt dir,
>       |                                               ^~~~~~~~~
> include/linux/jiffies.h:620:43: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   620 | int proc_dointvec_ms_jiffies(const struct ctl_table *table, int d=
ir, void *buffer,
>       |                                           ^~~~~~~~~
> include/linux/jiffies.h:622:52: warning: 'struct ctl_table' declared insi=
de parameter list will not be visible outside of this definition or declara=
tion
>   622 | int proc_doulongvec_ms_jiffies_minmax(const struct ctl_table *tab=
le, int dir,
>       |                                                    ^~~~~~~~~
>=20
> Caused by commit
>=20
>   44df6a7821ed ("sysctl: Move jiffies converters to kernel/time/jiffies.c=
")

I'll push the small fix to linux-next and add it to
44df6a7821ed ("sysctl: Move jiffies converters to
kernel/time/jiffies.c") in the sysctl tree.

Thx

--=20

Joel Granados

--hrc7j4zi676xym6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmkHEfwACgkQupfNUreW
QU8tBgv/QCJpa4slCazo6l29NuvuvJKOqnh5HFzeDA5M9ufH3/kB+vvo96JlMwR7
6KfxypaZ41kKCL0XnnrrLLUvhRXoFp6zGwB8OnbOZ7LQNlbXsqmpT5R6gU6Aob0h
SrNlGEsKiBXcg6dEDPKBGXqrwBtwRyHCUIlo4qv9LPE77zFttVc/GGnhCHaHW5Kd
X9dzpNCKE3UPrVCTaqJxEn5rS6vqJ6Ey8xDq+LIRhNumxcRtr2pqO+qUqLLLLMga
Lya6V8UNlFkc1LU3RaFNqphXrgsjFFp0qpYrZJecgK/UIwocfURQJ6w6DUgX8mFT
Uoruh30WAUiAsZusSMs1sYmY2JYzJKJGdINGIsJduU/8hI1Kj1ZxG71HTu4dLzvk
ITJKGpEt1o4WlFyb7I+2jPrSOy85g2vmYPhrUPxBIsJsYSTHbAK47SM5vZC+6Jok
L872np41W9olx0mPbF+jilwbdyqOUMwvz9znEZXcQf5RG7Rah7SGTCO2I+LiGDVk
c/hpWTur
=uiPo
-----END PGP SIGNATURE-----

--hrc7j4zi676xym6l--

